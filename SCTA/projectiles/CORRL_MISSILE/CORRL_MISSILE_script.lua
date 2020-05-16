#CORE Pulverizer Missile
#CORRL_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORRL_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 95,
}

TypeClass = CORRL_MISSILE
