#CORE Wind Generator - Produces Energy
#CORWIN
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local worldData = import('/mods/SCTA/lua/sim/worldData.lua')

CORWIN = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			fan = CreateRotator(self, 'fan', 'z', nil, 0, 0, 0),
			cradle = CreateRotator(self, 'cradle', 'y', nil, 0, 0, 0),
		}
		self.Trash:Add(self.Spinners.fan)
		self.Trash:Add(self.Spinners.cradle)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		self.Spinners.cradle:SetSpeed(20)
		self.OnWindChange(self, worldData.GetWindDirection(), worldData.GetWindAmount())
	end,

	OnWindChange = function(self, direction, amount)
		if self:GetFractionComplete() == 1 then
			--SPIN fan around z-axis SPEED lastfanspeed (lastfanspeed = <10>, but too slow ie. when no wind)
			self.Spinners.fan:SetSpeed((amount / 182) * 5)
	
			--TURN cradle to y-axis lastdir SPEED <20> (lastdir = wind direction)
			self.Spinners.cradle:SetGoal(direction + self.buildAngle)

			self:SetProductionPerSecondEnergy(worldData.GetWindEnergy())
		end
	end,
}

TypeClass = CORWIN
