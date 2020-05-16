local SinglePolyTrailProjectile = import('/lua/sim/Defaultprojectiles.lua').SinglePolyTrailProjectile
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

TAProjectile = Class(SinglePolyTrailProjectile) {
	Smoke = false,

	FxSmoke = '/mods/SCTA/effects/emitters/smoke_emit.bp',
	FxSmokeScale = 1,

	PolyTrail = '',

	OnCreate = function(self)
		SinglePolyTrailProjectile.OnCreate(self)
		if self.TrackTime then
			self:ForkThread( self.TrackingThread, self )
		end
		if self.Smoke == true then
			self.Trash:Add(CreateAttachedEmitter(self, 0, self:GetArmy(), self.FxSmoke):ScaleEmitter(self.FxSmokeScale))
		end
        	#self:SetCollisionShape('Sphere', 0, 0, 0, 1)
	end,

	TrackingThread = function(self)
		WaitSeconds(self.TrackTime)
		self:TrackTarget(false)
		self.Smoke = false
	end,


    AdjustDamageForTarget = function(self, targetEntity, defaultDamage)
        if targetEntity and defaultDamage and IsUnit(targetEntity) then
            if self.AirDamage and EntityCategoryContains(categories.AIR, targetEntity) then
                return self.AirDamage
            elseif self.CommanderDamage and EntityCategoryContains(categories.COMMANDER, targetEntity) then
                return self.CommanderDamage
            elseif self.NormalSubDamage and EntityCategoryContains(categories.NORMALSUB, targetEntity) then
                return self.NormalSubDamage
            elseif self.AdvancedSubDamage and EntityCategoryContains(categories.ADVANCEDSUB, targetEntity) then
                return self.AdvancedSubDamage
            elseif self.FlashDamage and EntityCategoryContains(categories.ARMFLASH, targetEntity) then
                return self.FlashDamage
            elseif self.PeeweeDamage and EntityCategoryContains(categories.ARMPW, targetEntity) then
                return self.PeeweeDamage
            elseif self.WarriorDamage and EntityCategoryContains(categories.ARMWAR, targetEntity) then
                return self.WarriorDamage
            elseif self.PyroDamage and EntityCategoryContains(categories.CORPYRO, targetEntity) then
                return self.PyroDamage
            end
        end
        return defaultDamage
    end,

    DoDamage = function(self, instigator, damageData, targetEntity)
        local radius
        if damageData.AlternateDamageRadius and damageData.AlternateDamageRadius > 0 then
            radius = damageData.AlternateDamageRadius 
        else
            radius = damageData.DamageRadius
        end
        TAutils.DoTaperedAreaDamage(
            instigator, self:GetPosition(), radius, damageData.DamageAmount, self, targetEntity,
            damageData.DamageType, damageData.DamageFriendly, damageData.DamageSelf, damageData.EdgeEffectiveness)
    end,

	PassDamageData = function(self, damageData)
		self.DamageData.DamageRadius = damageData.DamageRadius
		self.DamageData.DamageAmount = damageData.DamageAmount
		self.DamageData.DamageType = damageData.DamageType
		self.DamageData.DamageFriendly = damageData.DamageFriendly
		self.DamageData.CollideFriendly = damageData.CollideFriendly
		self.DamageData.DoTTime = damageData.DoTTime
		self.DamageData.DoTPulses = damageData.DoTPulses
		self.DamageData.MetaImpactAmount = damageData.MetaImpactAmount
		self.DamageData.MetaImpactRadius = damageData.MetaImpactRadius
		self.DamageData.Buffs = damageData.Buffs
		self.DamageData.ArtilleryShieldBlocks = damageData.ArtilleryShieldBlocks
		self.DamageData.AlternateDamageRadius = damageData.AlternateDamageRadius
	end,
}

TANuclearProjectile = Class(TAProjectile) {
	Smoke = true,

	FxImpactAirUnit = {
		'/mods/SCTA/effects/emitters/COMBOOM_emit.bp',
	},
	FxAirUnitHitScale = 15,
	FxImpactShield = {
		'/mods/SCTA/effects/emitters/COMBOOM_emit.bp',
	},
	FxShieldHitScale = 15,
	FxImpactUnit = {
		'/mods/SCTA/effects/emitters/COMBOOM_emit.bp',
	},
	FxUnitHitScale = 15,
	FxImpactProp = {
		'/mods/SCTA/effects/emitters/COMBOOM_emit.bp',
	},
	FxPropHitScale = 15,
	FxImpactLand = {
		'/mods/SCTA/effects/emitters/COMBOOM_emit.bp',
	},
	FxLandHitScale = 15,
	FxImpactWater = {
		'/effects/emitters/destruction_water_splash_ripples_01_emit.bp',
		'/effects/emitters/destruction_water_splash_wash_01_emit.bp',
		'/effects/emitters/destruction_water_splash_plume_01_emit.bp',
	},
    	FxWaterHitScale = 15,
	FxImpactProjectile = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxProjectileHitScale = 1.5,
    
    FxImpactTrajectoryAligned = false,

}

TAHeavyCannonProjectile = Class(TAProjectile) {
	FxImpactAirUnit = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxAirUnitHitScale = 2,
	FxImpactShield = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxShieldHitScale = 2,
	FxImpactUnit = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxUnitHitScale = 2,
	FxImpactProp = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxPropHitScale = 2,
	FxImpactLand = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
		'/mods/SCTA/effects/emitters/napalm_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxLandHitScale = 2,
	FxImpactWater = {
		'/effects/emitters/destruction_water_splash_ripples_01_emit.bp',
		'/effects/emitters/destruction_water_splash_wash_01_emit.bp',
		'/effects/emitters/destruction_water_splash_plume_01_emit.bp',
	},
    	FxWaterHitScale = 1.5,
}

TACannonProjectile = Class(TAProjectile) {
	FxImpactAirUnit = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
	},
	FxAirUnitHitScale = 1.25,
	FxImpactShield = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
	},
	FxShieldHitScale = 1.25,
	FxImpactUnit = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
	},
	FxUnitHitScale = 1.25,
	FxImpactProp = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
	},
	FxPropHitScale = 1.25,
	FxImpactLand = {
		'/mods/SCTA/effects/emitters/napalm_fire_emit.bp',
	},
	FxLandHitScale = 1.25,
	FxImpactWater = {
		'/effects/emitters/destruction_water_splash_ripples_01_emit.bp',
		'/effects/emitters/destruction_water_splash_wash_01_emit.bp',
		'/effects/emitters/destruction_water_splash_plume_01_emit.bp',
	},
    	FxWaterHitScale = 0.75,
}

TAMediumCannonProjectile = Class(TAProjectile) {
	FxImpactNone = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxNoneHitScale = 0.35,
	FxImpactShield = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxShieldHitScale = 0.35,
	FxImpactUnit = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxUnitHitScale = 0.35,
	FxImpactAirUnit = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxAirUnitHitScale = 0.35,
	FxImpactProp = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxPropHitScale = 0.35,
	FxImpactLand = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxLandHitScale = 0.35,
	FxImpactWater = {
		'/effects/emitters/destruction_water_splash_ripples_01_emit.bp',
		'/effects/emitters/destruction_water_splash_wash_01_emit.bp',
		'/effects/emitters/destruction_water_splash_plume_01_emit.bp',
	},
    	FxWaterHitScale = 0.5,
}

TALightCannonProjectile = Class(TAProjectile) {
	FxImpactAirUnit = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxAirUnitHitScale = 0.25,
	FxImpactShield = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxShieldHitScale = 0.25,
	FxImpactUnit = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxUnitHitScale = 0.25,
	FxImpactProp = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxPropHitScale = 0.25,
	FxImpactLand = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxLandHitScale = 0.25,
	FxImpactWater = {
		'/effects/emitters/destruction_water_splash_ripples_01_emit.bp',
		'/effects/emitters/destruction_water_splash_wash_01_emit.bp',
	},
    	FxWaterHitScale = 0.5,
}

TAMissileProjectile = Class(TAMediumCannonProjectile) {
	Smoke = true,
}


TAAntiNukeProjectile = Class(TAMissileProjectile) {
	FxImpactProjectile = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxProjectileHitScale = 1.5,
}

TALaserProjectile = Class(TAProjectile) {

	FxImpactAirUnit = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxAirUnitHitScale = 0.25,
	FxImpactShield = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxShieldHitScale = 0.25,
	FxImpactUnit = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxUnitHitScale = 0.25,
	FxImpactProp = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxPropHitScale = 0.25,
	FxImpactLand = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
	},
	FxLandHitScale = 0.25,
	FxImpactWater = {
		'/effects/emitters/destruction_water_splash_ripples_01_emit.bp',
		'/effects/emitters/destruction_water_splash_wash_01_emit.bp',
	},
    	FxWaterHitScale = 0.5,
}

TAEMGProjectile = Class(TALaserProjectile ) {
}

TAUnderWaterProjectile = Class(TAMediumCannonProjectile) {
	OnEnterWater = function(self)
		for k,v in self.FxImpactWater do
			CreateEmitterAtEntity(self, self:GetArmy(), v):ScaleEmitter(self.FxWaterHitScale)
		end
	end,

	OnExitWater = function(self)
		for k,v in self.FxImpactWater do
			CreateEmitterAtEntity(self, self:GetArmy(), v):ScaleEmitter(self.FxWaterHitScale)
		end
	end,

	FxImpactLand = {
		'/effects/emitters/destruction_water_splash_ripples_01_emit.bp',
		'/effects/emitters/destruction_water_splash_wash_01_emit.bp',
		'/effects/emitters/destruction_water_splash_plume_01_emit.bp',
	},

	FxImpactUnderWater = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
	},
	FxUnderWaterHitScale = 0.35,
	FxImpactWater = {
		'/effects/emitters/destruction_water_splash_ripples_01_emit.bp',
	},
    	FxWaterHitScale = 0.35,
}