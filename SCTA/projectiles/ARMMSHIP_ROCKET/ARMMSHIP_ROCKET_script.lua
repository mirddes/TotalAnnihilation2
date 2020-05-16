#ARM Ranger Rocket
#ARMMSHIP_ROCKET
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMMSHIP_ROCKET = Class(TAMissileProjectile) {
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
TypeClass = ARMMSHIP_ROCKET