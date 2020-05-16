local Projectile = import('/lua/sim/Projectile.lua').Projectile
local EffectTemplates = import('/lua/EffectTemplates.lua')

TADebris = Class(Projectile) {
    FxImpactLand = {
    		'/mods/SCTA/effects/emitters/terran_missile_hit_01_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_03_emit.bp',
    		'/mods/SCTA/effects/emitters/terran_missile_hit_04_emit.bp',
    },
    FxLandHitScale = 0.35,

}

TypeClass = TADebris