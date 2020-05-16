local DefaultWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
TAutils = import('/mods/SCTA/lua/TAutils.lua')

TAweapon = Class(DefaultWeapon) {
    FxMuzzleFlash = {},

    StartEconomyDrain = function(self)
    end,

    OnGotTargetCheck = function(self)
        local army = self.unit:GetArmy()
        local canSee = true

        ###object currently targeting
        local target = self:GetCurrentTarget()
        if (target) then
            if (IsUnit(target)) then
                canSee = target:GetBlip(army):IsSeenNow(army)
            end
            if (IsBlip(target)) then
                target = target:GetSource()
            end
        end

        ###object (if any) currently ordered to target
        local currentTarget = self.unit:GetTargetEntity()
        if (currentTarget and IsBlip(currentTarget)) then
            currentTarget = currentTarget:GetSource()
        end

        if (canSee == true or TAutils.ArmyHasTargetingFacility(self.unit:GetArmy()) == true or currentTarget == target or (target and IsProp(target)) or EntityCategoryContains(categories.NOCUSTOMTARGET, self.unit)) then
             return true
        else
            self:ResetTarget()
            return false
        end
    end,

    IdleState = State(DefaultWeapon.IdleState) {
        OnGotTarget = function(self)
            if (self:OnGotTargetCheck() == true) then
                DefaultWeapon.IdleState.OnGotTarget(self)
            end
        end,
    },

    WeaponUnpackingState = State(DefaultWeapon.WeaponUnpackingState) {
        Main = function(self)
            if (self:OnGotTargetCheck() == true) then
                DefaultWeapon.WeaponUnpackingState.Main(self)
            else
                ChangeState(self, self.WeaponPackingState)
            end
        end,

        OnGotTarget = function(self)
            if (self:OnGotTargetCheck() == true) then
                DefaultWeapon.WeaponUnpackingState.OnGotTarget(self)
            end
        end,
    },

    RackSalvoFireReadyState = State(DefaultWeapon.RackSalvoFireReadyState) {
        WeaponWantEnabled = true,
        WeaponAimWantEnabled = true,

        Main = function(self)
            local bp = self:GetBlueprint()
            if (bp.CountedProjectile == true and bp.WeaponUnpacks == true) then
                self.unit:SetBusy(true)
            else
                self.unit:SetBusy(false)
            end
            self.WeaponCanFire = true
            if bp.EnergyRequired and bp.EnergyRequired > 0 then
                self.WeaponCanFire = false
                local aiBrain = self.unit:GetAIBrain()
                while aiBrain:GetEconomyStored('ENERGY') < bp.EnergyRequired do
                        WaitSeconds(1)
                end
                aiBrain:TakeResource('Energy', bp.EnergyRequired)
                self.WeaponCanFire = true
            end
            #We change the state on counted projectiles because we won't get another OnFire call.
            if bp.CountedProjectile == true then
                ChangeState(self, self.RackSalvoFiringState)
            end

        end,

        OnGotTarget = function(self)
            if (self:OnGotTargetCheck() == true) then
                DefaultWeapon.RackSalvoFireReadyState.OnGotTarget(self)
            end
        end,

        OnFire = function(self)
            if self.WeaponCanFire then
                ChangeState(self, self.RackSalvoFiringState)
            end
        end,

        OnLostTarget = function(self)
            local bp = self:GetBlueprint()
            if bp.WeaponUnpacks == true then
                ChangeState(self, self.WeaponPackingState)
            end
        end,

    },

    WeaponPackingState = State(DefaultWeapon.WeaponPackingState) {
        OnGotTarget = function(self)
            if (self:OnGotTargetCheck() == true) then
                DefaultWeapon.WeaponPackingState.OnGotTarget(self)
            end
        end,
    },

    GetDamageTable = function(self)
        local weaponBlueprint = self:GetBlueprint()
        local damageTable = {}
        damageTable.EdgeEffectiveness = weaponBlueprint.EdgeEffectiveness
        damageTable.DamageRadius = weaponBlueprint.DamageRadius + (self.DamageRadiusMod or 0)
        damageTable.AlternateDamageRadius = weaponBlueprint.AlternateDamageRadius or 0
        damageTable.DamageAmount = weaponBlueprint.Damage + (self.DamageMod or 0)
        damageTable.DamageType = weaponBlueprint.DamageType
        damageTable.DamageFriendly = weaponBlueprint.DamageFriendly
        if damageTable.DamageFriendly == nil then
            damageTable.DamageFriendly = true
        end
        damageTable.CollideFriendly = weaponBlueprint.CollideFriendly or false
        damageTable.DoTTime = weaponBlueprint.DoTTime
        damageTable.DoTPulses = weaponBlueprint.DoTPulses
        damageTable.MetaImpactAmount = weaponBlueprint.MetaImpactAmount
        damageTable.MetaImpactRadius = weaponBlueprint.MetaImpactRadius
        #Add buff
        damageTable.Buffs = {}
        if weaponBlueprint.Buffs != nil then
            for k, v in weaponBlueprint.Buffs do
                damageTable.Buffs[k] = {}
                damageTable.Buffs[k] = v
            end   
        end     
        #remove disabled buff
        if (self.Disabledbf != nil) and (damageTable.Buffs != nil) then
            for k, v in damageTable.Buffs do
                for j, w in self.Disabledbf do
                    if v.BuffType == w then
                        #Removing buff
                        table.remove( damageTable.Buffs, k )
                    end
                end
            end  
        end  

        return damageTable
    end,
}