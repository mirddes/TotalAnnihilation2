local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local Unit = import('/lua/sim/Unit.lua').Unit
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

TAconstructor = Class(TAunit) {
	currentState = "closed",
	desiredState = "closed",
    currentTarget = nil,
	desiredTarget = nil,
	order = nil,

	isBuilding = false,
	isReclaiming = false,

	pauseTime = 3,
	hideUnit = false,
	isFactory = false,
	spinUnit = false,

	animating = false,
	wantStopAnimation = false,

	AnimationThread = function(self)
		self.animating = true
		while not IsDestroyed(self) and self.wantStopAnimation == false do
			if(self.currentState == "rolloff") then
				self.currentTarget = nil
				self.countdown = self.countdown - 0.2
				if (self.countdown <= 0) then
					self.desiredState = "closed"
				end
			end

			if (self.currentState ~= self.desiredState) then
				if (self.currentState == "closed") then
					#desiredState will only ever be "opened" from this state
					self:Open()
					self.currentState = "opened"
					self.desiredState = "aimed"
				elseif(self.currentState == "opened") then
					if (self.desiredState == "closed") then
						self:DelayedClose()

						--Check to make sure we still want to close
						if (self.desiredState == "closed") then	
							self:Close()
							self.currentState = "closed"
						end
					elseif (self.desiredState == "aimed") then
						if (self.currentTarget and not IsDestroyed(self.currentTarget)) then
							self:StopSpin(self.currentTarget)
						end
						self:RollOff()
						self.currentTarget = self.desiredTarget
						self.currentState = "aimed"
						
						if (self.currentTarget) then
							self:Aim(self.currentTarget)
						else
							self.desiredState = "rolloff"
						end

						if (IsDestroyed(self.currentTarget) == false) then
							if self.isFactory == true and IsDestroyed(self.currentTarget) == false then
								local bone = self:GetBlueprint().Display.BuildAttachBone or 0
								self.currentTarget:AttachBoneTo(-2, self, bone)
							end
							if self.hideUnit and IsDestroyed(self.currentTarget) == false  then
								self.currentTarget:ShowBone(0, true)
								#Need to Show Life Bar here once implemented
							end

							if (self.isBuilding == true) then
								self.currentTarget:HideFlares()
								self:SetBuildRate(self:GetBlueprint().Economy.BuildRate)
								TAunit.OnStartBuild(self, self.currentTarget, self.order)
							end
							if (self.isReclaiming == true) then
								self:SetReclaimTimeMultiplier(20)
							end
							ForkThread(self.Nano, self, self.currentTarget)
						end
					end
				elseif(self.currentState == "aimed" or self.currentState == "rolloff") then
					if (self.desiredState == "closed") then
						self:Close(self)
						self.currentState = "closed"
						if (self.isBuilding == false and self.isReclaiming == false) then
							self.wantStopAnimation = true
						end
					elseif (self.desiredState == "rolloff") then
						self:StopSpin(self.currentTarget)
						self:RollOff()
						self.currentState = "rolloff"
					end
				end
			end

			WaitSeconds(0.2)
		end
		self.animating = false
		self.wantStopAnimation = false
	end,


    OnKilled = function(self, instigator, type, overkillRatio)
        #If factory, destory what I'm building if I die
        TAunit.OnKilled(self, instigator, type, overkillRatio)
        if self.isFactory then
            if self.currentTarget and not self.currentTarget:IsDead() and self.currentTarget:GetFractionComplete() != 1 then
                self.currentTarget:Kill()
                self.currentTarget:Destroy()
            end
        end
    end,


	OnStartBuild = function(self, unitBeingBuilt, order )

        if unitBeingBuilt.noassistbuild and unitBeingBuilt:GetHealth()==unitBeingBuilt:GetMaxHealth() then
            return
        end

		self:SetBuildRate(0)
		self.desiredTarget = unitBeingBuilt
		if (self.currentState == "aimed" or self.currentState == "opened" or self.currentState == "rolloff") then
			self.currentState = "opened"
			self.desiredState = "aimed"
		else
			self.desiredState = "opened"
		end
		self:SetAllWeaponsEnabled(false)
		if self.hideUnit and IsDestroyed(unitBeingBuilt) == false then
			unitBeingBuilt:HideBone(0, true)
			#Need to Hide Life Bar
		end
		self.isBuilding = true
		self.isReclaiming = false
		self.order = order
		self.wantStopAnimation = false
		if (self.animating == false) then
			ForkThread(self.AnimationThread, self)
		end
	end,

	OnStopBuild = function(self, unitBeingBuilt, order )
		TAunit.OnStopBuild(self, unitBeingBuilt, order )
		self.desiredTarget = nil
		self.isBuilding = false
		self.countdown = self.pauseTime
		if (self.currentState == "aimed") then
			self.desiredState = "rolloff"
		else
			self.desiredState = "closed"
		end
		self:SetAllWeaponsEnabled(true)
		if self.isFactory then
			self:SetBusy(true)
			self:SetBlockCommandQueue(true)
		end
	end,


	StopSpin = function(self, unitBeingBuilt)
		if self.isFactory == true and unitBeingBuilt then
			unitBeingBuilt:DetachFrom(true)
		end
	end,


	OnStartReclaim = function(self, target)
		self:SetReclaimTimeMultiplier(99999)
		self:SetBuildRate(self:GetBlueprint().Economy.BuildRate)
		TAunit.OnStartReclaim(self, target)
		self.desiredTarget = target
		if (self.currentState == "aimed") then
			self.currentState = "opened"
			self.desiredState = "aimed"
		else
			self.desiredState = "opened"
		end
		self:SetAllWeaponsEnabled(false)
		self.isReclaiming = true
		self.isBuilding = false
		self.wantStopAnimation = false
		if (self.animating == false) then
			ForkThread(self.AnimationThread, self)
		end
	end,


	OnStopReclaim = function(self, target)
		TAunit.OnStopReclaim(self, target)
		self.desiredTarget = nil
		self.isReclaiming = false
		self.countdown = self.pauseTime
		self.desiredState = "closed"
		self:SetAllWeaponsEnabled(true)
	end,

	DelayedClose = function(self)
		if self.isFactory then
			# Wait until unit factory is clear to close
			local onlySelf = false
			while onlySelf == false do
				onlySelf = self:AreaClear(self:GetCloseArea())
				if not onlySelf then	
					WaitSeconds(0.5)
				end
				if self.isBuilding == true then
					return
				end
			end
		end
	end,

	GetCloseArea = function(self)
		local bp = self:GetBlueprint()
		local pos = self:GetPosition(bp.Display.BuildAttachBone)
		local area = nil
		if bp.Physics.CloseAreaX and bp.Physics.CloseAreaZ then
			area = Rect(pos.x - bp.Physics.CloseAreaX / 2, pos.z - bp.Physics.CloseAreaZ / 2, pos.x + bp.Physics.CloseAreaX / 2, pos.z + bp.Physics.CloseAreaX / 2)
		else
			area = Rect(pos.x - bp.SizeX / 2, pos.z - bp.SizeZ / 2, pos.x + bp.SizeX / 2, pos.z + bp.SizeZ / 2)
		end
		return area
	end,

	GetBuildArea = function(self)
		local bp = self:GetBlueprint()
		local pos = self:GetPosition(bp.Display.BuildAttachBone)
		local area = nil
		if bp.Physics.BuildAreaX and bp.Physics.BuildAreaZ then
			area = Rect(pos.x - bp.Physics.BuildAreaX / 2, pos.z - bp.Physics.BuildAreaZ / 2, pos.x + bp.Physics.BuildAreaX / 2, pos.z + bp.Physics.BuildAreaX / 2)
		else
			area = Rect(pos.x - bp.SizeX / 2, pos.z - bp.SizeZ / 2, pos.x + bp.SizeX / 2, pos.z + bp.SizeZ / 2)
		end
		return area
	end,

	AreaClear = function(self, area)
		local unitsInRect = GetUnitsInRect(area)
		for k, v in unitsInRect do
			if v != self and v != self.desiredTarget then
				if (v:GetPosition().x > area.x0) and (v:GetPosition().x < area.x1) and (v:GetPosition().z > area.y0) and (v:GetPosition().z < area.y1) then
					if v:GetPosition().y < self:GetPosition().y + 2 then
						return false
					end
				end
			end
		end
		return true
	end,

	RollOff = function(self)
		if self.isFactory then
			# Wait until unit has left the factory
			local onlySelf = false
			while onlySelf == false do
				onlySelf = self.AreaClear(self, self.GetBuildArea(self))
				if not onlySelf then
					WaitSeconds(0.5)
				end
			end
			self:SetBusy(false)
			self:SetBlockCommandQueue(false)
		end
	end,

	Open = function(self)
	end,

	Aim = function(self, target)
	end,

	Close = function(self)
	end,

	Nano = function(self, unitBeingBuilt)
		local target = 1
		local current = 0
		while  self.isBuilding == true and IsDestroyed(unitBeingBuilt) == false and unitBeingBuilt:GetFractionComplete() < 1 or self.isReclaiming == true and self.currentState == "aimed" do
			if self:IsPaused() == false then

				current = current + 1
				if current >= target or self.isReclaiming == true then
					for k,v in self:GetBlueprint().Display.BuildBones do

                        local selfPosition = self:GetPosition(v) 
                        local targetPosition = unitBeingBuilt:GetPosition()
                        local distance = VDist3(Vector(selfPosition.x,selfPosition.y, selfPosition.z), Vector(targetPosition.x, targetPosition.y, targetPosition.z))
                        local time = distance * 0.85
                        if (time >10) then
                            time = 10
                        end

						local aiBrain = self:GetAIBrain()
						local storedMass = aiBrain:GetEconomyStoredRatio('MASS')
						local storedEnergy = aiBrain:GetEconomyStoredRatio('ENERGY')
						local ratioMass = aiBrain:GetEconomyIncome('MASS') / aiBrain:GetEconomyRequested('MASS')
						local ratioEnergy =  aiBrain:GetEconomyIncome('ENERGY') / aiBrain:GetEconomyRequested('ENERGY')
						local lowestStored = math.min(storedMass, storedEnergy)
						if lowestStored == storedMass then 
							lowestRatio = ratioMass
						else
							lowestRatio = ratioEnergy
						end

						local bp
						if (self.isBuilding == true) then
							bp = self:GetBlueprint().Display.BuildEmitter or 'nanolathe.bp'
							CreateEmitterAtBone(self, v, self:GetArmy(), '/mods/SCTA/effects/emitters/' .. bp ):ScaleEmitter(0.1):SetEmitterCurveParam('LIFETIME_CURVE',time,0)
						else
							bp = self:GetBlueprint().Display.ReclaimEmitter or 'reclaimnanolathe.bp'
							CreateEmitterAtBone(self, v, self:GetArmy(), '/mods/SCTA/effects/emitters/' .. bp ):ScaleEmitter(0.1):SetEmitterCurveParam('LIFETIME_CURVE',time,0):SetEmitterCurveParam('Z_POSITION_CURVE',distance * 10,0)
						end
						

						if lowestRatio < 1 and lowestStored < 0.1 then
							target = math.floor(1 / lowestRatio)
						else
							target = 1
						end
					end
					current = 0
				end
			end
			WaitSeconds(0.25)
		end
	end,
}

TypeClass = TAconstructor