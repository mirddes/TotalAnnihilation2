#ARM Skeeter Laser
#ARMPT_LASER
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARMPT_LASER = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/YELLOW_LASER_emit.bp',
}

TypeClass = ARMPT_LASER

