#ARM Eagle - Radar Plane
#ARMAWAC
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair

ARMAWAC = Class(TAair) {

	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Spinners = {
			radar = CreateRotator(self, 'radar', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			Rwing = CreateSlider(self, 'Rwing'),
			Lwing = CreateSlider(self, 'Lwing'),
		}
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAair.OnStopBeingBuilt(self,builder,layer)
		self.Spinners.radar:SetSpeed(90)
	end,

	OpenWings = function(self)

		--MOVE Rwing to x-axis <4.45> SPEED <3.00>;
		self.Sliders.Rwing:SetGoal(-4.45,0,0)
		self.Sliders.Rwing:SetSpeed(3)

		--MOVE Lwing to x-axis <-4.45> SPEED <3.00>;
		self.Sliders.Lwing:SetGoal(4.45,0,0)
		self.Sliders.Lwing:SetSpeed(3)

	end,

	CloseWings = function(self)

		--MOVE Rwing to x-axis <0> SPEED <3.00>;
		self.Sliders.Rwing:SetGoal(0,0,0)
		self.Sliders.Rwing:SetSpeed(3)

		--MOVE Lwing to x-axis <0> SPEED <3.00>;
		self.Sliders.Lwing:SetGoal(0,0,0)
		self.Sliders.Lwing:SetSpeed(3)
	end,
}

TypeClass = ARMAWAC