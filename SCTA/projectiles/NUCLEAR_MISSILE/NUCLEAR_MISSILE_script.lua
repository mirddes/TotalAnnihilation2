#Nuclear Missile Rocket
#NUCLEAR_MISSILE
#
#Script created by Raevn

local TANuclearProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TANuclearProjectile

NUCLEAR_MISSILE = Class(TANuclearProjectile) {
	CommanderDamage = 2900,	

	OnCreate = function(self)
		TANuclearProjectile.OnCreate(self)
        	self:SetCollisionShape('Sphere', 0, 0, 0, 2.0)
		self:ForkThread( self.MovementThread )
	end,

	MovementThread = function(self)
		WaitSeconds(8)
		self:TrackTarget(true)
		WaitSeconds(0.5)
		self:TrackTarget(false)
		while self:GetDistanceToTarget() > 10 do
			WaitSeconds(0.5)
		end
		self:TrackTarget(true)
	end,

    	GetDistanceToTarget = function(self)
        	local tpos = self:GetCurrentTargetPosition()
        	local mpos = self:GetPosition()
        	local dist = VDist2(mpos[1], mpos[3], tpos[1], tpos[3])
        	return dist
	end,
}

TypeClass = NUCLEAR_MISSILE