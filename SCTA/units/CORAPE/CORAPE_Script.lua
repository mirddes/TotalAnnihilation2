#CORE Rapier - Gunship
#CORAPE
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORAPE = Class(TAair) {
	currentBarrel = 0,
	currentBarrel2 = 0,

	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Spinners = {
			winga = CreateRotator(self, 'winga', 'z', nil, 0, 0, 0),
			wingb = CreateRotator(self, 'wingb', 'z', nil, 0, 0, 0),
			gun1 = CreateRotator(self, 'gun1', 'z', nil, 0, 0, 0),
			gun2 = CreateRotator(self, 'gun2', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)
		--TURN winga to z-axis <-90.00> SPEED <120.02>;
		self.Spinners.winga:SetGoal(90)
		self.Spinners.winga:SetSpeed(120.02)

		--TURN wingb to z-axis <90.00> SPEED <120.02>;
		self.Spinners.wingb:SetGoal(-90)
		self.Spinners.wingb:SetSpeed(120.02)
	end,

	CloseWings = function(self)
		--TURN winga to z-axis <0> SPEED <120.02>;
		self.Spinners.winga:SetGoal(0)
		self.Spinners.winga:SetSpeed(120.02)

		--TURN wingb to z-axis <0> SPEED <120.02>;
		self.Spinners.wingb:SetGoal(0)
		self.Spinners.wingb:SetSpeed(120.02)
	end,

	Weapons = {
		VTOL_ROCKET = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAair.ShowMuzzleFlare(self, 0.15)

				self.unit.currentBarrel = self.unit.currentBarrel + 1
				if self.unit.currentBarrel == 3 then
					self.unit.currentBarrel = 0
				end

				self.unit.Spinners.gun1:SetGoal(-120 * self.unit.currentBarrel)
				self.unit.Spinners.gun1:SetSpeed(200)
			end,
		},
		VTOL_ROCKET2 = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAair.ShowMuzzleFlare(self, 0.15)

				self.unit.currentBarrel2 = self.unit.currentBarrel2 + 1
				if self.unit.currentBarrel2 == 3 then
					self.unit.currentBarrel2 = 0
				end

				self.unit.Spinners.gun2:SetGoal(-120 * self.unit.currentBarrel2)
				self.unit.Spinners.gun2:SetSpeed(200)
			end,
		},
		AUTO_ATTACK = Class(TAweapon) {},
	},
}

TypeClass = CORAPE