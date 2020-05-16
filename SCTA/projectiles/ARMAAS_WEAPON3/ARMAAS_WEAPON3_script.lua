#ARM Archer Cannon
#ARMAAS_WEAPON3
#
#Script created by Raevn

local TAMediumCannonProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMediumCannonProjectile

ARMAAS_WEAPON3 = Class(TAMediumCannonProjectile) {
	AirDamage = 146,
}

TypeClass = ARMAAS_WEAPON3
