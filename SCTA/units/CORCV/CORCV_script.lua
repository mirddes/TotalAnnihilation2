#CORE Construction Vehicle - Tech Level 1
#CORCV
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORCV = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
			door1 = CreateRotator(self, 'door1', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'door2', 'z', nil, 0, 0, 0),
			gun = CreateRotator(self, 'gun', 'x', nil, 0, 0, 0),
			turret = CreateRotator(self, 'turret', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			stand = CreateSlider(self, 'stand'),
			gun = CreateSlider(self, 'gun'),
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

		--TURN door1 to z-axis <-94.98> SPEED <190.79>;
		self.Spinners.door1:SetGoal(95)
		self.Spinners.door1:SetSpeed(190)

		--TURN door2 to z-axis <94.98> SPEED <190.79>;
		self.Spinners.door2:SetGoal(-95)
		self.Spinners.door2:SetSpeed(190)

		--SLEEP <498>;
		WaitSeconds(0.5)

		--TURN door1 to z-axis <-191.55> SPEED <193.93>;
		self.Spinners.door1:SetGoal(192)
		self.Spinners.door1:SetSpeed(195)

		--TURN door2 to z-axis <192.76> SPEED <196.38>;
		self.Spinners.door2:SetGoal(-192)
		self.Spinners.door2:SetSpeed(195)

		--SLEEP <498>;
		WaitSeconds(0.5)

		--MOVE stand to y-axis <3.05> SPEED <5.00>;
		self.Sliders.stand:SetGoal(0,3.05,0)
		self.Sliders.stand:SetSpeed(5)

		--MOVE gun to y-axis <0.70> SPEED <1.00>;
		self.Sliders.gun:SetGoal(0,0.70,0)
		self.Sliders.gun:SetSpeed(1)

		--SLEEP <581>;
		WaitSeconds(0.6)

		--SLEEP <19>;		
		TAconstructor.Open(self)
	end,

	Aim = function(self, target)
		local selfPosition = self:GetPosition('turret') 
		local targetPosition = target:GetPosition()
			
		--TURN turret to y-axis buildheading SPEED <160.03>;
		self.Spinners.turret:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('gun') 

		self.Spinners.gun:SetGoal(270 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.gun:SetSpeed(160.03)
		WaitFor(self.Spinners.gun)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
		self.Spinners.gun:SetGoal(0)
		self.Spinners.gun:SetSpeed(160.03)
		WaitFor(self.Spinners.gun)

		self.Spinners.turret:SetGoal(0)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		--MOVE stand to y-axis <0> SPEED <5.00>;
		self.Sliders.stand:SetGoal(0,0,0)
		self.Sliders.stand:SetSpeed(5)

		--MOVE gun to y-axis <0> SPEED <1.00>;
		self.Sliders.gun:SetGoal(0,0,0)
		self.Sliders.gun:SetSpeed(1)

		--SLEEP <584>;
		WaitSeconds(0.6)

		--TURN door1 to z-axis <-95.58> SPEED <192.75>;
		self.Spinners.door1:SetGoal(95)
		self.Spinners.door1:SetSpeed(193)

		--TURN door2 to z-axis <95.82> SPEED <194.70>;
		self.Spinners.door2:SetGoal(-95)
		self.Spinners.door2:SetSpeed(193)

		--SLEEP <498>;
		WaitSeconds(0.5)

		--TURN door1 to z-axis <0> SPEED <191.98>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(192)

		--TURN door2 to z-axis <0> SPEED <192.47>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(192)

		--SLEEP <498>;
		WaitSeconds(0.5)

		--SLEEP <9>
		TAconstructor.Close(self)
	end,
}
TypeClass = CORCV