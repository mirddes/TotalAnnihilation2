do
    local OldModBlueprints  = ModBlueprints
    
    local Mults = {
        Defense = {
            Health = 1,
            MaxHealth = 1,
        },
        Economy = {
            BuildCostEnergy = 0.25,
            BuildCostMass = 0.5,
            BuildTime = 0.5,
            MaintenanceConsumptionPerSecondEnergy = 1,
            BuildRate = 1.5,
        },
    }
    
    function ModBlueprints(all_blueprints)
        OldModBlueprints(all_blueprints)
        for id, bp in all_blueprints.Unit do
            if bp.Categories and (table.find(bp.Categories, 'ARM') or table.find(bp.Categories, 'CORE')) then
                for group, gdata in Mults do
                    for stat, data in gdata do
                        if bp[group] and bp[group][stat] then
                            bp[group][stat] = bp[group][stat] * data
                        end
                    end
                end
            end
        end
if all_blueprints.Unit.armcom then
        all_blueprints.Unit.armcom.Economy.StorageMass = 1500
        all_blueprints.Unit.armcom.Economy.StorageEnergy = 4000
    end
if all_blueprints.Unit.corcom then
        all_blueprints.Unit.corcom.Economy.StorageMass = 1500
        all_blueprints.Unit.corcom.Economy.StorageEnergy = 4000
    end
    end
end