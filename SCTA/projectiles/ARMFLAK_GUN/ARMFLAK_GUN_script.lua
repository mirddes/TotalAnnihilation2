#ARM Flakker Cannon
#ARMFLAK_GUN
#
#Script created by Raevn

local TAMediumCannonProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMediumCannonProjectile

ARMFLAK_GUN = Class(TAMediumCannonProjectile) {
	AirDamage = 130,
}

TypeClass = ARMFLAK_GUN
