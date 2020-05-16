#CORE Krogoth Laser
#CORKROG_HEAD
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

CORKROG_HEAD = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/PURPLE_LASER_emit.bp',
}

TypeClass = CORKROG_HEAD

