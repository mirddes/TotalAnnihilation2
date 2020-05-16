#CORE Deleter - Mobile Radar Jammer
#CORETER
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORETER = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			fork = CreateRotator(self, 'fork', 'z', nil, 0, 0, 0),
		}
		self.Trash:Add(self.Spinners.fork)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		--spin fork around z-axis speed <100>
		self.Spinners.fork:SetSpeed(100)
		self:SetConsumptionActive(true)
	end,


	OnScriptBitSet = function(self, bit)
		if bit == 5 then
			--spin fork around z-axis speed <0>
			self.Spinners.fork:SetSpeed(0)
			self:SetConsumptionActive(false)
			self:PlayUnitSound('Deactivate')
		end
		TAunit.OnScriptBitSet(self, bit)
	end,


	OnScriptBitClear = function(self, bit)
		if bit == 5 then
			--spin fork around z-axis speed <100>
			self.Spinners.fork:SetSpeed(100)
			self:SetConsumptionActive(true)
			self:PlayUnitSound('Activate')
		end
		TAunit.OnScriptBitClear(self, bit)
	end,
}
TypeClass = CORETER