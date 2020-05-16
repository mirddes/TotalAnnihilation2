#ARM Defender Missile
#ARMRL_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMRL_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 97,
}

TypeClass = ARMRL_MISSILE
