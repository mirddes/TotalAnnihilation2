#ARM Protector - Anti Missile Defense System
#ARMAMD
#
#Script created by Raevn

local TAnoassistbuild = import('/mods/SCTA/lua/TAnoassistbuild.lua').TAnoassistbuild
local DefaultWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMAMD = Class(TAnoassistbuild) {

	OnCreate = function(self)
		TAnoassistbuild.OnCreate(self)
		self.Spinners = {
			door1 = CreateRotator(self, 'Door_01', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'Door_02', 'z', nil, 0, 0, 0),
			door3 = CreateRotator(self, 'Door_03', 'x', nil, 0, 0, 0),
			door4 = CreateRotator(self, 'Door_04', 'x', nil, 0, 0, 0),
			turret = CreateRotator(self, 'Turret', 'y', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		AMD_ROCKET = Class(TAweapon) {

			currentRound = 1,

			PlayFxWeaponUnpackSequence = function(self)
                            TAweapon.PlayFxWeaponUnpackSequence(self)

			    self.currentRound = 1
			    self.unit:ShowBone('Rocket_01', true)
			    self.unit:ShowBone('Rocket_02', true)
			    self.unit:ShowBone('Rocket_03', true)
			    if self.unit:GetTacticalSiloAmmoCount() < 3 then
			        self.unit:HideBone('Rocket_02', true)
                            end
			    if self.unit:GetTacticalSiloAmmoCount() < 2 then
				self.unit:HideBone('Rocket_01', true)
			    end
			    if self.unit:GetTacticalSiloAmmoCount() < 1 then
			    	self.unit:HideBone('Rocket_03', true)
			    end


			    --TURN door1 to z-axis <-129.59> SPEED <73.31>;
			    self.unit.Spinners.door1:SetGoal(129.59)
			    self.unit.Spinners.door1:SetSpeed(73.31)

			    --TURN door2 to z-axis <131.39> SPEED <74.33>;
			    self.unit.Spinners.door2:SetGoal(-129.59)
			    self.unit.Spinners.door2:SetSpeed(73.31)

			    --TURN door3 to x-axis <-128.69> SPEED <72.80>;
			    self.unit.Spinners.door3:SetGoal(-129.59)
			    self.unit.Spinners.door3:SetSpeed(73.31)

			    --TURN door4 to x-axis <129.59> SPEED <73.31>;
			    self.unit.Spinners.door4:SetGoal(129.59)
			    self.unit.Spinners.door4:SetSpeed(73.31)

			    --SLEEP <1768>;
			    --SLEEP <3>;
			    #WaitSeconds(1.75)
                	    #ChangeState(self, self.RackSalvoFireReadyState)

                        end,

			PlayFxWeaponReloadSequence = function(self)
				TAweapon.PlayFxWeaponReloadSequence(self)

				if self.unit.currentRound == 1 then
					self.unit:HideBone('Rocket_03', true)
					if self.unit:GetTacticalSiloAmmoCount() > 3 then
						self.unit:ShowBone('Rocket_02', true)
					end

					--TURN turret to y-axis <119.99> SPEED <30.00>;
					self.unit.Spinners.turret:SetGoal(119.99)
					self.unit.Spinners.turret:SetSpeed(30)
				end
				if self.unit.currentRound == 2 then
					self.unit:HideBone('Rocket_01', true)
					if self.unit:GetTacticalSiloAmmoCount() > 3 then
						self.unit:ShowBone('Rocket_03', true)
					end

					--TURN turret to y-axis <239.99> SPEED <30.00>;
					self.unit.Spinners.turret:SetGoal(239.99)
					self.unit.Spinners.turret:SetSpeed(30)
				end
				if self.unit.currentRound == 3 then
					self.unit:HideBone('Rocket_02', true)
					if self.unit:GetTacticalSiloAmmoCount() > 3 then
						self.unit:ShowBone('Rocket_01', true)
					end

					--TURN turret to y-axis <-295.36> SPEED <30.00>;
					self.unit.Spinners.turret:SetGoal(0)
					self.unit.Spinners.turret:SetSpeed(30)
				end

				self.unit.currentRound = self.unit.currentRound + 1
				if self.unit.currentRound == 4 then
					self.unit.currentRound = 1
				end
			end,

			PlayFxWeaponPackSequence = function(self)
				TAweapon.PlayFxWeaponPackSequence(self)

				--TURN door1 to z-axis <0> SPEED <73.56>;
				self.unit.Spinners.door1:SetGoal(0)
				self.unit.Spinners.door1:SetSpeed(73.56)

				--TURN door2 to z-axis <0> SPEED <74.58>;
				self.unit.Spinners.door2:SetGoal(0)
				self.unit.Spinners.door2:SetSpeed(73.56)

				--TURN door3 to x-axis <0> SPEED <73.05>;
				self.unit.Spinners.door3:SetGoal(0)
				self.unit.Spinners.door3:SetSpeed(73.56)

				--TURN door4 to x-axis <0> SPEED <73.56>;
				self.unit.Spinners.door4:SetGoal(0)
				self.unit.Spinners.door4:SetSpeed(73.56)

				--SLEEP <1762>;
				#WaitSeconds(1.75)

				self.unit.Spinners.turret:SetGoal(0)
				#self.unit.Spinners.turret:SetSpeed(1000)
				self.unit.Spinners.turret:SetSpeed(100)
		
				--SLEEP <14>;
			end,

		},
	},
}

TypeClass = ARMAMD
