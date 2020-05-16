#ARM Metal Maker - Converts Energy into Metal
#ARMMAKR
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMMAKR = Class(TAunit) {
	damageReduction = 1,

	OnDamage = function(self, instigator, amount, vector, damageType)
		#Apply Damage Reduction
		TAunit.OnDamage(self, instigator, self.damageReduction * amount, vector, damageType) 
	end,

	OnProductionUnpaused = function(self)
		TAunit.OnProductionUnpaused(self)
		self:SetConsumptionActive(true)
		self.textureAnimation = true
		self.damageReduction = 1
		self:PlayUnitSound('Activate')
	end,

	OnProductionPaused = function(self)
		TAunit.OnProductionPaused(self)
		self:SetConsumptionActive(false)
		self.textureAnimation = false
		self.damageReduction = 0.5
		self:PlayUnitSound('Deactivate')		
	end,
}

TypeClass = ARMMAKR