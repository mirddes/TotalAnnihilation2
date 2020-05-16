#ARM Advanced Torpedo Launcher Torpedo Weapon
#ARMATL_TORPEDO
#
#Script created by Raevn

local TAUnderWaterProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TAUnderWaterProjectile

ARMATL_TORPEDO = Class(TAUnderWaterProjectile) {
	TrackTime = 3,
}

TypeClass = ARMATL_TORPEDO