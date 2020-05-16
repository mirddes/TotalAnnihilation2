#ARM Decoy Commander - Decoy Commander
#ARMCOM
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMDECOM = Class(TAconstructor) {

	Weapons = {
		ARMCOMLASER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAconstructor.ShowMuzzleFlare(self, 0.1)
			end,
		},
	},

	OnCreate = function(self)
		self.Spinners = {
			torso = CreateRotator(self, 'Torso', 'y', nil, 0, 0, 0),
			luparm = CreateRotator(self, 'LeftLowerArm', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,


	Aim = function(self)
		local selfPosition = self:GetPosition('Torso') 
		local targetPosition = target:GetPosition()
			

		--TURN torso to y-axis heading SPEED <300.07>;
		self.Spinners.torso:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.torso:SetSpeed(300)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('LaserMuzzle') 

		--TURN luparm to x-axis (0 - pitch - 29.99) SPEED <45.01>;
		self.Spinners.luparm:SetGoal(-180 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.luparm:SetSpeed(45.01)

		WaitFor(self.Spinners.torso)
		WaitFor(self.Spinners.luparm)
		TAconstructor.Aim(self, target)
	end,


	Close = function(self)
		self.Spinners.torso:SetGoal(0)
		self.Spinners.torso:SetSpeed(90)
	
		self.Spinners.luparm:SetGoal(0)
		self.Spinners.luparm:SetSpeed(45)

		WaitFor(self.Spinners.torso)
		WaitFor(self.Spinners.luparm)

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMDECOM