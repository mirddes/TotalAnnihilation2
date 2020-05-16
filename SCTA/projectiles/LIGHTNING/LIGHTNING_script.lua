#ARM Zeus Lightning Weapon
#LIGHTNING
#
#Script created by Raevn

local TALaserProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALaserProjectile

LIGHTNING = Class(TALaserProjectile) 
{
	PolyTrail = '/mods/SCTA/effects/emitters/LIGHTNING_emit.bp',
}

TypeClass = LIGHTNING

