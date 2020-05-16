#CORE Hydra Missile
#CORSHIP_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORSHIP_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 111,
}

TypeClass = CORSHIP_MISSILE
