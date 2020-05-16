#ARM Samson Missile
#ARMTRUCK_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMTRUCK_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 90,
}

TypeClass = ARMTRUCK_MISSILE
