#Generic TA Air unit
local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

TAair = Class(TAunit) 
{
	OnMotionVertEventChange = function(self, new, old )
		if (new == 'Bottom' and old == 'Down' and EntityCategoryContains(categories.TRANSPORTATION, self)) then
	                self:PlayUnitSound('Landing')
			self:CloseWings(self)
		elseif (new == 'Down' and old == 'Top' and not EntityCategoryContains(categories.TRANSPORTATION, self)) then
	                self:PlayUnitSound('Landing')
			self:CloseWings(self)
		elseif (new == 'Bottom') then
                	self:PlayUnitSound('TakeOff')
			self:OpenWings(self)
		elseif (new == 'Up' or new == 'Top') then
			self:OpenWings(self)
		end

		TAunit.OnMotionVertEventChange(self, new, old)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		self:OpenWings(self)
		#TODO: is this needed?
                self:PlayUnitSound('TakeOff')
	end,

	OpenWings = function(self)
	end,

	CloseWings = function(self)
	end,

    	OnRunOutOfFuel = function(self)
    	end,
}

TypeClass = TAair
