#CORE Instigator Laser
#GATOR_LASER
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

GATOR_LASER = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = GATOR_LASER

