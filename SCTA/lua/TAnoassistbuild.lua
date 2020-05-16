local TAunit = import('TAunit.lua').TAunit

TAnoassistbuild = Class(TAunit)
{
    noassistbuild = true,

    -- prompt assisting units to reassess whether they can assist
    -- (they can't assist-build, only assit-repair)
    -- see TAconstructor.OnStartBuild, which returns immediately if not full health
    OnDamage = function(self, instigator, amount, vector, damageType)
        TAunit.OnDamage(self, instigator, amount, vector, damageType)

        for _, v in self:GetGuards() do
            if not v.Dead then
                IssueClearCommands({v})
                IssueGuard({v},self)
            end
        end
    end,

}
