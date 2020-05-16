#ARM Penetrator Laser
#ARMMANNI_WEAPON
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARMMANNI_WEAPON = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/PURPLE_LASER_emit.bp',
}

TypeClass = ARMMANNI_WEAPON

