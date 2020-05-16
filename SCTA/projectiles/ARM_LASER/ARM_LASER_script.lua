#ARM Jeffy Laser
#ARM_LASER
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARM_LASER = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/YELLOW_LASER_emit.bp',
}

TypeClass = ARM_LASER

