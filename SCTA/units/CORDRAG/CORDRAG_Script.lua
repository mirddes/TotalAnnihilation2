#CORE Dragon's Teeth - Perimeter Defence
#CORDRAG
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORDRAG = Class(TAunit) {
#	OnStopBeingBuilt = function(self,builder,layer)
#		TAunit.OnStopBeingBuilt(self,builder,layer)
#		self:Kill()
#	end,
}

TypeClass = CORDRAG
