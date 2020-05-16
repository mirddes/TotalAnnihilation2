#ARM Construction Ship - Tech Level 1
#ARMCS
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMCS = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
			door1 = CreateRotator(self, 'Door_01', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'Door_02', 'z', nil, 0, 0, 0),
			arm = CreateRotator(self, 'Arm', 'x', nil, 0, 0, 0),
			nano = CreateRotator(self, 'Build_Nozzle', 'x', nil, 0, 0, 0),
			turret = CreateRotator(self, 'Turret', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			plate = CreateSlider(self, 'Plate'),
			door1 = CreateSlider(self, 'Door_01'),
			door2 = CreateSlider(self, 'Door_02'),
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

		--TURN door1 to z-axis <-70.64> SPEED <182.13>;
		self.Spinners.door1:SetGoal(70)
		self.Spinners.door1:SetSpeed(183)

		--TURN door2 to z-axis <71.54> SPEED <184.45>;
		self.Spinners.door2:SetGoal(-70)
		self.Spinners.door2:SetSpeed(183)

		--SLEEP <388>;
		WaitSeconds(0.4)

		--MOVE door1 to y-axis <-3.55> SPEED <9.00>;
		self.Sliders.door1:SetGoal(-3.55,-1.25,0)
		self.Sliders.door1:SetSpeed(9)

		--MOVE door2 to y-axis <-3.55> SPEED <9.00>;
		self.Sliders.door2:SetGoal(3.55,-1.25,0)
		self.Sliders.door2:SetSpeed(9)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--MOVE plate to y-axis <3.70> SPEED <9.00>;
		self.Sliders.plate:SetGoal(0,3.7,0)
		self.Sliders.plate:SetSpeed(9)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--TURN arm to x-axis <89.54> SPEED <229.67>;
		self.Spinners.arm:SetGoal(90)
		self.Spinners.arm:SetSpeed(229.67)

		--TURN nano to x-axis <-69.74> SPEED <178.88>;
		self.Spinners.nano:SetGoal(-69.74)
		self.Spinners.nano:SetSpeed(178.88)

		--SLEEP <390>;
		WaitSeconds(0.4)

		--SLEEP <20>;

		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		local selfPosition = self:GetPosition('Turret') 
		local targetPosition = target:GetPosition()
			
		--TURN turret to y-axis buildheading SPEED <160.03>;
		self.Spinners.turret:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('Build_Muzzle') 

		self.Spinners.nano:SetGoal(-180 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.nano:SetSpeed(160.03)
		WaitFor(self.Spinners.nano)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
		self.Spinners.turret:SetGoal(0)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		--TURN arm to x-axis <0> SPEED <230.85>;
		self.Spinners.arm:SetGoal(0)
		self.Spinners.arm:SetSpeed(230.85)

		--TURN nano to x-axis <0> SPEED <179.80>;
		self.Spinners.nano:SetGoal(0)
		self.Spinners.nano:SetSpeed(179.80)

		--SLEEP <388>;
		WaitSeconds(0.4)

		--MOVE plate to y-axis <0> SPEED <9.00>;
		self.Sliders.plate:SetGoal(0,0,0)
		self.Sliders.plate:SetSpeed(9)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--MOVE door1 to y-axis <0> SPEED <9.00>;
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(9)

		--MOVE door2 to y-axis <0> SPEED <9.00>;
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(9)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--TURN door1 to z-axis <0> SPEED <181.19>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(181.19)

		--TURN door2 to z-axis <0> SPEED <183.50>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(181.19)

		--SLEEP <390>
		WaitSeconds(0.4)

		--SLEEP <20>

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMCS