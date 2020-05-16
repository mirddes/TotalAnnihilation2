#ARM Nuclear Mine - Nuclear Mine
#ARMMINE6
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local Projectile = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

ARMMINE6 = Class(TAunit) {
	attacked = false,

	Weapons = {
		ARMMINE6 = Class(Projectile) {
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
		self:SetMesh('/units/ARMMINE6/ARMMINE6_cloak_mesh', true)
	end,
}
TypeClass = ARMMINE6