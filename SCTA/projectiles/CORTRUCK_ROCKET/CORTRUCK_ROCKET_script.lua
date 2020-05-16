#CORE Diplomat Rocket
#CORTRUCK_ROCKET
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORTRUCK_ROCKET = Class(TAMissileProjectile) {
	TrackTime = 10,

	OnCreate = function(self)
		TAMissileProjectile.OnCreate(self)
		self:ForkThread( self.MovementThread )
	end,

	MovementThread = function(self)
		WaitSeconds(5)
		self:TrackTarget(true)
		WaitSeconds(3)
		self:TrackTarget(false)
	end,
}

TypeClass = CORTRUCK_ROCKET