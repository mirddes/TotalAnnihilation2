#ARM Moho Mine - Advanced Metal Extractor
#ARMMOHO
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local worldData = import('/mods/SCTA/lua/sim/worldData.lua')

ARMMOHO = Class(TAunit) {
	onMetalSpot = false,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			arms = CreateRotator(self, 'Blades', 'y', nil, 0, 91, 0),
		}
		self.Trash:Add(self.Spinners.arms)
	end,

	CreateWreckage = function( self, overkillRatio )
		if self.onMetalSpot == false then
			TAunit.CreateWreckage(self, overkillRatio)
		else
			return nil
		end
	end,

	OnStopBeingBuilt = function(self, builder, layer)
		TAunit.OnStopBeingBuilt(self, builder, layer)
		local markers = ScenarioUtils.GetMarkers() 
		local unitPosition = self:GetPosition() 
		self:SetProductionPerSecondMass(worldData:GetMap().mohoSurfaceMetal) 
		for k, v in pairs(markers) do 
			if(v.type == 'Mass') then 
                		local massPosition = v.position 
                		if (massPosition[1] < unitPosition[1] + 1) and (massPosition[1] > unitPosition[1] - 1) then 
	                    		if (massPosition[2] < unitPosition[2] + 1) and (massPosition[2] > unitPosition[2] - 1) then 
		                    		if (massPosition[3] < unitPosition[3] + 1) and (massPosition[3] > unitPosition[3] - 1) then 
                		   			self:SetProductionPerSecondMass(worldData:GetMap().mohoMetal) 
							self.onMetalSpot = true
		                    			break 
						end
					end
                		end 
            		end 
        	end	
		self:PlayUnitSound('Activate')	
		self.Spinners.arms:SetTargetSpeed(self:GetProductionPerSecondMass() * 17)
	end,

	OnProductionPaused = function(self)
		TAunit.OnProductionPaused(self)
		self.Spinners.arms:SetAccel(182)
		self.Spinners.arms:SetTargetSpeed(0)
		self:SetConsumptionActive(false)
		self:PlayUnitSound('Deactivate')
	end,

	OnProductionUnpaused = function(self)
		TAunit.OnProductionUnpaused(self)
		self.Spinners.arms:SetAccel(91)
		self.Spinners.arms:SetTargetSpeed(self:GetProductionPerSecondMass() * 17)
		self:SetConsumptionActive(true)
		self:PlayUnitSound('Activate')
	end,
}

TypeClass = ARMMOHO