local Shield = import('/lua/shield.lua').Shield

WreckShield = Class(Shield){
    AttachedWreck = nil,

    OnCreate = function(self,spec)
        self.Trash = TrashBag()
        self.Owner = spec.Owner
	self.AttachedWreck = spec.Wreck
        self.FactionName = spec.FactionName
        self.CollisionSizeX = spec.CollisionSizeX or 1
	self.CollisionSizeY = spec.CollisionSizeY or 1
	self.CollisionSizeZ = spec.CollisionSizeZ or 1
	self.CollisionCenterX = spec.CollisionCenterX or 0
	self.CollisionCenterY = spec.CollisionCenterY or 0
	self.CollisionCenterZ = spec.CollisionCenterZ or 0
	self:CreateShieldMesh()
	#self.OwnerShieldMesh = spec.OwnerShieldMesh or ''

	self:SetSize(spec.Size)

        self:SetMaxHealth(spec.ShieldMaxHealth)
        self:SetHealth(self,spec.ShieldMaxHealth)

        self:SetVerticalOffset(spec.ShieldVerticalOffset)

        self:SetVizToFocusPlayer('Intel')
        self:SetVizToEnemies('Intel')
        self:SetVizToAllies('Intel')
        self:SetVizToNeutrals('Intel')
	self:SetOrientation(spec.Orientation, true)
        Warp(self, spec.Position)

    end,

    CreateImpactEffect = function(self, vector)
    end,

    CreateShieldMesh = function(self)
	self:SetCollisionShape( 'Box', self.CollisionCenterX, self.CollisionCenterY, self.CollisionCenterZ, self.CollisionSizeX, self.CollisionSizeY, self.CollisionSizeZ)
    end,

    RemoveShield = function(self)
        self:SetCollisionShape('None')
    end,

    OnCollisionCheckWeapon = function(self, firingWeapon)
        return true
    end,

    OnCollisionCheck = function(self,other)
        return true
    end,

    OnDamage =  function(self,instigator,amount,vector,type)
	if self.AttachedWreck then
		self.AttachedWreck:DoTakeDamage(instigator, amount, vector, type)
	else
		self:Destroy()
	end
    end,


    OnGetDamageAbsorption = function(self,instigator,amount,type)

#	if self.Owner then
#	        amount = amount * (self.Owner:GetArmorMult(type))
#       	amount = amount * ( 1.0 - ArmyGetHandicap(self:GetArmy()) )
#	        return math.min( self:GetHealth(), amount )
#	else
#	        return math.min(0)
#	end
	return 0
    end,

    UpdateShieldRatio = function(self, value)     
#        if value >= 0 then
#            self.Owner:SetShieldRatio(value)
#        else
#            self.Owner:SetShieldRatio(self:GetHealth() / self:GetMaxHealth())
#        end
    end,
}