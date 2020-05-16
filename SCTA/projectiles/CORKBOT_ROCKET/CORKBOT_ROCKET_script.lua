#CORE Storm Rocket
#CORKBOT_ROCKET
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORKBOT_ROCKET = Class(TAMissileProjectile) 
{
	TrackTime = 4,
}

TypeClass = CORKBOT_ROCKET
