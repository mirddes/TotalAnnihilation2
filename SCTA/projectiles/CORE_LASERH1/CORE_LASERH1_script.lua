#CORE Gaat Gun Laser
#CORE_LASERH1
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

CORE_LASERH1 = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/GREEN_LASER_emit.bp',
}

TypeClass = CORE_LASERH1

