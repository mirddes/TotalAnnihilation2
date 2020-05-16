#ARM Wind Generator - Produces Energy
#ARMWIN
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local worldData = import('/mods/SCTA/lua/sim/worldData.lua')

ARMWIN = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			blades = CreateRotator(self, 'Blades', 'z', nil, 0, 0, 0),
			post = CreateRotator(self, 'Turret', 'y', nil, 0, 0, 0),
		}
		self.Trash:Add(self.Spinners.blades)
		self.Trash:Add(self.Spinners.post)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		self.Spinners.post:SetSpeed(20)
		self.OnWindChange(self, worldData.GetWindDirection(), worldData.GetWindAmount())
	end,

	OnWindChange = function(self, direction, amount)
		if self:GetFractionComplete() == 1 then
			--SPIN blades around z-axis SPEED lastfanspeed (lastfanspeed = <10>, but too slow ie. when no wind)
			self.Spinners.blades:SetSpeed((amount / 182) * 5)
	
			--TURN post to y-axis lastdir SPEED <20> (lastdir = wind direction)
			self.Spinners.post:SetGoal(direction + self.buildAngle)

			self:SetProductionPerSecondEnergy(worldData.GetWindEnergy())
		end
	end,
}

TypeClass = ARMWIN
