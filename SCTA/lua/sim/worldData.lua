maps = import('Worlds.lua').maps
terrain = import('Worlds.lua').terrain
TAutils = import('/mods/SCTA/lua/TAutils.lua')

function GetTerrain()
	local map = GetMap()
	for k,v in terrain do
		if v.name == map.type then
			return terrain[k]
		end
	end
	return terrain[1]
end

function GetMap()
	for k,v in maps do
		if v.name == ScenarioInfo.name then
			return maps[k]
		end
	end
	return maps[1]
end

function GetWindDirection()
	return TAutils.wind.direction
end

function GetWindAmount()
	return TAutils.wind.amount
end

function GetWindEnergy()
	return GetWindAmount() / 167
end

function GetTidalEnergy()
	return GetMap().tidal
end