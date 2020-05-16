#CORE Sonar Station - Sonar Station
#CORSONAR
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORSONAR = Class(TAunit) {

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dish = CreateRotator(self, 'dish', 'y', nil, 0, 0, 0),
		}
		self.Trash:Add(self.Spinners.base)
	end,

	OnIntelDisabled = function(self)
		--SPIN base around y-axis  SPEED <0>;
		self.Spinners.dish:SetSpeed(0)

		self:SetConsumptionActive(false)
		self.textureAnimation = false
		TAunit.OnIntelDisabled(self)
		self:PlayUnitSound('Deactivate')
	end,

	OnIntelEnabled = function(self)
		--SPIN base around y-axis  SPEED <60.01>;
		self.Spinners.dish:SetSpeed(60)

		self:SetConsumptionActive(true)
		self.textureAnimation = true
		TAunit.OnIntelEnabled(self)
		self:PlayUnitSound('Activate')
	end,
}

TypeClass = CORSONAR
