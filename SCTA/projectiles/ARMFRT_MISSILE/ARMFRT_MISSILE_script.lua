#ARM Defender - NS Missile
#ARMFRT_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMFRT_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 97,
}

TypeClass = ARMFRT_MISSILE
