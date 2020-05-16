#ARM Skimmer Laser
#ARMSH_WEAPON
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARMSH_WEAPON = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = ARMSH_WEAPON

