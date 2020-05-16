#CORE Hurricane Laser
#CORAIR2AIRLASER
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

CORAIR2AIRLASER = Class(TALaserProjectile) {
	AirDamage = 30,
	PolyTrail = '/mods/SCTA/effects/emitters/YELLOW_LASER_emit.bp',
}

TypeClass = CORAIR2AIRLASER

