#ARM Hawk Missile 2
#ARMVTOL_ADVMISSILE2
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMVTOL_ADVMISSILE2 = Class(TAMissileProjectile) 
{
	TrackTime = 7,
	AirDamage = 150,
}

TypeClass = ARMVTOL_ADVMISSILE2
