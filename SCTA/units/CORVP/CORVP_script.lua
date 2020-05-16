#CORE Vehicle Plant - Produces Vehicles
#CORVP
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

CORVP = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			layer1a = CreateRotator(self, 'layer1a', 'y', nil, 0, 0, 0),
			layer2a = CreateRotator(self, 'layer2a', 'y', nil, 0, 0, 0),
			layer3a = CreateRotator(self, 'layer3a', 'y', nil, 0, 0, 0),
			layer1b = CreateRotator(self, 'layer1b', 'y', nil, 0, 0, 0),
			layer2b = CreateRotator(self, 'layer2b', 'y', nil, 0, 0, 0),
			layer3b = CreateRotator(self, 'layer3b', 'y', nil, 0, 0, 0),
			layer1c = CreateRotator(self, 'layer1c', 'y', nil, 0, 0, 0),
			layer2c = CreateRotator(self, 'layer2c', 'y', nil, 0, 0, 0),
			layer3c = CreateRotator(self, 'layer3c', 'y', nil, 0, 0, 0),
			arm1 = CreateRotator(self, 'arm1', 'y', nil, 0, 0, 0),
			arm2 = CreateRotator(self, 'arm2', 'y', nil, 0, 0, 0),
			gun1 = CreateRotator(self, 'gun1', 'y', nil, 0, 0, 0),
			gun2 = CreateRotator(self, 'gun2', 'y', nil, 0, 0, 0),
			zgun1 = CreateRotator(self, 'gun1', 'z', nil, 0, 0, 0),
			zgun2 = CreateRotator(self, 'gun2', 'z', nil, 0, 0, 0),
			muzzle1 = CreateRotator(self, 'muzzle1', 'y', 90, 36535, 0, 0),
			muzzle2 = CreateRotator(self, 'muzzle2', 'y', 90, 36535, 0, 0),
			pad = CreateRotator(self, 'pad', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			layer1a = CreateSlider(self, 'layer1a'),
			layer2a = CreateSlider(self, 'layer2a'),
			layer3a = CreateSlider(self, 'layer3a'),
			layer1b = CreateSlider(self, 'layer1b'),
			layer2b = CreateSlider(self, 'layer2b'),
			layer3b = CreateSlider(self, 'layer3b'),
			layer1c = CreateSlider(self, 'layer1c'),
			layer2c = CreateSlider(self, 'layer2c'),
			layer3c = CreateSlider(self, 'layer3c'),
			pad = CreateSlider(self, 'padmove'),
			gun1 = CreateSlider(self, 'gun1'),
			gun2 = CreateSlider(self, 'gun2'),
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

		--TURN layer3a to y-axis <-89.42> SPEED <240.45>;
		self.Spinners.layer3a:SetGoal(-90)
		self.Spinners.layer3a:SetSpeed(240)

		--TURN layer3b to y-axis <-89.88> SPEED <241.68>;
		self.Spinners.layer3b:SetGoal(-90)
		self.Spinners.layer3b:SetSpeed(240)

		--TURN layer3c to y-axis <-89.88> SPEED <241.68>;
		self.Spinners.layer3c:SetGoal(-90)
		self.Spinners.layer3c:SetSpeed(240)

		--SLEEP <372>;
		WaitSeconds(0.35)

		--TURN layer2a to y-axis <90.34> SPEED <228.76>;
		self.Spinners.layer2a:SetGoal(90)
		self.Spinners.layer2a:SetSpeed(230)

		--TURN layer2b to y-axis <90.34> SPEED <228.76>;
		self.Spinners.layer2b:SetGoal(90)
		self.Spinners.layer2b:SetSpeed(230)

		--TURN layer2c to y-axis <90.34> SPEED <228.76>;
		self.Spinners.layer2c:SetGoal(90)
		self.Spinners.layer2c:SetSpeed(230)

		--SLEEP <395>;
		WaitSeconds(0.4)

		--TURN layer1a to y-axis <-89.88> SPEED <228.18>;
		self.Spinners.layer1a:SetGoal(-90)
		self.Spinners.layer1a:SetSpeed(230)

		--TURN layer1b to y-axis <-89.88> SPEED <228.18>;
		self.Spinners.layer1b:SetGoal(-90)
		self.Spinners.layer1b:SetSpeed(230)

		--TURN layer1c to y-axis <-89.88> SPEED <228.18>;
		self.Spinners.layer1c:SetGoal(-90)
		self.Spinners.layer1c:SetSpeed(230)

		--SLEEP <394>;
		WaitSeconds(0.4)

		--TURN layer1a to y-axis <-179.76> SPEED <221.44>;
		self.Spinners.layer1a:SetGoal(-180)
		self.Spinners.layer1a:SetSpeed(220)

		--TURN layer1b to y-axis <-179.30> SPEED <220.31>;
		self.Spinners.layer1b:SetGoal(-180)
		self.Spinners.layer1b:SetSpeed(220)

		--TURN layer1c to y-axis <-179.76> SPEED <221.44>;
		self.Spinners.layer1c:SetGoal(-180)
		self.Spinners.layer1c:SetSpeed(220)

		--SLEEP <406>;
		WaitSeconds(0.4)

		--MOVE layer1b to z-axis <-11.40> SPEED <27.00>;
		self.Sliders.layer1b:SetGoal(0,0,11.4)
		self.Sliders.layer1b:SetSpeed(27)

		--MOVE layer2b to z-axis <-11.45> SPEED <27.00>;
		self.Sliders.layer2b:SetGoal(11.4,0,0)
		self.Sliders.layer2b:SetSpeed(27)

		--MOVE layer3b to z-axis <-11.50> SPEED <27.00>;
		self.Sliders.layer3b:SetGoal(-11.4,0,0)
		self.Sliders.layer3b:SetSpeed(27)

		--SLEEP <421>;
		WaitSeconds(0.4)

		--MOVE layer1a to x-axis <5.35> SPEED <16.00>;
		self.Sliders.layer1a:SetGoal(5.35,0,0)
		self.Sliders.layer1a:SetSpeed(16)

		--MOVE layer1c to x-axis <-5.49> SPEED <17.00>;
		self.Sliders.layer1c:SetGoal(-5.5,0,0)
		self.Sliders.layer1c:SetSpeed(17)

		--MOVE layer2a to x-axis <5.35> SPEED <16.00>;
		self.Sliders.layer2a:SetGoal(0,0,-5.35)
		self.Sliders.layer2a:SetSpeed(16)

		--MOVE layer2c to x-axis <-5.50> SPEED <17.00>;
		self.Sliders.layer2c:SetGoal(0,0,5.5)
		self.Sliders.layer2c:SetSpeed(17)

		--MOVE layer3a to x-axis <5.30> SPEED <16.00>;
		self.Sliders.layer3a:SetGoal(0,0,5.35)
		self.Sliders.layer3a:SetSpeed(16)

		--MOVE layer3c to x-axis <-5.55> SPEED <17.00>;
		self.Sliders.layer3c:SetGoal(0,0,-5.5)
		self.Sliders.layer3c:SetSpeed(17)

		--MOVE pad to z-axis <2.30> SPEED <7.00>;
		self.Sliders.pad:SetGoal(0,0,2.3)
		self.Sliders.pad:SetSpeed(7)

		--SLEEP <323>;
		WaitSeconds(0.3)

		--MOVE gun2 to x-axis <-0.74> SPEED <1.00>;
		self.Sliders.gun2:SetGoal(-0.75,0,0)
		self.Sliders.gun2:SetSpeed(1)

		--MOVE gun1 to x-axis <-0.85> SPEED <1.00>;
		self.Sliders.gun1:SetGoal(-0.75,0,0)
		self.Sliders.gun1:SetSpeed(1)

		--TURN arm1 to y-axis <-90.34> SPEED <187.08>;
		self.Spinners.arm1:SetGoal(-90)
		self.Spinners.arm1:SetSpeed(185)

		--TURN arm2 to y-axis <88.96> SPEED <184.24>;
		self.Spinners.arm2:SetGoal(90)
		self.Spinners.arm2:SetSpeed(185)

		--TURN gun2 to x-axis <-11.00> SPEED <22.79>;
		#self.Spinners.xgun2:SetGoal(-11)
		#self.Spinners.xgun2:SetSpeed(21)

		--TURN gun2 to y-axis <66.95> SPEED <138.65>;
		self.Spinners.gun2:SetGoal(67)
		self.Spinners.gun2:SetSpeed(139)

		--TURN gun2 to z-axis <2.29> SPEED <4.74>;
		self.Spinners.zgun2:SetGoal(-20)
		self.Spinners.zgun2:SetSpeed(4.75)

		--TURN gun1 to x-axis <10.08> SPEED <20.89>;
		#self.Spinners.xgun1:SetGoal(20)
		#self.Spinners.xgun1:SetSpeed(21)

		--TURN gun1 to y-axis <-66.95> SPEED <138.65>;
		self.Spinners.gun1:SetGoal(-67)
		self.Spinners.gun1:SetSpeed(139)

		--TURN gun1 to z-axis <2.29> SPEED <4.74>;
		self.Spinners.zgun1:SetGoal(-20)
		self.Spinners.zgun1:SetSpeed(4.75)

		--SLEEP <483>;
		WaitSeconds(0.6)

		--SLEEP <21>;

		#Needs to be moved
		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)
		TAconstructor.Open(self)
	end,

	Close = function(self)
		#Needs to be moved
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--MOVE gun2 to x-axis <0> SPEED <1.00>;
		self.Sliders.gun2:SetGoal(0,0,0)
		self.Sliders.gun2:SetSpeed(1.5)

		--MOVE gun1 to x-axis <0> SPEED <2.00>;
		self.Sliders.gun1:SetGoal(0,0,0)
		self.Sliders.gun1:SetSpeed(1.5)

		--TURN arm1 to y-axis <0> SPEED <216.70>;
		self.Spinners.arm1:SetGoal(0)
		self.Spinners.arm1:SetSpeed(215)

		--TURN arm2 to y-axis <0> SPEED <213.40>;
		self.Spinners.arm2:SetGoal(0)
		self.Spinners.arm2:SetSpeed(215)

		--TURN gun2 to x-axis <0> SPEED <26.39>;
		#self.Spinners.xgun2:SetGoal(0)
		#self.Spinners.xgun2:SetSpeed(25)

		--TURN gun2 to y-axis <0> SPEED <160.59>;
		self.Spinners.gun2:SetGoal(0)
		self.Spinners.gun2:SetSpeed(160)

		--TURN gun2 to z-axis <0> SPEED <5.50>;
		self.Spinners.zgun2:SetGoal(0)
		self.Spinners.zgun2:SetSpeed(5.5)

		--TURN gun1 to x-axis <0> SPEED <24.19>;
		#self.Spinners.xgun1:SetGoal(0)
		#self.Spinners.xgun1:SetSpeed(25)

		--TURN gun1 to y-axis <0> SPEED <160.59>;
		self.Spinners.gun1:SetGoal(0)
		self.Spinners.gun1:SetSpeed(160)

		--TURN gun1 to z-axis <0> SPEED <5.50>;
		self.Spinners.zgun1:SetGoal(0)
		self.Spinners.zgun1:SetSpeed(5.5)

		--SLEEP <417>;
		WaitSeconds(0.4)

		--MOVE layer1a to x-axis <0> SPEED <16.00>;
		self.Sliders.layer1a:SetGoal(0,0,0)
		self.Sliders.layer1a:SetSpeed(16)

		--MOVE layer1c to x-axis <0> SPEED <17.00>;
		self.Sliders.layer1c:SetGoal(0,0,0)
		self.Sliders.layer1c:SetSpeed(17)

		--MOVE layer2a to x-axis <0> SPEED <16.00>;
		self.Sliders.layer2a:SetGoal(0,0,0)
		self.Sliders.layer2a:SetSpeed(16)

		--MOVE layer2c to x-axis <0> SPEED <17.00>;
		self.Sliders.layer2c:SetGoal(0,0,0)
		self.Sliders.layer2c:SetSpeed(17)

		--MOVE layer3a to x-axis <0> SPEED <16.00>;
		self.Sliders.layer3a:SetGoal(0,0,0)
		self.Sliders.layer3a:SetSpeed(16)

		--MOVE layer3c to x-axis <0> SPEED <17.00>;
		self.Sliders.layer3c:SetGoal(0,0,0)
		self.Sliders.layer3c:SetSpeed(17)

		--MOVE pad to z-axis <0> SPEED <7.00>;
		self.Sliders.pad:SetGoal(0,0,0)
		self.Sliders.pad:SetSpeed(7)

		--SLEEP <321>;
		WaitSeconds(0.3)

		--MOVE layer1b to z-axis <0> SPEED <27.00>;
		self.Sliders.layer1b:SetGoal(0,0,0)
		self.Sliders.layer1b:SetSpeed(27)

		--MOVE layer2b to z-axis <0> SPEED <27.00>;
		self.Sliders.layer2b:SetGoal(0,0,0)
		self.Sliders.layer2b:SetSpeed(27)

		--MOVE layer3b to z-axis <0> SPEED <27.00>;
		self.Sliders.layer3b:SetGoal(0,0,0)
		self.Sliders.layer3b:SetSpeed(27)

		--SLEEP <416>;
		WaitSeconds(0.4)

		--TURN layer1a to y-axis <-89.88> SPEED <216.64>;
		self.Spinners.layer1a:SetGoal(-90)
		self.Spinners.layer1a:SetSpeed(216)

		--TURN layer1b to y-axis <-89.88> SPEED <215.53>;
		self.Spinners.layer1b:SetGoal(-90)
		self.Spinners.layer1b:SetSpeed(216)

		--TURN layer1c to y-axis <-89.88> SPEED <216.64>;
		self.Spinners.layer1c:SetGoal(-90)
		self.Spinners.layer1c:SetSpeed(216)

		--SLEEP <415>;
		WaitSeconds(0.4)

		--TURN layer1a to y-axis <0> SPEED <222.53>;
		self.Spinners.layer1a:SetGoal(0)
		self.Spinners.layer1a:SetSpeed(222)

		--TURN layer1b to y-axis <0> SPEED <222.53>;
		self.Spinners.layer1b:SetGoal(0)
		self.Spinners.layer1b:SetSpeed(222)

		--TURN layer1c to y-axis <0> SPEED <222.53>;
		self.Spinners.layer1c:SetGoal(0)
		self.Spinners.layer1c:SetSpeed(222)

		--SLEEP <404>;
		WaitSeconds(0.4)

		--TURN layer2a to y-axis <0> SPEED <212.12>;
		self.Spinners.layer2a:SetGoal(0)
		self.Spinners.layer2a:SetSpeed(212)

		--TURN layer2b to y-axis <0> SPEED <212.12>;
		self.Spinners.layer2b:SetGoal(0)
		self.Spinners.layer2b:SetSpeed(212)

		--TURN layer2c to y-axis <0> SPEED <212.12>;
		self.Spinners.layer2c:SetGoal(0)
		self.Spinners.layer2c:SetSpeed(212)

		--SLEEP <426>;
		WaitSeconds(0.4)

		--TURN layer3a to y-axis <0> SPEED <225.30>;
		self.Spinners.layer3a:SetGoal(0)
		self.Spinners.layer3a:SetSpeed(226)

		--TURN layer3b to y-axis <0> SPEED <226.46>;
		self.Spinners.layer3b:SetGoal(0)
		self.Spinners.layer3b:SetSpeed(226)

		--TURN layer3c to y-axis <0> SPEED <226.46>;
		self.Spinners.layer3c:SetGoal(0)
		self.Spinners.layer3c:SetSpeed(226)

		--SLEEP <397>;
		WaitSeconds(0.4)

		--SLEEP <12>;

		TAconstructor.Close(self)
	end,
}

TypeClass = CORVP