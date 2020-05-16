#CORE Construction Aircraft - Tech Level 1
#CORCA
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORCA = Class(TAconstructor) {

	OnCreate = function(self)
		TAconstructor.OnCreate(self)
		self.Spinners = {
			nozzle = CreateRotator(self, 'nozzle', 'x', nil, 0, 0, 0),
			winga = CreateRotator(self, 'winga', 'z', nil, 0, 0, 0),
			wingb = CreateRotator(self, 'wingb', 'z', nil, 0, 0, 0),
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
		--TURN winga to z-axis <-90.12> SPEED <61.86>;
		self.Spinners.winga:SetGoal(90)
		self.Spinners.winga:SetSpeed(61)

		--TURN wingb to z-axis <90.12> SPEED <61.86>;
		self.Spinners.wingb:SetGoal(-90)
		self.Spinners.wingb:SetSpeed(61)
	end,

	CloseWings = function(self)
		--TURN winga to z-axis <0> SPEED <61.95>;
		self.Spinners.winga:SetGoal(0)
		self.Spinners.winga:SetSpeed(61)

		--TURN wingb to z-axis <0> SPEED <61.95>;
		self.Spinners.wingb:SetGoal(0)
		self.Spinners.wingb:SetSpeed(61)
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

TypeClass = CORCA