local BaseGenericDebris = import('/lua/sim/DefaultProjectiles.lua').BaseGenericDebris
local EffectTemplates = import('/lua/EffectTemplates.lua')

ARMRL_debris01 = Class(BaseGenericDebris) {
    FxImpactLand = EffectTemplates.GenericDebrisLandImpact01,
    FxTrails = {
	'/mods/SCTA/effects/emitters/debris_smoke_emit.bp',
	'/mods/SCTA/effects/emitters/debrisfire_smoke_emit.bp',
    },
}

TypeClass = ARMRL_debris01

