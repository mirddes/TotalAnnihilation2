#CORE Advanced Radar Tower - Long Range Radar Tower
#CORARAD
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORARAD = Class(TAunit) {
	closeDueToDamage = false,

	intelIsActive = true,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dish = CreateRotator(self, 'dish', 'x', nil, 0, 0, 0),
			turret = CreateRotator(self, 'turret', 'y', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		self.intelIsActive = true
		self:SetConsumptionActive(true)
		self:PlayUnitSound('Activate')
		ChangeState(self, self.OpeningState)
	end,

	OnDestroy = function(self)
		TAunit.OnDestroy(self)
		ChangeState(self, self.DeadState)
	end,

	OpeningState = State {
		Main = function(self)

			self:PlayUnitSound('Activate')

			--SPIN turret around y-axis  SPEED <20.00>;
			self.Spinners.turret:ClearGoal()
			self.Spinners.turret:SetSpeed(20)

			--SPIN dish around x-axis  SPEED <-200.04>;
			self.Spinners.dish:ClearGoal()
			self.Spinners.dish:SetSpeed(-200)
			
			self:EnableIntel('Radar')
			ChangeState(self, self.IdleOpenState)
		end,
	},


	ClosingState = State {
		Main = function(self)
			self:DisableIntel('Radar')

			self:PlayUnitSound('Deactivate')

			--SPIN turret around y-axis  SPEED <0.00>;
			self.Spinners.turret:ClearGoal()
			self.Spinners.turret:SetSpeed(0)

			--SPIN dish around x-axis  SPEED <0.0>;
			self.Spinners.dish:ClearGoal()
			self.Spinners.dish:SetSpeed(0)

			ChangeState(self, self.IdleClosedState)
		end,

	},

	IdleClosedState = State {
		Main = function(self)
			if self.closeDueToDamage == true then 
				while self.DamageSeconds > 0 do
					WaitSeconds(1)
					self.DamageSeconds = self.DamageSeconds - 1
				end

				self.closeDueToDamage = false

				if self.intelIsActive == true then 
					ChangeState(self, self.OpeningState)
				end
			end
		end,

		OnDamage = function(self, instigator, amount, vector, damageType)
			TAunit.OnDamage(self, instigator, amount, vector, damageType) 

			self.DamageSeconds = 8
			ChangeState(self, self.ClosingState)
		end,

	},

	IdleOpenState = State {
		Main = function(self)
		end,

		OnDamage = function(self, instigator, amount, vector, damageType)
			TAunit.OnDamage(self, instigator, amount, vector, damageType)
			self.DamageSeconds = 8
			self.closeDueToDamage = true
			ChangeState(self, self.ClosingState)
		end,

	},

	OnScriptBitSet = function(self, bit)
		if bit == 3 then
			self.intelIsActive = false
			self:SetConsumptionActive(false)
			ChangeState(self, self.ClosingState)
		end
		TAunit.OnScriptBitSet(self, bit)
	end,


	OnScriptBitClear = function(self, bit)
		if bit == 3 then
			self.intelIsActive = true
			self:SetConsumptionActive(true)
			ChangeState(self, self.OpeningState)
		end
		TAunit.OnScriptBitClear(self, bit)
	end,

	DeadState = State {
		Main = function(self)
		end,
	},
}

TypeClass = CORARAD