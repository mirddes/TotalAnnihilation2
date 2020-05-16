#ARM Precision Mine - High Damage, Small Range Mine
#ARMMINE5
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local Projectile = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

ARMMINE5 = Class(TAunit) {
	attacked = false,

	Weapons = {
		ARMMINE5 = Class(Projectile) {
			OnWeaponFired = function(self)
				self.unit.attacked = true
				self.unit:Kill()
			end,
		},
	},

	OnKilled = function(self, instigator, type, overkillRatio)
		if self.unit.attacked == true then
			instigator = self
		end
		TAunit.OnKilled(self, instigator, type, overkillRatio)
		
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		self:SetScriptBit('RULEUTC_CloakToggle', true)
		self:RequestRefreshUI()
	end,

	OnIntelDisabled = function(self)
		self:SetMesh(self:GetBlueprint().Display.MeshBlueprint, true)
	end,

	OnIntelEnabled = function(self)
		self:SetMesh('/units/ARMMINE5/ARMMINE5_cloak_mesh', true)
	end,
}
TypeClass = ARMMINE5