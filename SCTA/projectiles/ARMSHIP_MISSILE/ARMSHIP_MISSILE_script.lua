#ARM Ranger Missile
#ARMSHIP_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMSHIP_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 108,
}

TypeClass = ARMSHIP_MISSILE
