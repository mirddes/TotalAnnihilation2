#ARM Targeting Facility - Automatic Radar Targeting
#ARMTARG
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMTARG = Class(TAunit) {
	damageReduction = 1,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			post1 = CreateRotator(self, 'post1', 'x', nil, 0, 0, 0),
			post2 = CreateRotator(self, 'post2', 'x', nil, 0, 0, 0),
			post3 = CreateRotator(self, 'post3', 'z', nil, 0, 0, 0),
			post4 = CreateRotator(self, 'post4', 'z', nil, 0, 0, 0),
		}
		self.Sliders = {
			light1 = CreateSlider(self, 'light1'),
			light2 = CreateSlider(self, 'light2'),
			light3 = CreateSlider(self, 'light3'),
			light4 = CreateSlider(self, 'light4'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	OnDamage = function(self, instigator, amount, vector, damageType)
		TAunit.OnDamage(self, instigator, amount * self.damageReduction, vector, damageType) 
		#Has Damage Reduction
	end,

	OnKilled = function(self, instigator, type, overkillRatio)
            if (self:GetScriptBit(3) == false) then
	        TAutils.unregisterTargetingFacility(self:GetArmy())
            end
            TAunit.OnKilled(self, instigator, type, overkillRatio)
        end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		ForkThread(self.Open, self)
		self:PlayUnitSound('Activate')
		TAutils.registerTargetingFacility(self:GetArmy())
	end,

	OnScriptBitSet = function(self, bit)
		if bit == 3 then
			self:PlayUnitSound('Deactivate')
    		        ForkThread(self.Close, self)
			TAutils.unregisterTargetingFacility(self:GetArmy())
		end
		TAunit.OnScriptBitSet(self, bit)
	end,

	OnScriptBitClear = function(self, bit)
		if bit == 3 then
			self:PlayUnitSound('Activate')
			ForkThread(self.Open, self)
			TAutils.registerTargetingFacility(self:GetArmy())
		end
		TAunit.OnScriptBitClear(self, bit)
	end,

	Open = function(self)
		self.damageReduction = 1

		--TURN post1 to x-axis <-90.21> SPEED <82.32>;
		self.Spinners.post1:SetGoal(-90)
		self.Spinners.post1:SetSpeed(82)

		--TURN post2 to x-axis <89.78> SPEED <81.93>;
		self.Spinners.post2:SetGoal(90)
		self.Spinners.post2:SetSpeed(82)

		--TURN post3 to z-axis <-90.21> SPEED <82.32>;
		self.Spinners.post3:SetGoal(90)
		self.Spinners.post3:SetSpeed(82)

		--TURN post4 to z-axis <90.21> SPEED <82.32>;
		self.Spinners.post4:SetGoal(-90)
		self.Spinners.post4:SetSpeed(82)

		--SLEEP <1096>;
                WaitSeconds(1.1)

		--MOVE light4 to x-axis <1.90> SPEED <1.00>;
		self.Sliders.light4:SetGoal(-1.9,0,0)
		self.Sliders.light4:SetSpeed(1)

		--MOVE light3 to x-axis <-2.05> SPEED <1.00>;
		self.Sliders.light3:SetGoal(2.05,0,0)
		self.Sliders.light3:SetSpeed(1)

		--MOVE light2 to z-axis <-2.00> SPEED <1.00>;
		self.Sliders.light2:SetGoal(0,0,-2)
		self.Sliders.light2:SetSpeed(1)

		--MOVE light1 to z-axis <2.00> SPEED <1.00>;
		self.Sliders.light1:SetGoal(0,0,2)
		self.Sliders.light1:SetSpeed(1)

		--SLEEP <1109>;
		--SLEEP <53>;
                WaitSeconds(1.2)

		self:SetConsumptionActive(true)
	end,

	Close = function(self)
		--MOVE light4 to x-axis <0> SPEED <1.00>;
		self.Sliders.light4:SetGoal(0,0,0)
		self.Sliders.light4:SetSpeed(1)

		--MOVE light3 to x-axis <0> SPEED <1.00>;
		self.Sliders.light3:SetGoal(0,0,0)
		self.Sliders.light3:SetSpeed(1)

		--MOVE light2 to z-axis <0> SPEED <1.00>;
		self.Sliders.light2:SetGoal(0,0,0)
		self.Sliders.light2:SetSpeed(1)

		--MOVE light1 to z-axis <0> SPEED <1.00>;
		self.Sliders.light1:SetGoal(0,0,0)
		self.Sliders.light1:SetSpeed(1)

		--SLEEP <1206>;
                WaitSeconds(1.2)

		--TURN post1 to x-axis <0> SPEED <73.96>;
		self.Spinners.post1:SetGoal(0)
		self.Spinners.post1:SetSpeed(74)

		--TURN post2 to x-axis <0> SPEED <73.60>;
		self.Spinners.post2:SetGoal(0)
		self.Spinners.post2:SetSpeed(74)

		--TURN post3 to z-axis <0> SPEED <73.96>;
		self.Spinners.post3:SetGoal(0)
		self.Spinners.post3:SetSpeed(74)

		--TURN post4 to z-axis <0> SPEED <73.96>;
		self.Spinners.post4:SetGoal(0)
		self.Spinners.post4:SetSpeed(74)

		--SLEEP <1220>;
		--SLEEP <58>;
                WaitSeconds(1.3)

		self.damageReduction = 0.7
		self:SetConsumptionActive(false)
	end,
}

TypeClass = ARMTARG