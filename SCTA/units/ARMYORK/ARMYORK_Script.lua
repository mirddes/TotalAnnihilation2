#ARM Phalanx - Mobile Flak Vehicle
#ARMYORK
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMYORK = Class(TAunit) {

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			wheel1 = CreateRotator(self, 'FrontWheels', 'x', nil, 0, 0, 0),
			wheel2 = CreateRotator(self, 'MiddleWheels', 'x', nil, 0, 0, 0),
			wheel3 = CreateRotator(self, 'BackWheels', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		ARMYORK_GUN = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
	},

	OnMotionHorzEventChange = function(self, new, old )
		TAunit.OnMotionHorzEventChange(self, new, old)

		if (new == 'Cruise') then
			self.Spinners.wheel1:SetSpeed(150)
			self.Spinners.wheel2:SetSpeed(150)
			self.Spinners.wheel3:SetSpeed(150)
		elseif (new == 'Stopped') then
			self.Spinners.wheel1:SetSpeed(0)
			self.Spinners.wheel2:SetSpeed(0)
			self.Spinners.wheel3:SetSpeed(0)
		end
	end,
}

TypeClass = ARMYORK
