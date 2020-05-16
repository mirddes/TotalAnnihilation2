#ARM Moho Metal Maker - Converts Energy into Metal
#ARMMMKR
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMMMKR = Class(TAunit) {
	closeDueToDamage = false,

	#must be a better way, but couldn't find it
	productionIsActive = true,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			lid1 = CreateRotator(self, 'lid1', 'x', nil, 0, 0, 0),
			lid2 = CreateRotator(self, 'lid2', 'x', nil, 0, 0, 0),
			lid3 = CreateRotator(self, 'lid3', 'x', nil, 0, 0, 0),
			lid4 = CreateRotator(self, 'lid4', 'x', nil, 0, 0, 0),	
			core = CreateRotator(self, 'Core', 'y', nil, 0, 0, 0),	
		}
		self.Sliders = {
			core = CreateSlider(self, 'Core'),	
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
		ChangeState(self, self.OpeningState)
	end,

	OpeningState = State {
		Main = function(self)
			self:PlayUnitSound('Activate')
			self.textureAnimation = true

			--TURN lid2 to x-axis <30.40> SPEED <38.60>;
			self.Spinners.lid2:SetGoal(30.40)
			self.Spinners.lid2:SetSpeed(36.00)

			--TURN lid3 to x-axis <-26.75> SPEED <35.45>;
			self.Spinners.lid3:SetGoal(-30.40)
			self.Spinners.lid3:SetSpeed(36.00)

			--TURN mmakercore to y-axis <-30.40> SPEED <39.39>;
			self.Spinners.core:SetGoal(-30.40)
			self.Spinners.core:SetSpeed(39.39)

			--SLEEP <772>;
			WaitSeconds(0.75)

			--MOVE mmakercore to y-axis <5.05> SPEED <6.00>;
			self.Sliders.core:SetGoal(0,5.05,0)
			self.Sliders.core:SetSpeed(6)

			--TURN lid1 to x-axis <35.26> SPEED <45.57>;
			self.Spinners.lid1:SetGoal(30.40)
			self.Spinners.lid1:SetSpeed(45.57)

			--TURN lid4 to x-axis <-30.40> SPEED <39.29>;
			self.Spinners.lid4:SetGoal(-30.40)
			self.Spinners.lid4:SetSpeed(45.57)

			--TURN lid2 to x-axis <60.80> SPEED <39.29>;
			self.Spinners.lid2:SetGoal(60.80)
			self.Spinners.lid2:SetSpeed(39.29)

			--TURN lid3 to x-axis <-74.18> SPEED <61.29>;
			self.Spinners.lid3:SetGoal(-60.80)
			self.Spinners.lid3:SetSpeed(39.29)

			--TURN mmakercore to y-axis <-60.80> SPEED <39.29>;
			self.Spinners.core:SetGoal(-60.80)
			self.Spinners.core:SetSpeed(39.39)

			--SLEEP <774>;
			WaitSeconds(0.75)

			--MOVE mmakercore to y-axis <15.84> SPEED <13.00>;
			self.Sliders.core:SetGoal(0,15.84,0)
			self.Sliders.core:SetSpeed(13)

			--TURN mmakercore to y-axis <-90.00> SPEED <37.67>;
			self.Spinners.core:SetGoal(-90.00)
			self.Spinners.core:SetSpeed(37.67)

			--SLEEP <775>;
			WaitSeconds(0.75)

			--SLEEP <775>;
			WaitSeconds(0.75)

			self:SetProductionActive(true)
			self:SetConsumptionActive(true)

			ChangeState(self, self.IdleOpenState)
		end,
	},


	ClosingState = State {
		Main = function(self)
			self:SetProductionActive(false)
			self:PlayUnitSound('Activate')
			self:SetConsumptionActive(false)

			--MOVE mmakercore to y-axis <5.05> SPEED <15.00>;
			self.Sliders.core:SetGoal(0,5.05,0)
			self.Sliders.core:SetSpeed(15)

			--TURN mmakercore to y-axis <-60.80> SPEED <42.74>;
			self.Spinners.core:SetGoal(-60.80)
			self.Spinners.core:SetSpeed(42.74)

			--SLEEP <683>;
			WaitSeconds(0.7)

			--MOVE mmakercore to y-axis <0> SPEED <7.00>;
			self.Sliders.core:SetGoal(0,0,0)
			self.Sliders.core:SetSpeed(7)

			--TURN lid1 to x-axis <0> SPEED <51.35>;
			self.Spinners.lid1:SetGoal(0)
			self.Spinners.lid1:SetSpeed(51.35)

			--TURN lid4 to x-axis <0> SPEED <44.26>;
			self.Spinners.lid4:SetGoal(0)
			self.Spinners.lid4:SetSpeed(51.35)

			--TURN lid2 to x-axis <30.40> SPEED <44.26>;
			self.Spinners.lid2:SetGoal(30.40)
			self.Spinners.lid2:SetSpeed(69.05)

			--TURN lid3 to x-axis <-26.75> SPEED <69.05>;
			self.Spinners.lid3:SetGoal(-30.40)
			self.Spinners.lid3:SetSpeed(69.05)

			--TURN mmakercore to y-axis <-30.40> SPEED <44.26>;
			self.Spinners.core:SetGoal(-30.40)
			self.Spinners.core:SetSpeed(44.26)

			--SLEEP <687>;
			WaitSeconds(0.7)

			--TURN lid2 to x-axis <0.60> SPEED <43.57>;
			self.Spinners.lid2:SetGoal(0)
			self.Spinners.lid2:SetSpeed(43.57)

			--TURN lid3 to x-axis <0.60> SPEED <40.01>;
			self.Spinners.lid3:SetGoal(0)
			self.Spinners.lid3:SetSpeed(43.57)

			--TURN mmakercore to y-axis <0> SPEED <44.46>;
			self.Spinners.core:SetGoal(0)
			self.Spinners.core:SetSpeed(44.46)

			--SLEEP <684>;
			WaitSeconds(0.7)

			--SLEEP <688>;
			WaitSeconds(0.7)

			ChangeState(self, self.IdleClosedState)
			self.textureAnimation = false
		end,

	},

	IdleClosedState = State {
		Main = function(self)
			#Building was closed due to damage
			if self.closeDueToDamage == true then 
				while self.DamageSeconds > 0 do
					WaitSeconds(1)
					self.DamageSeconds = self.DamageSeconds - 1
				end

				self.closeDueToDamage = false

				#Only Open if set to active
				if self.productionIsActive == true then 
					ChangeState(self, self.OpeningState)
				end
			end
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
		
	OnProductionUnpaused = function(self)
		TAunit.OnProductionUnpaused(self)
		self.productionIsActive = true
		ChangeState(self, self.OpeningState)
	end,

	OnProductionPaused = function(self)
		TAunit.OnProductionPaused(self)
		self.productionIsActive = false
		ChangeState(self, self.ClosingState)
	end,



	OnDamage = function(self, instigator, amount, vector, damageType)
		TAunit.OnDamage(self, instigator, amount, vector, damageType) 
		self.DamageSeconds = 8
	end,
}

TypeClass = ARMMMKR