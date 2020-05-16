#CORE Adv. Construction Aircraft - Tech Level 2
#CORACA
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORACA = Class(TAconstructor) {

	OnCreate = function(self)
		TAconstructor.OnCreate(self)
		self.Spinners = {
			nozzle = CreateRotator(self, 'nozzle', 'x', nil, 0, 0, 0),
			wing1 = CreateRotator(self, 'wing1', 'z', nil, 0, 0, 0),
			wing2 = CreateRotator(self, 'wing2', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OnMotionVertEventChange = function(self, new, old )
		if (new == 'Down' or new == 'Bottom') then
                	self:PlayUnitSound('Landing')
			self:CloseWings(self)
		elseif (new == 'Up' or new == 'Top') then
                	self:PlayUnitSound('TakeOff')
			self:OpenWings(self)
		end
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAconstructor.OnStopBeingBuilt(self,builder,layer)
		self:OpenWings(self)
	end,

	OpenWings = function(self)
		--TURN wing1 to z-axis <-90.00> SPEED <60.57>;
		self.Spinners.wing1:SetGoal(90)
		self.Spinners.wing1:SetSpeed(60)

		--TURN wing2 to z-axis <90.00> SPEED <60.57>;
		self.Spinners.wing2:SetGoal(-90)
		self.Spinners.wing2:SetSpeed(60)
	end,

	CloseWings = function(self)
		--TURN wing1 to z-axis <0> SPEED <60.21>;
		self.Spinners.wing1:SetGoal(0)
		self.Spinners.wing1:SetSpeed(60)

		--TURN wing2 to z-axis <0> SPEED <60.21>;
		self.Spinners.wing2:SetGoal(0)
		self.Spinners.wing2:SetSpeed(60)
	end,

	Aim = function(self, target)
		local selfPosition = self:GetPosition('nozzle') 
		local targetPosition = target:GetPosition()
		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)

		self.Spinners.nozzle:SetGoal(-TAutils.GetAngle(0, targetPosition.y, distance, selfPosition.y))
		self.Spinners.nozzle:SetSpeed(160.03)

		WaitFor(self.Spinners.nozzle)
		TAconstructor.Aim(self, target)
	end,
}

TypeClass = CORACA