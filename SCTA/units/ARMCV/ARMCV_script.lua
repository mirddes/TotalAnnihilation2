#ARM Construction Vehicle - Tech Level 1
#ARMCV
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMCV = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
			door1 = CreateRotator(self, 'Door_01', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'Door_02', 'z', nil, 0, 0, 0),
			arm = CreateRotator(self, 'Turret_Arm', 'x', nil, 0, 0, 0),
			nano = CreateRotator(self, 'Turret_Hinge', 'x', nil, 0, 0, 0),
			turret = CreateRotator(self, 'Turret', 'y', nil, 0, 0, 0),
			turretBarrel = CreateRotator(self, 'Turret_Barrel', 'x', nil, 0, 0, 0),
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
		self.Spinners.door1:SetGoal(-70)
		self.Spinners.door1:SetSpeed(182.13)

		--TURN door2 to z-axis <70.64> SPEED <182.13>;
		self.Spinners.door2:SetGoal(70)
		self.Spinners.door2:SetSpeed(182.13)

		--SLEEP <388>;
		WaitSeconds(0.4)

		--MOVE door1 to y-axis <-2.35> SPEED <6.00>;
		self.Sliders.door1:SetGoal(2.25,0,0)
		self.Sliders.door1:SetSpeed(6)

		--MOVE door2 to y-axis <-2.25> SPEED <5.00>;
		self.Sliders.door2:SetGoal(-2.25,0,0)
		self.Sliders.door2:SetSpeed(6)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--MOVE plate to y-axis <4.45> SPEED <11.00>;
		self.Sliders.plate:SetGoal(0,4.45,0)
		self.Sliders.plate:SetSpeed(11)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--TURN arm to x-axis <90.00> SPEED <230.82>;
		self.Spinners.arm:SetGoal(90)
		self.Spinners.arm:SetSpeed(230.82)

		--TURN nano to x-axis <-66.14> SPEED <169.65>;
		self.Spinners.nano:SetGoal(-66.14)
		self.Spinners.nano:SetSpeed(169.65)

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
		selfPosition = self:GetPosition('Turret_Muzzle') 

		self.Spinners.nano:SetGoal(TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y) + 180)
		self.Spinners.nano:SetSpeed(160.03)
		WaitFor(self.Spinners.nano)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)

		self.Spinners.turret:SetGoal(0)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		--TURN arm to x-axis <0> SPEED <232.01>;
		self.Spinners.arm:SetGoal(0)
		self.Spinners.arm:SetSpeed(232.01)

		--TURN nano to x-axis <0> SPEED <170.52>;
		self.Spinners.nano:SetGoal(0)
		self.Spinners.nano:SetSpeed(170.52)

		--SLEEP <388>;
		WaitSeconds(0.4)

		--MOVE plate to y-axis <0> SPEED <11.00>;
		self.Sliders.plate:SetGoal(0,0,0)
		self.Sliders.plate:SetSpeed(11)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--MOVE door1 to y-axis <0> SPEED <6.00>;
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(6)

		--MOVE door2 to y-axis <0> SPEED <5.00>;
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(6)

		--SLEEP <389>;
		WaitSeconds(0.4)

		--TURN door1 to z-axis <0> SPEED <181.19>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(181.19)

		--TURN door2 to z-axis <0> SPEED <181.19>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(181.19)

		--SLEEP <390>
		WaitSeconds(0.4)

		--SLEEP <20>

		TAconstructor.Close(self)
	end,
}
TypeClass = ARMCV
