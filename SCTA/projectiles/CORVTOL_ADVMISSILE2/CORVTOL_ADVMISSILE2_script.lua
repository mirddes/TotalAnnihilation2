#CORE Vamp Missile
#CORVTOL_ADVMISSILE2
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

CORVTOL_ADVMISSILE2 = Class(TAMissileProjectile) 
{
	TrackTime = 7,
	AirDamage = 155,
}

TypeClass = CORVTOL_ADVMISSILE2
