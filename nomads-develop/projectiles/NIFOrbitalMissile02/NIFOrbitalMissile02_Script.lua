local NIFOrbitalMissile = import('/lua/nomadsprojectiles.lua').NIFOrbitalMissile

NIFOrbitalMissile02 = Class(NIFOrbitalMissile) {
    TargetSpread = 10,--This controls the spread of the bombardment projectiles
}

TypeClass = NIFOrbitalMissile02
