#CORE Metal Maker - Converts Energy into Metal
#CORMAKR
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORMAKR = Class(TAunit) {

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			plug = CreateRotator(self, 'plug', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OnProductionUnpaused = function(self)
		#Open Animation
		self:PlayUnitSound('Activate')		
		ForkThread(self.Open, self)

	end,

	OnProductionPaused = function(self)
		#Close Animation		
		TAunit.OnProductionPaused(self)
		self:SetConsumptionActive(false)
		self.textureAnimation = false
		self:PlayUnitSound('Deactivate')
		ForkThread(self.Close, self)
	end,

	Open = function(self)
		--TURN plug to z-axis <180> SPEED <50.01> 
		self.Spinners.plug:SetGoal(0)
		self.Spinners.plug:SetSpeed(50)
		WaitFor(self.Spinners.plug)

		TAunit.OnProductionUnpaused(self)
		self:SetConsumptionActive(true)
		self.textureAnimation = true
	end,

	Close = function(self)
		--TURN plug to z-axis <0> SPEED <50.01>
		self.Spinners.plug:SetGoal(180)
		self.Spinners.plug:SetSpeed(50)
		WaitFor(self.Spinners.plug)
	end,
}


TypeClass = CORMAKR