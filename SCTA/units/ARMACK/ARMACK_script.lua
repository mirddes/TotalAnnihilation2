#ARM Adv. Construction Kbot - Tech Level 2
#ARMACK
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMACK = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
			guncase = CreateRotator(self, 'Case', 'x', nil, 0, 0, 0),
			nanojoint = CreateRotator(self, 'Joint', 'x', nil, 0, 0, 0),
			nanoarm = CreateRotator(self, 'Arms', 'x', nil, 0, 0, 0),
			torso = CreateRotator(self, 'Torso', 'y', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,

	Open = function(self)

		--TURN guncase to x-axis <-68.10> SPEED <90.82>;
		self.Spinners.guncase:SetGoal(-68.10)
		self.Spinners.guncase:SetSpeed(90)

		--TURN nanojoint to x-axis <-4.21> SPEED <5.62>;
		self.Spinners.nanojoint:SetGoal(-4.21)
		self.Spinners.nanojoint:SetSpeed(5.62)

		--SLEEP <750>;
		WaitSeconds(0.75)

		--TURN nanoarm to x-axis <-52.73> SPEED <69.58>;
		self.Spinners.nanoarm:SetGoal(-52.73)
		self.Spinners.nanoarm:SetSpeed(69.58)

		--TURN nanojoint to x-axis <43.93> SPEED <63.55>;
		self.Spinners.nanojoint:SetGoal(43.93)
		self.Spinners.nanojoint:SetSpeed(63.55)

		--SLEEP <758>;
		WaitSeconds(0.75)

		--TURN nanoarm to x-axis <-87.53> SPEED <45.92>;
		self.Spinners.nanoarm:SetGoal(-87.53)
		self.Spinners.nanoarm:SetSpeed(45.92)

		--TURN nanojoint to x-axis <157.50> SPEED <149.84>;
		self.Spinners.nanojoint:SetGoal(157.50)
		self.Spinners.nanojoint:SetSpeed(149.84)

		--SLEEP <758>;
		WaitSeconds(0.75)

		--SLEEP <30>;

		TAconstructor.Open(self)
	end,

	Aim = function(self, target)
		local selfPosition = self:GetPosition('Torso') 
		local targetPosition = target:GetPosition()
			
		--TURN torso to y-axis buildheading SPEED <160.03>;
		self.Spinners.torso:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.torso:SetSpeed(160.03)
		WaitFor(self.Spinners.torso)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('Joint') 

		self.Spinners.nanojoint:SetGoal(159.97 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y) - 90)
		self.Spinners.nanojoint:SetSpeed(45.01)

		WaitFor(self.Spinners.nanojoint)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
		self.Spinners.torso:SetGoal(0)
		self.Spinners.torso:SetSpeed(160.03)

		--TURN nanoarm to x-axis <0> SPEED <116.58>;
		self.Spinners.nanoarm:SetGoal(0)
		self.Spinners.nanoarm:SetSpeed(116.58)

		--TURN nanojoint to x-axis <0> SPEED <209.76>;
		self.Spinners.nanojoint:SetGoal(0)
		self.Spinners.nanojoint:SetSpeed(209.76)

		--SLEEP <751>;
		WaitSeconds(0.75)

		--TURN guncase to x-axis <0.9> SPEED <89.99>;
		self.Spinners.guncase:SetGoal(0)
		self.Spinners.guncase:SetSpeed(90)

		--SLEEP <758>;
		WaitSeconds(0.75)

		--SLEEP <40>;

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMACK