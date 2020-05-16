#CORE Doomsday Machine Laser
#CORE_DOOMSDAY
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

CORE_DOOMSDAY = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/PURPLE_LASER_emit.bp',
}

TypeClass = CORE_DOOMSDAY

