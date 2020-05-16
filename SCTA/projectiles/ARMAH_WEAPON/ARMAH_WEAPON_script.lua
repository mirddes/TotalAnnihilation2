#ARM Swatter Missile
#ARMAH_WEAPON
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMAH_WEAPON = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 105,
}

TypeClass = ARMAH_WEAPON
