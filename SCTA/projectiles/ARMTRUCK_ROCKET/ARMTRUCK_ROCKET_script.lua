#ARM Merl Rocket
#ARMTRUCK_ROCKET
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMTRUCK_ROCKET = Class(TAMissileProjectile) {
	TrackTime = 10,

	OnCreate = function(self)
		TAMissileProjectile.OnCreate(self)
		self:ForkThread( self.MovementThread )
	end,

	MovementThread = function(self)
		WaitSeconds(5)
		self:TrackTarget(true)
		WaitSeconds(1)
		self:TrackTarget(false)
	end,
}

TypeClass = ARMTRUCK_ROCKET