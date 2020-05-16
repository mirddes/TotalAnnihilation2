#CORE Immolator Cannon
#CORPLAS_WEAPON
#
#Script created by Raevn

local TACannonProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TACannonProjectile

CORPLAS_WEAPON = Class(TACannonProjectile) {
	FlashDamage = 200,
	PeeweeDamage = 80,
	WarriorDamage = 150,
}

TypeClass = CORPLAS_WEAPON
