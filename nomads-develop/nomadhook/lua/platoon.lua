do


-- Adding Nomads experimentals for better AI support

local oldPlatoon = Platoon

Platoon = Class(oldPlatoon) {

    ExperimentalAIHub = function(self)
        --LOG('*DEBUG: AI ExperimentalAIHub')
        local experimental = self:GetPlatoonUnits()[1]
        if experimental then
            local behaviors = import('/lua/ai/AIBehaviors.lua')
            local ID = experimental.UnitId
            --LOG('*DEBUG: AI choosing behavior for nomads experimental '..repr(ID))
            if ID == 'xna0401' then
                return behaviors.CometBehavior(self)
            elseif ID == 'xnl0402' then
                return behaviors.BeamerBehavior(self)
            elseif ID == 'xnl0403' then
                return behaviors.CrawlerBehavior(self)
            elseif ID == 'xnl0401' then
                return behaviors.BullfrogBehavior(self)
            end
        end

        return oldPlatoon.ExperimentalAIHub(self)
    end,

    ExperimentalAIHubSorian = function(self)
        -- trying to have Sorian support Nomads aswell. This is mostly copy-paste from Sorians code. Hooking doesn't work here
        -- because the function call seems to be terminated when one of the behaviours is returned. So by using hooking only the call to
        -- SOrians function is executed. Everything coming after (Nomads code) is neglected.
        --local ret = oldPlatoon.ExperimentalAIHubSorian(self)

        --LOG('*DEBUG: AI ExperimentalAIHubSorian')

        local experimental = self:GetPlatoonUnits()[1]
        if experimental then
            local ID = experimental.UnitId

            if ID == 'xna0401' or ID == 'xnl0402' or ID == 'xnl0403' or ID == 'xnl0401' then

                -- The next 7 lines or so are copy-paste from Sorian
                local aiBrain = self:GetBrain()
                if Random(1,5) == 3 and (not aiBrain.LastTaunt or GetGameTimeSeconds() - aiBrain.LastTaunt > 90) then
                    local randelay = Random(60,180)
                    aiBrain.LastTaunt = GetGameTimeSeconds() + randelay
                    local SUtils = import('/lua/AI/sorianutilities.lua')
                    SUtils.AIDelayChat('enemies', ArmyBrains[aiBrain:GetArmyIndex()].Nickname, 't4taunt', nil, randelay)
                end
                self:SetPlatoonFormationOverride('AttackFormation')


                local behaviors = import('/lua/ai/AIBehaviors.lua')
                --LOG('*DEBUG: AI choosing behavior for nomads experimental '..repr(ID))
                if ID == 'xna0401' then
                    return behaviors.CometBehavior(self)
                elseif ID == 'xnl0402' then
                    return behaviors.BeamerBehavior(self)
                elseif ID == 'xnl0403' then
                    return behaviors.CrawlerBehavior(self)
                elseif ID == 'xnl0401' then
                    return behaviors.BullfrogBehavior(self)
                end
            end
        end

        --return ret
        return oldPlatoon.ExperimentalAIHubSorian(self)
    end,
}



end