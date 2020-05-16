#ARM Lurker Torpedo Weapon
#ARM_TORPEDO
#
#Script created by Raevn

local TAUnderWaterProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAUnderWaterProjectile

ARM_TORPEDO = Class(TAUnderWaterProjectile) {
	TrackTime = 3,
	AdvancedSubDamage = 115,
}

TypeClass = ARM_TORPEDO