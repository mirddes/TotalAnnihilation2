faCompatibility = false

function GetDistanceBetweenTwoPoints(x1, z1, x2, z2)
	#lol ^ is broken :P
	local dx = (x2-x1)*(x2 - x1)
	local dz = (z2-z1)*(z2 - z1)
	local distance = math.sqrt(dx + dz)

	return ( distance )
end

function VDist2(u,v)
    local dx = u.x-v.x
    local dz = u.z-v.z
    return math.sqrt(dx*dx + dz*dz)
end

function getUnitChat()
	return -1
end

function DisplayMessage(message, importance)
	if getUnitChat() >= importance then
		print(message)
	end
end

function GetAngle(x1, z1, x2, z2)
	local dx = x2 - x1
	local dz = z2 - z1

	local angle = math.atan(math.abs(dz) / math.abs(dx))

	if dz < 0 then
		if dx < 0 then
			angle = math.pi - angle
		elseif dx == 0 then
			angle = math.pi / 2
		end
	elseif dz > 0 then
		if dx < 0 then
			angle = math.pi + angle
		elseif dx > 0 then
			angle = 2 * math.pi - angle
		elseif dx == 0 then
			angle = 3 * math.pi
		end
	else
		if dx < 0 then
			angle = math.pi
		else
			angle = 0
		end
	end
	return (angle / math.pi) * 180 + 90
end


function CalcDamageTaper(positionEpicentre, positionEntity, radius, edgeEffectiveness)
    # spherical above, cylindrical below

    local edge = edgeEffectiveness or 0.0
    local taperCoef = (1.0-edge)/radius

    local dx = positionEpicentre.x - positionEntity.x
    local dy = positionEpicentre.y - positionEntity.y
    local dz = positionEpicentre.z - positionEntity.z

    local r = math.sqrt(dx*dx + dy*dy + dz*dz)
    if r > radius then
        return 0.0

    else
        return (1.0 - taperCoef*r)
    end

end


function Clamp(x,lb,ub)
    if x >= ub then
        return ub
    elseif x <= lb then
        return lb
    else
        return x
    end
end


function TADamageUnitsInArea(instigator, location, radius, damage, projectile, damageType, damageAllies, damageSelf, edgeEffectiveness)

    local rect = Rect(location[1]-radius-1, location[3]-radius-1, location[1]+radius+1, location[3]+radius+1)
    local units = GetUnitsInRect(rect) or {}

    for _, u in units do

        local collisionExtents = u:GetCollisionExtents()
        local damagePosition = {
            x=Clamp(location[1],collisionExtents.Min[1],collisionExtents.Max[1]),
            y=Clamp(location[2],collisionExtents.Min[2],collisionExtents.Max[2]),
            z=Clamp(location[3],collisionExtents.Min[3],collisionExtents.Max[3]),
            }

        local taper = CalcDamageTaper(location, damagePosition, radius, edgeEffectiveness)
        #LOG("--collisionExtents="..repr(collisionExtents))
        #LOG("  damagePosition="..damagePosition.x..","..damagePosition.y..","..damagePosition.z)
        #LOG("  epiPosition="..location.x..","..location.y..","..location.z)
        #LOG("  taper="..repr(taper)..", edgeEffectiveness="..repr(edgeEffectiveness))

        if taper<=0 then continue end

        local dmg1 = damage
        if projectile then
            dmg1 = projectile:AdjustDamageForTarget(u, damage)
        end
        local dmg2 = dmg1 * taper

        army = instigator:GetArmy() or nil
        if instigator == u then
            if damageSelf then
                local vector = import('/lua/utilities.lua').GetDirectionVector(location, u:GetPosition())
                -- need this ugliness due to Damage() refuse to damage when instigator == u
                instigator:OnDamage(instigator, dmg2, vector, damageType)
            end

        elseif damageAllies or not IsAlly(army, u:GetArmy()) then
            #bp = u:GetBlueprint()
            #LOG("  TADamageUnitsInArea, UnitName="..repr(bp.General.UnitName)..", dmg1="..dmg1..", taper="..taper..", dmg2="..dmg2)
            Damage(instigator, location, u, dmg2, damageType)
        end
    end

end


function TADamageReclaimablesInArea(instigator, location, radius, damage, projectile, damageType, edgeEffectiveness)

    local rect = Rect(location[1]-radius, location[3]-radius, location[1]+radius, location[3]+radius)
    local reclaimables = GetReclaimablesInRect(rect) or {}

    for _, reclaimable in reclaimables do
        -- nobody cares about accurate replication of TA damage to reclaimables so just calculate taper based on centre of entity
        local taper = CalcDamageTaper(location, reclaimable:GetPosition(), radius, edgeEffectiveness)
        if taper<=0 then continue end

        local dmg = damage * taper
        if IsProp(reclaimable) and dmg > 0.0 then
            Damage(instigator, location, reclaimable, dmg, damageType)
        end
    end
end


function TADamageEntity(instigator, location, targetEntity, damage, projectile, damageType)
    local dmg = damage
    if projectile then
        dmg = projectile:AdjustDamageForTarget(targetEntity, damage)
    end

    if dmg and dmg>0 then
        Damage(instigator, location, targetEntity, dmg, damageType)
    end
end


function DoTaperedAreaDamage(instigator, location, radius, damage, projectile, targetEntity, damageType, damageAllies, damageSelf, edgeEffectiveness)

    if radius and radius > 0 then
        -- Get rid of trees
        DamageArea(instigator, location, radius, 1, 'Force', false, false)

        TADamageUnitsInArea(instigator, location, radius, damage, projectile, damageType, damageAllies, damageSelf, edgeEffectiveness)
        TADamageReclaimablesInArea(instigator, location, radius, damage, projectile, damageType, edgeEffectiveness)

    elseif targetEntity then
        TADamageEntity(instigator, location, targetEntity, damage, projectile, damageType)
    end

end

-- Raevn's original tapered damage function. doesn't account for y differential or collision box or specific projectile/target damage
function DoTaperedAreaDamageRaevn(instigator, position, radius, damage, projectile, targetEntity, damageType, damageFriendly, damageSelf, edgeEffectiveness)
	local precision = math.floor(radius * 2) + 1
	local pulse = 0
	local edge = edgeEffectiveness or 0

        if radius and radius > 0 then
		if edge * damage > 0 then
			DamageArea(instigator, position, radius, damage * edge, damageType, damageFriendly, damageSelf or false)
		end
		while pulse < precision do
			local factor = (pulse + 1) / precision
       			if damage and damage - edge > 0 then
	            		DamageArea(instigator, position, radius * factor, damage / precision + (1 - factor) * damage * edge, damageType, damageFriendly, damageSelf or false)
        		end
			pulse = pulse + 1
		end
	elseif damage and targetEntity then
		Damage(instigator, position, targetEntity, damage, damageType)
	end
end



textureChange = {
	{
		currentAnim = 1,
		frames = 8,
		bones = {
			{
			'a',
			'b',
			'c',
			'd',
			'e',
			'd',
			'c',
			'b',
			},
			{
			'a2',
			'b2',
			'c2',
			'd2',
			'e2',
			'd2',
			'c2',
			'b2',
			},
		},
	},
	{
		currentAnim = 1,
		frames = 6,
		bones = {
			{
			'a',
			'b',
			'c',
			'd',
			'c',
			'b',
			},
			{
			'a2',
			'b2',
			'c2',
			'd2',
			'c2',
			'b2',
			},
		}
	},
}

function TextureChangeCall()
	while true do
		for k,v in textureChange do
			local hide1 = v.bones[1][v.currentAnim]
			local hide2 = v.bones[2][v.currentAnim]
			v.currentAnim = v.currentAnim + 1
			if v.currentAnim > v.frames then
				v.currentAnim = 1
			end
			for bk,bv in ArmyBrains do
				local units = bv:GetListOfUnits(categories.TEXTUREANIM, false)

				if units then
					for uk,uv in units do
						if uv:GetFractionComplete() == 1 then
							if uv:GetBlueprint().Display.TextureAnimationFrames == v.frames then
								if uv.textureAnimation == true then
									uv:ShowBone(v.bones[1][v.currentAnim], true)
									uv:HideBone(hide1, true)
									if (uv:GetBlueprint().Display.TextureAnimationSets == 2) then
										uv:ShowBone(v.bones[2][v.currentAnim], true)
										uv:HideBone(hide2, true)
									end
								else
									uv:HideBone(hide1, true)
									uv:ShowBone(v.bones[1][v.currentAnim], true)
									if (uv:GetBlueprint().Display.TextureAnimationSets == 2) then
										uv:HideBone(hide2, true)
										uv:ShowBone(v.bones[2][v.currentAnim], true)
									end
								end
							end
						end
					end
				end
			end
		end
		WaitSeconds(0.5)
	end
end


function QueueDelayedWreckage(self,overkillRatio, bp, completed, pos, orientation, health)
	ForkThread(CreateDelayedWreckage, self, overkillRatio, bp, completed, pos, orientation, health)
end


function CreateDelayedWreckage(self,overkillRatio, bp, completed, pos, orientation, health)
	local WreckShield = import('/mods/SCTA/lua/TAshield.lua').WreckShield

	#see if we can reduce this?
	while not IsDestroyed(self) do
		WaitSeconds(0.4)
	end

	local wreck = bp.Wreckage.Blueprint
	if wreck and completed == 1 then
			
		local prop = CreateProp( pos, wreck )
		pbp = prop:GetBlueprint()


		prop:SetScale(pbp.Display.UniformScale)
		prop:SetOrientation(orientation, true)

		local mass = (pbp.Economy.ReclaimMassMax or 0)
		local energy = (pbp.Economy.ReclaimEnergyMax or 0)
		#change this to point to the wreckage prop intead of the unit blueprint?
		local time = (bp.Wreckage.ReclaimTimeMultiplier or 1) 

		prop:SetMaxReclaimValues(time, mass, energy)

		prop.OriginalUnit = self.OriginalUnit or self
		if pbp.Physics.BlockPath == true then
		        prop.myShield = WreckShield {
        	        	Owner = self,
               			FactionName = bp.General.FactionName,
               			CollisionSizeX = (pbp.CollisionSizeX or (pbp.SizeX or 2)) / 2,
	               		CollisionSizeY = (pbp.CollisionSizeY or (pbp.SizeY or 2)) / 2,
	       	        	CollisionSizeZ = (pbp.CollisionSizeZ or (pbp.SizeZ or 2)) / 2,
                		CollisionCenterX = pbp.CollisionOffsetX or 0,
               			CollisionCenterY = pbp.SizeY / 2 + pbp.CollisionOffsetY or 0,
	               		CollisionCenterZ = pbp.CollisionOffsetZ or 0,
                		OwnerShieldMesh = pbp.Display.MeshBlueprint,
	               		ShieldMaxHealth = prop:GetHealth(),
                		ShieldRechargeTime = 999,
	       	        	ShieldEnergyDrainRechargeTime = 0,
                		ShieldRegenRate = 0,
               			ShieldRegenStartTime = 999,
				Wreck = prop,
				Orientation = orientation,
				Position = pos,
	                }
		end
		prop:DoTakeDamage(prop, overkillRatio * health, Vector(0,0,0), 'Normal')
        	prop.AssociatedBP = pbp.BlueprintId
	end
end



wind = {
	direction = 0,
	amount = 0,
    threadStarted = false
}

function WindChangeThread()

    if wind.threadStarted then
        return
    end
    wind.threadStarted = true
    LOG('Started WindChangeThread')

	worldData = import('sim/worldData.lua')
	if worldData.GetMap().maxWind > 0 then
		while true do

			wind.direction = math.random(360)
			wind.amount = math.random(worldData.GetMap().maxWind - worldData.GetMap().minWind) + worldData.GetMap().minWind

			for bk,bv in ArmyBrains do
				local generators = bv:GetListOfUnits(categories.WIND, false)
				if generators then
					for k,v in generators do
						v.OnWindChange(v, wind.direction, wind.amount)
					end
				end
			end

			WaitSeconds(15)
		end
	end
end

targetingFacilityData = {}

function registerTargetingFacility(army)
    if (targetingFacilityData[army]) then
        targetingFacilityData[army] = targetingFacilityData[army] + 1
    else
        targetingFacilityData[army] = 1
    end

end

function unregisterTargetingFacility(army)
    if (targetingFacilityData[army]) then
        targetingFacilityData[army] = targetingFacilityData[army] - 1
    else
        targetingFacilityData[army] = 0
    end
end

function ArmyHasTargetingFacility(army)
    return (targetingFacilityData[army] > 0 and GetArmyBrain(army):GetEconomyStored('ENERGY') > 0)
end


function StringTokeniser (s,tok)

    local line = s
    local tokStart = nil
    local tokEnd = 0
    return function ()
        while line do
            local s, e = string.find(line, ";", tokEnd+1)
            if s then
                tokStart = tokEnd+1
                tokEnd = s
                return string.sub(line, tokStart, tokEnd-1)
            else
                tokStart = tokEnd+1
                substr = string.sub(line, tokStart)
                line = nil
                return substr
            end
        end
        return nil
    end
end


function WordIterator(s)

    local pos,_ = string.find(s,'%S',1)
    return function()
        while pos do
            local nextPos,_ = string.find(s,'%s',pos)

            if nextPos then
                word = string.sub(s,pos,nextPos-1)
                pos,_ = string.find(s,'%S',nextPos)
            else
                word = string.sub(s,pos)
                pos = nil
            end
            return word
        end
        return nil
    end

end


function Cobler(script, spinners, sliders)

    local words
    for line in StringTokeniser(script,';') do
        words = { }
        for word in WordIterator(line) do
            table.insert(words,word)
        end

        if words[1] == "SLEEP" then
            local seconds = tonumber(string.sub(words[2],2,-2)) / 1000.0
            --LOG('SLEEP '..seconds)
            WaitSeconds(seconds)

        elseif words[1] == "TURN" then
            local bone = words[2]
            local axis = words[4]
            local angle = tonumber(string.sub(words[5],2,-2))
            local speed = tonumber(string.sub(words[7],2,-2))
            local spinner = spinners[bone]
            if spinner then
                spinner:SetGoal(angle)
                spinner:SetSpeed(speed)
            else
                LOG('invalid spinner for command: TURN '..bone..' '..angle..' '..speed)
            end

        elseif words[1] == "MOVE" then
            local bone = words[2]
            local axis = words[4]
            local goal = tonumber(string.sub(words[5],2,-2))
            local speed = tonumber(string.sub(words[7],2,-2))
            local slider = sliders[bone]
            if slider then
                if axis == 'x-axis' then
                    slider:SetGoal(goal, 0, 0)
                elseif axis == 'y-axis' then
                    slider:SetGoal(0, goal, 0)
                elseif axis == 'z-axis' then
                    slider:SetGoal(0, 0, goal)
                end
                slider:SetSpeed(speed)
            else
                LOG('invalid slider for command: MOVE '..bone..' '..axis..' '..goal..' '..speed)
            end
        end
    end

end
