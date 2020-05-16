#CORE Titan Torpedo Weapon
#CORAIR_TORPEDO
#
#Script created by Raevn

local TAUnderWaterProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAUnderWaterProjectile

CORAIR_TORPEDO = Class(TAUnderWaterProjectile) {
	TrackTime = 10,

	OnEnterWater = function(self)
		ForkThread(self.MovementThread,self)
		TAUnderWaterProjectile.OnEnterWater(self)
	end,

	MovementThread = function(self)
		self:TrackTarget(true)
		WaitSeconds(0.1)
		self:SetTurnRate(55)
	end,
}

TypeClass = CORAIR_TORPEDO