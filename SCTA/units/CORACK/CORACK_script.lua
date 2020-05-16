#CORE Adv. Construction Kbot - Tech Level 2
#CORACK
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORACK = Class(TAconstructor) {

	OnCreate = function(self)

		self.Spinners = {
			lnanocase = CreateRotator(self, 'lnanocase', 'y', nil, 0, 0, 0),
			rnanocase = CreateRotator(self, 'rnanocase', 'y', nil, 0, 0, 0),
			lcasedoor = CreateRotator(self, 'lcasedoor', 'y', nil, 0, 0, 0),
			rcasedoor = CreateRotator(self, 'rcasedoor', 'y', nil, 0, 0, 0),
			torso = CreateRotator(self, 'torso', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			lnanocase = CreateSlider(self, 'lnanocase'),
			rnanocase = CreateSlider(self, 'rnanocase'),
			lgunjoint = CreateSlider(self, 'lgunjoint'),
			rgunjoint = CreateSlider(self, 'rgunjoint'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end

		TAconstructor.OnCreate(self)
	end,

	Open = function(self)
		--MOVE lnanocase to x-axis <-2.89> SPEED <5.00>;
		self.Sliders.lnanocase:SetGoal(-2.90,0,0)
		self.Sliders.lnanocase:SetSpeed(5.0)

		--MOVE rnanocase to x-axis <2.80> SPEED <5.00>;
		self.Sliders.rnanocase:SetGoal(2.90,0,0)
		self.Sliders.rnanocase:SetSpeed(5.0)

		--SLEEP <513>;
		WaitSeconds(0.5)

		--TURN lnanocase to y-axis <-90.00> SPEED <173.78>;
		self.Spinners.lnanocase:SetGoal(-90.00)
		self.Spinners.lnanocase:SetSpeed(173.78)

		--TURN rnanocase to y-axis <90.00> SPEED <173.78>;
		self.Spinners.rnanocase:SetGoal(90.00)
		self.Spinners.rnanocase:SetSpeed(173.78)

		--TURN rcasedoor to z-axis <-90.00> SPEED <173.78>;
		self.Spinners.rcasedoor:SetGoal(-90.00)
		self.Spinners.rcasedoor:SetSpeed(173.78)

		--TURN lcasedoor to z-axis <90.00> SPEED <173.78>;
		self.Spinners.lcasedoor:SetGoal(90.00)
		self.Spinners.lcasedoor:SetSpeed(173.78)

		--SLEEP <518>;
		WaitSeconds(0.5)

		--MOVE rgunjoint to x-axis <4.75> SPEED <9.00>;
		self.Sliders.rgunjoint:SetGoal(4.75,0,0)
		self.Sliders.rgunjoint:SetSpeed(9.0)

		--MOVE lgunjoint to x-axis <-4.74> SPEED <9.00>;
		self.Sliders.lgunjoint:SetGoal(-4.75,0,0)
		self.Sliders.lgunjoint:SetSpeed(9.0)

		--SLEEP <520>;
		WaitSeconds(0.5)

		--SLEEP <21>;

		TAconstructor.Open(self)
	end,

	Aim = function(self,target)

		#Aim at build job
		local selfPosition = self:GetPosition('torso') 
		local targetPosition = target:GetPosition()
			
		--TURN torso to y-axis buildheading SPEED <160.03>;
		self.Spinners.torso:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.torso:SetSpeed(160.03)
		WaitFor(self.Spinners.torso)
--[[
		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('NozzleTip') 

		self.Spinners.nanobody2:SetGoal(-180 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.nanobody2:SetSpeed(45.01)

		WaitFor(self.Spinners.nanobody2)
--]]
		TAconstructor.Aim(self, target)

	end,

	Close = function(self)
		self.Spinners.torso:SetGoal(0)
		self.Spinners.torso:SetSpeed(160.03)
		WaitFor(self.Spinners.torso)

		--MOVE rgunjoint to x-axis <0> SPEED <6.00>;
		self.Sliders.rgunjoint:SetGoal(0,0,0)
		self.Sliders.rgunjoint:SetSpeed(6.0)

		--MOVE lgunjoint to x-axis <0> SPEED <6.00>;
		self.Sliders.lgunjoint:SetGoal(0,0,0)
		self.Sliders.lgunjoint:SetSpeed(6.0)

		--SLEEP <683>;
		WaitSeconds(0.7)

		--TURN lnanocase to y-axis <0> SPEED <130.65>;
		self.Spinners.lnanocase:SetGoal(0)
		self.Spinners.lnanocase:SetSpeed(130.65)

		--TURN rnanocase to y-axis <0> SPEED <130.65>;
		self.Spinners.rnanocase:SetGoal(0)
		self.Spinners.rnanocase:SetSpeed(130.65)

		--TURN rcasedoor to z-axis <0.35> SPEED <131.16>;
		self.Spinners.rcasedoor:SetGoal(0)
		self.Spinners.rcasedoor:SetSpeed(130.65)

		--TURN lcasedoor to z-axis <0> SPEED <130.65>;
		self.Spinners.lcasedoor:SetGoal(0)
		self.Spinners.lcasedoor:SetSpeed(130.65)

		--SLEEP <689>;
		WaitSeconds(0.7)

		--MOVE lnanocase to x-axis <0> SPEED <4.00>;
		self.Sliders.lnanocase:SetGoal(0,0,0)
		self.Sliders.lnanocase:SetSpeed(4.0)

		--MOVE rnanocase to x-axis <0> SPEED <4.00>;
		self.Sliders.rnanocase:SetGoal(0,0,0)
		self.Sliders.rnanocase:SetSpeed(4.0)

		--SLEEP <691>;
		WaitSeconds(0.7)

		--SLEEP <34>;

		TAconstructor.Close(self)
	end,
}

TypeClass = CORACK