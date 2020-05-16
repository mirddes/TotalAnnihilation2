#ARM Flea Laser
#ARMFLEA_WEAPON
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARMFLEA_WEAPON = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/GREEN_LASER_emit.bp',
}

TypeClass = ARMFLEA_WEAPON

