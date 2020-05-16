#CORE Radar Tower - Radar Tower
#CORRAD
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORRAD = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dish = CreateRotator(self, 'dish', 'y', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		self.StartSpin(self)
		self:PlayUnitSound('Activate')
	end,

	OnScriptBitSet = function(self, bit)
		if bit == 3 then
			self:PlayUnitSound('Deactivate')
			self.StopSpin(self)
		end
		TAunit.OnScriptBitSet(self, bit)
	end,


	OnScriptBitClear = function(self, bit)
		if bit == 3 then
			self:PlayUnitSound('Activate')
			self.StartSpin(self)
		end
		TAunit.OnScriptBitClear(self, bit)
	end,

	StartSpin = function(self)
		--SPIN dish around y-axis SPEED <40>
		self.Spinners.dish:SetSpeed(40)

		self:SetConsumptionActive(true)
	end,

	StopSpin = function(self)
		--SPIN dish around y-axis SPEED <0>
		self.Spinners.dish:SetSpeed(0)

		self:SetConsumptionActive(false)
	end,
}

TypeClass = CORRAD