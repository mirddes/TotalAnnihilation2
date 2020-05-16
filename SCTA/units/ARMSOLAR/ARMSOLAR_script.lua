#ARM Solar Collector - Produces Energy
#ARMSOLAR
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMSOLAR = Class(TAunit) {
	closeDueToDamage = false,
	damageReduction = 1,

	#must be a better way, but couldn't find it
	productionIsActive = true,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dish1 = CreateRotator(self, 'Dish_01', 'x', nil, 0, 0, 0),
			dish2 = CreateRotator(self, 'Dish_02', 'z', nil, 0, 0, 0),
			dish3 = CreateRotator(self, 'Dish_03', 'x', nil, 0, 0, 0),
			dish4 = CreateRotator(self, 'Dish_04', 'z', nil, 0, 0, 0),	
		}
		for k, v in self.Spinners do
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
			self.damageReduction = 1
			--TURN dish1 to x-axis <-90.00> SPEED <60.01>
			self.Spinners.dish1:SetGoal(90)
			self.Spinners.dish1:SetSpeed(60)

			--TURN dish2 to x-axis <90.00> SPEED <60.01>
			self.Spinners.dish2:SetGoal(90)
			self.Spinners.dish2:SetSpeed(60)

			--TURN dish3 to z-axis <-90.00> SPEED <60.01>
			self.Spinners.dish3:SetGoal(-90)
			self.Spinners.dish3:SetSpeed(60)

			--TURN dish4 to z-axis <90.00> SPEED <60.01>
			self.Spinners.dish4:SetGoal(-90)
			self.Spinners.dish4:SetSpeed(60)

			for k, spinner in self.Spinners do
				WaitFor(spinner)
			end

			self:SetProductionActive(true)

			ChangeState(self, self.IdleOpenState)
		end,
	},


	ClosingState = State {
		Main = function(self)
			self:SetProductionActive(false)
			self:PlayUnitSound('Activate')

			--TURN dish1 to x-axis <0> SPEED <120.02>
			self.Spinners.dish1:SetGoal(0)
			self.Spinners.dish1:SetSpeed(120)

			--TURN dish2 to x-axis <0> SPEED <120.02>
			self.Spinners.dish2:SetGoal(0)
			self.Spinners.dish2:SetSpeed(120)

			--TURN dish3 to x-axis <0> SPEED <120.02>
			self.Spinners.dish3:SetGoal(0)
			self.Spinners.dish3:SetSpeed(120)

			--TURN dish4 to x-axis <0> SPEED <120.02>
			self.Spinners.dish4:SetGoal(0)
			self.Spinners.dish4:SetSpeed(120)

			for k, spinner in self.Spinners do
				WaitFor(spinner)
			end
			self.damageReduction = 0.33
			ChangeState(self, self.IdleClosedState)
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
		#Apply Damage Reduction
		TAunit.OnDamage(self, instigator, amount * self.damageReduction, vector, damageType) 
		self.DamageSeconds = 8
	end,
}

TypeClass = ARMSOLAR