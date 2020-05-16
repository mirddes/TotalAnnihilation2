#ARM Pirahna Torpedo Weapon
#ARMSMART_TORPEDO
#
#Script created by Raevn

local TAUnderWaterProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAUnderWaterProjectile

ARMSMART_TORPEDO = Class(TAUnderWaterProjectile) {
	TrackTime = 3,
	NormalSubDamage = 580,
}

TypeClass = ARMSMART_TORPEDO