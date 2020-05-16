#ARM Shipyard - Produces Ships
#ARMSY
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

ARMSY = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,

	OnCreate = function(self)
		TAconstructor.OnCreate(self)
		self.Spinners = {
			nano1 = CreateRotator(self, 'Build_Tower_01', 'y', nil, 0, 0, 0),
			nano2 = CreateRotator(self, 'Build_Tower_02', 'y', nil, 0, 0, 0),
			turret1 = CreateRotator(self, 'Build_Nozzle_01', 'x', nil, 0, 0, 0),
			turret2 = CreateRotator(self, 'Build_Nozzle_02', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			nano1 = CreateSlider(self, 'Build_Nozzle_01'),
			nano2 = CreateSlider(self, 'Build_Nozzle_02'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	OnKilled = function(self, instigator, type, overkillRatio)
		TAconstructor.OnKilled(self, instigator, type, overkillRatio)
		self.textureAnimation = false
	end,

	Open = function(self)
		--MOVE nano2 to y-axis <7.80> SPEED <10.00>;
		self.Sliders.nano2:SetGoal(0,7.8,0)
		self.Sliders.nano2:SetSpeed(10)

		--MOVE nano1 to y-axis <7.75> SPEED <10.00>;
		self.Sliders.nano1:SetGoal(0,7.8,0)
		self.Sliders.nano1:SetSpeed(10)

		--SLEEP <751>;
		WaitSeconds(0.75)

		--TURN nano2 to x-axis <-311.84> SPEED <411.51>;
		self.Spinners.nano2:SetGoal(-311.84)
		self.Spinners.nano2:SetSpeed(411.51)

		--TURN nano1 to x-axis <-312.29> SPEED <412.10>;
		self.Spinners.nano1:SetGoal(312.29)
		self.Spinners.nano1:SetSpeed(411.51)

		--SLEEP <758>;
		WaitSeconds(0.75)

		#Doesn't point properly, new values used
		--TURN turret1 to y-axis <-45.00> SPEED <59.21>;
		self.Spinners.turret1:SetGoal(75)
		self.Spinners.turret1:SetSpeed(59.81)

		--TURN turret2 to y-axis <45.44> SPEED <59.81>;
		self.Spinners.turret2:SetGoal(75)
		self.Spinners.turret2:SetSpeed(59.81)

		 #Changed to allow new turn value
		--SLEEP <760>;
		WaitSeconds(1.45)

		--SLEEP <37>;

		TAconstructor.Open(self)
	end,


	Close = function(self)


		--TURN turret1 to y-axis <0> SPEED <60.01>;
		self.Spinners.turret1:SetGoal(0)
		self.Spinners.turret1:SetSpeed(60)

		--TURN turret2 to y-axis <0> SPEED <60.60>;
		self.Spinners.turret2:SetGoal(0)
		self.Spinners.turret2:SetSpeed(60)

		--SLEEP <750>;
		WaitSeconds(0.75)

		--TURN nano2 to x-axis <0> SPEED <412.05>;
		self.Spinners.nano2:SetGoal(0)
		self.Spinners.nano2:SetSpeed(412.05)

		--TURN nano1 to x-axis <0> SPEED <412.64>;
		self.Spinners.nano1:SetGoal(0)
		self.Spinners.nano1:SetSpeed(412.05)

		--SLEEP <757>;
		WaitSeconds(0.75)

		--MOVE nano2 to y-axis <0> SPEED <10.00>;
		self.Sliders.nano2:SetGoal(0,0,0)
		self.Sliders.nano2:SetSpeed(10)

		--MOVE nano1 to y-axis <0> SPEED <10.00>;
		self.Sliders.nano1:SetGoal(0,0,0)
		self.Sliders.nano1:SetSpeed(10)

		--SLEEP <760>;
		WaitSeconds(0.75)

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMSY