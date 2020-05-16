#ARM Cloakable Fusion Reactor - Produces Energy
#ARMCKFUS
#
#Blueprint created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMCKFUS = Class(TAunit) {
    OnStopBeingBuilt = function(self,builder,layer)
        TAunit.OnStopBeingBuilt(self,builder,layer)
        self:SetScriptBit('RULEUTC_CloakToggle', true)
        self:RequestRefreshUI()
    end,

	OnIntelDisabled = function(self)
		self:SetMesh(self:GetBlueprint().Display.MeshBlueprint, true)
	end,

	OnIntelEnabled = function(self)
		self:SetMesh('/units/ARMCKFUS/ARMCKFUS_cloak_mesh', true)
	end,
}

TypeClass = ARMCKFUS
