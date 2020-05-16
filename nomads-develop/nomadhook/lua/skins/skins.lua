do

skins = table.merged( skins, {

    nomads = {
        default = "default",
        texturesPath = "/textures/ui/nomads",
        imagerMesh = "/meshes/game/map-border_squ_nomads_mesh",
        imagerMeshHorz = "/meshes/game/map-border_hor_nomads_mesh",
        buttonFont = "Zeroes Three",
        factionFont = "Zeroes Three",
        bodyFont = "Arial",
        fixedFont = "Arial",
        titleFont = "Zeroes Three",
        bodyColor = "FFC1782A",
        factionFontOverColor = "FFff0000",
        factionFontDownColor = "FFFFFFFF",
        factionTextColor = "FFFC8F00",
        factionBackColor = "FFD68E00",
        fontOverColor = "FFFFFFFF",
        fontDownColor = "FF513923",
        fontColor = "FFFC8F00",
        dialogCaptionColor = "FFD6C6BC",
        dialogColumnColor = "FFAD976E",
        dialogButtonColor = "FF4EAA7F",
        dialogButtonFont = "Zeroes Three",
        highlightColor = "FFA59075",
        disabledColor = "FF3D3630",
        tooltipBorderColor = "FFAF886D",
        tooltipTitleColor = "FF3F1700",
        tooltipBackgroundColor = "FF000000",
        dialogColumnColor = "FFC1782A",
        menuFontSize = 18,
        layouts = {
            "bottom",
            "left",
            "right"
        },
    },
})

-- Do this again since now nomads isn't flattened yet and we added things to default.
-- Flatten skins for performance. Note that this doesn't avoid the need to scan texture paths.
for k, v in skins do
    local default = skins[v.default]
    while default do
        -- Copy the entire default chain into the toplevel skin.
        table.assimilate(v, default)

        default = skins[default.default]
    end
end

end
