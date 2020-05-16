#ARM Commander Laser
#ARMCOMLASER
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARMCOMLASER = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = ARMCOMLASER
