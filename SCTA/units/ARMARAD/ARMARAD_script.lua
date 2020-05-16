#ARM Advanced Radar Tower - Long Range Radar Tower
#ARMARAD
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMARAD = Class(TAunit) {
	closeDueToDamage = false,

	intelIsActive = true,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dish1 = CreateRotator(self, 'Dish_01', 'z', nil, 0, 0, 0),
			dish2 = CreateRotator(self, 'Dish_02', 'z', nil, 0, 0, 0),
			arm1 = CreateRotator(self, 'Arm_01', 'x', nil, 0, 0, 0),
			arm2 = CreateRotator(self, 'Arm_02', 'x', nil, 0, 0, 0),	
			turret = CreateRotator(self, 'Turret', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			post = CreateSlider(self, 'Post'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
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

			--MOVE post to y-axis <9.10> SPEED <16.00>;
			self.Sliders.post:SetGoal(0,9.1,0)
			self.Sliders.post:SetSpeed(16)

			--WAIT-FOR-MOVE post along y-axis;
			WaitFor(self.Sliders.post)

			--TURN dish1 to z-axis <84.14> SPEED <147.66>;
			self.Spinners.dish1:SetGoal(-84.14)
			self.Spinners.dish1:SetSpeed(147.66)

			--TURN dish2 to z-axis <-84.14> SPEED <147.66>;
			self.Spinners.dish2:SetGoal(84.15)
			self.Spinners.dish2:SetSpeed(147.66)

			--WAIT-FOR-TURN dish1 around z-axis;
			WaitFor(self.Spinners.dish1)

			--WAIT-FOR-TURN dish2 around z-axis;
			WaitFor(self.Spinners.dish2)

			--SPIN turret around y-axis  SPEED <-30.00>;
			self.Spinners.turret:SetSpeed(-30)
			self.Spinners.turret:ClearGoal()

			--SPIN arm1 around x-axis  SPEED <100.02>;
			self.Spinners.arm1:SetSpeed(-100)
			self.Spinners.arm1:ClearGoal()

			--SPIN arm2 around x-axis  SPEED <-100.02>;
			self.Spinners.arm2:SetSpeed(100)
			self.Spinners.arm2:ClearGoal()
			
			self:EnableIntel('Radar')
			ChangeState(self, self.IdleOpenState)
		end,
	},


	ClosingState = State {
		Main = function(self)
			self:DisableIntel('Radar')

			self:PlayUnitSound('Deactivate')

			--TURN turret to y-axis <0> SPEED <60.01>;
			self.Spinners.turret:SetSpeed(60)
			self.Spinners.turret:SetGoal(0)

			--TURN arm1 to x-axis <0> SPEED <100.02>;
			self.Spinners.arm1:SetSpeed(100)
			self.Spinners.arm1:SetGoal(0)

			--TURN arm2 to x-axis <0> SPEED <100.02>;
			self.Spinners.arm2:SetSpeed(100)
			self.Spinners.arm2:SetGoal(0)

			--WAIT-FOR-TURN turret around y-axis;
			WaitFor(self.Spinners.turret)

			--WAIT-FOR-TURN arm1 around x-axis;
			WaitFor(self.Spinners.arm1)

			--WAIT-FOR-TURN arm2 around x-axis;
			WaitFor(self.Spinners.arm2)

			--TURN dish1 to z-axis <0> SPEED <178.70>;
			self.Spinners.dish1:SetGoal(0)
			self.Spinners.dish1:SetSpeed(178.70)

			--TURN dish2 to z-axis <0> SPEED <178.70>;
			self.Spinners.dish2:SetGoal(0)
			self.Spinners.dish2:SetSpeed(178.70)

			--WAIT-FOR-TURN dish1 around z-axis;
			WaitFor(self.Spinners.dish1)

			--WAIT-FOR-TURN dish2 around z-axis;
			WaitFor(self.Spinners.dish2)

			--MOVE post to y-axis <0> SPEED <19.00>;
			self.Sliders.post:SetGoal(0,0,0)
			self.Sliders.post:SetSpeed(19)

			--WAIT-FOR-MOVE post along y-axis;
			WaitFor(self.Sliders.post)

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

TypeClass = ARMARAD