#ARM Jethro Missile
#ARMKBOT_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMKBOT_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 83,
}

TypeClass = ARMKBOT_MISSILE
