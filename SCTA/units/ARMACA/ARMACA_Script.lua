#ARM Adv. Construction Aircraft - Tech Level 2
#ARMACA
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMACA = Class(TAconstructor) {

	OnCreate = function(self)
		TAconstructor.OnCreate(self)
		self.Spinners = {
			nozzle = CreateRotator(self, 'Nozzle', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		self.Sliders = {
			wing1 = CreateSlider(self, 'Wing_01'),
			wing2 = CreateSlider(self, 'Wing_02'),
		}
		for k, v in self.Sliders do
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
		--MOVE wing1 to x-axis <5.59> SPEED <5.00>;
		self.Sliders.wing1:SetGoal(-5.59,0,0)
		self.Sliders.wing1:SetSpeed(5)

		--MOVE wing2 to x-axis <-5.65> SPEED <5.00>;
		self.Sliders.wing2:SetGoal(5.65,0,0)
		self.Sliders.wing2:SetSpeed(5)
	end,

	CloseWings = function(self)
		--MOVE wing1 to x-axis <0> SPEED <5.00>;
		self.Sliders.wing1:SetGoal(0,0,0)
		self.Sliders.wing1:SetSpeed(5)

		--MOVE wing2 to x-axis <0> SPEED <5.00>;
		self.Sliders.wing2:SetGoal(0,0,0)
		self.Sliders.wing2:SetSpeed(5)
	end,

	Aim = function(self, target)
		local selfPosition = self:GetPosition('Nozzle') 
		local targetPosition = target:GetPosition()
		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)

		self.Spinners.nozzle:SetGoal(-TAutils.GetAngle(0, targetPosition.y, distance, selfPosition.y))
		self.Spinners.nozzle:SetSpeed(160.03)

		WaitFor(self.Spinners.nozzle)
		TAconstructor.Aim(self, target)
	end,
}

TypeClass = ARMACA