#ARM Annihilator Laser
#ARM_TOTAL_ANNIHILATOR
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARM_TOTAL_ANNIHILATOR = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/PURPLE_LASER_emit.bp',
}

TypeClass = ARM_TOTAL_ANNIHILATOR

