#Anti Nuke Rocket
#AMD_ROCKET
#
#Projectile created by Raevn

local TAAntiNukeProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAAntiNukeProjectile

AMD_ROCKET = Class(TAAntiNukeProjectile) {
	OnCreate = function(self)
		TAAntiNukeProjectile.OnCreate(self)
        	self:SetCollisionShape('Sphere', 0, 0, 0, 2.0)
		self:ForkThread( self.MovementThread )
	end,

	MovementThread = function(self)
		#WaitSeconds(1.5)
		self:TrackTarget(true)
	end,
}

TypeClass = AMD_ROCKET