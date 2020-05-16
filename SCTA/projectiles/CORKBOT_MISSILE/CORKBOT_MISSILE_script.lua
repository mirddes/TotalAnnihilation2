#CORE Crasher, Searcher Missile
#CORKBOT_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORKBOT_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 80,
}

TypeClass = CORKBOT_MISSILE
