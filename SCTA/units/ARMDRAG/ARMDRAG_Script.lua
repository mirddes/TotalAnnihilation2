#ARM Dragon's Teeth - Perimeter Defence
#ARMDRAG
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMDRAG = Class(TAunit) {
#	OnStopBeingBuilt = function(self,builder,layer)
#		TAunit.OnStopBeingBuilt(self,builder,layer)
#		self:Kill()
#	end,
}

TypeClass = ARMDRAG
