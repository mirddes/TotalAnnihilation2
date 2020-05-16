#ARM Rocko Rocket
#ARMKBOT_ROCKET
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

KBOT_ROCKET = Class(TAMissileProjectile) 
{
	TrackTime = 4,
}

TypeClass = KBOT_ROCKET
