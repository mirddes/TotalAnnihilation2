#ARM Vehicle Plant - Produces Vehicles
#ARMVP
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

ARMVP = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			side1 = CreateRotator(self, 'Side_02', 'z', nil, 0, 0, 0),
			side2 = CreateRotator(self, 'Side_01', 'z', nil, 0, 0, 0),
			door1 = CreateRotator(self, 'Door_02', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'Door_01', 'z', nil, 0, 0, 0),
			nano1 = CreateRotator(self, 'Build_Muzzle_02', 'z', nil, 0, 0, 0),
			nano2 = CreateRotator(self, 'Build_Muzzle_01', 'z', nil, 0, 0, 0),
			nano1aim = CreateRotator(self, 'Nozzle_01', 'y', 90, 3600, 0, 0),
			nano2aim = CreateRotator(self, 'Nozzle_02', 'y', -90, 3600, 0, 0),
			pad = CreateRotator(self, 'BuildPlate', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			door1 = CreateSlider(self, 'Door_02'),
			door2 = CreateSlider(self, 'Door_01'),
			plate1 = CreateSlider(self, 'Build_Plate_02'),
			plate2 = CreateSlider(self, 'Build_Plate_01'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,


	Open = function(self)
		--TURN side2 to z-axis <89.54> SPEED <116.93>
		self.Spinners.side2:SetGoal(89.54)
		self.Spinners.side2:SetSpeed(116.93)

		--TURN side1 to z-axis <-89.54> SPEED <116.93>
		self.Spinners.side1:SetGoal(-89.54)
		self.Spinners.side1:SetSpeed(116.93)

		--SLEEP <766>
		WaitSeconds(0.75)

		--TURN doo2 to z-axis <90.00> SPEED <210.32>
		self.Spinners.door2:SetGoal(90)
		self.Spinners.door2:SetSpeed(210.32)

		--TURN door1 to z-axis <-90.44> SPEED <211.37>
		self.Spinners.door1:SetGoal(-90)
		self.Spinners.door1:SetSpeed(210.32)

		--SLEEP <428>
		WaitSeconds(0.4)

		--MOVE doo2 to x-axis <-7.00> SPEED <16.00>
		self.Sliders.door2:SetGoal(0,7,0)
		self.Sliders.door2:SetSpeed(16)

		--MOVE door1 to x-axis <7.10> SPEED <16.00>
		self.Sliders.door1:SetGoal(0,7,0)
		self.Sliders.door1:SetSpeed(16)

		--SLEEP <428>
		WaitSeconds(0.4)

		--MOVE plate2 to x-axis <5.85> SPEED <13.00>
		self.Sliders.plate2:SetGoal(5.85,0,0)
		self.Sliders.plate2:SetSpeed(13)

		--MOVE plate1 to x-axis <-6.50> SPEED <15.00>
		self.Sliders.plate1:SetGoal(-5.85,0,0)
		self.Sliders.plate1:SetSpeed(13)

		--SLEEP <429>
		WaitSeconds(0.4)

		--TURN nano2 to z-axis <-37.34> SPEED <86.67>
		self.Spinners.nano2:SetGoal(-37)
		self.Spinners.nano2:SetSpeed(86.67)

		--TURN nano1 to z-axis <41.84> SPEED <97.12>
		self.Spinners.nano1:SetGoal(37)
		self.Spinners.nano1:SetSpeed(86.67)
			
		--SLEEP <431>
		WaitSeconds(0.45)

		--SLEEP <19>
		#Needs to be moved
		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Close = function(self)
		#Needs to be moved
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--TURN nano2 to z-axis <0> SPEED <89.37>
		self.Spinners.nano2:SetGoal(0)
		self.Spinners.nano2:SetSpeed(89.37)

		--TURN nano1 to z-axis <0> SPEED <100.14>
		self.Spinners.nano1:SetGoal(0)
		self.Spinners.nano1:SetSpeed(89.37)

		--SLEEP <418>
		WaitSeconds(0.4)

		--MOVE plate2 to x-axis <0> SPEED <13.00>
		self.Sliders.plate2:SetGoal(0,0,0)
		self.Sliders.plate2:SetSpeed(13)

		--MOVE plate1 to x-axis <0> SPEED <15.00>
		self.Sliders.plate1:SetGoal(0,0,0)
		self.Sliders.plate1:SetSpeed(13)

		--SLEEP <426>
		WaitSeconds(0.45)

		--MOVE doo2 to x-axis <0> SPEED <16.00>
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(16)

		--MOVE door1 to x-axis <0> SPEED <16.00>
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(16)

		--SLEEP <428>
		WaitSeconds(0.45)

		--TURN doo2 to z-axis <0> SPEED <209.35>
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(210.39)

		--TURN door1 to z-axis <0> SPEED <210.39>
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(210.39)

		--SLEEP <430>
		WaitSeconds(0.45)

		--TURN side1 to z-axis <0> SPEED <122.02>
		self.Spinners.side2:SetGoal(0)
		self.Spinners.side2:SetSpeed(122.02)

		--TURN side2 to z-axis <0> SPEED <122.02>
		self.Spinners.side1:SetGoal(0)
		self.Spinners.side1:SetSpeed(122.02)

		--SLEEP <734>
		WaitSeconds(0.75)

		--SLEEP <20>;
		TAconstructor.Close(self)
	end,
}

TypeClass = ARMVP