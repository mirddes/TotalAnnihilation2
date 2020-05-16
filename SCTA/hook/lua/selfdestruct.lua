
function DoSelfDestruct(unit)

    if unit:BeenDestroyed() or unit.Dead then
        return
    end

    if EntityCategoryContains(categories.TRANSPORTATION, unit) then
        local cargo = unit:GetCargo()
        for k, v in cargo do
            if unit ~= v then
                DoSelfDestruct(v)
            end
        end
    end

    FireSelfdestructWeapons(unit)
    unit.SelfDestructed = true
    unit:Kill(unit, 'normal', 0)
end


function ToggleSelfDestruct(data)
    -- Suppress self destruct in tutorial missions as they screw up the mission end
    if ScenarioInfo.tutorial and ScenarioInfo.tutorial == true then
        return
    end

    if data.owner ~= -1 then
        local unitEntities = {}
        for _, unitId in data.units do
            local unit = GetEntityById(unitId)
            if OkayToMessWithArmy(unit:GetArmy()) then
                table.insert(unitEntities, unit)
            end
        end
        if table.getsize(unitEntities) > 0 then
            if data.noDelay then -- Kill these units instantly
                for _, unit in unitEntities do
                    DoSelfDestruct(unit)
                end
            else
                local togglingOff = false
                for _, unit in unitEntities do -- Rescue anything in the process of dying, and skip the next bit
                    if unit.SelfDestructThread then
                        togglingOff = true
                        KillThread(unit.SelfDestructThread)
                        unit.SelfDestructThread = false
                        local entityId = unit:GetEntityId()
                        CancelCountdown(entityId)
                    end
                end

                if not togglingOff then
                    for _, unitEnt in unitEntities do
                        local unit = unitEnt

                        -- Unit and weapon bp flags can be used to control behaviour on SelfDestruct
                        -- Instant kill if InstantDeathOnSelfDestruct = true variable set in units general table
                        -- Fires weapons with FireOnSelfDestruct = true in units weapon table
                        local bp = unit:GetBlueprint()
                        if bp.General.InstantDeathOnSelfDestruct then
                            DoSelfDestruct(unit)
                        else
                            -- Regular self destruct cycle
                            local entityId = unit:GetEntityId()
                            StartCountdown(entityId)
                            unit.SelfDestructThread = ForkThread(function()
                                WaitSeconds(5)
                                DoSelfDestruct(unit)
                            end)
                        end
                    end
                end
            end
        end
    end
end

function FireSelfdestructWeapons(unit)
    local wepCount = unit:GetWeaponCount()
    for i = 1, wepCount do
        local wep = unit:GetWeapon(i)
        local wepBP = wep:GetBlueprint()
        if wepBP.FireOnSelfDestruct then
            if wep.Fire then
                wep.Fire()
            else
                wep.OnFire(wep)
            end
        end
    end
end
