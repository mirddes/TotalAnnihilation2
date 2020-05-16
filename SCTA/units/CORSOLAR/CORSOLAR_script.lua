#CORE Solar Collector - Produces Energy
#CORSOLAR
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORSOLAR = Class(TAunit) {
	closeDueToDamage = false,
	damageReduction = 1,

	#must be a better way, but couldn't find it
	productionIsActive = true,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			wing1 = CreateRotator(self, 'wing1', 'z', nil, 0, 0, 0),
			wing2 = CreateRotator(self, 'wing2', 'z', nil, 0, 0, 0),
			wing3 = CreateRotator(self, 'wing3', 'x', nil, 0, 0, 0),
			wing4 = CreateRotator(self, 'wing4', 'x', nil, 0, 0, 0),	
		}
		self.Sliders = {
			leg1 = CreateSlider(self, 'leg1'),
			leg2 = CreateSlider(self, 'leg2'),
			leg3 = CreateSlider(self, 'leg3'),
			leg4 = CreateSlider(self, 'leg4'),
			wing3 = CreateSlider(self, 'wing3'),
			wing4 = CreateSlider(self, 'wing4'),
			shell = CreateSlider(self, 'shell'),	
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
			self.damageReduction = 1

			--MOVE shell to y-axis <4.09> SPEED <8.00>;
			self.Sliders.shell:SetGoal(0,4.1,0)
			self.Sliders.shell:SetSpeed(8)

			--SLEEP <462>;
			WaitSeconds(0.45)

			--SLEEP <135>;	
			WaitSeconds(0.1)
		
			--MOVE leg1 to x-axis <4.45> SPEED <9.00>;
			--MOVE leg1 to z-axis <4.49> SPEED <9.00>;
			self.Sliders.leg1:SetGoal(-4.45,0,4.45)
			self.Sliders.leg1:SetSpeed(9)

			--MOVE leg2 to x-axis <-4.55> SPEED <9.00>;
			--MOVE leg2 to z-axis <4.50> SPEED <9.00>;
			self.Sliders.leg2:SetGoal(4.45,0,4.45)
			self.Sliders.leg2:SetSpeed(9)

			--MOVE leg3 to x-axis <-4.34> SPEED <9.00>;
			--MOVE leg3 to z-axis <-4.45> SPEED <9.00>;
			self.Sliders.leg3:SetGoal(4.45,0,-4.45)
			self.Sliders.leg3:SetSpeed(9)

			--MOVE leg4 to x-axis <4.40> SPEED <9.00>;
			--MOVE leg4 to z-axis <-4.39> SPEED <9.00>;
			self.Sliders.leg4:SetGoal(-4.45,0,-4.45)
			self.Sliders.leg4:SetSpeed(9)

			--SLEEP <472>;
			WaitSeconds(0.45)

			--SLEEP <254>;
			WaitSeconds(0.25)

			--TURN wing1 to z-axis <-90.00> SPEED <241.99>;
			self.Spinners.wing1:SetGoal(-95)
			self.Spinners.wing1:SetSpeed(242)

			--TURN wing2 to z-axis <90.00> SPEED <241.99>;
			self.Spinners.wing2:SetGoal(95)
			self.Spinners.wing2:SetSpeed(242)

			--SLEEP <372>;
			WaitSeconds(0.55)

			--TURN wing1 to z-axis <-229.25> SPEED <365.58>;
			self.Spinners.wing1:SetGoal(-230)
			self.Spinners.wing1:SetSpeed(365)

			--TURN wing2 to z-axis <229.25> SPEED <365.58>;
			self.Spinners.wing2:SetGoal(230)
			self.Spinners.wing2:SetSpeed(365)

			--SLEEP <381>;
			WaitSeconds(0.35)

			--MOVE wing3 to y-axis <0.30> SPEED <1.00>;
			self.Sliders.wing3:SetGoal(0,0.3,0)
			self.Sliders.wing3:SetSpeed(1)

			--MOVE wing4 to y-axis <0.30> SPEED <1.00>;
			self.Sliders.wing4:SetGoal(0,0.3,0)
			self.Sliders.wing4:SetSpeed(1)

			--SLEEP <226>;
			WaitSeconds(0.2)

			--TURN wing3 to x-axis <-90.00> SPEED <246.63>;
			self.Spinners.wing3:SetGoal(-90)
			self.Spinners.wing3:SetSpeed(250)

			--TURN wing4 to x-axis <91.21> SPEED <249.96>;
			self.Spinners.wing4:SetGoal(90)
			self.Spinners.wing4:SetSpeed(250)

			--SLEEP <365>;
			WaitSeconds(0.35)

			--TURN wing3 to x-axis <-229.25> SPEED <446.43>;
			self.Spinners.wing3:SetGoal(-230)
			self.Spinners.wing3:SetSpeed(445)

			--TURN wing4 to x-axis <229.25> SPEED <442.54>;
			self.Spinners.wing4:SetGoal(230)
			self.Spinners.wing4:SetSpeed(445)

			--SLEEP <312>;
			WaitSeconds(0.3)

			--SLEEP <33>;

			self:SetProductionActive(true)

			ChangeState(self, self.IdleOpenState)
		end,
	},


	ClosingState = State {
		Main = function(self)
			self:SetProductionActive(false)
			self:PlayUnitSound('Activate')

			--TURN wing3 to x-axis <-90.00> SPEED <321.68>;
			self.Spinners.wing3:SetGoal(-90)
			self.Spinners.wing3:SetSpeed(320)

			--TURN wing4 to x-axis <91.21> SPEED <318.87>;
			self.Spinners.wing4:SetGoal(90)
			self.Spinners.wing4:SetSpeed(320)

			--SLEEP <433>;
			WaitSeconds(0.45)

			--TURN wing3 to x-axis <0.00> SPEED <204.42>;
			self.Spinners.wing3:SetGoal(0)
			self.Spinners.wing3:SetSpeed(205)

			--TURN wing4 to x-axis <0.00> SPEED <210.22>;
			self.Spinners.wing4:SetGoal(0)
			self.Spinners.wing4:SetSpeed(205)

			--SLEEP <434>;
			WaitSeconds(0.45)

			--MOVE wing3 to y-axis <0.00> SPEED <1.00>;
			self.Sliders.wing3:SetGoal(0,0,0)
			self.Sliders.wing3:SetSpeed(1)

			--MOVE wing4 to y-axis <0.00> SPEED <1.00>;
			self.Sliders.wing4:SetGoal(0,0,0)
			self.Sliders.wing4:SetSpeed(1)

			--SLEEP <204>;
			WaitSeconds(0.2)

			--TURN wing1 to z-axis <-90.00> SPEED <324.68>;
			self.Spinners.wing1:SetGoal(-90)
			self.Spinners.wing1:SetSpeed(325)

			--TURN wing2 to z-axis <90.00> SPEED <324.68>;
			self.Spinners.wing2:SetGoal(90)
			self.Spinners.wing2:SetSpeed(325)

			--SLEEP <429>;
			WaitSeconds(0.4)

			--TURN wing1 to z-axis <0.00> SPEED <209.84>;
			self.Spinners.wing1:SetGoal(0)
			self.Spinners.wing1:SetSpeed(210)

			--TURN wing2 to z-axis <0.00> SPEED <209.84>;
			self.Spinners.wing2:SetGoal(0)
			self.Spinners.wing2:SetSpeed(210)

			--SLEEP <429>;
			WaitSeconds(0.4)

			--SLEEP <139>;
			WaitSeconds(0.15)
			
			--MOVE leg1 to x-axis <0> SPEED <11.00>;
			--MOVE leg1 to z-axis <0> SPEED <11.00>;
			self.Sliders.leg1:SetGoal(0,0,0)
			self.Sliders.leg1:SetSpeed(11)

			--MOVE leg2 to x-axis <0> SPEED <11.00>;
			--MOVE leg2 to z-axis <0> SPEED <11.00>;
			self.Sliders.leg2:SetGoal(0,0,0)
			self.Sliders.leg2:SetSpeed(11)

			--MOVE leg3 to x-axis <0> SPEED <11.00>;
			--MOVE leg3 to z-axis <0> SPEED <11.00>;
			self.Sliders.leg3:SetGoal(0,0,0)
			self.Sliders.leg3:SetSpeed(11)

			--MOVE leg4 to x-axis <0> SPEED <11.00>;
			--MOVE leg4 to z-axis <0> SPEED <11.00>;
			self.Sliders.leg4:SetGoal(0,0,0)
			self.Sliders.leg4:SetSpeed(11)

			--SLEEP <381>;
			WaitSeconds(0.375)

			--SLEEP <122>;
			WaitSeconds(0.125)

			--MOVE shell to y-axis <0> SPEED <12.00>;
			self.Sliders.shell:SetGoal(0,0,0)
			self.Sliders.shell:SetSpeed(12)

			--SLEEP <337>;
			WaitSeconds(0.35)

			--SLEEP <52>;

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

TypeClass = CORSOLAR