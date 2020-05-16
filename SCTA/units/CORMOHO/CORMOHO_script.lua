#CORE Moho Mine - Advanced Metal Extractor
#CORMOHO
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local worldData = import('/mods/SCTA/lua/sim/worldData.lua')

CORMOHO = Class(TAunit) {
	onMetalSpot = false,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			rotary = CreateRotator(self, 'rotary', 'y', nil, 0, 0, 0),
			dingle1 = CreateRotator(self, 'dingle1', 'y', nil, 0, 0, 0),
			dingle2 = CreateRotator(self, 'dingle2', 'y', nil, 0, 0, 0),
			shell = CreateRotator(self, 'shell', 'x', nil, 0, 0, 0),
		}
                self.Sliders = {
                        stands = CreateSlider(self, 'stands'),
                }
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	CreateWreckage = function( self, overkillRatio )
		if self.onMetalSpot == false then
			TAunit.CreateWreckage(self, overkillRatio)
		else
			return nil
		end
	end,

	OnStopBeingBuilt = function(self, builder, layer)
		TAunit.OnStopBeingBuilt(self, builder, layer)
		local markers = ScenarioUtils.GetMarkers() 
		local unitPosition = self:GetPosition() 
		self:SetProductionPerSecondMass(worldData:GetMap().mohoSurfaceMetal) 
		for k, v in pairs(markers) do 
			if(v.type == 'Mass') then 
                		local massPosition = v.position 
                		if (massPosition[1] < unitPosition[1] + 1) and (massPosition[1] > unitPosition[1] - 1) then 
	                    		if (massPosition[2] < unitPosition[2] + 1) and (massPosition[2] > unitPosition[2] - 1) then 
		                    		if (massPosition[3] < unitPosition[3] + 1) and (massPosition[3] > unitPosition[3] - 1) then 
                		   			self:SetProductionPerSecondMass(worldData:GetMap().mohoMetal) 
							self.onMetalSpot = true
		                    			break 
						end
					end
                		end 
            		end 
        	end	
		self:PlayUnitSound('Activate')	
		ForkThread(self.Open, self)
	end,

	OnProductionPaused = function(self)
		TAunit.OnProductionPaused(self)
		ForkThread(self.Close, self)
                self:SetConsumptionActive(false)
		self:PlayUnitSound('Deactivate')
	end,

	OnProductionUnpaused = function(self)
		TAunit.OnProductionUnpaused(self)
		ForkThread(self.Open, self)
                self:SetConsumptionActive(true)
		self:PlayUnitSound('Activate')
	end,

        Open = function(self)
		--MOVE stands to y-axis <10.35> SPEED <13.00>;
		self.Sliders.stands:SetGoal(0,10.35,0)
		self.Sliders.stands:SetSpeed(13)

		--SLEEP <772>;
		--SLEEP <198>;
		WaitSeconds(1.0)

		--TURN shell to x-axis <-180.00> SPEED <261.68>;
		self.Spinners.shell:SetGoal(-180)
		self.Spinners.shell:SetSpeed(261.68)

		--SLEEP <688>;
		--SLEEP <201>;
		WaitSeconds(0.9)

		--MOVE stands to y-axis <0> SPEED <11.00>;
		self.Sliders.stands:SetGoal(0,0,0)
		self.Sliders.stands:SetSpeed(11)

		--SLEEP <911>;
		--SLEEP <34>;
		WaitSeconds(0.9)

		--SPIN rotary around y-axis  SPEED spinspeed accelerate spinacc;
		self.Spinners.rotary:SetAccel(182)
		self.Spinners.rotary:SetTargetSpeed(self:GetProductionPerSecondMass() * 27)

		--SPIN dingle1 around y-axis  SPEED spinspeed;
		self.Spinners.dingle1:ClearGoal()
		self.Spinners.dingle1:SetSpeed(self:GetProductionPerSecondMass() * 27)

		--SPIN dingle2 around y-axis  SPEED spinspeed;
		self.Spinners.dingle2:ClearGoal()
		self.Spinners.dingle2:SetSpeed(self:GetProductionPerSecondMass() * 27)
        end,

        Close = function(self)
		--STOP-SPIN rotary around y-axis  DECELERATE spindec;
		self.Spinners.rotary:SetAccel(546)
		self.Spinners.rotary:SetTargetSpeed(0)

		--STOP-SPIN dingle1 around y-axis  DECELERATE spindec;
		self.Spinners.dingle1:SetAccel(546)
		self.Spinners.dingle1:SetTargetSpeed(0)

		--STOP-SPIN dingle2 around y-axis  DECELERATE spindec;
		self.Spinners.dingle2:SetAccel(546)
		self.Spinners.dingle2:SetTargetSpeed(0)

		--WAIT-FOR-TURN rotary around y-axis;
		WaitFor(self.Spinners.rotary)

		--WAIT-FOR-TURN dingle1 around y-axis;
		WaitFor(self.Spinners.dingle1)

		--WAIT-FOR-TURN dingle2 around y-axis;
		WaitFor(self.Spinners.dingle2)

		--TURN dingle1 to y-axis <0> SPEED <120.02>;
		self.Spinners.dingle1:SetGoal(0)
		self.Spinners.dingle1:SetSpeed(120)

		--TURN dingle2 to y-axis <0> SPEED <120.02>;
		self.Spinners.dingle2:SetGoal(0)
		self.Spinners.dingle2:SetSpeed(120)

		--MOVE stands to y-axis <10.35> SPEED <13.00>;
		self.Sliders.stands:SetGoal(0,10.35,0)
		self.Sliders.stands:SetSpeed(13)

		--SLEEP <768>;
		--SLEEP <199>;
		WaitSeconds(1.0)

		--TURN shell to x-axis <0> SPEED <261.30>;
		self.Spinners.shell:SetGoal(0)
		self.Spinners.shell:SetSpeed(261)

		--SLEEP <689>;
		--SLEEP <201>;
		WaitSeconds(0.9)

		--MOVE stands to y-axis <0> SPEED <11.00>;
		self.Sliders.stands:SetGoal(0,0,0)
		self.Sliders.stands:SetSpeed(11)

		--SLEEP <911>;
		--SLEEP <33>;
		WaitSeconds(0.9)
        end,
}

TypeClass = CORMOHO