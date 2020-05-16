do

local AbilityDefinition = import('/lua/abilitydefinition.lua').abilities
local CM = import('/lua/ui/game/commandmode.lua')
local Utilities = import('/lua/utilities.lua')

--TODO: rename the tasks file to something else, or possibly remove it entirely
TasksFile = import( '/lua/user/tasks/Tasks.lua' )
VerifyScriptCommand2 = TasksFile.VerifyScriptCommand
GetAvailableAbilityUnits = TasksFile.GetAvailableAbilityUnits

ReticuleSizeCorrection = 1.4
ReticuleIdCounter = 0

function GetIdForNewReticule()
    ReticuleIdCounter = ReticuleIdCounter + 1
    return ReticuleIdCounter
end


local oldWorldView = WorldView
WorldView = Class(oldWorldView) {

    OnCreate = function(self)
        oldWorldView.OnCreate(self)
        self.AllowDraging = true
        self.AbilityCommandMode = false
    end,

    OnDestroy = function(self)
        self:DestroyTargetReticules()
        self:DestroyRangeDecals()
        oldWorldView.OnDestroy(self)
    end,

    HandleEvent = function(self, event)
        if self:MouseDragLogic(event) then
            return true
        end
        return oldWorldView.HandleEvent(self, event)
    end,

    OnUpdateCursor = function(self)
        -- Using this function to set and remove specific ability variables
        local mode = CM.GetCommandMode()
        if mode[1] == 'order' and mode[2].TaskName and AbilityDefinition[ mode[2].TaskName ] then
            local mousePos = GetMouseWorldPos()
            if not self.AbilityCommandMode then
                self.DragButtonIsPressed = false
                self.IsDraggingMouse = false
                self:SetupAbility()
            end
            if self.RangeDecals then
                self:UpdateRangeDecals()
            end
            if not self.IsDraggingMouse then
                self:UpdateTargetReticules(mousePos, self.DragDelta, self.DragAngle)
            end
            self:SetCursorImg(mousePos)
        else
            if self.AbilityCommandMode ~= false then  -- also run when variable is nil (after game start)
                self:UnsetAbility()
            end
            oldWorldView.OnUpdateCursor(self)
        end
    end,

    MouseDragLogic = function(self, event)
        local EventHandled = false
        if self.AllowDraging then

            -- keycode 3 == right mouse button. 1 is left but can't be used reliably because when draging with left button the engine doesn't send event ButtonRelease
            if event.Type == 'ButtonPress' and event.KeyCode == 2 then

                -- toggling drag mode on and off
                if not self.DragButtonIsPressed then
                    self.DragButtonIsPressed = true
                    self.DragStartPos = GetMouseWorldPos()
                else
                    self.DragButtonIsPressed = false
                    if self.IsDraggingMouse then
                        self.DragEndPos = GetMouseWorldPos()
                        self:OnMouseDragEnd(self.DragStartPos, self.DragDelta, self.DragAngle, self.DragEndPos)
                    end
                    self.IsDraggingMouse = false
                end
                EventHandled = true

            elseif (event.Type == 'ButtonPress' or event.Type == 'ButtonDClick') and event.KeyCode == 1 then
                -- adding a reticule in drag mode, on left click
                if self.DragButtonIsPressed or self.IsDraggingMouse then
                    self.ReticuleCount = math.min(self.ReticuleCountMax, self.ReticuleCount + 1)
                    self:UpdateTargetReticules(self.DragStartPos, self.DragDelta, self.DragAngle)
                    EventHandled = true
                end

            elseif (event.Type == 'ButtonPress' or event.Type == 'ButtonDClick') and event.KeyCode == 3 then
                -- number of reticules - 1
                if self.DragButtonIsPressed or self.IsDraggingMouse then
                    -- if right clicking when we're already at minimum number then cancel command mode. else just subtract 1.
                    if self.ReticuleCount > self.ReticuleCountMin then
                        self.ReticuleCount = math.max(self.ReticuleCountMin, self.ReticuleCount - 1)
                        self:UpdateTargetReticules(self.DragStartPos, self.DragDelta, self.DragAngle)
                    else
                        CM.EndCommandMode(true)
                    end
                    EventHandled = true
                end

            elseif event.Type == 'MouseMotion' then
                -- moving mouse, update delta and angle
                if self.DragButtonIsPressed and not self.IsDraggingMouse then
                    self.IsDraggingMouse = true
                    if not self.TargetReticules then
                        self:CreateTargetReticules(self.DragStartPos, self.DragDelta, self.DragAngle)
                    end
                    self:OnMouseDragBegin(self.DragStartPos, self.DragDelta, self.DragAngle)
                elseif self.IsDraggingMouse then
                    local mousePos = GetMouseWorldPos()
                    local dx = mousePos[1] - self.DragStartPos[1]
                    local dz = mousePos[3] - self.DragStartPos[3]
                    self.DragAngle = (90 - ((math.atan2(dz, dx) * 180) / math.pi)) / 180 * math.pi
                    local maxDelta = self.TargetReticuleSize / 2
                    self.DragDelta = VDist2(self.DragStartPos[1], self.DragStartPos[3], mousePos[1], mousePos[3] )
                    self.UseMaxSpread = false
                    if self.DragDelta > maxDelta then
                        if self.DragDelta <= (maxDelta + 2) or self.Behavior.AllowMaxSpread == false then
                            self.DragDelta = maxDelta
                            self.UseMaxSpread = false
                        else
                            self.DragDelta = self.TargetReticuleSize
                            self.UseMaxSpread = true
                        end
                    end
                    self:UpdateTargetReticules(self.DragStartPos, self.DragDelta, self.DragAngle)
                    self:OnMouseDragMotion(self.DragStartPos, self.DragDelta, self.DragAngle)
                end
                EventHandled = true

            elseif event.Type == 'ButtonRelease' and event.KeyCode == 2 then
                if not self.DragButtonIsPressed then
                    self.DragButtonIsPressed = false
                    if self.IsDraggingMouse then
                        self.DragEndPos = GetMouseWorldPos()
                        self:OnMouseDragEnd(self.DragStartPos, self.DragDelta, self.DragAngle, self.DragEndPos)
                    end
                    self.IsDraggingMouse = false
                    EventHandled = true
                end

            elseif event.Type == 'ButtonRelease' and (event.KeyCode == 1 or event.KeyCode == 3) then
                -- ignore the release event when we're dragging. The buttonpress event is used to increase or decrease number of reticules.
                if self.DragButtonIsPressed or self.IsDraggingMouse then
                    EventHandled = true
                end
            end
        end
        return EventHandled
    end,

    OnMouseDragBegin = function(self, DragStartPos, DragDelta, DragAngle)
    end,

    OnMouseDragMotion = function(self, DragStartPos, DragDelta, DragAngle)
    end,

    OnMouseDragEnd = function(self, DragStartPos, DragDelta, DragAngle, DragEndPos)
    end,

    OnAbilityUnitsListUpdated = function(self, AbilityName)
        if not self.AbilityCommandMode then return end
        local pos = GetMouseWorldPos()
        if self.IsDraggingMouse then
            pos = self.DragStartPos
        end

        self:UpdateVariables()
        local i = table.getsize(self.TargetReticules)

        if self.ReticuleCount <= 0 then
            -- there's no unit remaining, end the command mode
            CM.EndCommandMode(true)
            return
        elseif i < self.ReticuleCount then
            -- we have fewer reticules than we can have, make more!
            self:CreateTargetReticules(pos, self.DragDelta, self.DragAngle, true)
        elseif i > self.ReticuleCount then
            -- we have more reticules than we can have, remove some!
            self:DestroyTargetReticules(true)
            self:UpdateTargetReticules(pos, self.DragDelta, self.DragAngle)
        end
        self.AllowDraging = ((self.Behavior.AllowDraging ~= false) and (self.ReticuleCountMax > 1))
    end,

    SetupAbility = function(self)
        if not self.AbilityCommandMode then
            local mode = CM.GetCommandMode()
            self.AbilityData = AbilityDefinition[ mode[2].TaskName ]
            self.AbilityData['Name'] = mode[2].TaskName
            self.Behavior = mode[2].Behaviour
            self:InitializeVariables()
            self:CreateRangeDecals()
            self:CreateTargetReticules(GetMouseWorldPos(), 0, 0)
            self.AllowDraging = ((self.Behavior.AllowDraging ~= false) and (self.ReticuleCountMax > 1))
            self.AbilityCommandMode = true
        end
    end,

    UnsetAbility = function(self)
        if self.AbilityCommandMode ~= false then  -- also run when variable is nil (after game start)
            self:DestroyRangeDecals()
            self:DestroyTargetReticules()
            self.IsDraggingMouse = false
            self.Behavior = nil
            self.UseMaxSpread = false
            self.AllowDraging = false
            self.AbilityCommandMode = false
            self.AbilityData = nil
            self.AbilityUnitsList = nil
        end
    end,

    -- TODO: Try to get rid of this function as much as possible
    GetAbilityData = function(self, name)
        if self.AbilityData then
            if name == 'DoRangeCheck' then
                if self.AbilityData.ExtraInfo.DoRangeCheck then
                    return self.AbilityData.ExtraInfo.DoRangeCheck
                else
                    return false
                end
            elseif self.AbilityData[name] ~= nil then
                return self.AbilityData[name]
            end
        end
    end,

    SetCursorImg = function(self, worldPos)
        local cursorWas = self.Cursor
        local inRange = self:CheckPosInRange(worldPos)
        if not inRange then
            self.Cursor = {UIUtil.GetCursor('RULEUCC_Invalid')}
        else
            local cursor = self:GetAbilityData('cursor') or self:GetAbilityData('Name') or 'RULEUCC_Attack'
            self.Cursor = {UIUtil.GetCursor(cursor)}
        end
        if self.Cursor == nil or cursorWas == nil or self.Cursor[1] ~= cursorWas[1] then
            self:ApplyCursor()
        end
    end,

    CreateTargetReticules = function(self, worldPos, offset, angle, add)
        if not add then
            self:DestroyTargetReticules()
        end
        if not self.TargetReticules then
            self.TargetReticules = {}
        end
        local i = table.getsize(self.TargetReticules)
        if i < self.ReticuleCountMax then
            for k=(i+1), self.ReticuleCountMax do
                self:CreateTargetReticule(Vector(0,0,0))
            end
            self:UpdateTargetReticules(worldPos, offset, angle)
        end
    end,

    DestroyTargetReticules = function(self, onlyRemoveExcess)
        if self.TargetReticules then
            if onlyRemoveExcess then
                local i = table.getsize(self.TargetReticules)
                for k=(self.ReticuleCountMax+1), i do
                    self.TargetReticules[k]:Destroy()
                    self.TargetReticules[k] = nil
                end
            else
                for k, ret in self.TargetReticules do
                    ret:Destroy()
                end
                self.TargetReticules = nil
            end
        end
    end,

    UpdateTargetReticules = function(self, worldPos, offset, angle)
        local reticules = self.TargetReticules
        local units = self:GetUnitsThatCanFireOn(worldPos, offset)
        local nu = self:GetNumTargetReticulesForUnits(units)
        local nr = table.getsize(reticules)
        local UseNumReticules = math.min(nr - math.max(0, nr - nu), self.ReticuleCount)

        if UseNumReticules < nr then
            -- hide the reticules not used or not in range
            for i = (UseNumReticules+1), nr do
                reticules[i].InRange = false
                reticules[i].Position = {0,0,0}
                reticules[i]:SetPosition(table.copy(Vector(0,0,0)))
                reticules[i]:SetScale(Vector(0,0,0))
            end
        end

        if UseNumReticules > 0 then
            if UseNumReticules >= 4 and self.UseMaxSpread then   -- Max spread setting
                --set one reticule in the centre
                self:SetReticulePosition(reticules[1], worldPos)
                for i = 2, UseNumReticules do
                    self:SetReticulePosition(reticules[i], worldPos, offset, angle, UseNumReticules-1, i)
                end
            -- normal dragging setting (max. colateral or max. pinpoint damage). checking for offset > 1 takes care of the snapping
            elseif UseNumReticules > 1 and offset >= (self.TargetReticuleSize * .1) then
                for i = 1, UseNumReticules do
                    self:SetReticulePosition(reticules[i], worldPos, offset, angle, UseNumReticules, i)
                end
            elseif reticules then  -- single reticule or all at the same spot
                for i = 1, UseNumReticules do
                    self:SetReticulePosition(reticules[i], worldPos)
                end
            end
        end
        
        --this bit is required to update the decal positions properly
        for i = 1, UseNumReticules do
            reticules[i]:SetPosition(table.copy(reticules[i].Position))
        end
    end,
    
    SetReticulePosition = function(self, reticule, worldPosition, offset, DragAngle, UseNumReticules, reticuleNumber)
        local ReticulePosOffset = self.TargetReticuleSize / 2
        
        --if the reticule isnt in the centre then we need to offset it additionally
        if offset and DragAngle and UseNumReticules and reticuleNumber then
            local angleInc = (2*math.pi) / UseNumReticules
            local offsetAmount = offset
            if not (UseNumReticules >= 4 and self.UseMaxSpread) then
                offsetAmount = math.min(offsetAmount, ReticulePosOffset)
            end
        
            local r = (DragAngle + (angleInc * reticuleNumber))
            local x = worldPosition[1] + (math.sin(r) * offsetAmount)
            local z = worldPosition[3] + (math.cos(r) * offsetAmount)
            worldPosition = {x, worldPosition[2], z}
        end
        
        reticule.InRange = true
        reticule.Position = worldPosition
        reticule:SetPosition(table.copy({ worldPosition[1] + ReticulePosOffset, worldPosition[2], worldPosition[3] + ReticulePosOffset }))
        reticule:SetScale(Vector(self.TargetReticuleSize, 1, self.TargetReticuleSize))
    end,

    GetNumTargetReticulesForUnits = function(self, units)
        local n = 0
        for k, unit in units do
            n = n + self:GetNumTargetReticulesForUnit(unit)
        end
        return n
    end,

    GetNumTargetReticulesForUnit = function(self, unit)
        local name = self:GetAbilityData('Name')
        local bp = unit:GetBlueprint().SpecialAbilities
        if bp and bp[ name ] then
            return math.max((bp[ name ].WantNumTargets or 1), 1)
        end
        return 0
    end,

    GetUnitsThatCanFireOn = function(self, pos, offset)
        local units = self.AbilityUnitsList
        if self:GetAbilityData('DoRangeCheck') then
            local UnitsInRange = {}
            for k, unit in units do
                if self:CheckUnitCanFireAtPosition(unit, pos, offset) then
                    UnitsInRange[unit:GetEntityId()] = unit
                end
            end
            return UnitsInRange
        else
            return units
        end
    end,

    CheckUnitCanFireAtPosition = function(self, unit, pos, offset)
        local Name = self:GetAbilityData('Name')
        local MaxRadius = -1
        local MinRadius = -1

        -- get unit bp data
        local bp = unit:GetBlueprint().SpecialAbilities
        if bp and bp[ Name ] then
            MaxRadius = bp[ Name ].MaxRadius or -1
            MinRadius = bp[ Name ].MinRadius or -1
            if offset and offset > 0 then  -- consider reticule offset from center
                if MaxRadius > 0 then
                    MaxRadius = MaxRadius - offset
                end
                if MinRadius > 0 then
                    MinRadius = MinRadius + offset
                end
            end
        end

        -- check position is within range of unit
        local upos = unit:GetPosition()
        local dist = VDist2(pos[1], pos[3], upos[1], upos[3])

        -- check unit has range limitation
        if MaxRadius < 0 or dist <= MaxRadius then
            if MinRadius <= 0 or dist >= MinRadius then
                return true
            end
        end

        return false
    end,

    CreateTargetReticule = function(self, worldPos)
        local size = self.TargetReticuleSize * ReticuleSizeCorrection
        local decal = UserDecal {}
        decal.Id = GetIdForNewReticule()
        decal.Size = size
        decal:SetTexture('/textures/ui/common/game/AreaTargetDecal/weapon_icon_small.dds')
        decal:SetScale(Vector(size, 1, size))
        self.TargetReticules[1 + table.getsize(self.TargetReticules)] = decal
    end,

    CheckPosInRange = function(self, pos)
        if self:GetAbilityData('DoRangeCheck') then
            local reticules = self.TargetReticules
            local nr = table.getsize(reticules)
            for i = 1, nr do
                if reticules[i].InRange then
                    return true
                end
            end
            return false
        else
            return true
        end
    end,

    CreateRangeDecals = function(self)
        if self:GetAbilityData('DoRangeCheck') then
            self.RangeDecals = {}
            local units = self.AbilityUnitsList
            if units then
                for id, unit in units do
                    self:CreateRangeDecal(unit)
                end
            end
        end
    end,

    UpdateRangeDecals = function(self)
        local unitsInRange = table.copy(self:GetUnitsThatCanFireOn(GetMouseWorldPos(),self.DragDelta))
        local decals = self.RangeDecals
        for k, decal in decals do
            local isUnitInRange = unitsInRange[decal.UnitAttached:GetEntityId()]
            if decal and decal.UnitAttached and not decal.UnitAttached:IsDead() and decal.UnitAttached.GetPosition and isUnitInRange then
                decal:SetPosition(table.copy( decal.UnitAttached:GetPosition() ))
                unitsInRange[decal.UnitAttached:GetEntityId()] = nil --remove unit from the list
            else
                decals[k]:Destroy()
                decals[k] = nil
            end
        end
        
        --any leftover units are missing decals, and need to be added
        for k, unit in unitsInRange do
            self:CreateRangeDecal(unit)
        end
    end,

    DestroyRangeDecals = function(self)
        local decals = self.RangeDecals
        if decals then
            for k, decal in decals do
                decal:Destroy()
            end
        end
        self.RangeDecals = nil
    end,

    CreateRangeDecal = function(self, unit)
        local name = self:GetAbilityData('Name')
        local maxRadius = unit:GetBlueprint().SpecialAbilities[name].MaxRadius
        if maxRadius and maxRadius > 0 then
            local decal = UserDecal {}
            decal:SetTexture('/textures/ui/common/game/AreaTargetDecal/AbilityRange.dds')
            decal:SetScale(Vector(4 * 2, 1, 4 * 2))  -- the * 2 is to convert from radius
            decal.UnitAttached = unit
            table.insert(self.RangeDecals, decal)
            return decal
        end
    end,

    GetAbilityUnits = function(self, selectionFilter)
        local name = self:GetAbilityData('Name')
        local unitIds = GetAvailableAbilityUnits(name, selectionFilter) or {}
        local units = {}
        local unit
        for k, unitId in unitIds do
            unit = GetUnitById(unitId)
            if unit then
                units[ unitId ] = unit
            end
        end
        return units
    end,

    InitializeVariables = function(self)
        self:UpdateVariables()
        self:DetermineTargetReticuleSize()

        self.DragAngle = 0
        self.DragDelta = math.max(0, math.min(1, self.Behavior.DragDelta or 0)) * self.TargetReticuleSize / 2
        if self.Behavior.DragDelta > 1 and self.Behavior.AllowMaxSpread ~= false then
            self.DragDelta = self.TargetReticuleSize
            self.UseMaxSpread = true
        end
    end,
    
    UpdateVariables = function(self)
        self.AbilityUnitsList = self:GetAbilityUnits(self.Behavior.UseSelected)
        self:DetermineTargetReticuleCountMinMax()
        if self.Behavior.AllReticulesAtStart then
            self.ReticuleCount = self.ReticuleCountMax
        else
            self.ReticuleCount = self.ReticuleCountMin
        end
    end,

    DetermineTargetReticuleCountMinMax = function(self)
        -- initialize reticule count, basically go through units and see how many they can offer
        local units = self.AbilityUnitsList
        if units then
            self.ReticuleCountMax = 0
            self.ReticuleCountMin = 99999
            for k, unit in units do
                n = self:GetNumTargetReticulesForUnit(unit)
                if n > 0 then
                    self.ReticuleCountMax = self.ReticuleCountMax + n
                    self.ReticuleCountMin = math.min(self.ReticuleCountMin, n)
                else
                    self.ReticuleCountMax = self.ReticuleCountMax + 1
                    self.ReticuleCountMin = 1
                end
            end
            self.ReticuleCountMin = math.min(self.ReticuleCountMin, self.ReticuleCountMax)
            self.ReticuleCount = math.max(self.ReticuleCountMin, math.min(self.ReticuleCount or 0, self.ReticuleCountMax))
        else
            self.ReticuleCountMin = 0
            self.ReticuleCountMax = 0
            self.ReticuleCount = 0
        end
    end,

    DetermineTargetReticuleSize = function(self)
        if self.Behavior.ReticuleSizeOverride then
            self.TargetReticuleSize = self.Behavior.ReticuleSizeOverride * 2  -- correction radius diameter
        else
            self.TargetReticuleSize = 0
            local units = self.AbilityUnitsList
            if units then
                local ubp
                local name = self:GetAbilityData('Name')
                for k, unit in units do
                    ubp = unit:GetBlueprint().SpecialAbilities
                    if ubp[name] and ubp[name].AreaOfEffect and ubp[name].AreaOfEffect > 0 then
                        if self.TargetReticuleSize == 0 then
                            self.TargetReticuleSize = ubp[name].AreaOfEffect
                        else
                            self.TargetReticuleSize = math.min(self.TargetReticuleSize, ubp[name].AreaOfEffect)
                        end
                    end
                end
                if self.TargetReticuleSize < 1 then
                    LOG('Attention: Worldview DetermineTargetReticuleSize(): reticule size is less than 1! Is AreaOfEffect properly specified in unit blueprints?')
                else
                    self.TargetReticuleSize = self.TargetReticuleSize * 2  -- correction radius diameter
                end
            end
        end
    end,

    GetTargetLocations = function(self)
        local reticules = self.TargetReticules
        local positions = {}
        if reticules then
            for _, reticule in reticules do
                if reticule.InRange then
                    positions[ reticule.Id ] = reticule.Position
                end
            end
        end
        return positions
    end,
}



end
