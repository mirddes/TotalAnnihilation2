#ARM Hawk Missile
#ARMVTOL_ADVMISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMissileProjectile

ARMVTOL_ADVMISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 7,
	AirDamage = 150,
}

TypeClass = ARMVTOL_ADVMISSILE
