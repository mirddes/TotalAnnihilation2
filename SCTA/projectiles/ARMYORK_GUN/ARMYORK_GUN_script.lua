#ARM Phalanx Cannon
#ARMYORK_GUN
#
#Script created by Raevn

local TAMediumCannonProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAMediumCannonProjectile

ARMYORK_GUN = Class(TAMediumCannonProjectile) {
	AirDamage = 128,
}

TypeClass = ARMYORK_GUN
