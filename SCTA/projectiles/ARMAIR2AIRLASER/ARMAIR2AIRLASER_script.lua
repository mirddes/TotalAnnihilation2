#ARM Pheonix Laser
#ARMAIR2AIRLASER
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

ARMAIR2AIRLASER = Class(TALaserProjectile) {
	AirDamage = 32,
	PolyTrail = '/mods/SCTA/effects/emitters/YELLOW_LASER_emit.bp',
}

TypeClass = ARMAIR2AIRLASER

