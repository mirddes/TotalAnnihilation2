#CORE Avenger Missile
#CORVTOL_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORVTOL_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 136,
}

TypeClass = CORVTOL_MISSILE
