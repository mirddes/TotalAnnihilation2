#CORE Krogoth Rocket
#CORKROG_ROCKET
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORKROG_ROCKET = Class(TAMissileProjectile) {
	TrackTime = 15,
	AirDamage = 383,

	OnCreate = function(self)
		TAMissileProjectile.OnCreate(self)
		self:ForkThread( self.MovementThread )
	end,

	MovementThread = function(self)
		WaitSeconds(1)
		self:TrackTarget(true)
	end,
}

TypeClass = CORKROG_ROCKET