#ARM Floating Metal Maker - Converts Energy into Metal
#ARMFMKR
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMFMKR = Class(TAunit) {

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dome = CreateRotator(self, 'dome', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)

		--TURN dome to x-axis <180.42> SPEED <112.46>
		self.Spinners.dome:SetGoal(180)
		self.Spinners.dome:SetSpeed(112.46)
	end,

	OnProductionUnpaused = function(self)
		TAunit.OnProductionUnpaused(self)
		self:SetConsumptionActive(true)
		self.textureAnimation = true
		self:PlayUnitSound('Activate')

		--TURN dome to x-axis <180.42> SPEED <112.46>
		self.Spinners.dome:SetGoal(180)
		self.Spinners.dome:SetSpeed(112.46)
	end,

	OnProductionPaused = function(self)
		TAunit.OnProductionPaused(self)
		self:SetConsumptionActive(false)
		self.textureAnimation = false
		self:PlayUnitSound('Deactivate')

		--TURN dome to x-axis <0> SPEED <112.46>
		self.Spinners.dome:SetGoal(0)
		self.Spinners.dome:SetSpeed(112.46)		
	end,
}

TypeClass = ARMFMKR