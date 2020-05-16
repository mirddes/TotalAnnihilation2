#ARM Spider Paralyzer Weapon
#ARM_PARALYSER
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARM_PARALYSER = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = ARM_PARALYSER
