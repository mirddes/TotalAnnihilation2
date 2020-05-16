#Generic TA unit
local Unit = import('/lua/sim/Unit.lua').Unit
local explosion = import('/lua/defaultexplosions.lua')
local scenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local TAutils = import('/mods/SCTA/lua/TAutils.lua')
local Game = import('/lua/game.lua')
local util = import('/lua/utilities.lua')
local debrisCat = import('/mods/SCTA/lua/TAdebrisCategories.lua')
#local WreckShield = import('/mods/SCTA/lua/TAshield.lua').WreckShield

TAunit = Class(Unit) 
{


	lastHitVector = nil,
	buildAngle = 0,
	textureAnimation = false,
    	FxDamage1 = {},
    	FxDamage2 = {},
    	FxDamage3 = {},
	FxMovement = nil,
	Suicide = false,
	CurrentSpeed = 'Stopped',
	FxReclaim = nil,
	DestructionExplosionWaitDelayMin = 0,
	DestructionExplosionWaitDelayMax = 0,

	OnCreate = function(self)
        Unit.OnCreate(self)

        if not TAutils.wind.threadStarted then
            ForkThread(TAutils.WindChangeThread, self)
        end

		self:SetFireState(2)
		local bp = self:GetBlueprint()
		if bp.General.BuildAngle then
		 	local angle = bp.General.BuildAngle / 182
 			self.buildAngle = (math.random(angle) - (angle / 2))
			angle = (180 + self.buildAngle) * (math.pi / 180)
	 		local x = math.cos(angle / 2) 
	  		local z = math.sin(angle / 2) 
			Warp(self, self:GetPosition(), {0, x, 0, z}) 
		end
		self:SetReclaimTimeMultiplier(50)
		self:SetDeathWeaponEnabled(false)
		self:HideFlares()
		self.FxMovement = TrashBag()
		if not EntityCategoryContains(categories.NOSMOKE, self) then
			ForkThread(self.Smoke, self)
		end
	end,

    -- override due to bug in unit.lua
    UpdateConsumptionValues = function(self)
        local energy_rate = 0
        local mass_rate = 0

        if self.ActiveConsumption then
            local focus = self:GetFocusUnit()
            local time = 1
            local mass = 0
            local energy = 0
            local targetData
            local baseData

            if focus then -- Always inherit work status of focus
                self:InheritWork(focus)
            end

            if self.WorkItem then -- Enhancement
                targetData = self.WorkItem
            elseif focus then -- Handling upgrades
                if self:IsUnitState('Upgrading') then
                    baseData = self:GetBlueprint().Economy -- Upgrading myself, subtract ev. baseCost
                elseif focus.originalBuilder and not focus.originalBuilder.Dead and focus.originalBuilder:IsUnitState('Upgrading') and focus.originalBuilder:GetFocusUnit() == focus then
                    baseData = focus.originalBuilder:GetBlueprint().Economy
                end

                if baseData then
                    targetData = focus:GetBlueprint().Economy
                end
            end

            if targetData then -- Upgrade/enhancement
                time, energy, mass = Game.GetConstructEconomyModel(self, targetData, baseData)
            elseif focus then -- Building/repairing something
                -- bugfix here.  Need to prevent SiloProjectile stats being picked up when repairing a building nuker
                -- if focus:IsUnitState('SiloBuildingAmmo') then
                if focus:IsUnitState('SiloBuildingAmmo') and focus:GetHealth()==focus:GetMaxHealth() then
                    -- For TAUnit, we'll never get here because TA doesn't allow assist of missiles
                    local siloBuildRate = focus:GetBuildRate() or 1
                    time, energy, mass = focus:GetBuildCosts(focus.SiloProjectile)
                    local selfBuildRate = self:GetBuildRate() or 1
                    energy = (energy / siloBuildRate) * (self:GetBuildRate() or 1)
                    mass = (mass / siloBuildRate) * (self:GetBuildRate() or 1)
                else
                    time, energy, mass = self:GetBuildCosts(focus:GetBlueprint())
                end
            end

            energy = math.max(1, energy * (self.EnergyBuildAdjMod or 1))
            mass = math.max(1, mass * (self.MassBuildAdjMod or 1))
            energy_rate = energy / time
            mass_rate = mass / time
        end

        self:UpdateAssistersConsumption()

        local myBlueprint = self:GetBlueprint()
        if self.MaintenanceConsumption then
            local mai_energy = (self.EnergyMaintenanceConsumptionOverride or myBlueprint.Economy.MaintenanceConsumptionPerSecondEnergy)  or 0
            local mai_mass = myBlueprint.Economy.MaintenanceConsumptionPerSecondMass or 0

            -- Apply economic bonuses
            mai_energy = mai_energy * (100 + self.EnergyModifier) * (self.EnergyMaintAdjMod or 1) * 0.01
            mai_mass = mai_mass * (100 + self.MassModifier) * (self.MassMaintAdjMod or 1) * 0.01

            energy_rate = energy_rate + mai_energy
            mass_rate = mass_rate + mai_mass
        end

         -- Apply minimum rates
        energy_rate = math.max(energy_rate, myBlueprint.Economy.MinConsumptionPerSecondEnergy or 0)
        mass_rate = math.max(mass_rate, myBlueprint.Economy.MinConsumptionPerSecondMass or 0)

        self:SetConsumptionPerSecondEnergy(energy_rate)
        self:SetConsumptionPerSecondMass(mass_rate)
        self:SetConsumptionActive(energy_rate > 0 or mass_rate > 0)
    end,


	OnStopBeingBuilt = function(self,builder,layer)
		Unit.OnStopBeingBuilt(self,builder,layer)
		self:SetConsumptionActive(true)
		self.textureAnimation = true
		ForkThread(self.IdleEffects, self)
	end,
	
	OnMotionVertEventChange = function(self, new, old )
		local bp = self:GetBlueprint()
		if (old == 'Bottom') then
			if bp.Display.MovementEffects then
				ForkThread(self.MovementEffects, self)
			end
		elseif (new == 'Bottom' and old == 'Down') then
			if self.FxMovement then
				ForkThread(self.IdleEffects, self)
				for k,v in self.FxMovement do
					v:Destroy()
				end
			end
		end
	end,

	OnMotionHorzEventChange = function(self, new, old )
	        if self:IsDead() then
        	    return
	        end

		local bp = self:GetBlueprint()
		if (new == 'Cruise') then
			if bp.Display.MovementEffects then
				ForkThread(self.MovementEffects, self)
			end
			if old == 'Stopped' then
                		self:PlayUnitSound('StartMove')
			end
		elseif (new == 'Stopped') then
			if (not EntityCategoryContains(categories.TRANSPORTATION, self) or not self:GetCargo()) then
				#TAutils.DisplayMessage(self:GetBlueprint().General.UnitName .. ": Arrived", 2)
				if self.FxMovement then
					ForkThread(self.IdleEffects, self)
					for k,v in self.FxMovement do
						v:Destroy()
					end
				end
			end
			self:PlayUnitSound('StopMove')
		end
		self.CurrentSpeed = new
	        self:StopRocking()
	end,

				
	MovementEffects = function(self)
		local bp = self:GetBlueprint()
		if not IsDestroyed(self) and bp.Display.MovementEffects then
			for k, v in bp.Display.MovementEffects.Bones do
				self.FxMovement:Add(CreateAttachedEmitter(self, v, self:GetArmy(), bp.Display.MovementEffects.Emitter ):ScaleEmitter(bp.Display.MovementEffects.Scale))
			end
		end
	end,

	IdleEffects = function(self)
		local bp = self:GetBlueprint()
		if not IsDestroyed(self) and not self:IsMoving() and bp.Display.IdleEffects then
			for k, v in bp.Display.IdleEffects.Bones do
				self.FxMovement:Add(CreateAttachedEmitter(self, v, self:GetArmy(), bp.Display.IdleEffects.Emitter ):ScaleEmitter(bp.Display.IdleEffects.Scale))
			end
		end
	end,

	Smoke = function(self)
		local bone = self:GetBlueprint().Display.SmokeBone or -1
		while not IsDestroyed(self) do
			if self:GetFractionComplete() == 1 then
				if self:GetHealth()/self:GetMaxHealth() < 0.25 then
					CreateEmitterAtBone(self, bone, self:GetArmy(), '/mods/SCTA/effects/emitters/damage_bad_smoke_emit.bp' )
					CreateEmitterAtBone(self, bone, self:GetArmy(), '/mods/SCTA/effects/emitters/damage_bad_smoke_emit.bp' )
				elseif self:GetHealth()/self:GetMaxHealth() < 0.5 then
					CreateEmitterAtBone(self, bone, self:GetArmy(), '/mods/SCTA/effects/emitters/damage_smoke_emit.bp' )
					CreateEmitterAtBone(self, bone, self:GetArmy(), '/mods/SCTA/effects/emitters/damage_bad_smoke_emit.bp' )
				elseif self:GetHealth()/self:GetMaxHealth() < 0.75 then
					CreateEmitterAtBone(self, bone, self:GetArmy(), '/mods/SCTA/effects/emitters/damage_smoke_emit.bp' )
				end
			end
			WaitSeconds(0.5)
		end
	end,

	ShowMuzzleFlare = function(self, duration)
		local bp = self:GetBlueprint()

		#Show flare bone for pre-determined time
		self.unit:ShowBone(bp.RackBones[self.CurrentRackSalvoNumber - 1].MuzzleBones[1], true)
		WaitSeconds(duration)
		self.unit:HideBone(bp.RackBones[self.CurrentRackSalvoNumber - 1].MuzzleBones[1], true)
	end,

	OnKilled = function(self, instigator, type, overkillRatio)
		local bp = self:GetBlueprint()
		if self:GetFractionComplete() == 1 then
			for k, weapon in bp.Weapon do
				#Self Destruct
				if ((self == instigator and weapon.Label == 'SuicideWeapon') or (self != instigator and weapon.Label == 'DeathWeapon') and type ~= "Reclaimed")then
					TAutils.DoTaperedAreaDamage(self, self:GetPosition(), weapon.DamageRadius, weapon.Damage, nil, nil, 'Normal', true, false, weapon.EdgeEffectiveness)
					if (self == instigator and weapon.Label == 'SuicideWeapon') then
						self:CreateDebrisProjectiles()
						self.Suicide = true
					end
				end
			end
		end
		Unit.OnKilled(self, instigator, type, overkillRatio)
	end,

	CreateWreckage = function( self, overkillRatio )

		# if overkill ratio is high, the wreck is vaporized! No wreakage for you!
		if overkillRatio then
			if overkillRatio > 0.075 then
				self:CreateDebrisProjectiles()
				return
			end
		end

		# generate wreakage in place of the dead unit
	        if self:GetBlueprint().Wreckage.WreckageLayers[self:GetCurrentLayer()] and self.Suicide == false then
			TAutils.QueueDelayedWreckage(self, overkillRatio, self:GetBlueprint(), self:GetFractionComplete(), self:GetPosition(), self:GetOrientation(), self:GetMaxHealth())
		end
	end,

	CreateDestructionEffects = function( self, overKillRatio )
		local bp = self:GetBlueprint()
		if bp.Display.DestructionEffects then
 			if self:GetFractionComplete() == 1 then
				--if not EntityCategoryContains(categories.NOEXPLOSION, self) then
				--	CreateLightParticle( self, 0, self:GetArmy(), bp.Display.DestructionEffects.FlashSize or 20, bp.Display.DestructionEffects.FlashTime or 10, 'ExplosionGlow', 'ramp_ExplosionGlow' )
				--end
				if bp.Display.DestructionEffects.DestructionEmitters then
					for k,v in bp.Display.DestructionEffects.DestructionEmitters do
						for bk,bv in v.EmitterBone do
							for ek, ev in v.EmitterBlueprint do
								CreateEmitterAtBone(self, bv, self:GetArmy(), ev):ScaleEmitter(v.EmitterSize)
							end
						end
					end
				end
	    			#self:HideBone(0, true)
			end
		end
	end,

	CreateDebrisProjectiles = function(self)
	    local bp = self:GetBlueprint()
	    local sx = bp.SizeX
	    local sy = bp.SizeY
	    local sz = bp.SizeZ
	    local partamounts = util.GetRandomInt( bp.Display.DestructionEffects.DefaultFlamingProjectileCountMin or 1, bp.Display.DestructionEffects.DefaultFlamingProjectileCountMax or ((sx * sz / 4) + 3)) 
		LOG("PartAmounts: ",partamounts)
	    for i = 1, partamounts do
	        local xpos, ypos, zpos = util.GetRandomOffset( sx, sy, sz, 1)
        	local xdir,ydir,zdir = util.GetRandomOffset( sx, sy, sz, 10)
        	self:CreateProjectile('/mods/SCTA/effects/entities/Debris/Flame/DefaultFlameProjectileDebris_proj.bp',xpos,ypos,zpos,xdir,ydir + 5,zdir)
	    end
	    partamounts = util.GetRandomInt( bp.Display.DestructionEffects.DefaultProjectileCountMin or 5, bp.Display.DestructionEffects.DefaultProjectileCountMax or (sx * sz + 4)) 
		LOG("PartAmounts: ",partamounts)
	    local z = math.cos(self:GetHeading())
	    local x = math.sin(self:GetHeading())
	    for i = 1, partamounts do
	        local xpos, ypos, zpos = util.GetRandomOffset( sx, sy, sz, 1)
        	local xdir,ydir,zdir = util.GetRandomOffset( sx, sy, sz, 10)

		local debrisList = {}
		if bp.Display.DestructionEffects.DefaultProjectileCategories then
			for k, v in bp.Display.DestructionEffects.DefaultProjectileCategories do
				for ek, ev in debrisCat.RULEDPC[v] do
					table.insert(debrisList, ev)
				end
			end
		else
			debrisList = debrisCat.RULEDPC.RULEDPC_Generic
		end
		if debrisList then
			if bp.Display.DestructionEffects.DestructionDebrisUseLocalVelocity and bp.Display.DestructionEffects.DestructionDebrisUseLocalVelocity == true then
				speed = bp.Physics.MaxSpeed
				if self.CurrentSpeed == 'Stopped' then
					speed = 0
				elseif self.CurrentSpeed == 'Cruise' then
					speed = speed / 2
				elseif self.CurrentSpeed == 'Stopping' then
					speed = speed / 5
				end
				xdir = xpos + x*speed
				zdir = zpos + z*speed
				ydir = ypos + sy
			end
	        	local debris = self:CreateProjectile(debrisList[util.GetRandomInt(1,table.getn(debrisList))],xpos,ypos,zpos,xdir,ydir,zdir)
			if bp.Display.DestructionEffects.DestructionDebrisUseLocalVelocity and bp.Display.DestructionEffects.DestructionDebrisUseLocalVelocity == true then
				debris:SetVelocity(speed)
			end
		end
	    end
	    if bp.Display.DestructionEffects.DestructionProjectiles then
		    for k, v in bp.Display.DestructionEffects.DestructionProjectiles do
	        	self:CreateProjectileAtBone(v.ProjectileBlueprint,v.Bone)
		    end
	    end
	end,

	HideFlares = function(self)
		local bp = self:GetBlueprint()
		if bp.Weapon then
			for w, weapon in bp.Weapon do
				if weapon.RackBones and weapon.Fake ~= true then
					for k, flare in weapon.RackBones do
						if not flare.HideMuzzle or flare.HideMuzzle == false then
							self:HideBone(flare.MuzzleBones[1], true)
						end
					end
				end
			end
		end
	end,

    OnReclaimed = function(self, entity)
        self:DoUnitCallbacks('OnReclaimed', entity)
        self.CreateReclaimEndEffects( entity, self )
	#OnKilled = function(self, instigator, type, overkillRatio)
        self:OnKilled(entity, "Reclaimed", 0.0)
    end,

    DeathThread = function( self, overkillRatio, instigator)

        #LOG('*DEBUG: OVERKILL RATIO = ', repr(overkillRatio))

        #WaitSeconds( utilities.GetRandomFloat( self.DestructionExplosionWaitDelayMin, self.DestructionExplosionWaitDelayMax) )
        self:DestroyAllDamageEffects()

        if self.PlayDestructionEffects then
            self:CreateDestructionEffects( self, overkillRatio )
        end

        #MetaImpact( self, self:GetPosition(), 0.1, 0.5 )
        if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
            if self.PlayDestructionEffects and self.PlayEndAnimDestructionEffects then
                self:CreateDestructionEffects( self, overkillRatio )
            end
        end

        self:CreateWreckage( overkillRatio )

        # CURRENTLY DISABLED UNTIL DESTRUCTION
        # Create destruction debris out of the mesh, currently these projectiles look like crap,
        # since projectile rotation and terrain collision doesn't work that great. These are left in
        # hopes that this will look better in the future.. =)
        if( self.ShowUnitDestructionDebris and overkillRatio ) then
            if overkillRatio <= 1 then
                self.CreateUnitDestructionDebris( self, true, true, false )
            elseif overkillRatio <= 2 then
                self.CreateUnitDestructionDebris( self, true, true, false )
            elseif overkillRatio <= 3 then
                self.CreateUnitDestructionDebris( self, true, true, true )
            else #VAPORIZED
                self.CreateUnitDestructionDebris( self, true, true, true )
            end
        end

        #LOG('*DEBUG: DeathThread Destroying in ',  self.DeathThreadDestructionWaitTime )
        WaitSeconds(self.DeathThreadDestructionWaitTime)

        self:PlayUnitSound('Destroyed')
        self:Destroy()
    end,

    ##########################################################################################
    ## VETERANCY
    ##########################################################################################


    #Check to see if we should veteran up.
    CheckVeteranLevel = function(self)
        local bp = self:GetBlueprint().Veteran
        if not bp then
            bp = Game.VeteranDefault
        end
        local unitKills = self:GetStat('KILLS', 0).Value + 1
        if self.VeteranLevel == table.getsize(bp) then
            #return # Don't stop at level 5
        end

        local nextLvl = self.VeteranLevel + 1
        local nextKills = bp[('Level' .. nextLvl)]
        if unitKills >= nextKills then
            self:SetVeteranLevel(nextLvl)
        end
    end,

    SetVeteranLevel = function(self, level)
        local old = self.VeteranLevel
        self.VeteranLevel = level

      
        for i = 1, self:GetWeaponCount() do
            local wep = self:GetWeapon(i)
            wep:OnVeteranLevel(old, level)
        end

        local bp = self:GetBlueprint().Buffs
        if bp then
            local lvlkey = 'VeteranLevel' .. level
            for k, v in bp do
                if v.Add[lvlkey] == true then
                    self:AddBuff(v)
                end
            end
        end
        self:GetAIBrain():OnBrainUnitVeterancyLevel(self, level)
        self:DoUnitCallbacks('OnVeteran')
    end,
}

TypeClass = TAunit
