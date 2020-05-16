#CORE Targeting Facility - Automatic Radar Targeting
#CORTARG
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORTARG = Class(TAunit) {
	damageReduction = 1,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Sliders = {
			arm1 = CreateSlider(self, 'arm1'),
			arm2 = CreateSlider(self, 'arm2'),
			arm3 = CreateSlider(self, 'arm3'),
			arm4 = CreateSlider(self, 'arm4'),
			light1 = CreateSlider(self, 'light1'),
			light2 = CreateSlider(self, 'light2'),
			light3 = CreateSlider(self, 'light3'),
			light4 = CreateSlider(self, 'light4'),
		}
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

		--MOVE arm1 to z-axis <-5.35> SPEED <4.00>;
		self.Sliders.arm1:SetGoal(0,0,-5.5)
		self.Sliders.arm1:SetSpeed(4)

		--MOVE arm2 to z-axis <5.30> SPEED <4.00>;
		self.Sliders.arm2:SetGoal(0,0,5.5)
		self.Sliders.arm2:SetSpeed(4)

		--MOVE arm3 to x-axis <-5.50> SPEED <5.00>;
		self.Sliders.arm3:SetGoal(5.5,0,0)
		self.Sliders.arm3:SetSpeed(4)

		--MOVE arm4 to x-axis <5.45> SPEED <4.00>;
		self.Sliders.arm4:SetGoal(-5.5,0,0)
		self.Sliders.arm4:SetSpeed(4)

		--SLEEP <1094>;
                WaitSeconds(1.1)

		--MOVE light4 to y-axis <1.20> SPEED <1.00>;
		self.Sliders.light4:SetGoal(0,1.2,0)
		self.Sliders.light4:SetSpeed(1)

		--MOVE light3 to y-axis <1.20> SPEED <1.00>;
		self.Sliders.light3:SetGoal(0,1.2,0)
		self.Sliders.light3:SetSpeed(1)

		--MOVE light2 to y-axis <1.20> SPEED <1.00>;
		self.Sliders.light2:SetGoal(0,1.2,0)
		self.Sliders.light2:SetSpeed(1)

		--MOVE light1 to y-axis <1.15> SPEED <1.00>;
		self.Sliders.light1:SetGoal(0,1.2,0)
		self.Sliders.light1:SetSpeed(1)

		--SLEEP <1109>;
		--SLEEP <112>;
                WaitSeconds(1.2)

		self:SetConsumptionActive(true)
	end,

	Close = function(self)

		#BUG in TA, lights never lower again
		--MOVE light4 to y-axis <0> SPEED <0>;
		self.Sliders.light4:SetGoal(0,0,0)
		self.Sliders.light4:SetSpeed(1)

		--MOVE light3 to y-axis <0> SPEED <0>;
		self.Sliders.light3:SetGoal(0,0,0)
		self.Sliders.light3:SetSpeed(1)

		--MOVE light2 to y-axis <0> SPEED <0>;
		self.Sliders.light2:SetGoal(0,0,0)
		self.Sliders.light2:SetSpeed(1)

		--MOVE light1 to y-axis <0> SPEED <0>;
		self.Sliders.light1:SetGoal(0,0,0)
		self.Sliders.light1:SetSpeed(1)

		--SLEEP <1201>;
                WaitSeconds(1.2)

		--MOVE arm1 to z-axis <0> SPEED <4.00>;
		self.Sliders.arm1:SetGoal(0,0,0)
		self.Sliders.arm1:SetSpeed(4)

		--MOVE arm2 to z-axis <0> SPEED <4.00>;
		self.Sliders.arm2:SetGoal(0,0,0)
		self.Sliders.arm2:SetSpeed(4)

		--MOVE arm3 to x-axis <0> SPEED <4.00>;
		self.Sliders.arm3:SetGoal(0,0,0)
		self.Sliders.arm3:SetSpeed(4)

		--MOVE arm4 to x-axis <0> SPEED <4.00>;
		self.Sliders.arm4:SetGoal(0,0,0)
		self.Sliders.arm4:SetSpeed(4)

		--SLEEP <1220>;
		--SLEEP <59>;
                WaitSeconds(1.2)

		self.damageReduction = 0.7
		self:SetConsumptionActive(false)
	end,
}

TypeClass = CORTARG