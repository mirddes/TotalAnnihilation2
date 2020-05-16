#CORE Pyro - Assault Kbot
#CORPYRO
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORPYRO = Class(TAunit) {
	#NEED A MUCH BETTER WAY OF DOING SOUND
	lastSound = 0,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		lastSound = 0
	end,


	OnStopBeingBuilt = function(self, builder, layer)
		TAunit.OnStopBeingBuilt(self, builder, layer)
		ForkThread(self.SoundThread,self)
		ForkThread(self.FlameThread,self)
        end,

      	Weapons = {
		FLAMETHROWER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				LOG(self.unit.lastSound)
				if self.unit.lastSound == 0 then
					self:PlaySound(Sound({Cue = 'FLAMHVY1', Bank = 'TA_Sound', LodCutoff = 'Weapon_LodCutoff'}))
					self.unit.lastSound = 12
				end
			end,
		},

	},

	SoundThread = function(self)
		while not IsDestroyed(self) do
			if self.lastSound > 0 then
				self.lastSound = self.lastSound - 1
			end
			WaitSeconds(0.1)
		end
	end,

	FlameThread = function(self)
		while not IsDestroyed(self) do
			flameNumber = math.random(3)

			if flameNumber == 1 then
				self:ShowBone('flame1', true)
				self:HideBone('flame2', true)
				self:HideBone('flame3', true)
			end
			if flameNumber == 2 then
				self:ShowBone('flame2', true)
				self:HideBone('flame1', true)
				self:HideBone('flame3', true)
			end
			if flameNumber == 3 then
				self:ShowBone('flame3', true)
				self:HideBone('flame2', true)
				self:HideBone('flame1', true)
			end
			WaitSeconds(0.1)
		end
	end,
}
TypeClass = CORPYRO