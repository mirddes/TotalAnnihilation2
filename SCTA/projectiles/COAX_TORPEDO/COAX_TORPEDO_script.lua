#ARM Torpedo Launcher Torpedo Weapon
#COAX_TORPEDO
#
#Script created by Raevn

local TAUnderWaterProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAUnderWaterProjectile

COAX_TORPEDO = Class(TAUnderWaterProjectile) {
	TrackTime = 3,
}

TypeClass = COAX_TORPEDO
