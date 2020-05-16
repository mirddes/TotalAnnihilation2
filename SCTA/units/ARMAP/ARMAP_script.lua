#ARM Aircraft Plant - Produces Aircraft
#ARMAP
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

ARMAP = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			radar = CreateRotator(self, 'Radar', 'y', nil, 0, 0, 0),
			door1 = CreateRotator(self, 'Door_01', 'x', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'Door_02', 'z', nil, 0, 0, 0),
			pad = CreateRotator(self, 'BasePlate', 'y', nil, 0, 0, 0),
			post1 = CreateRotator(self, 'Turret_01', 'y', nil, 0, 0, 0),
			post2 = CreateRotator(self, 'Turret_02', 'y', nil, 0, 0, 0),
			nano1 = CreateRotator(self, 'Build_Nozzle_01', 'z', nil, 0, 0, 0),
			nano2 = CreateRotator(self, 'Build_Nozzle_02', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			door1 = CreateSlider(self, 'Door_01'),
			door2 = CreateSlider(self, 'Door_02'),
			plate1 = CreateSlider(self, 'Post_01'),
			plate2 = CreateSlider(self, 'Post_02'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAconstructor.OnStopBeingBuilt(self,builder,layer)
		self.Spinners.radar:SetSpeed(45)
	end,

	Open = function(self)
		--TURN door1 to x-axis <-88.64> SPEED <129.82>
		self.Spinners.door1:SetGoal(-90)
		self.Spinners.door1:SetSpeed(131.80)

		--TURN door2 to z-axis <90.00> SPEED <131.80>
		self.Spinners.door2:SetGoal(-90)
		self.Spinners.door2:SetSpeed(131.80)

		--SLEEP <683>
		WaitSeconds(0.7)

		--MOVE door1 to y-axis <-8.35> SPEED <12.00>
		self.Sliders.door1:SetGoal(0,0,-8.35)
		self.Sliders.door1:SetSpeed(12)

		--MOVE door2 to y-axis <-5.30> SPEED <7.00>
		self.Sliders.door2:SetGoal(5.3,0,0)
		self.Sliders.door2:SetSpeed(7)

		--SLEEP <689>
		WaitSeconds(0.7)

		--MOVE plate1 to y-axis <7.75> SPEED <11.00>
		self.Sliders.plate1:SetGoal(0,7.75,0)
		self.Sliders.plate1:SetSpeed(11)
			
		--MOVE plate2 to y-axis <9.60> SPEED <13.00>
		self.Sliders.plate2:SetGoal(0,9.4,0)
		self.Sliders.plate2:SetSpeed(13)

		--SLEEP <691>
		WaitSeconds(0.7)

		--TURN post1 to y-axis <89.54> SPEED <129.62>
		self.Spinners.post1:SetGoal(89.54)
		self.Spinners.post1:SetSpeed(129.62)

		--SLEEP <691>
		WaitSeconds(0.7)

		--TURN nano2 to x-axis <132.29> SPEED <190.67>
		self.Spinners.nano2:SetGoal(132.29)
		self.Spinners.nano2:SetSpeed(190.67)

		--TURN nano1 to z-axis <-128.69> SPEED <185.48>
		self.Spinners.nano1:SetGoal(128.69)
		self.Spinners.nano1:SetSpeed(185.48)
			
		--SLEEP <694>
		WaitSeconds(0.7)


		--TURN post2 to y-axis <-48.14> SPEED <70.30>
		self.Spinners.post2:SetGoal(-48.1)
		self.Spinners.post2:SetSpeed(70.30)

		--TURN post1 to y-axis <76.94> SPEED <18.39>
		self.Spinners.post1:SetGoal(76.94)
		self.Spinners.post1:SetSpeed(18.39)
			
		--SLEEP <685>
		WaitSeconds(0.7)

		--SLEEP <70>

		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Close = function(self)
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--TURN post2 to y-axis <0> SPEED <70.51>
		self.Spinners.post2:SetGoal(0)
		self.Spinners.post2:SetSpeed(70.51)

		--TURN post1 to y-axis <89.54> SPEED <18.45>
		self.Spinners.post1:SetGoal(89.54)
		self.Spinners.post1:SetSpeed(18.45)

		--SLEEP <683>
		WaitSeconds(0.7)

		--TURN nano2 to x-axis <0> SPEED <192.06>
		self.Spinners.nano2:SetGoal(0)
		self.Spinners.nano2:SetSpeed(192.06)

		--TURN nano1 to z-axis <0> SPEED <186.83>
		self.Spinners.nano1:SetGoal(0)
		self.Spinners.nano1:SetSpeed(186.83)

		--SLEEP <689>
		WaitSeconds(0.7)

		--TURN post1 to y-axis <0> SPEED <129.62>
		self.Spinners.post1:SetGoal(0)
		self.Spinners.post1:SetSpeed(129.62)

		--SLEEP <691>
		WaitSeconds(0.7)

		--MOVE plate1 to y-axis <0> SPEED <11.00>
		self.Sliders.plate1:SetGoal(0,0,0)
		self.Sliders.plate1:SetSpeed(11)

		--MOVE plate2 to y-axis <0> SPEED <13.00>
		self.Sliders.plate2:SetGoal(0,0,0)
		self.Sliders.plate2:SetSpeed(13)

		--SLEEP <691>
		WaitSeconds(0.7)

		--MOVE door1 to y-axis <0> SPEED <12.00>
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(12)

		--MOVE door2 to y-axis <0> SPEED <7.00>
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(7)

		--SLEEP <694>
		WaitSeconds(0.7)

		--TURN door1 to x-axis <0> SPEED <129.44>
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(131.41)

		--TURN door2 to z-axis <0> SPEED <131.41>
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(131.41)

		--SLEEP <694>
		WaitSeconds(0.7)

		--SLEEP <70>

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMAP