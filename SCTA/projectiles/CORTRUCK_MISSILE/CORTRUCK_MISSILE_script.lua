#CORE Slasher Missile
#CORTRUCK_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORTRUCK_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 92,
}

TypeClass = CORTRUCK_MISSILE
