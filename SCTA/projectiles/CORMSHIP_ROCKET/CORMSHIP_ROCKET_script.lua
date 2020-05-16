#CORE Hydra Rocket
#CORMSHIP_ROCKET
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORMSHIP_ROCKET = Class(TAMissileProjectile) {
	TrackTime = 10,

	OnCreate = function(self)
		TAMissileProjectile.OnCreate(self)
		self:ForkThread( self.MovementThread )
	end,

	MovementThread = function(self)
		WaitSeconds(5)
		self:TrackTarget(true)
		WaitSeconds(2)
		self:TrackTarget(false)
	end,
}
TypeClass = CORMSHIP_ROCKET