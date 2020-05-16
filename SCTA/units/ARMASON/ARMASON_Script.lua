#ARM Advanced Sonar Station - Extended Sonar
#ARMASON
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMSONAR = Class(TAunit) {
	damageReduction = 1,

	OnDamage = function(self, instigator, amount, vector, damageType)
		#Apply Damage Reduction
		TAunit.OnDamage(self, instigator, self.damageReduction * amount, vector, damageType) 
	end,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			hinge1 = CreateRotator(self, 'hinge1', 'x', nil, 0, 0, 0),
			hinge2 = CreateRotator(self, 'hinge2', 'x', nil, 0, 0, 0),
			hinge3 = CreateRotator(self, 'hinge3', 'z', nil, 0, 0, 0),
			hinge4 = CreateRotator(self, 'hinge4', 'z', nil, 0, 0, 0),
			dish1 = CreateRotator(self, 'dish1', 'y', nil, 0, 0, 0),
			dish2 = CreateRotator(self, 'dish2', 'y', nil, 0, 0, 0),
			dish3 = CreateRotator(self, 'dish3', 'y', nil, 0, 0, 0),
			dish4 = CreateRotator(self, 'dish4', 'y', nil, 0, 0, 0),
			wheel = CreateRotator(self, 'wheel', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			base = CreateSlider(self, 'ARMASON'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	OnIntelDisabled = function(self)
		--TURN hinge1 to x-axis <0> SPEED <68.78>;
		self.Spinners.hinge1:SetGoal(0)
		self.Spinners.hinge1:SetSpeed(68)

		--TURN hinge2 to x-axis <0> SPEED <68.55>;
		self.Spinners.hinge2:SetGoal(0)
		self.Spinners.hinge2:SetSpeed(68)

		--TURN hinge3 to z-axis <0> SPEED <67.43>;
		self.Spinners.hinge3:SetGoal(0)
		self.Spinners.hinge3:SetSpeed(68)

		--TURN hinge4 to z-axis <0> SPEED <67.21>;
		self.Spinners.hinge4:SetGoal(0)
		self.Spinners.hinge4:SetSpeed(68)

		--TURN dish4 to y-axis <0> SPEED <93.12>;
		self.Spinners.dish4:SetGoal(0)
		self.Spinners.dish4:SetSpeed(90)

		--TURN dish3 to y-axis <0> SPEED <88.87>;
		self.Spinners.dish3:SetGoal(0)
		self.Spinners.dish3:SetSpeed(90)

		--TURN dish2 to y-axis <0> SPEED <94.01>;
		self.Spinners.dish2:SetGoal(0)
		self.Spinners.dish2:SetSpeed(90)

		--TURN dish1 to y-axis <0> SPEED <92.23>;
		self.Spinners.dish1:SetGoal(0)
		self.Spinners.dish1:SetSpeed(90)

		--MOVE base to y-axis <-15.00> SPEED <5.00>;
		self.Sliders.base:SetGoal(0,-15,0)
		self.Sliders.base:SetSpeed(5)

		--STOP-SPIN wheel around y-axis;
		self.Spinners.wheel:SetSpeed(0)



		self:SetConsumptionActive(false)
		self.textureAnimation = false
		TAunit.OnIntelDisabled(self)
		self:PlayUnitSound('Deactivate')
		self.damageReduction = 0.46
	end,

	OnIntelEnabled = function(self)
		--TURN hinge1 to x-axis <133.26> SPEED <68.74>;
		self.Spinners.hinge1:SetGoal(130)
		self.Spinners.hinge1:SetSpeed(68)

		--TURN hinge2 to x-axis <-132.83> SPEED <68.52>;
		self.Spinners.hinge2:SetGoal(-130)
		self.Spinners.hinge2:SetSpeed(68)

		--TURN hinge3 to z-axis <130.67> SPEED <67.40>;
		self.Spinners.hinge3:SetGoal(-130)
		self.Spinners.hinge3:SetSpeed(68)

		--TURN hinge4 to z-axis <-130.23> SPEED <67.18>;
		self.Spinners.hinge4:SetGoal(130)
		self.Spinners.hinge4:SetSpeed(68)

		--TURN dish4 to y-axis <-180.42> SPEED <93.07>;
		self.Spinners.dish4:SetGoal(-180)
		self.Spinners.dish4:SetSpeed(90)

		--TURN dish3 to y-axis <-172.21> SPEED <88.83>;
		self.Spinners.dish3:SetGoal(-180)
		self.Spinners.dish3:SetSpeed(90)

		--TURN dish2 to y-axis <-182.15> SPEED <93.96>;
		self.Spinners.dish2:SetGoal(-180)
		self.Spinners.dish2:SetSpeed(90)

		--TURN dish1 to y-axis <-178.69> SPEED <92.18>;
		self.Spinners.dish1:SetGoal(-180)
		self.Spinners.dish1:SetSpeed(90)

		--MOVE base to y-axis <0> SPEED <5.00>;
		self.Sliders.base:SetGoal(0,0,0)
		self.Sliders.base:SetSpeed(5)

		--SPIN wheel around y-axis  SPEED <60.01>;
		self.Spinners.wheel:SetSpeed(60)

		self:SetConsumptionActive(true)
		self.textureAnimation = true
		TAunit.OnIntelEnabled(self)
		self:PlayUnitSound('Activate')
		self.damageReduction = 1
	end,

	OnKilled = function(self, instigator, type, overkillRatio)
		TAunit.OnKilled(self, instigator, type, overkillRatio)
		self.textureAnimation = false
	end,
}

TypeClass = ARMSONAR
