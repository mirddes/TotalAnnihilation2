#CORE Searcher Laser
#CORPT_LASER
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

CORPT_LASER = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/YELLOW_LASER_emit.bp',
}

TypeClass = CORPT_LASER

