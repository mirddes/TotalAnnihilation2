#CORE Snake Torpedo Weapon
#CORE_TORPEDO
#
#Script created by Raevn

local TAUnderWaterProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAUnderWaterProjectile

CORE_TORPEDO = Class(TAUnderWaterProjectile) {
	TrackTime = 3,
	AdvancedSubDamage = 130,
}

TypeClass = CORE_TORPEDO