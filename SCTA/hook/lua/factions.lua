-- Note that the order here will determine the faction index
-- (it's the automatically assigned array index)
Factions = {
    {
        Key = 'arm',
        Category = 'ARM',
        DisplayName = "ARM",
        SoundPrefix = 'ARM',
        InitialUnit = 'ARMCOM',
        CampaignFileDesignator = 'M',
        TransmissionLogColor = 'ff0000ff',
        Icon = "/mods/SCTA/textures/ui/common/widgets/faction-icons-alpha_bmp/arm_ico.dds",
        VeteranIcon = "/mods/SCTA/textures/ui/common/game/veteran-logo_bmp/arm-veteran_bmp.dds",
        SmallIcon = "/mods/SCTA/textures/ui/common/faction_icon-sm/arm_ico.dds",
        LargeIcon = "/mods/SCTA/textures/ui/common/faction_icon-lg/arm_ico.dds",
        TooltipID = 'lob_arm',
        DefaultSkin = 'uef',
        loadingMovie = '/movies/UEF_load.sfd',
        loadingColor = 'FFbadbdb',
        loadingTexture = '/UEF_load.dds',
        IdleEngTextures = {
            T1 = '/mods/SCTA/textures/ui/common/icons/units/armck_icon.dds',
            T2 = '/mods/SCTA/textures/ui/common/icons/units/armack_icon.dds',
            T3 = '/icons/units/xsl0309_icon.dds',
            SCU = '/icons/units/xsl0301_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/mods/SCTA/textures/ui/common/icons/units/armlab_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/armalab_icon.dds',
                '/icons/units/xsb0301_icon.dds',
            },
            AIR = {
                '/mods/SCTA/textures/ui/common/icons/units/armap_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/armaap_icon.dds',
                '/icons/units/xsb0302_icon.dds',
            },
            NAVAL = {
                '/mods/SCTA/textures/ui/common/icons/units/armsy_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/armasy_icon.dds',
                '/icons/units/xsb0303_icon.dds',
            },
        },
    },

    {
        Key = 'core',
        Category = 'CORE',
        DisplayName = 'CORE',
        SoundPrefix = 'CORE',
        InitialUnit = 'CORCOM',
        CampaignFileDesignator = 'K',
        TransmissionLogColor = 'ffff0000',
        Icon = "/mods/SCTA/textures/ui/common/widgets/faction-icons-alpha_bmp/core_ico.dds",
        VeteranIcon = "/mods/SCTA/textures/ui/common/game/veteran-logo_bmp/core-veteran_bmp.dds",
        SmallIcon = "/mods/SCTA/textures/ui/common/faction_icon-sm/core_ico.dds",
        LargeIcon = "/mods/SCTA/textures/ui/common/faction_icon-lg/core_ico.dds",
        TooltipID = 'lob_core',
        DefaultSkin = 'cybran',
        loadingMovie = '/movies/cybran_load.sfd',
        loadingColor = 'FFe24f2d',
        loadingTexture = '/cybran_load.dds',
        IdleEngTextures = {
            T1 = '/mods/SCTA/textures/ui/common/icons/units/corck_icon.dds',
            T2 = '/mods/SCTA/textures/ui/common/icons/units/corack_icon.dds',
            T3 = '/icons/units/xsl0309_icon.dds',
            SCU = '/icons/units/xsl0301_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/mods/SCTA/textures/ui/common/icons/units/corlab_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/coralab_icon.dds',
                '/icons/units/xsb0301_icon.dds',
            },
            AIR = {
                '/mods/SCTA/textures/ui/common/icons/units/corap_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/coraap_icon.dds',
                '/icons/units/xsb0302_icon.dds',
            },
            NAVAL = {
                '/mods/SCTA/textures/ui/common/icons/units/corsy_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/corasy_icon.dds',
                '/icons/units/xsb0303_icon.dds',
            },
        },
    },
}

-- map faction key to index, as this lookup is done frequently
FactionIndexMap = {}

-- file designator to faction key
FactionDesToKey = {}

for index, value in Factions do
    FactionIndexMap[value.Key] = index
    FactionDesToKey[value.CampaignFileDesignator] = value.Key
end
