#CORE Hive - Light Carrier
#CORCARRY
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORCARRY = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dish = CreateRotator(self, 'dish', 'y', nil, 0, 0, 0),
		}
		self.Trash:Add(self.Spinners.dish)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		--SPIN dish around y-axis SPEED <60.01>
		self.Spinners.dish:SetSpeed(60)
		self:SetConsumptionActive(true)
	end,


	OnScriptBitSet = function(self, bit)
		if bit == 3 then

			self.Spinners.dish:SetSpeed(0)

			self:SetConsumptionActive(false)
		end
		TAunit.OnScriptBitSet(self, bit)
	end,


	OnScriptBitClear = function(self, bit)
		if bit == 3 then
			--SPIN dish around y-axis SPEED <60.01>
			self.Spinners.dish:SetSpeed(60)
			self:SetConsumptionActive(true)
		end
		TAunit.OnScriptBitClear(self, bit)
	end,
}

TypeClass = CORCARRY
