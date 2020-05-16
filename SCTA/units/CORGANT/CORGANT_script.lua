#CORE Krogoth Gantry - Builds Krogoths
#CORGANT
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORGANT = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = false,

	OnCreate = function(self)
		self.Spinners = {
			clamp1b = CreateRotator(self, 'clamp1b', 'z', nil, 0, 0, 0),
			clamp2b = CreateRotator(self, 'clamp2b', 'z', nil, 0, 0, 0),
			clamp3b = CreateRotator(self, 'clamp3b', 'z', nil, 0, 0, 0),
			clamp4b = CreateRotator(self, 'clamp4b', 'z', nil, 0, 0, 0),
			crane = CreateRotator(self, 'crane', 'x', nil, 0, 0, 0),
            arm1a = CreateRotator(self, 'arm1a', 'z', nil, 0, 0, 0),
            arm1b = CreateRotator(self, 'arm1b', 'z', nil, 0, 0, 0),
            arm2a = CreateRotator(self, 'arm2a', 'z', nil, 0, 0, 0),
            arm2b = CreateRotator(self, 'arm2b', 'z', nil, 0, 0, 0),
            arm3a = CreateRotator(self, 'arm3a', 'z', nil, 0, 0, 0),
            arm3b = CreateRotator(self, 'arm3b', 'z', nil, 0, 0, 0),
            arm4a = CreateRotator(self, 'arm4a', 'z', nil, 0, 0, 0),
            arm4b = CreateRotator(self, 'arm4b', 'z', nil, 0, 0, 0),

		}
		self.Sliders = {
			clamp1 = CreateSlider(self, 'clamp1'),
			clamp2 = CreateSlider(self, 'clamp2'),
			clamp3 = CreateSlider(self, 'clamp3'),
			clamp4 = CreateSlider(self, 'clamp4'),
            clamp1b = CreateSlider(self, 'clamp1b'),
            clamp2b = CreateSlider(self, 'clamp2b'),
            clamp3b = CreateSlider(self, 'clamp3b'),
			clamp4b = CreateSlider(self, 'clamp4b'),
            clamplight1 = CreateSlider(self, 'clamplight1'),
            clamplight2 = CreateSlider(self, 'clamplight2'),
            clamplight3 = CreateSlider(self, 'clamplight3'),
            clamplight4 = CreateSlider(self, 'clamplight4'),
            gangplank = CreateSlider(self, 'gangplank'),
            arm1a = CreateSlider(self, 'arm1a'),
            arm4a = CreateSlider(self, 'arm4a'),
		}

		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end

		TAconstructor.OnCreate(self)
	end,


	Open = function(self)

		--TURN clamp4b to z-axis <28.82> SPEED <94.23>;
		self.Spinners.clamp4b:SetGoal(30)
		self.Spinners.clamp4b:SetSpeed(110)

		--TURN clamp3b to z-axis <34.45> SPEED <112.61>;
		self.Spinners.clamp3b:SetGoal(30)
		self.Spinners.clamp3b:SetSpeed(110)

		--TURN clamp2b to z-axis <-32.68> SPEED <106.86>;
		self.Spinners.clamp2b:SetGoal(-30)
		self.Spinners.clamp2b:SetSpeed(110)

		--TURN clamp1b to z-axis <-30.93> SPEED <101.12>;
		self.Spinners.clamp1b:SetGoal(-30)
		self.Spinners.clamp1b:SetSpeed(110)

		--SLEEP <306>;
		WaitSeconds(0.3)

		--TURN clamp4b to z-axis <49.21> SPEED <56.96>;
		self.Spinners.clamp4b:SetGoal(50)
		self.Spinners.clamp4b:SetSpeed(50)

		--TURN clamp3b to z-axis <49.56> SPEED <42.23>;
		self.Spinners.clamp3b:SetGoal(50)
		self.Spinners.clamp3b:SetSpeed(50)

		--TURN clamp2b to z-axis <-48.86> SPEED <45.18>;
		self.Spinners.clamp2b:SetGoal(-50)
		self.Spinners.clamp2b:SetSpeed(50)

		--TURN clamp1b to z-axis <-49.56> SPEED <52.05>;
		self.Spinners.clamp1b:SetGoal(50)
		self.Spinners.clamp1b:SetSpeed(50)

		--SLEEP <358>;
		WaitSeconds(0.4)

		--TURN clamp4b to z-axis <36.56> SPEED <38.59>;
		self.Spinners.clamp4b:SetGoal(40)
		self.Spinners.clamp4b:SetSpeed(35)

		--TURN clamp3b to z-axis <37.26> SPEED <37.52>;
		self.Spinners.clamp3b:SetGoal(40)
		self.Spinners.clamp3b:SetSpeed(35)

		--TURN clamp2b to z-axis <-39.37> SPEED <28.94>;
		self.Spinners.clamp2b:SetGoal(-40)
		self.Spinners.clamp2b:SetSpeed(35)

		--TURN clamp1b to z-axis <-39.01> SPEED <32.15>;
		self.Spinners.clamp1b:SetGoal(-40)
		self.Spinners.clamp1b:SetSpeed(35)

		--SLEEP <328>;
		WaitSeconds(0.3)

		--MOVE clamp1 to x-axis <8.79> SPEED <28.00>;
		self.Sliders.clamp1:SetGoal(8.8,0,0)
		self.Sliders.clamp1:SetSpeed(28)

		--MOVE clamp4 to x-axis <-8.34> SPEED <27.00>;
		self.Sliders.clamp4:SetGoal(-8.8,0,0)
		self.Sliders.clamp4:SetSpeed(28)

		--TURN clamp4b to z-axis <41.12> SPEED <14.84>;
		self.Spinners.clamp4b:SetGoal(41)
		self.Spinners.clamp4b:SetSpeed(10)

		--TURN clamp3b to z-axis <41.12> SPEED <12.55>;
		self.Spinners.clamp3b:SetGoal(41)
		self.Spinners.clamp3b:SetSpeed(10)

		--TURN clamp2b to z-axis <-41.13> SPEED <5.70>;
		self.Spinners.clamp2b:SetGoal(-41)
		self.Spinners.clamp2b:SetSpeed(10)

		--TURN clamp1b to z-axis <-42.53> SPEED <11.41>;
		self.Spinners.clamp1b:SetGoal(-41)
		self.Spinners.clamp1b:SetSpeed(10)

		--SLEEP <308>;
		WaitSeconds(0.3)

		--MOVE clamp1 to x-axis <13.40> SPEED <7.00>;
		self.Sliders.clamp1:SetGoal(13.4,0,0)
		self.Sliders.clamp1:SetSpeed(7)

		--MOVE clamp2 to x-axis <9.05> SPEED <13.00>;
		self.Sliders.clamp2:SetGoal(9,0,0)
		self.Sliders.clamp2:SetSpeed(13)

		--MOVE clamp3 to x-axis <-8.65> SPEED <13.00>;
		self.Sliders.clamp3:SetGoal(-9,0,0)
		self.Sliders.clamp3:SetSpeed(13)

		--MOVE clamp4 to x-axis <-13.75> SPEED <8.00>;
		self.Sliders.clamp4:SetGoal(-13.8,0,0)
		self.Sliders.clamp4:SetSpeed(8)

		--SLEEP <657>;
		WaitSeconds(0.7)

		--MOVE clamp1 to x-axis <14.99> SPEED <2.00>;
		self.Sliders.clamp1:SetGoal(15,0,0)
		self.Sliders.clamp1:SetSpeed(2)

		--MOVE clamp2 to x-axis <13.30> SPEED <5.00>;
		self.Sliders.clamp2:SetGoal(13.2,0,0)
		self.Sliders.clamp2:SetSpeed(5)

		--MOVE clamp3 to x-axis <-13.20> SPEED <6.00>;
		self.Sliders.clamp3:SetGoal(-13.2,0,0)
		self.Sliders.clamp3:SetSpeed(5)

		--MOVE clamp4 to x-axis <-15.14> SPEED <1.00>;
		self.Sliders.clamp4:SetGoal(-15,0,0)
		self.Sliders.clamp4:SetSpeed(2)

		--TURN crane to x-axis <-10.18> SPEED <14.21>;
		self.Spinners.crane:SetGoal(-10)
		self.Spinners.crane:SetSpeed(14)

		--TURN clamp4b to z-axis <15.81> SPEED <35.30>;
		self.Spinners.clamp4b:SetGoal(15)
		self.Spinners.clamp4b:SetSpeed(37)

		--TURN clamp1b to z-axis <-14.06> SPEED <39.72>;
		self.Spinners.clamp1b:SetGoal(-15)
		self.Spinners.clamp1b:SetSpeed(37)

		--SLEEP <717>;
		WaitSeconds(0.7)

		--MOVE clamp2 to x-axis <15.09> SPEED <3.00>;
		self.Sliders.clamp2:SetGoal(15,0,0)
		self.Sliders.clamp2:SetSpeed(3)

		--MOVE clamp3 to x-axis <-14.94> SPEED <3.00>;
		self.Sliders.clamp3:SetGoal(-15,0,0)
		self.Sliders.clamp3:SetSpeed(3)

		--MOVE clamp4b to x-axis <-4.60> SPEED <8.00>;
		self.Sliders.clamp4b:SetGoal(-5,0,0)
		self.Sliders.clamp4b:SetSpeed(8)

		--MOVE clamplight4 to x-axis <2.45> SPEED <4.00>;
		self.Sliders.clamplight4:SetGoal(2.5,0,0)
		self.Sliders.clamplight4:SetSpeed(4)

		--MOVE clamp1b to x-axis <4.59> SPEED <8.00>;
		self.Sliders.clamp1b:SetGoal(5,0,0)
		self.Sliders.clamp1b:SetSpeed(8)

		--MOVE clamplight1 to x-axis <-2.25> SPEED <4.00>;
		self.Sliders.clamplight1:SetGoal(-2.5,0,0)
		self.Sliders.clamplight1:SetSpeed(4)

		--TURN crane to x-axis <-24.95> SPEED <27.19>;
		self.Spinners.crane:SetGoal(-25)
		self.Spinners.crane:SetSpeed(27)

		--TURN clamp4b to z-axis <-36.21> SPEED <95.84>;
		self.Spinners.clamp4b:SetGoal(-36)
		self.Spinners.clamp4b:SetSpeed(95)

		--TURN clamp3b to z-axis <13.00> SPEED <51.80>;
		self.Spinners.clamp3b:SetGoal(13)
		self.Spinners.clamp3b:SetSpeed(52)

		--TURN clamp2b to z-axis <-13.35> SPEED <51.15>;
		self.Spinners.clamp2b:SetGoal(-13)
		self.Spinners.clamp2b:SetSpeed(52)

		--TURN clamp1b to z-axis <39.37> SPEED <98.43>;
		self.Spinners.clamp1b:SetGoal(36)
		self.Spinners.clamp1b:SetSpeed(95)

		--SLEEP <543>;
		WaitSeconds(0.5)

		--MOVE clamp4b to y-axis <-5.25> SPEED <10.00>;
		self.Sliders.clamp4b:SetGoal(-5,-5.25,0)
		self.Sliders.clamp4b:SetSpeed(10)

		--MOVE clamplight4 to x-axis <3.70> SPEED <2.00>;
		self.Sliders.clamplight4:SetGoal(3.5,0,0)
		self.Sliders.clamplight4:SetSpeed(2)

		--MOVE clamp3b to x-axis <-4.60> SPEED <8.00>;
		self.Sliders.clamp3b:SetGoal(-4.5,0,0)
		self.Sliders.clamp3b:SetSpeed(8)

		--MOVE clamplight3 to x-axis <2.40> SPEED <4.00>;
		self.Sliders.clamplight3:SetGoal(2,0,0)
		self.Sliders.clamplight3:SetSpeed(3)

		--MOVE clamp2b to x-axis <4.65> SPEED <8.00>;
		self.Sliders.clamp2b:SetGoal(4.5,0,0)
		self.Sliders.clamp2b:SetSpeed(8)

		--MOVE clamplight2 to x-axis <-2.05> SPEED <3.00>;
		self.Sliders.clamplight2:SetGoal(-2,0,0)
		self.Sliders.clamplight2:SetSpeed(3)

		--MOVE clamp1b to y-axis <-5.20> SPEED <9.00>;
		self.Sliders.clamp1b:SetGoal(5,-5.25,0)
		self.Sliders.clamp1b:SetSpeed(10)

		--MOVE clamplight1 to x-axis <-3.50> SPEED <2.00>;
		self.Sliders.clamplight1:SetGoal(-3.5,0,0)
		self.Sliders.clamplight1:SetSpeed(2)

		--TURN crane to x-axis <-37.26> SPEED <23.52>;
		self.Spinners.crane:SetGoal(-37)
		self.Spinners.crane:SetSpeed(24)

		--TURN clamp4b to z-axis <0> SPEED <69.25>;
		self.Spinners.clamp4b:SetGoal(0)
		self.Spinners.clamp4b:SetSpeed(70)

		--TURN clamp3b to z-axis <-36.91> SPEED <95.47>;
		self.Spinners.clamp3b:SetGoal(-37)
		self.Spinners.clamp3b:SetSpeed(100)

		--TURN clamp2b to z-axis <39.72> SPEED <101.52>;
		self.Spinners.clamp2b:SetGoal(37)
		self.Spinners.clamp2b:SetSpeed(100)

		--TURN clamp1b to z-axis <0> SPEED <75.30>;
		self.Spinners.clamp1b:SetGoal(0)
		self.Spinners.clamp1b:SetSpeed(70)

		--SLEEP <523>;
		WaitSeconds(0.5)

		--MOVE clamp3b to y-axis <-5.05> SPEED <9.00>;
		self.Sliders.clamp3b:SetGoal(-4.5,-5,0)
		self.Sliders.clamp3b:SetSpeed(9)

		--MOVE clamplight3 to x-axis <3.65> SPEED <2.00>;
		self.Sliders.clamplight3:SetGoal(3.5,0,0)
		self.Sliders.clamplight3:SetSpeed(2)

		--MOVE clamp2b to y-axis <-5.04> SPEED <9.00>;
		self.Sliders.clamp2b:SetGoal(4.5,-5,0)
		self.Sliders.clamp2b:SetSpeed(9)

		--MOVE clamplight2 to x-axis <-3.55> SPEED <2.00>;
		self.Sliders.clamplight2:SetGoal(-3.5,0,0)
		self.Sliders.clamplight2:SetSpeed(2)

		--TURN crane to x-axis <-48.51> SPEED <21.51>;
		self.Spinners.crane:SetGoal(-49)
		self.Spinners.crane:SetSpeed(22)

		--TURN clamp3b to z-axis <0> SPEED <70.59>;
		self.Spinners.clamp3b:SetGoal(0)
		self.Spinners.clamp3b:SetSpeed(71)

		--TURN clamp2b to z-axis <0> SPEED <75.97>;
		self.Spinners.clamp2b:SetGoal(0)
		self.Spinners.clamp2b:SetSpeed(76)

		--SLEEP <523>;
		WaitSeconds(0.5)

		--TURN crane to x-axis <-64.33> SPEED <30.25>;
		self.Spinners.crane:SetGoal(-64)
		self.Spinners.crane:SetSpeed(30)

		--SLEEP <523>;
		WaitSeconds(0.5)

		--TURN crane to x-axis <-82.96> SPEED <35.63>;
		self.Spinners.crane:SetGoal(-83)
		self.Spinners.crane:SetSpeed(36)

		--SLEEP <523>;
		WaitSeconds(0.5)

		--TURN crane to x-axis <-94.92> SPEED <22.85>;
		self.Spinners.crane:SetGoal(-95)
		self.Spinners.crane:SetSpeed(23)

		--SLEEP <523>;
		WaitSeconds(0.5)

		--TURN crane to x-axis <-92.81> SPEED <4.03>;
		self.Spinners.crane:SetGoal(-93)
		self.Spinners.crane:SetSpeed(4)

		--SLEEP <523>;
		WaitSeconds(0.5)

		--TURN crane to x-axis <-88.93> SPEED <7.39>;
		self.Spinners.crane:SetGoal(-89)
		self.Spinners.crane:SetSpeed(7)

		--SLEEP <523>;
		WaitSeconds(0.5)

		--TURN crane to x-axis <-90.00> SPEED <2.01>;
		self.Spinners.crane:SetGoal(-90)
		self.Spinners.crane:SetSpeed(2)

		--SLEEP <523>;
		WaitSeconds(0.5)

		--TURN arm1a to z-axis <8.08> SPEED <15.46>;
		self.Spinners.arm1a:SetGoal(8)
		self.Spinners.arm1a:SetSpeed(15)

		--TURN arm2a to z-axis <20.03> SPEED <38.32>;
		self.Spinners.arm2a:SetGoal(20)
		self.Spinners.arm2a:SetSpeed(38)

		--TURN arm3a to z-axis <-19.33> SPEED <36.97>;
		self.Spinners.arm3a:SetGoal(-19)
		self.Spinners.arm3a:SetSpeed(37)

		--TURN arm4a to z-axis <-11.25> SPEED <21.51>;
		self.Spinners.arm4a:SetGoal(-11)
		self.Spinners.arm4a:SetSpeed(22)


		--SLEEP <523>;
		WaitSeconds(0.5)

		--TURN arm1a to z-axis <26.01> SPEED <31.29>;
		self.Spinners.arm1a:SetGoal(26)
		self.Spinners.arm1a:SetSpeed(31)

		--TURN arm2a to z-axis <41.83> SPEED <38.04>;
		self.Spinners.arm2a:SetGoal(42)
		self.Spinners.arm2a:SetSpeed(38)

		--TURN arm3a to z-axis <-42.53> SPEED <40.50>;
		self.Spinners.arm3a:SetGoal(-43)
		self.Spinners.arm3a:SetSpeed(40)

		--TURN arm4a to z-axis <-25.31> SPEED <24.54>;
		self.Spinners.arm4a:SetGoal(-25)
		self.Spinners.arm4a:SetSpeed(24)

		--TURN arm3b to z-axis <-29.88> SPEED <52.15>;
		self.Spinners.arm3b:SetGoal(-30)
		self.Spinners.arm3b:SetSpeed(52)

		--TURN arm2b to z-axis <26.71> SPEED <46.63>;
		self.Spinners.arm2b:SetGoal(27)
		self.Spinners.arm2b:SetSpeed(47)


		--SLEEP <573>;
		WaitSeconds(0.6)

		--TURN arm1a to z-axis <59.41> SPEED <60.40>;
		self.Spinners.arm1a:SetGoal(59.4)
		self.Spinners.arm1a:SetSpeed(60)

		--TURN arm2a to z-axis <73.82> SPEED <57.86>;
		self.Spinners.arm2a:SetGoal(74)
		self.Spinners.arm2a:SetSpeed(58)

		--TURN arm3a to z-axis <-73.12> SPEED <55.31>;
		self.Spinners.arm3a:SetGoal(-73)
		self.Spinners.arm3a:SetSpeed(55)

		--TURN arm4a to z-axis <-53.43> SPEED <50.86>;
		self.Spinners.arm4a:SetGoal(-53)
		self.Spinners.arm4a:SetSpeed(51)

		--TURN arm4b to z-axis <-36.20> SPEED <65.49>;
		self.Spinners.arm4b:SetGoal(-36)
		self.Spinners.arm4b:SetSpeed(65)

		--TURN arm3b to z-axis <-74.87> SPEED <81.39>;
		self.Spinners.arm3b:SetGoal(-75)
		self.Spinners.arm3b:SetSpeed(81)

		--TURN arm2b to z-axis <78.39> SPEED <93.47>;
		self.Spinners.arm2b:SetGoal(78)
		self.Spinners.arm2b:SetSpeed(93)

		--TURN arm1b to z-axis <40.42> SPEED <73.12>;
		self.Spinners.arm1b:SetGoal(40)
		self.Spinners.arm1b:SetSpeed(73)


		--SLEEP <553>;
		WaitSeconds(0.6)

		--TURN arm1a to z-axis <76.99> SPEED <31.79>;
		self.Spinners.arm1a:SetGoal(77)
		self.Spinners.arm1a:SetSpeed(32)

		--TURN arm2a to z-axis <86.48> SPEED <22.89>;
		self.Spinners.arm2a:SetGoal(86)
		self.Spinners.arm2a:SetSpeed(23)

		--TURN arm3a to z-axis <-83.67> SPEED <19.07>;
		self.Spinners.arm3a:SetGoal(-84)
		self.Spinners.arm3a:SetSpeed(19)

		--TURN arm4a to z-axis <-75.23> SPEED <39.42>;
		self.Spinners.arm4a:SetGoal(-75)
		self.Spinners.arm4a:SetSpeed(39)

		--TURN arm4b to z-axis <-56.25> SPEED <36.24>;
		self.Spinners.arm4b:SetGoal(-56)
		self.Spinners.arm4b:SetSpeed(36)

		--TURN arm1b to z-axis <68.90> SPEED <51.50>;
		self.Spinners.arm1b:SetGoal(69)
		self.Spinners.arm1b:SetSpeed(51)


		--SLEEP <553>;
		WaitSeconds(0.6)

		--TURN arm1a to z-axis <86.83> SPEED <18.13>;
		self.Spinners.arm1a:SetGoal(87)
		self.Spinners.arm1a:SetSpeed(18)

		--TURN arm4a to z-axis <-86.83> SPEED <21.36>;
		self.Spinners.arm4a:SetGoal(-87)
		self.Spinners.arm4a:SetSpeed(21)

		--TURN arm4b to z-axis <-78.04> SPEED <40.14>;
		self.Spinners.arm4b:SetGoal(-78)
		self.Spinners.arm4b:SetSpeed(40)

		--TURN arm1b to z-axis <77.68> SPEED <16.18>;
		self.Spinners.arm1b:SetGoal(78)
		self.Spinners.arm1b:SetSpeed(16)


		--SLEEP <543>;
		WaitSeconds(0.5)

		--MOVE gangplank to z-axis <2.25> SPEED <4.00>;
        self.Sliders.gangplank:SetGoal(0,0,2.25)
		self.Sliders.gangplank:SetSpeed(4)

		--MOVE arm1a to z-axis <-4.89> SPEED <9.00>;
        self.Spinners.arm1a:SetGoal(78)
		self.Spinners.arm1a:SetSpeed(9)

		--MOVE arm4a to z-axis <-4.90> SPEED <9.00>;
        self.Spinners.arm4a:SetGoal(-78)
		self.Spinners.arm4a:SetSpeed(9)


		--SLEEP <533>;
		WaitSeconds(0.5)

		--MOVE gangplank to z-axis <9.89> SPEED <13.00>;
        self.Sliders.gangplank:SetGoal(0,0,9.89)
		self.Sliders.gangplank:SetSpeed(13)

		--SLEEP <583>;
		--SLEEP <703>;
		WaitSeconds(1.3)

		TAconstructor.Open(self)
	end,

    close_script = [[
		MOVE gangplank to z-axis <2.25> SPEED <38.00>;
		SLEEP <200>;
		MOVE gangplank to z-axis <0> SPEED <11.00>;
		MOVE arm1a to z-axis <0> SPEED <24.00>;
		MOVE arm4a to z-axis <0> SPEED <24.00>;
		SLEEP <200>;
		TURN arm1a to z-axis <76.99> SPEED <49.23>;
		TURN arm4a to z-axis <-75.23> SPEED <58.01>;
		TURN arm4b to z-axis <-56.25> SPEED <109.01>;
		TURN arm1b to z-axis <68.90> SPEED <43.95>;
		SLEEP <200>;
		TURN arm1a to z-axis <59.41> SPEED <87.91>;
		TURN arm2a to z-axis <73.82> SPEED <63.29>;
		TURN arm3a to z-axis <-73.12> SPEED <52.74>;
		TURN arm4a to z-axis <-53.43> SPEED <109.01>;
		TURN arm4b to z-axis <-36.20> SPEED <100.21>;
		TURN arm1b to z-axis <40.42> SPEED <142.41>;
		SLEEP <200>;
		TURN arm1a to z-axis <26.01> SPEED <167.03>;
		TURN arm2a to z-axis <41.83> SPEED <160.00>;
		TURN arm3a to z-axis <-42.53> SPEED <152.96>;
		TURN arm4a to z-axis <-25.31> SPEED <140.65>;
		TURN arm4b to z-axis <0> SPEED <181.09>;
		TURN arm3b to z-axis <-29.88> SPEED <225.05>;
		TURN arm2b to z-axis <26.71> SPEED <258.45>;
		TURN arm1b to z-axis <0> SPEED <202.19>;
		SLEEP <200>;
		TURN arm1a to z-axis <8.08> SPEED <89.66>;
		TURN arm2a to z-axis <20.03> SPEED <109.01>;
		TURN arm3a to z-axis <-19.33> SPEED <116.04>;
		TURN arm4a to z-axis <-11.25> SPEED <70.32>;
		TURN arm3b to z-axis <0> SPEED <149.45>;
		TURN arm2b to z-axis <0> SPEED <133.62>;
		SLEEP <200>;
		TURN arm1a to z-axis <0> SPEED <40.43>;
		TURN arm2a to z-axis <0> SPEED <100.21>;
		TURN arm3a to z-axis <0> SPEED <96.70>;
		TURN arm4a to z-axis <0> SPEED <56.26>;
		SLEEP <200>;
		TURN crane to x-axis <-92.81> SPEED <14.06>;
		SLEEP <200>;
		TURN crane to x-axis <-91.04> SPEED <8.78>;
		SLEEP <200>;
		TURN crane to x-axis <-87.89> SPEED <15.81>;
		SLEEP <200>;
		TURN crane to x-axis <-82.96> SPEED <24.61>;
		SLEEP <200>;
		TURN crane to x-axis <-64.33> SPEED <93.18>;
		SLEEP <200>;
		TURN crane to x-axis <-48.51> SPEED <79.11>;
		SLEEP <200>;
		MOVE clamp3b to y-axis <0> SPEED <25.00>;
		MOVE clamplight3 to x-axis <2.40> SPEED <6.00>;
		MOVE clamp2b to y-axis <0> SPEED <25.00>;
		MOVE clamplight2 to x-axis <-2.05> SPEED <7.00>;
		TURN crane to x-axis <-37.26> SPEED <56.26>;
		TURN clamp3b to z-axis <-36.91> SPEED <184.61>;
		TURN clamp2b to z-axis <39.72> SPEED <198.68>;
		SLEEP <200>;
		MOVE clamp4b to y-axis <0> SPEED <26.00>;
		MOVE clamplight4 to x-axis <2.45> SPEED <6.00>;
		MOVE clamp3b to x-axis <0> SPEED <23.00>;
		MOVE clamplight3 to x-axis <0> SPEED <12.00>;
		MOVE clamp2b to x-axis <0> SPEED <23.00>;
		MOVE clamplight2 to x-axis <0> SPEED <10.00>;
		MOVE clamp1b to y-axis <0> SPEED <26.00>;
		MOVE clamplight1 to x-axis <-2.25> SPEED <6.00>;
		TURN crane to x-axis <-24.95> SPEED <61.53>;
		TURN clamp4b to z-axis <-36.21> SPEED <181.09>;
		TURN clamp3b to z-axis <13.00> SPEED <249.67>;
		TURN clamp2b to z-axis <-13.35> SPEED <265.49>;
		TURN clamp1b to z-axis <39.37> SPEED <196.92>;
		SLEEP <200>;
		MOVE clamp2 to x-axis <13.30> SPEED <8.00>;
		MOVE clamp3 to x-axis <-13.20> SPEED <8.00>;
		MOVE clamp4b to x-axis <0> SPEED <23.00>;
		MOVE clamplight4 to x-axis <0> SPEED <12.00>;
		MOVE clamp1b to x-axis <0> SPEED <22.00>;
		MOVE clamplight1 to x-axis <0> SPEED <11.00>;
		TURN crane to x-axis <-10.18> SPEED <73.84>;
		TURN clamp4b to z-axis <15.81> SPEED <260.21>;
		TURN clamp3b to z-axis <41.12> SPEED <140.65>;
		TURN clamp2b to z-axis <-41.13> SPEED <138.90>;
		TURN clamp1b to z-axis <-14.06> SPEED <267.25>;
		SLEEP <200>;
		MOVE clamp1 to x-axis <13.40> SPEED <7.00>;
		MOVE clamp2 to x-axis <9.05> SPEED <21.00>;
		MOVE clamp3 to x-axis <-8.65> SPEED <22.00>;
		MOVE clamp4 to x-axis <-13.75> SPEED <6.00>;
		TURN crane to x-axis <0> SPEED <50.98>;
		TURN clamp4b to z-axis <41.12> SPEED <126.59>;
		TURN clamp1b to z-axis <-42.53> SPEED <142.41>;
		SLEEP <200>;
		MOVE clamp1 to x-axis <8.79> SPEED <23.00>;
		MOVE clamp2 to x-axis <0> SPEED <45.00>;
		MOVE clamp3 to x-axis <0> SPEED <43.00>;
		MOVE clamp4 to x-axis <-8.34> SPEED <27.00>;
		SLEEP <200>;
		MOVE clamp1 to x-axis <0> SPEED <43.00>;
		MOVE clamp4 to x-axis <0> SPEED <41.00>;
		TURN clamp4b to z-axis <36.56> SPEED <22.85>;
		TURN clamp3b to z-axis <37.26> SPEED <19.33>;
		TURN clamp2b to z-axis <-39.37> SPEED <8.78>;
		TURN clamp1b to z-axis <-39.01> SPEED <17.58>;
		SLEEP <200>;
		TURN clamp4b to z-axis <28.82> SPEED <38.68>;
		TURN clamp3b to z-axis <34.45> SPEED <14.06>;
		TURN clamp2b to z-axis <-32.68> SPEED <33.40>;
		TURN clamp1b to z-axis <-30.93> SPEED <40.43>;
		SLEEP <200>;
		TURN clamp4b to z-axis <0> SPEED <144.17>;
		TURN clamp3b to z-axis <0> SPEED <172.30>;
		TURN clamp2b to z-axis <0> SPEED <163.51>;
		TURN clamp1b to z-axis <0> SPEED <154.72>;
		SLEEP <200>;
		SLEEP <200>; ]],

	Close = function(self)
        TAutils.Cobler(self.close_script, self.Spinners, self.Sliders)
	end,
}

TypeClass = CORGANT