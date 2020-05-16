#CORE Adv. Aircraft Plant - Produces Aircraft
#CORAAP
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORAAP = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			dish = CreateRotator(self, 'dish', 'y', nil, 0, 0, 0),
			pad = CreateRotator(self, 'pad', 'y', nil, 0, 0, 0),
			block1 = CreateRotator(self, 'block1', 'z', nil, 0, 0, 0),
			block2 = CreateRotator(self, 'block2', 'z', nil, 0, 0, 0),
			gun1 = CreateRotator(self, 'gun1', 'x', nil, 0, 0, 0),
			gun2 = CreateRotator(self, 'gun2', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			head1 = CreateSlider(self, 'head1'),
			head2 = CreateSlider(self, 'head2'),
			pedistal = CreateSlider(self, 'pedistal'),
			sleeve1 = CreateSlider(self, 'sleeve1'),
			sleeve2 = CreateSlider(self, 'sleeve2'),
			bump1 = CreateSlider(self, 'bump1'),
			bump2 = CreateSlider(self, 'bump2'),
			conduit1 = CreateSlider(self, 'conduit1'),
			conduit2 = CreateSlider(self, 'conduit2'),
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
		self.Spinners.dish:SetSpeed(150)
	end,

	Open = function(self)
		--MOVE head1 to x-axis <0.79> SPEED <1.00>;
		#self.Sliders.head1:SetGoal(0.79,0,0)
		#self.Sliders.head1:SetSpeed(1)

		--TURN block1 to z-axis <-90.22> SPEED <113.95>;
		self.Spinners.block1:SetGoal(90)
		self.Spinners.block1:SetSpeed(114)

		--TURN block2 to z-axis <90.22> SPEED <113.95>;
		self.Spinners.block2:SetGoal(-90)
		self.Spinners.block2:SetSpeed(114)

		--SLEEP <792>;
		WaitSeconds(0.8)

		--TURN block1 to z-axis <-180.22> SPEED <360.08>;
		self.Spinners.block1:SetGoal(180)
		self.Spinners.block1:SetSpeed(360)

		--TURN block2 to z-axis <180.22> SPEED <360.08>;
		self.Spinners.block2:SetGoal(-180)
		self.Spinners.block2:SetSpeed(360)

		--SLEEP <250>;
		WaitSeconds(0.3)

		--MOVE pedistal to y-axis <5.00> SPEED <20.00>;
		self.Sliders.pedistal:SetGoal(0,5,0)
		self.Sliders.pedistal:SetSpeed(20)

		--SLEEP <250>;
		WaitSeconds(0.3)

		--MOVE sleeve1 to x-axis <3.69> SPEED <12.00>;
		self.Sliders.sleeve1:SetGoal(-3.69,0,0)
		self.Sliders.sleeve1:SetSpeed(12)

		--MOVE sleeve2 to x-axis <-3.64> SPEED <11.00>;
		self.Sliders.sleeve2:SetGoal(3.69,0,0)
		self.Sliders.sleeve2:SetSpeed(12)

		--MOVE head2 to y-axis <-2.85> SPEED <9.00>;
		self.Sliders.head2:SetGoal(0,-2.85,0)
		self.Sliders.head2:SetSpeed(9)

		--MOVE head1 to y-axis <-2.85> SPEED <9.00>;
		self.Sliders.head1:SetGoal(0,-2.85,0)
		self.Sliders.head1:SetSpeed(9)

		--SLEEP <307>;
		WaitSeconds(0.3)

		--MOVE bump2 to x-axis <2.40> SPEED <6.00>;
		--MOVE bump2 to y-axis <0.40> SPEED <1.00>;
		self.Sliders.bump2:SetGoal(-2.4,0.4,0)
		self.Sliders.bump2:SetSpeed(6)

		--MOVE conduit2 to x-axis <-3.74> SPEED <10.00>;
		self.Sliders.conduit2:SetGoal(3.7,0,0)
		self.Sliders.conduit2:SetSpeed(10)

		--MOVE bump1 to x-axis <-2.40> SPEED <6.00>;
		--MOVE bump1 to y-axis <0.40> SPEED <1.00>;
		self.Sliders.bump1:SetGoal(2.4,0.4,0)
		self.Sliders.bump1:SetSpeed(6)

		--MOVE conduit1 to x-axis <3.69> SPEED <10.00>;
		self.Sliders.conduit1:SetGoal(-3.7,0,0)
		self.Sliders.conduit1:SetSpeed(10)

		--SLEEP <360>;
		WaitSeconds(0.4)

		--TURN gun2 to x-axis <179.76> SPEED <241.68>;
		self.Spinners.gun2:SetGoal(180)
		self.Spinners.gun2:SetSpeed(242)

		--TURN gun1 to x-axis <179.76> SPEED <241.68>;
		self.Spinners.gun1:SetGoal(180)
		self.Spinners.gun1:SetSpeed(242)

		--SLEEP <744>;
		--SLEEP <8>;
		WaitSeconds(0.8)

		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Close = function(self)
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--TURN gun2 to x-axis <0> SPEED <337.99>;
		self.Spinners.gun2:SetGoal(0)
		self.Spinners.gun2:SetSpeed(338)

		--TURN gun1 to x-axis <0> SPEED <337.99>;
		self.Spinners.gun1:SetGoal(0)
		self.Spinners.gun1:SetSpeed(338)

		--SLEEP <532>;
		WaitSeconds(0.5)

		--MOVE bump2 to x-axis <0> SPEED <6.00>;
		--MOVE bump2 to y-axis <0> SPEED <1.00>;
		self.Sliders.bump2:SetGoal(0,0,0)
		self.Sliders.bump2:SetSpeed(6)

		--MOVE conduit2 to x-axis <0> SPEED <9.00>;
		self.Sliders.conduit2:SetGoal(0,0,0)
		self.Sliders.conduit2:SetSpeed(9)

		--MOVE bump1 to x-axis <0> SPEED <6.00>;
		--MOVE bump1 to y-axis <0> SPEED <1.00>;
		self.Sliders.bump1:SetGoal(0,0,0)
		self.Sliders.bump1:SetSpeed(6)

		--MOVE conduit1 to x-axis <0> SPEED <9.00>;
		self.Sliders.conduit1:SetGoal(0,0,0)
		self.Sliders.conduit1:SetSpeed(9)

		--SLEEP <388>;
		WaitSeconds(0.4)

		--MOVE sleeve1 to x-axis <0> SPEED <9.00>;
		self.Sliders.sleeve1:SetGoal(0,0,0)
		self.Sliders.sleeve1:SetSpeed(9)

		--MOVE sleeve2 to x-axis <0> SPEED <9.00>;
		self.Sliders.sleeve2:SetGoal(0,0,0)
		self.Sliders.sleeve2:SetSpeed(9)

		--MOVE head2 to y-axis <0> SPEED <7.00>;
		self.Sliders.head2:SetGoal(0,0,0)
		self.Sliders.head2:SetSpeed(7)

		--MOVE head1 to y-axis <0> SPEED <7.00>;
		self.Sliders.head1:SetGoal(0,0,0)
		self.Sliders.head1:SetSpeed(7)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--MOVE pedistal to y-axis <0> SPEED <8.00>;
		self.Sliders.pedistal:SetGoal(0,0,0)
		self.Sliders.pedistal:SetSpeed(8)

		--SLEEP <595>;
		WaitSeconds(0.6)

		--TURN block1 to z-axis <-90.22> SPEED <223.93>;
		self.Spinners.block1:SetGoal(90)
		self.Spinners.block1:SetSpeed(224)

		--TURN block2 to z-axis <90.22> SPEED <223.93>;
		self.Spinners.block2:SetGoal(-90)
		self.Spinners.block2:SetSpeed(224)

		--SLEEP <402>;
		WaitSeconds(0.4)

		--MOVE head2 to x-axis <0> SPEED <1.00>;
		self.Sliders.head2:SetGoal(0,0,0)
		self.Sliders.head2:SetSpeed(1)

		--MOVE head1 to x-axis <0> SPEED <1.00>;
		self.Sliders.head1:SetGoal(0,0,0)
		self.Sliders.head1:SetSpeed(1)

		--TURN block1 to z-axis <0> SPEED <224.50>;
		self.Spinners.block1:SetGoal(0)
		self.Spinners.block1:SetSpeed(224)

		--TURN block2 to z-axis <0> SPEED <224.50>;
		self.Spinners.block2:SetGoal(0)
		self.Spinners.block2:SetSpeed(224)

		--SLEEP <402>;
		--SLEEP <13>;
		WaitSeconds(0.4)

		TAconstructor.Close(self)
	end,
}

TypeClass = CORAAP