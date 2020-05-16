#ARM Sonar Station - Locates Water Units
#ARMSONAR
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMSONAR = Class(TAunit) {

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			base = CreateRotator(self, 'Base', 'y', nil, 0, 0, 0),
		}
		self.Trash:Add(self.Spinners.base)
	end,

	OnIntelDisabled = function(self)
		--SPIN base around y-axis  SPEED <0>;
		self.Spinners.base:SetSpeed(0)

		self:SetConsumptionActive(false)
		self.textureAnimation = false
		TAunit.OnIntelDisabled(self)
		self:PlayUnitSound('Deactivate')
	end,

	OnIntelEnabled = function(self)
		--SPIN base around y-axis  SPEED <60.01>;
		self.Spinners.base:SetSpeed(60)

		self:SetConsumptionActive(true)
		self.textureAnimation = true
		TAunit.OnIntelEnabled(self)
		self:PlayUnitSound('Activate')
	end,

	OnKilled = function(self, instigator, type, overkillRatio)
		self.Spinners.base:SetSpeed(0)
		TAunit.OnKilled(self, instigator, type, overkillRatio)
		self.textureAnimation = false
	end,
}

TypeClass = ARMSONAR
