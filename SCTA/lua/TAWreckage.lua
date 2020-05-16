local Prop = import('/lua/sim/Prop.lua').Prop
#local WreckShield = import('/mods/SCTA/lua/TAshield.lua').WreckShield
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

TAWreckage = Class(Prop) {
	smokeEmitter = nil,
	wreckageDead = false,
	myShield = nil,
	OriginalUnit = nil,

	OnCreate = function(self)
		Prop.OnCreate(self)
		bp = self:GetBlueprint()
		ForkThread(self.SinkThread, self)
		if self:GetPosition().y >= GetSurfaceHeight(self:GetPosition().x, self:GetPosition().z) then
			if not EntityCategoryContains(categories.NOSMOKE, self) then
				self.smokeEmitter = CreateAttachedEmitter(self, 0, -1, '/mods/SCTA/effects/emitters/wreckage_smoke_emit.bp' )
			end
		end
	end,

	SinkThread = function(self)
		local sinkSpeed = 0.015
		local sinkAccel = 0.0025
		while not IsDestroyed(self) and self:GetPosition().y > GetTerrainHeight(self:GetPosition().x, self:GetPosition().z) + (self:GetBlueprint().SeabedOffset or 0) do
			local pos = self:GetPosition()
			Warp(self, Vector(pos[1], pos[2] - sinkSpeed, pos[3]))
			if self.myShield then
				Warp(self.myShield, Vector(pos[1], pos[2] - sinkSpeed, pos[3]))
			end
			WaitTicks(1)
			sinkSpeed = sinkSpeed + sinkAccel
			if self.smokeEmitter then
				self.smokeEmitter:Destroy()
			end
		end
	end,

	OnDamage = function(self, instigator, amount, vector, damageType)
		self:DoTakeDamage(instigator, amount, vector, damageType)
	end,

	DoTakeDamage = function(self, instigator, amount, vector, damageType)
		local maxHealth = self:GetMaxHealth()
		local preHealth = self:GetHealth()
		self:AdjustHealth(instigator, -amount)
		local health = self:GetHealth()
		if health <= 0 and self.wreckageDead == false then
			self.wreckageDead = true
			TAutils.QueueDelayedWreckage(self, amount / maxHealth, self:GetBlueprint(), 1, self:GetPosition(), self:GetOrientation(), self:GetMaxHealth())
			if not self:GetBlueprint().Wreckage then
				#Make duration limited?
				CreateSplat(self:GetPosition(), 0, 'Smudge', 1, 1, 130, 0, -1, 0)
			end
			self:Destroy()			
		end
	end,

	OnDestroy = function(self)
		if self.myShield then
			self.myShield:Destroy()
		end

	end,
}
