#CORE Construction Ship - Tech Level 1
#CORCS
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORCS = Class(TAconstructor) {

	OnCreate = function(self)

		self.Spinners = {
			door1 = CreateRotator(self, 'door1', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'door2', 'z', nil, 0, 0, 0),
			fork = CreateRotator(self, 'fork', 'x', nil, 0, 0, 0),
			gun = CreateRotator(self, 'gun', 'x', nil, 0, 0, 0),
			turret = CreateRotator(self, 'turret', 'y', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,

	Open = function(self)
		--TURN door1 to z-axis <-95.09> SPEED <123.36>;
		self.Spinners.door1:SetGoal(95)
		self.Spinners.door1:SetSpeed(123)

		--TURN door2 to z-axis <95.05> SPEED <123.32>;
		self.Spinners.door2:SetGoal(-95)
		self.Spinners.door2:SetSpeed(123)

		--SLEEP <771>;
		WaitSeconds(0.8)

		--TURN door1 to z-axis <-190.01> SPEED <157.19>;
		self.Spinners.door1:SetGoal(190)
		self.Spinners.door1:SetSpeed(157)

		--TURN door2 to z-axis <189.98> SPEED <157.19>;
		self.Spinners.door2:SetGoal(-157)
		self.Spinners.door2:SetSpeed(190)

		--SLEEP <604>;
		WaitSeconds(0.6)

		--TURN fork to x-axis <77.22> SPEED <127.89>;
		self.Spinners.fork:SetGoal(77)
		self.Spinners.fork:SetSpeed(128)

		--TURN gun to x-axis <-71.14> SPEED <117.82>;
		self.Spinners.gun:SetGoal(-71)
		self.Spinners.gun:SetSpeed(117)

		--SLEEP <604>;
		WaitSeconds(0.6)

		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		local selfPosition = self:GetPosition('turret') 
		local targetPosition = target:GetPosition()
			
		--TURN turret to y-axis buildheading SPEED <160.03>;
		self.Spinners.turret:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('gun') 

		self.Spinners.gun:SetGoal(-180 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.gun:SetSpeed(160.03)
		WaitFor(self.Spinners.gun)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
		self.Spinners.turret:SetGoal(0)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		self.Spinners.gun:SetGoal(0)
		self.Spinners.gun:SetSpeed(160.03)
		WaitFor(self.Spinners.gun)

		--TURN fork to x-axis <0> SPEED <70.22>;
		self.Spinners.fork:SetGoal(0)
		self.Spinners.fork:SetSpeed(70)

		--TURN gun to x-axis <0> SPEED <64.69>;
		self.Spinners.gun:SetGoal(0)
		self.Spinners.gun:SetSpeed(65)

		--SLEEP <1100>;
		WaitSeconds(1.1)

		--TURN door1 to z-axis <-95.09> SPEED <209.12>;
		self.Spinners.door1:SetGoal(95)
		self.Spinners.door1:SetSpeed(209)

		--TURN door2 to z-axis <95.05> SPEED <209.12>;
		self.Spinners.door2:SetGoal(-95)
		self.Spinners.door2:SetSpeed(209)

		--SLEEP <454>;
		WaitSeconds(0.4)

		--TURN door1 to z-axis <0> SPEED <209.50>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(209)

		--TURN door2 to z-axis <0> SPEED <209.43>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(209)

		--SLEEP <454>;
		WaitSeconds(0.4)

		TAconstructor.Close(self)
	end,
}

TypeClass = CORCS