#CORE Pyro Flamethrower
#FLAMETHROWER
#
#Script created by Raevn

local TALightCannonProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALightCannonProjectile

FLAMETHROWER = Class(TALightCannonProjectile) {
	PyroDamage = 2,
	Smoke = true,

	FxSmoke = '/mods/SCTA/effects/emitters/flamethrower_emit.bp',

	OnCreate = function(self)
		TALightCannonProjectile.OnCreate(self)
		ForkThread(self.MovementThread,self)
	end,

	MovementThread = function(self)
		while not IsDestroyed(self) do
			local pos = self:GetPosition()
			DamageArea(self, pos, 1, 10, 'Normal', false)
			WaitSeconds(0.1)
		end
	end,

	FxImpactAirUnit = {},
	FxImpactShield = {},
	FxImpactUnit = {},
	FxImpactProp = {},
	FxImpactLand = {},
	FxImpactWater = {},
}

TypeClass = FLAMETHROWER
