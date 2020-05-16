#CORE Tidal Generator - Produces Energy
#CORTIDE
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local worldData = import('/mods/SCTA/lua/sim/worldData.lua')

CORTIDE = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			wheel = CreateRotator(self, 'wheel', 'y', nil, 0, 0, 0),
		}
		self.Trash:Add(self.Spinners.wheel)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)

		--SPIN wheel around y-axis SPEED <35.00>
		self.Spinners.wheel:SetSpeed(35)
		
		self:SetProductionPerSecondEnergy(worldData.GetTidalEnergy())
	end,



	OnKilled = function(self, instigator, type, overkillRatio)
		self.Spinners.wheel:SetSpeed(0)
		TAunit.OnKilled(self, instigator, type, overkillRatio)
	end,
}

TypeClass = CORTIDE
