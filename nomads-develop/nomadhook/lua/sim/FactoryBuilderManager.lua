do


local oldFactoryBuilderManager = FactoryBuilderManager

FactoryBuilderManager = Class(oldFactoryBuilderManager) {

    GetFactoryFaction = function(self, factory)
        if EntityCategoryContains( categories.NOMADS, factory ) then
            return 'Nomads'
        else
            return oldFactoryBuilderManager.GetFactoryFaction(self, factory)
        end
        return false
    end,
}


end