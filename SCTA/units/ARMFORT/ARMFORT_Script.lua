#ARM Fortification Wall - Perimeter Defence
#ARMFORT
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMFORT = Class(TAunit) {
#	OnStopBeingBuilt = function(self,builder,layer)
#		TAunit.OnStopBeingBuilt(self,builder,layer)
#		self:Kill()
#	end,
}

TypeClass = ARMFORT
