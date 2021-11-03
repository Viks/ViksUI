
----------------------------------------------------------------------
-- 	This is taken from Leatrix Maps, and recoded for ViksUI
--  All credit goes to Leatrix
----------------------------------------------------------------------
-- Create locale structure

----------------------------------------------------------------------
-- Leatrix Maps
----------------------------------------------------------------------

-- Hide the map frame title text
WorldMapFrameTitleText:Hide()


----------------------------------------------------------------------
-- Show points of interest
----------------------------------------------------------------------

local dnTex, rdTex = "Dungeon", "Raid"
local pATex, pHTex, pNTex = "TaxiNode_Continent_Alliance", "TaxiNode_Continent_Horde", "TaxiNode_Continent_Neutral"

local PinData = {
	-- World Of Warcraft: Eastern Kingdoms
	[27] =  --[[Dun Morogh]] {{31.1, 37.9, "Gnomeregan", "Dungeon", 231, dnTex},},
	[15] =  --[[Badlands]] {{41.7, 11.6, "Uldaman", "Dungeon", 239, dnTex},},
	[16] =  --[[Uldaman]] {{36.7, 29.4, "Uldaman", "Dungeon", 239, dnTex},},
	[18] =  --[[Tirisfal Glades]] {{82.5, 33.3, "Scarlet Halls" .. ", " .. "Scarlet Monastery", "Dungeon", 316, dnTex}, {61.9, 59.0, "Stranglethorn Vale", "Portal", 0, pHTex}, {60.7, 58.7, "Orgrimmar", "Portal", 0, pHTex}, {59.1, 58.9, "Howling Fjord", "Portal", 0, pHTex}, {59.4, 67.4, "Silvermoon City", "Orb of Translocation", 0, pHTex},},
	[19] =  --[[Scarlet Monastery]] {{69.2, 24.4, "Scarlet Monastery", "Dungeon", 316, dnTex}, {78.6, 58.9, "Scarlet Halls", "Dungeon", 311, dnTex},},
	[21] =  --[[Silverpine Forest]] {{44.8, 67.8, "Shadowfang Keep", "Dungeon", 64, dnTex},},
	[22] =  --[[Western Plaguelands]] {{69.6, 73.2, "Scholomance", "Dungeon", 246, dnTex},},
	[23] =  --[[Eastern Plaguelands]] {{27.7, 11.6, "Stratholme: Crusader's Square", "Dungeon", 236, dnTex}, {43.5, 19.4, "Stratholme: The Gauntlet", "Dungeon", 236, dnTex},},
	[30] =  --[[New Tinkertown]] {{30.2, 74.7, "Gnomeregan", "Dungeon", 231, dnTex},},
	[32] =  --[[Searing Gorge]] {{34.9, 83.9, "Blackrock Mountain", "Blackrock Caverns" .. "," .. "Blackrock Depths" .. "|n" .. "Blackrock Spire" .. "," .. "Blackwing Lair" .. "," .. "Molten Core", 66, dnTex},},
	[33] =  --[[Blackrock Mountain]] {{66.5, 60.7, "Blackrock Caverns", "Dungeon", 66, dnTex}, {64.3, 70.9, "Blackwing Lair", "Raid", 742, rdTex}, {65.9, 41.9, "Blackrock Spire", "Dungeon", 229, dnTex}, {80.3, 40.7, "Lower Blackrock Spire", "Dungeon", 229, dnTex}, {79.0, 33.7, "Upper Blackrock Spire", "Dungeon", 559, dnTex},},
	[34] =  --[[Blackrock Mountain]] {{71.9, 53.5, "Blackrock Caverns", "Dungeon", 66, dnTex},},
	[35] =  --[[Blackrock Mountain]] {{54.3, 83.4, "Molten Core", "Raid", 741, rdTex}, {39.0, 18.3, "Blackrock Depths", "Dungeon", 228, dnTex},},
	[36] =  --[[Burning Steppes]] {{21.0, 37.9, "Blackrock Mountain", "Blackrock Caverns" .. "," .. "Blackrock Depths" .. "|n" .. "Blackrock Spire" .. "," .. "Blackwing Lair" .. "," .. "Molten Core", 66, dnTex}, {23.0, 26.3, "Blackwing Descent", "Raid", 73, rdTex},},
	[37] =  --[[Elwynn Forest]] {{19.1, 36.9, "The Stockade", "Dungeon", 238, dnTex},},
	[42] =  --[[Deadwind Pass]] {{46.9, 74.7, "Karazhan", "Raid", 745, rdTex}, {46.7, 70.2, "Return to Karazhan", "Dungeon", 860, dnTex},},
	[50] =  --[[Northern Stranglethorn]] {{72.1, 32.9, "Zul'Gurub", "Dungeon", 76, dnTex}, {37.6, 51.0, "Undercity", "Portal", 0, pHTex},},
	[51] =  --[[Swamp of Sorrows]] {{69.7, 53.5, "Temple of Atal'Hakkar", "Dungeon", 237, dnTex},},
	[52] =  --[[Westfall]] {{42.6, 71.8, "The Deadmines", "Dungeon", 63, dnTex},},
	[55] =  --[[The Deadmines]] {{25.5, 51.1, "The Deadmines", "Dungeon", 63, dnTex},},
	[84] =  --[[Stormwind City]] {{49.5, 69.5, "The Stockade", "Dungeon", 238, dnTex}, {74.4, 18.4, "Eastern Earthshrine", "Deepholm" .. ", " .. "Hyjal" .. ", " .. "Tol Barad" .. ", " .. "Twilight Highlands" .. ", " .. "Uldum" .. ", " .. "Vashj'ir", 0, pATex, nil, nil, nil, nil},},
	[90] =  --[[Undercity]] {{85.3, 17.1, "Hellfire Peninsula", "Portal", 0, pHTex},},
	[224] =  --[[Stranglethorn Vale]] {{63.5, 21.6, "Zul'Gurub", "Dungeon", 76, dnTex},},
	[243] =  --[[Blackrock Depths]] {{68.4, 38.3, "Molten Core", "Raid", 741, rdTex},},
	[469] =  --[[New Tinkertown]] {{32.6, 37.0, "Gnomeregan", "Dungeon", 231, dnTex},},

	-- World Of Warcraft: Kalimdor
	[10] =  --[[Northern Barrens]] {{38.9, 69.1, "Wailing Caverns", "Dungeon", 240, dnTex},},
	[11] =  --[[Wailing Caverns]] {{55.1, 65.9, "Wailing Caverns", "Dungeon", 240, dnTex},},
	[57] =  --[[Teldrassil]] {{55.0, 93.7, "Stormwind", "Portal", 0, pATex}, {52.3, 89.5, "Exodar", "Portal", 0, pATex},},
	[63] =  --[[Ashenvale]] {{14.2, 13.9, "Blackfathom Deeps", "Dungeon", 227, dnTex},},
	[64] =  --[[Thousand Needles]] {{41.5, 29.4, "Razorfen Downs", "Dungeon", 233, dnTex},},
	[66] =  --[[Desolace]] {{29.1, 62.6, "Maraudon", "Dungeon", 232, dnTex},},
	[67] =  --[[Maraudon]] {{78.2, 56.0, "Maraudon: Foulspore Cavern", "Dungeon", 232, dnTex},},
	[68] =  --[[Maraudon]] {{44.4, 76.8, "Maraudon: Earth Song Falls", "Dungeon", 232, dnTex}, {52.0, 24.5, "Maraudon: The Wicked Grotto", "Dungeon", 232, dnTex},},
	[69] =  --[[Feralas]] {{60.3, 31.3, "Dire Maul: Capital Gardens", "Dungeon", 230, dnTex}, {64.8, 30.2, "Dire Maul: Warpwood Quarter", "Dungeon", 230, dnTex}, {62.5, 24.9, "Dire Maul: Gordok Commons", "Dungeon", 230, dnTex},},
	[70] =  --[[Dustwallow Marsh]] {{52.2, 75.7, "Onyxia's Lair", "Raid", 760, rdTex},},
	[71] =  --[[Tanaris]] {{39.2, 21.3, "Zul'Farrak", "Dungeon", 241, dnTex}, {64.8, 50.0, "Caverns of Time", "Black Morass" .. ", " .. "Culling of Stratholme" .. ",|n" .. "Dragon Soul" .. ", " .. "End Time" .. ", " .. "Hour of Twilight" .. ",|n" .. "Hyjal Summit" .. ", " .. "Old Hillsbrad Foothills" .. ",|n" .. "Well of Eternity", 255, dnTex},},
	[75] =  --[[Caverns of Time]] {{57.5, 82.6, "The Culling of Stratholme", "Dungeon", 279, dnTex}, {36.7, 83.0, "The Black Morass", "Dungeon", 255, dnTex}, {22.5, 64.4, "Well of Eternity", "Dungeon", 185, dnTex}, {26.9, 35.8, "Old Hillsbrad Foothills", "Dungeon", 251, dnTex}, {35.5, 15.6, "Hyjal Summit", "Raid", 750, rdTex}, {57.3, 29.6, "End Time", "Dungeon", 184, dnTex}, {61.6, 26.6, "Dragon Soul", "Raid", 187, rdTex}, {66.9, 29.4, "Hour of Twilight", "Dungeon", 186, dnTex},},
	[81] =  --[[Silithus]] {{43.2, 44.5, "Chamber of Heart", "Titan Translocator", 0, pNTex}, {41.5, 44.9, "Tiragarde Sound", "Portal", 0, pATex}, {41.6, 45.2, "Zuldazar", "Portal", 0, pHTex},},
	[85] =  --[[Orgrimmar]] {{55.2, 51.2, "Ragefire Chasm", "Dungeon", 226, dnTex}, {50.1, 37.8, "Western Earthshrine", "Deepholm" .. ", " .. "Hyjal" .. ", " .. "Twilight Highlands" .. ", " .. "Uldum" .. ", " .. "Vashj'ir", 0, pHTex, nil, nil, nil, nil}, {47.4, 39.3, "Tol Barad", "Portal", 0, pHTex, nil, nil, nil, nil}, {43.0, 65.0, "Zeppelin to" .." " .. "Thunder Bluff" .. ", " .. "Mulgore", "", 0, pHTex}, {50.7, 55.5, "Undercity", "Portal", 0, pHTex},},
	[86] =  --[[Orgrimmar]] {{70.0, 49.2, "Ragefire Chasm", "Dungeon", 226, dnTex}, {50.1, 37.8, "Western Earthshrine", "Deepholm" .. ", " .. "Hyjal" .. ", " .. "Twilight Highlands" .. ", " .. "Uldum" .. ", " .. "Vashj'ir", 0, pHTex, nil, nil, nil, nil}, {47.4, 39.3, "Tol Barad", "Portal", 0, pHTex, nil, nil, nil, nil}, {43.0, 65.0, "Zeppelin to" .." " .. "Thunder Bluff" .. ", " .. "Mulgore", "", 0, pHTex}, {50.7, 55.5, "Undercity", "Portal", 0, pHTex},},
	[88] =  --[[Thunder Bluff]] {{14.6, 26.4, "Zeppelin to" .. " " .. "Orgrimmar" .. ", " .. "Durotar", "", 0, pHTex},},
	[89] =  --[[Darnassus]] {{44.1, 78.5, "Temple of the Moon", "Exodar" .. ", " .. "Hellfire Peninsula", 0, pATex},},
	[97] =  --[[Azuremyst Isle]] {{20.4, 54.1, "Darnassus", "Portal", 0, pATex},},
	[199] =  --[[Southern Barrens]] {{41.0, 94.6, "Razorfen Kraul", "Dungeon", 234, dnTex},},
	[247] =  --[[Ruins of Ahn'Qiraj]] {{59.3, 28.7, "Scarab Coffer", "Chest", 0, chTex}, {60.8, 51.0, "Scarab Coffer", "Chest", 0, chTex}, {73.0, 66.4, "Scarab Coffer", "Chest", 0, chTex},  {57.4, 78.3, "Scarab Coffer", "Chest", 0, chTex}, {54.8, 87.5, "Scarab Coffer", "Chest", 0, chTex}, {41.0, 76.9, "Scarab Coffer", "Chest", 0, chTex}, {34.0, 53.0, "Scarab Coffer", "Chest", 0, chTex}, {41.1, 32.2, "Scarab Coffer", "Chest", 0, chTex}, {41.6, 46.3, "Scarab Coffer", "Chest", 0, chTex}, {46.7, 42.0, "Scarab Coffer", "Chest", 0, chTex},}, 
	[319] =  --[[Temple of Ahn'Qiraj]] {{33.1, 48.4, "Large Scarab Coffer", "Chest", 0, chTex}, {64.5, 25.5, "Large Scarab Coffer", "Chest", 0, chTex}, {58.4, 49.9, "Large Scarab Coffer", "Chest", 0, chTex}, {47.5, 54.7, "Large Scarab Coffer", "Chest", 0, chTex}, {56.2, 66.0, "Large Scarab Coffer", "Chest", 0, chTex}, {50.7, 78.1, "Large Scarab Coffer", "Chest", 0, chTex}, {51.4, 83.2, "Large Scarab Coffer", "Chest", 0, chTex}, {48.4, 85.4, "Large Scarab Coffer", "Chest", 0, chTex}, {48.0, 81.1, "Large Scarab Coffer", "Chest", 0, chTex}, {34.2, 83.5, "Large Scarab Coffer", "Chest", 0, chTex}, {39.2, 68.4, "Large Scarab Coffer", "Chest", 0, chTex},}, 
	[327] =  --[[Ahn'Qiraj: The Fallen Kingdom]] {{46.8, 7.5, "Temple of Ahn'Qiraj", "Raid", 744, rdTex}, {58.9, 14.3, "Ruins of Ahn'Qiraj", "Raid", 743, rdTex},},

	-- The Burning Crusade
	[95] =  --[[Ghostlands]] {{82.1, 64.3, "Zul'Aman", "Dungeon", 77, dnTex},},
	[100] =  --[[Hellfire Peninsula]] {{46.6, 52.8, "Magtheridon's Lair", "Raid", 747, rdTex}, {47.7, 53.6, "Hellfire Ramparts", "Dungeon", 248, dnTex}, {47.7, 52.0, "The Shattered Halls", "Dungeon", 259, dnTex}, {46.0, 51.8, "The Blood Furnace", "Dungeon", 256, dnTex}, {88.6, 47.7, "Orgrimmar", "Portal", 0, pHTex}, {88.6, 52.8, "Stormwind", "Portal", 0, pATex},},
	[102] =  --[[Zangarmarsh]] {{50.4, 40.9, "Coilfang Reservoir", "Serpentshrine Cavern" .. ", " .. "Slave Pens" .. ",|n" .. "Steamvault" .. ", " .. "Underbog", 748, dnTex},},
	[103] =  --[[The Exodar]] {{48.3, 62.9, "Stormwind", "Portal", 0, pATex},},
	[104] =  --[[Shadowmoon Valley]] {{71.0, 46.4, "Black Temple", "Raid", 751, rdTex},},
	[105] =  --[[Blade's Edge Mountains]] {{68.7, 24.3, "Gruul's Lair", "Raid", 746, rdTex},},
	[108] =  --[[Terokkar Forest]] {{43.2, 65.6, "Sethekk Halls", "Dungeon", 252, dnTex}, {36.1, 65.6, "Auchenai Crypts", "Dungeon", 247, dnTex}, {39.6, 71.0, "Shadow Labyrinth", "Dungeon", 253, dnTex}, {39.7, 60.2, "Mana-Tombs", "Dungeon", 250, dnTex},},
	[109] =  --[[Netherstorm]] {{70.6, 69.7, "The Mechanar", "Dungeon", 258, dnTex}, {73.7, 63.7, "The Eye", "Raid", 749, rdTex}, {71.7, 55.0, "The Botanica", "Dungeon", 257, dnTex}, {74.4, 57.7, "The Arcatraz", "Dungeon", 254, dnTex},},
	[110] =  --[[Silvermoon City]] {{58.5, 18.7, "Orgrimmar", "Portal", 0, pHTex}, {49.5, 14.8, "Undercity", "Orb of Translocation", 0, pHTex}, {58.5, 18.7, "Orgrimmar", "Portal", 0, pHTex},},
	[111] =  --[[Shattrath City]] {{48.5, 42.0, "Isle of Quel'Danas", "Portal", 0, pNTex}, {56.8, 48.9, "Orgrimmar", "Portal", 0, pHTex}, {57.2, 48.3, "Stormwind", "Portal", 0, pATex},},
	[122] =  --[[Isle of Quel'Danas]] {{61.2, 30.9, "Magisters' Terrace", "Dungeon", 249, dnTex}, {44.3, 45.6, "Sunwell Plateau", "Raid", 752, rdTex},},
	[245] =  --[[Tol Barad Peninsula]] {{56.3, 79.7, "Orgrimmar", "Portal", 0, pHTex}, {75.3, 58.8, "Stormwind", "Portal", 0, pATex},},

	-- Wrath Of The Lich King
	[114] =  --[[Borean Tundra]] {{27.6, 26.6, "The Nexus", "The Nexus" .. ", " .. "The Oculus" .. ",|n" .. "The Eye of Eternity", 281, dnTex},},
	[115] =  --[[Dragonblight]] {{59.6, 51.1, "Wyrmrest Temple", "The Ruby Sanctum" .. ", " .. "The Obsidian Sanctum", 761, dnTex}, {87.4, 51.1, "Naxxramas", "Raid", 754, rdTex}, {26.2, 49.6, "Azjol-Nerub", "Azjol-Nerub" .. ", " .. "The Old Kingdom", 272, dnTex},},
	[116] =  --[[Grizzly Hills]] {{17.5, 27.0, "Drak'Tharon Keep", "Dungeon", 273, dnTex},},
	[117] =  --[[Howling Fjord]] {{57.3, 46.8, "Utgarde Keep", "Utgarde Keep" .. ", " .. "Utgarde Pinnacle", 285, dnTex},},
	[118] =  --[[Icecrown]] {{53.3, 85.5, "Icecrown Citadel", "Raid", 758, rdTex}, {52.6, 89.4, "The Frozen Halls", "The Forge of Souls" .. ", " .. "The Pit of Saron" .. ",|n" .. "The Halls of Reflection", 280, dnTex}, {74.2, 20.5, "Trial of the Champion", "Dungeon", 284, dnTex}, {75.1, 21.8, "Trial of the Crusader", "Raid", 757, rdTex},},
	[120] =  --[[The Storm Peaks]] {{39.6, 26.9, "Halls of Stone", "Dungeon", 277, dnTex}, {45.4, 21.4, "Halls of Lightning", "Dungeon", 275, dnTex}, {41.6, 17.8, "Ulduar", "Raid", 759, rdTex},},
	[121] =  --[[Zul'Drak]] {{29.0, 83.9, "Drak'Tharon Keep", "Dungeon", 273, dnTex}, {76.2, 21.1, "Gundrak", "Dungeon", 274, dnTex}, {81.2, 28.9, "Gundrak (rear entrance)", "Dungeon", 274, dnTex},},
	[123] =  --[[Wintergrasp]] {{50.5, 16.4, "Vault of Archavon", "Raid", 753, rdTex},},
	[125] =  --[[Dalaran]] {{66.8, 68.2, "The Violet Hold", "Dungeon", 283, dnTex}, {40.1, 62.8, "Stormwind", "Portal", 0, pATex}, {55.3, 25.4, "Orgrimmar", "Portal", 0, pHTex},},

	-- Cataclysm
	[198] =  --[[Mount Hyjal]] {{47.3, 78.0, "Firelands", "Raid", 78, rdTex},},
	[203] =  --[[Vashj'ir]] {{49.1, 42.4, "Throne of the Tides", "Dungeon", 65, dnTex},},
	[204] =  --[[Abyssal Depths]] {{70.8, 29.0, "Throne of the Tides", "Dungeon", 65, dnTex},},
	[207] =  --[[Deepholm]] {{47.6, 52.0, "The Stonecore", "Dungeon", 67, dnTex},},
	[241] =  --[[Twilight Highlands]] {{34.0, 78.0, "The Bastion of Twilight", "Raid", 72, rdTex}, {19.2, 54.0, "Grim Batol", "Dungeon", 71, dnTex},},
	[244] =  --[[Tol Barad]] {{46.3, 47.9, "Baradin Hold", "Raid", 75, rdTex},},
	[249] =  --[[Uldum]] {{71.6, 52.2, "Halls of Origination", "Dungeon", 70, dnTex}, {60.5, 64.2, "Lost City of the Tol'vir", "Dungeon", 69, dnTex}, {76.7, 84.4, "The Vortex Pinnacle", "Dungeon", 68, dnTex}, {38.4, 80.6, "Throne of the Four Winds", "Raid", 74, rdTex},},

	-- Mists Of Pandaria
	[371] =  --[[The Jade Forest]] {{56.2, 57.9, "Temple of the Jade Serpent", "Dungeon", 313, dnTex},},
	[376] =  --[[Valley of the Four Winds]] {{36.1, 69.2, "Stormstout Brewery", "Dungeon", 302, dnTex},},
	[379] =  --[[Kun-Lai Summit]] {{59.6, 39.2, "Mogu'shan Vaults", "Raid", 317, rdTex}, {36.7, 47.4, "Shado-Pan Monastery", "Dungeon", 312, dnTex},},
	[388] =  --[[Townlong Steppes]] {{34.7, 81.5, "Siege of Niuzao Temple", "Dungeon", 324, dnTex},},
	[390] =  --[[Vale of Eternal Blossoms]] {{80.9, 32.7, "Mogu'shan Palace", "Dungeon", 321, dnTex}, {72.4, 44.2, "Siege of Orgrimmar", "Raid", 369, rdTex}, {15.8, 74.3, "Gate of the Setting Sun", "Dungeon", 303, dnTex},},
	[422] =  --[[Dread Wastes]] {{38.8, 35.0, "Heart of Fear", "Raid", 330, rdTex},},
	[433] =  --[[The Veiled Stair]] {{48.4, 61.4, "Terrace of Endless Spring", "Raid", 320, rdTex},},
	[504] =  --[[Isle of Thunder]] {{63.6, 32.3, "Throne of Thunder", "Raid", 362, rdTex},},
	[392] =  --[[Shrine of Two Moons]] {{73.3, 42.8, "Orgrimmar", "Portal", 0, pHTex},},
	[394] =  --[[Shrine of Seven Stars]] {{71.6, 36.0, "Stormwind", "Portal", 0, pATex},},

	-- Warlords Of Draenor
	[525] =  --[[Frostfire Ridge]] {{49.8, 24.7, "Bloodmaul Slag Mines", "Dungeon", 385, dnTex},},
	[534] =  --[[Tanaan Jungle]] {{45.7, 53.5, "Hellfire Citadel", "Raid", 669, rdTex},},
	[535] =  --[[Talador]] {{46.3, 73.9, "Auchindoun", "Dungeon", 547, dnTex},},
	[539] =  --[[Shadowmoon Valley]] {{31.9, 42.5, "Shadowmoon Burial Grounds", "Dungeon", 537, dnTex},},
	[542] =  --[[Spires of Arak]] {{35.6, 33.6, "Skyreach", "Dungeon", 476, dnTex},},
	[543] =  --[[Gorgrond]] {{51.3, 28.6, "Blackrock Foundry", "Raid", 457, rdTex}, {55.2, 31.9, "Grimrail Depot", "Dungeon", 536, dnTex}, {59.6, 45.5, "The Everbloom", "Dungeon", 556, dnTex}, {45.4, 13.5, "Iron Docks", "Dungeon", 558, dnTex},},
	[550] =  --[[Nagrand]] {{32.9, 38.4, "Highmaul", "Raid", 477, rdTex},},
	[622] =  --[[Stormshield]] {{60.8, 38.0, "Stormwind", "Portal", 0, pATex}, {36.4, 41.1, "Lion's Watch", "Portal", 0, pATex, 38445},},
	[624] =  --[[Warspear]] {{60.6, 51.6, "Orgrimmar", "Portal", 0, pHTex}, {53.0, 43.9, "Vol'mar", "Portal", 0, pHTex, 37935},},

	-- Legion
	[885] =  --[[Antoran Wastes]] {{55.0, 62.4, "Antorus, the Burning Throne", "Raid", 946, rdTex},},
	[630] =  --[[Azsuna]] {{61.1, 41.1, "Eye of Azshara", "Dungeon", 716, dnTex}, {48.1, 82.1, "Vault of the Wardens", "Dungeon", 707, dnTex},},
	[646] =  --[[Broken Shore]] {{64.7, 16.6, "Cathedral of Eternal Night", "Dungeon", 900, dnTex}, {64.1, 21.3, "Tomb of Sargeras", "Raid", 875, rdTex},},
	[627] =  --[[Dalaran]] {{66.5, 68.6, "The Violet Hold", "Dungeon", 777, dnTex}, {39.6, 63.2, "Stormwind", "Portal", 0, pATex}, {55.2, 23.9, "Orgrimmar", "Portal", 0, pHTex},},
	[682] =  --[[Felsoul Hold]] {{53.6, 36.8, "Shal'Aran", "Portal", 0, pNTex, 41575,},},
	[650] =  --[[Highmountain]] {{49.6, 68.7, "Neltharion's Lair", "Dungeon", 767, dnTex},},
	[882] =  --[[Mac'Aree]] {{22.2, 56.2, "Seat of the Triumvirate", "Dungeon", 945, dnTex},},
	[684] =  --[[Shattered Locus]] {{40.9, 13.7, "Shal'Aran", "Portal", 0, pNTex, 42230,},},
	[634] =  --[[Stormheim]] {{70.4, 69.5, "Gates of Valor", "Halls of Valor" .. "," .. "Trial of Valor", 721, dnTex}, {52.5, 45.3, "Maw of Souls", "Dungeon", 727, dnTex},},
	[680] =  --[[Suramar]] {{21.6, 28.5, "Falanaar", "Portal", 0, pNTex, 42230,}, {39.7, 76.2, "Felsoul Hold", "Portal", 0, pNTex, 41575,}, {30.8, 11.0, "Moon Guard Stronghold", "Portal", 0, pNTex, 43808,}, {43.7, 79.2, "Lunastre Estate", "Portal", 0, pNTex, 43811,}, {36.1, 47.2, "Ruins of Elune'eth", "Portal", 0, pNTex, 40956,}, {52.0, 78.8, "Evermoon Terrace", "Portal", 0, pNTex, 42889,}, {43.4, 60.6, "Sanctum of Order", "Portal", 0, pNTex, 43813,}, {42.0, 35.2, "Tel'anor", "Portal", 0, pNTex, 43809,}, {64.0, 60.4, "Twilight Vineyards", "Portal", 0, pNTex, 44084,}, {54.5, 69.4, "Astravar Harbor", "Portal", 0, pNTex, 44740,}, {47.7, 81.4, "The Waning Crescent", "Portal", 0, pNTex, 42487, 38649,}, {43.3, 62.3, "Sanctum of Order", "The Arcway" .. "," .. "The Nighthold", 726, dnTex}, {50.9, 65.6, "Court of Stars", "Dungeon", 800, dnTex},},
	[641] =  --[[Val'sharah]] {{38.6, 51.0, "Black Rook Hold", "Dungeon", 740, dnTex}, {59.0, 31.1, "Darkheart Thicket", "Dungeon", 762, dnTex}, {56.3, 36.9, "The Emerald Nightmare", "Raid", 768, rdTex},},

	-- Battle For Azeroth
	[896] =  --[[Drustvar]] {{33.7, 12.6, "Waycrest Manor", "Dungeon", 1021, dnTex},},
	[1462]=  --[[Mechagon Island]] {{73.2, 36.3, "Operation: Mechagon", "Dungeon", 1178, dnTex},},
	[863] =  --[[Nazmir]] {{51.4, 64.9, "The Underrot", "Dungeon", 1022, dnTex}, {54.1, 63.0, "Uldir", "Raid", 1031, rdTex},},
	[942] =  --[[Stormsong Valley]] {{83.9, 46.9, "Crucible of Storms", "Raid", 1177, rdTex}, {78.9, 26.5, "Shrine of the Storm", "Dungeon", 1036, dnTex},},
	[895] =  --[[Tiragarde Sound]] {{84.5, 78.8, "Freehold", "Dungeon", 1001, dnTex},},
	[864] =  --[[Vol'dun]] {{51.9, 25.1, "Temple of Sethraliss", "Dungeon", 1030, dnTex},},
	[862] =  --[[Zuldazar]] {{43.4, 39.5, "Atal'Dazar", "Dungeon", 968, dnTex}, {37.6, 39.5, "Kings' Rest", "Dungeon", 1041, dnTex},},
	[1527] =  --[[Uldum]] {{71.6, 52.2, "Halls of Origination", "Dungeon", 70, dnTex}, {60.5, 64.2, "Lost City of the Tol'vir", "Dungeon", 69, dnTex}, {76.7, 84.4, "The Vortex Pinnacle", "Dungeon", 68, dnTex}, {38.4, 80.6, "Throne of the Four Winds", "Raid", 74, rdTex},},
	[1530] =  --[[Vale of Eternal Blossoms (N'Zoth)]] {{81.4, 30.2, "Mogu'shan Palace", "Dungeon", 321, dnTex}, {72.6, 42.0, "Siege of Orgrimmar", "Raid", 369, rdTex}, {15.5, 72.2, "Gate of the Setting Sun", "Dungeon", 303, dnTex},},
	[1161] =  --[[Boralus Harbor]] {{70.4, 17.7, "Sanctum of the Sages", "Exodar" .. ", " .. "Ironforge" .. ", " .. "Nazjatar" .. ", " .. "Silithus" .. ", " .. "Stormwind", 0, pATex},},
	[1163] =  --[[Dazar'alor]] {{60.5, 70.3, "Hall of Ancient Paths", "Nazjatar" .. ", " .. "Orgrimmar" .. ", " .. "Silithus" .. ", " .. "Silvermoon City" .. ", " .. "Thunder Bluff", 0, pHTex},},
	[1473] =  --[[Chamber of Heart]] {{50.1, 30.4, "Silithus", "Titan Translocator", 0, pNTex},},
	[1525] =  --[[Revendreth]] {{78.3, 49.1, "Halls of Atonement", "Dungeon", 1185, dnTex, nil, nil, nil, nil}, {50.9, 29.9, "Sanguine Depths", "Dungeon", 1189, dnTex, nil, nil, nil, nil}, {46.2, 41.2, "Castle Nathria", "Raid", 1190, rdTex, nil, nil, nil, nil},},
	[1533] =  --[[Bastion]] {{40.0, 55.3, "The Necrotic Wake", "Dungeon", 1182, dnTex, nil, nil, nil, nil}, {58.4, 28.7, "Spires of Ascension", "Dungeon", 1186, dnTex, nil, nil, nil, nil},},
	[1536] =  --[[Maldraxxus]] {{59.2, 64.8, "Plaguefall", "Dungeon", 1183, dnTex, nil, nil, nil, nil}, {53.0, 53.0, "Theater of Pain", "Dungeon", 1187, dnTex, nil, nil, nil, nil},},
	[1565] =  --[[Ardenweald]] {{68.7, 66.1, "De Other Side", "Dungeon", 1188, dnTex, nil, nil, nil, nil}, {35.4, 53.9, "Mists of Tirna Scithe", "Dungeon", 1184, dnTex, nil, nil, nil, nil},},
}

-- Faction specific dungeon and raid entrances
if playerFaction == "Alliance" then
	--[[Boralus]] 			PinData[1161] = PinData[1161] or {}; 	tinsert(PinData[1161], {70.5, 35.4, "Battle of Dazar'alor", "Raid", 1176, rdTex, nil, nil, nil, nil})
	--[[Boralus]] 			PinData[1161] = PinData[1161] or {}; 	tinsert(PinData[1161], {72.4, 19.0, "Siege of Boralus", "Dungeon", 1023, dnTex, nil, nil, nil, nil})
	--[[Tiragarde Snd]]		PinData[895] = PinData[895] or {}; 		tinsert(PinData[895], {74.4, 28.2, "Battle of Dazar'alor", "Raid", 1176, rdTex, nil, nil, nil, nil})
	--[[Tiragarde Snd]]		PinData[895] = PinData[895] or {}; 		tinsert(PinData[895], {74.8, 24.1, "Siege of Boralus", "Dungeon", 1023, dnTex, nil, nil, nil, nil})
	--[[Zuldazar]] 			PinData[862] = PinData[862] or {}; 		tinsert(PinData[862], {39.2, 71.5, "The MOTHERLODE!!", "Dungeon", 1012, dnTex, nil, nil, nil, nil})
	--[[Townlong Steppes]] 	PinData[388] = PinData[388] or {}; 		tinsert(PinData[388], {49.7, 68.7, "Throne of Thunder", "Raid", 362, rdTex, nil, nil, nil, nil})

elseif playerFaction == "Horde" then
	--[[Dazar'alor]] 		PinData[1165] = PinData[1165] or {}; 	tinsert(PinData[1165], {38.9, 2.7, "Battle of Dazar'alor", "Raid", 1176, rdTex, nil, nil, nil, nil})
	--[[Dazar'alor]] 		PinData[1165] = PinData[1165] or {}; 	tinsert(PinData[1165], {44.3, 92.7, "The MOTHERLODE!!", "Dungeon", 1012, dnTex, nil, nil, nil, nil})
	--[[Tiragarde Snd]]		PinData[895] = PinData[895] or {}; 		tinsert(PinData[895], {88.3, 51.0, "Siege of Boralus", "Dungeon", 1023, dnTex, nil, nil, nil, nil})
	--[[Zuldazar]] 			PinData[862] = PinData[862] or {}; 		tinsert(PinData[862], {54.3, 29.9, "Battle of Dazar'alor", "Raid", 1176, rdTex, nil, nil, nil, nil})
	--[[Zuldazar]] 			PinData[862] = PinData[862] or {}; 		tinsert(PinData[862], {56.1, 59.9, "The MOTHERLODE!!", "Dungeon", 1012, dnTex, nil, nil, nil, nil})
	--[[Townlong Steppes]] 	PinData[388] = PinData[388] or {}; 		tinsert(PinData[388], {50.6, 73.4, "Throne of Thunder", "Raid", 362, rdTex, nil, nil, nil, nil})

end

local VikMix = CreateFromMixins(MapCanvasDataProviderMixin)

function VikMix:RefreshAllData()

	-- Remove all pins created by Leatrix Maps
	self:GetMap():RemoveAllPinsByTemplate("MapInfoGlobalPinTemplate")

	-- Make new pins
	local pMapID = WorldMapFrame.mapID
	if PinData[pMapID] then
		local count = #PinData[pMapID]
		for i = 1, count do

			-- Do nothing if pinInfo has no entry for zone we are looking at
			local pinInfo = PinData[pMapID][i]
			if not pinInfo then return nil end

			-- Get POI if any quest requirements have been met
			if not pinInfo[7] or pinInfo[7] and not pinInfo[8] and C_QuestLog.IsQuestFlaggedCompleted(pinInfo[7]) or pinInfo[7] and pinInfo[8] and C_QuestLog.IsQuestFlaggedCompleted(pinInfo[7]) and not C_QuestLog.IsQuestFlaggedCompleted(pinInfo[8]) then
				if playerFaction == "Alliance" and pinInfo[6] ~= pHTex or playerFaction == "Horde" and pinInfo[6] ~= pATex then
					local myPOI = {}
					myPOI["position"] = CreateVector2D(pinInfo[1] / 100, pinInfo[2] / 100)
					myPOI["name"] = pinInfo[3]
					myPOI["description"] = pinInfo[4]
					myPOI["journalID"] = pinInfo[5]
					myPOI["atlasName"] = pinInfo[6]
					self:GetMap():AcquirePin("LeaMapsGlobalPinTemplate", myPOI)
				end
			end
		end
	end

end

MapInfoGlobalPinMixin = BaseMapPoiPinMixin:CreateSubPin("PIN_FRAME_LEVEL_DUNGEON_ENTRANCE")

function MapInfoGlobalPinMixin:OnAcquired(myInfo)
	BaseMapPoiPinMixin.OnAcquired(self, myInfo)
end

WorldMapFrame:AddDataProvider(CreateFromMixins(VikMix))

----------------------------------------------------------------------
-- Reveal unexplored areas
----------------------------------------------------------------------

-- Preset map reveal to enabled
local optRevealMap = "On"

-- Create reveal button before reveal data loads
local revBtn = CreateFrame("Button", nil, WorldMapFrame.BorderFrame)
revBtn:SetSize(1, 24)
revBtn:SetPoint("TOPRIGHT", -60, 0)
revBtn:SetHitRectInsets(0, 0, 0, 0)
revBtn:Show()

-- Create fontstring
revBtn.f = revBtn:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
revBtn.f:SetAllPoints()
revBtn.f:SetText("|TInterface\\BUTTONS\\UI-MicroStream-Red:0|t" .. "Reveal")
revBtn.f:SetJustifyH("RIGHT")

-- Set button width
revBtn:SetWidth(revBtn.f:GetStringWidth() + 40)

-- Function to set button texture
local function SetRevBtn()
	revBtn:Hide()
	if optRevealMap == "On" then
		revBtn.f:SetText("|TInterface\\BUTTONS\\UI-MicroStream-Green:0|t" .. "Hide")
	else
		revBtn.f:SetText("|TInterface\\BUTTONS\\UI-MicroStream-Red:0|t" .. "Reveal")
	end
	revBtn:Show()
end

revBtn:HookScript("OnEnter", function()
	if optRevealMap == "On" then
		revBtn.f:SetText("|TInterface\\BUTTONS\\UI-MicroStream-Green:0|t|cffffffaa" .. "Hide")
	else
		revBtn.f:SetText("|TInterface\\BUTTONS\\UI-MicroStream-Red:0|t|cffffffaa" .. "Reveal")
	end
end)

revBtn:HookScript("OnLeave", function()
	if optRevealMap == "On" then
		revBtn.f:SetText("|TInterface\\BUTTONS\\UI-MicroStream-Green:0|t|cffffd100" .. "Hide")
	else
		revBtn.f:SetText("|TInterface\\BUTTONS\\UI-MicroStream-Red:0|t|cffffd100" .. "Reveal")
	end
end)

-- Set button texture on startup
SetRevBtn()

-- Map data
local MapInfoData = {

	[2] = {["162:157:399:440"] = "440583", ["192:184:457:406"] = "271426", ["208:157:438:0"] = "271427", ["210:200:462:298"] = "271440", ["220:218:295:48"] = "271439", ["224:227:431:157"] = "271421", ["236:196:415:60"] = "271428", ["244:222:282:174"] = "440584", ["248:158:302:264"] = "271422", ["254:258:304:312"] = "271443, 440585", ["259:165:309:0"] = "271435, 271442, 271435, 271442", ["330:255:429:413"] = "271437, 440582",},
	[8] = {["172:205:248:321"] = "272176", ["174:185:449:340"] = "272180", ["186:185:514:43"] = "272169", ["186:216:448:101"] = "272177", ["187:165:435:224"] = "272185", ["190:172:331:0"] = "272172", ["201:167:333:202"] = "272178", ["208:300:530:138"] = "272186, 457475", ["218:192:226:220"] = "272181", ["222:202:400:0"] = "272179", ["237:184:201:0"] = "457473", ["260:243:527:291"] = "272170, 457474", ["302:223:319:273"] = "272173, 457470", ["373:259:208:62"] = "272187, 272171, 457476, 457477", ["446:264:286:401"] = "272168, 272165, 457471, 457472",},
	[11] = {["207:332:555:129"] = "270569, 438215", ["219:175:547:379"] = "270585", ["233:193:362:275"] = "270559", ["239:231:481:254"] = "270574", ["241:195:290:104"] = "270554", ["243:217:448:127"] = "270584", ["257:249:403:6"] = "270564, 438223", ["261:216:258:6"] = "438216, 438217", ["278:209:511:7"] = "270553, 438214", ["283:270:116:57"] = "270572, 438218, 438219, 438220", ["315:212:556:456"] = "270573, 438222", ["336:289:344:379"] = "270565, 438224, 438225, 438226", ["377:325:152:318"] = "438227, 438228, 438229, 438230", ["446:256:100:208"] = "270560, 438221",},
	[15] = {["183:238:506:126"] = "270360", ["196:270:293:145"] = "270352, 438180", ["210:227:404:144"] = "270350", ["212:305:0:144"] = "438173, 438174", ["215:188:332:273"] = "438169", ["220:287:85:24"] = "270347, 438168", ["227:268:132:105"] = "270351, 438179", ["228:227:201:312"] = "270346", ["237:252:261:416"] = "270348", ["249:278:171:123"] = "270349, 438167", ["252:258:327:367"] = "270342, 438166", ["260:220:476:359"] = "270353, 438184", ["270:271:581:118"] = "270336, 438176, 438177, 438178", ["273:268:77:400"] = "270361, 438170, 438171, 438172", ["284:306:21:269"] = "270358, 438181, 438182, 438183", ["306:248:430:249"] = "270343, 438175",},
	[16] = {["209:196:411:116"] = "270532", ["214:285:144:99"] = "270525, 270521", ["236:260:504:19"] = "270530, 442231", ["252:353:0:66"] = "270529, 442225, 270529, 442225", ["266:210:336:0"] = "442238, 442239", ["274:448:407:220"] = "270540, 270527, 442226, 442227", ["285:223:230:68"] = "270543, 442224", ["328:313:175:178"] = "442232, 442233, 442234, 442235", ["339:347:0:281"] = "270520, 442228, 442229, 442230", ["342:353:230:315"] = "270522, 270550, 270528, 270536", ["469:613:533:55"] = "270534, 270551, 270546, 270535, 442236, 442237",},
	[18] = {["168:170:375:102"] = "391431", ["195:199:436:0"] = "438233", ["199:191:333:474"] = "438238", ["218:183:459:97"] = "391430", ["233:266:386:374"] = "438236, 438237", ["235:188:327:182"] = "391434", ["238:195:225:110"] = "391425", ["240:270:578:91"] = "438234, 438235", ["268:354:533:268"] = "438243, 438244, 438245, 438246", ["272:206:258:0"] = "391435, 438231", ["295:205:530:6"] = "391432, 438232", ["308:226:144:175"] = "391429, 391428", ["348:357:132:311"] = "438247, 438248, 438249, 438250", ["370:298:368:179"] = "438239, 438240, 438241, 438242",},
	[19] = {["161:234:692:99"] = "272996", ["175:210:686:232"] = "273000", ["179:169:389:255"] = "440917", ["190:214:477:129"] = "273020", ["199:182:480:252"] = "273015", ["210:292:573:122"] = "273009, 273002", ["212:177:418:317"] = "273016", ["225:281:347:325"] = "273003, 440921", ["242:179:594:324"] = "273006", ["250:279:752:150"] = "272999, 440935", ["262:262:740:47"] = "440926, 440927, 440928, 440929", ["285:260:324:90"] = "273019, 440914, 440915, 440916", ["286:225:201:192"] = "273017, 440930", ["293:338:709:330"] = "440931, 440932, 440933, 440934", ["390:267:423:359"] = "440922, 440923, 440924, 440925", ["431:407:9:207"] = "273001, 440918, 440919, 440920",},
	[22] = {["152:189:433:327"] = "440742", ["162:172:461:77"] = "440744", ["174:199:323:68"] = "440735", ["176:152:471:156"] = "440741", ["179:165:337:337"] = "272613", ["186:238:369:0"] = "440734", ["217:198:483:212"] = "272598", ["218:200:341:157"] = "272620", ["227:172:236:0"] = "272610", ["251:167:312:249"] = "272616", ["255:180:349:429"] = "440740", ["281:345:147:0"] = "440736, 440737, 440738, 440739", ["283:243:509:250"] = "272614, 440725", ["318:263:505:405"] = "272599, 440726, 440727, 440728", ["352:302:581:15"] = "272600, 440729, 440730, 440731", ["361:175:445:0"] = "440732, 440733", ["409:162:318:506"] = "272609, 440743",},
	[23] = {["169:195:472:332"] = "273102", ["185:230:551:151"] = "273121", ["194:208:601:390"] = "273107", ["241:212:229:228"] = "273113", ["241:252:495:213"] = "273094", ["290:133:286:211"] = "441018, 441019", ["311:436:533:0"] = "273122, 273103, 441023, 441024", ["316:316:48:235"] = "273120, 441020, 441021, 441022", ["325:192:300:232"] = "441015, 441016", ["359:182:231:123"] = "273114, 441017", ["368:220:261:448"] = "273108, 273101", ["432:271:235:0"] = "273095, 273111, 273100, 273090", ["464:325:96:343"] = "441011, 441012, 441013, 441014", ["492:314:510:354"] = "273119, 273092, 273112, 273093",},
	[24] = {["177:266:595:263"] = "271543, 271530", ["181:176:541:184"] = "271542", ["182:320:383:348"] = "442692, 442693", ["186:213:493:289"] = "271544", ["196:220:687:271"] = "271533", ["202:191:258:351"] = "271548", ["202:202:133:335"] = "271551", ["214:254:651:414"] = "271553", ["228:273:774:102"] = "442674, 442675", ["238:231:382:151"] = "271523", ["243:162:391:271"] = "442677", ["248:206:211:462"] = "271514", ["250:192:401:69"] = "271521", ["258:320:0:10"] = "271522, 442685, 442686, 442687", ["262:526:0:100"] = "271538, 271513, 442695, 442696, 442697, 442698", ["264:373:738:295"] = "442680, 442681, 442682, 442683", ["265:232:570:61"] = "271520, 442678", ["266:241:462:427"] = "271532, 442676", ["274:216:183:211"] = "271536, 442688", ["277:175:351:0"] = "271535, 442679", ["280:211:56:457"] = "271512, 442694", ["286:176:528:0"] = "271554, 442699", ["297:299:650:55"] = "271537, 442689, 442690, 442691", ["310:178:118:0"] = "271529, 442684", ["328:253:144:40"] = "271518, 271527",},
	[26] = {["105:148:390:255"] = "450678", ["116:129:344:254"] = "450649", ["134:124:463:101"] = "450634", ["135:160:426:224"] = "450633", ["144:139:200:505"] = "450668", ["147:160:425:279"] = "450639", ["148:120:413:55"] = "450670", ["148:146:484:166"] = "450671", ["155:147:451:140"] = "450648", ["158:169:321:42"] = "450666", ["165:203:494:226"] = "450677", ["171:136:359:191"] = "450650", ["180:182:287:399"] = "450628", ["189:181:347:85"] = "450669", ["204:244:502:373"] = "450667", ["212:160:441:0"] = "450679", ["229:219:383:352"] = "450674", ["250:167:194:216"] = "450665", ["258:113:341:0"] = "450637, 450638", ["269:258:542:410"] = "450640, 450641, 450642, 450643", ["275:193:505:44"] = "450675, 450676", ["302:175:191:302"] = "450651, 450652, 450651, 450652", ["312:254:59:310"] = "450672, 450673", ["316:238:102:137"] = "450635, 450636", ["437:451:565:217"] = "450644, 450645, 450646, 450647", ["447:263:555:68"] = "450629, 450630, 450631, 450632",},
	[27] = {["176:235:490:195"] = "271933", ["191:278:133:105"] = "271927, 440600", ["199:199:390:252"] = "271929", ["199:212:286:269"] = "271934", ["208:204:367:159"] = "271910", ["225:196:357:343"] = "271922", ["226:225:152:284"] = "440603", ["238:267:0:236"] = "271917, 440597", ["240:196:220:379"] = "271937", ["241:211:220:181"] = "271928", ["244:401:677:267"] = "271938, 271916", ["281:261:565:208"] = "271915, 271921, 440601, 440602", ["287:289:487:334"] = "271912, 271920, 440598, 440599", ["303:311:475:5"] = "271908, 271935, 271936, 271909",},
	[28] = {["171:234:397:132"] = "445524, 445524", ["174:249:579:306"] = "271401", ["184:188:449:220"] = "271417", ["198:251:663:288"] = "271408", ["211:160:374:287"] = "271400", ["218:234:760:268"] = "271409", ["225:276:360:340"] = "271406, 438340", ["226:335:469:256"] = "438345, 438346", ["236:358:263:0"] = "271392, 442671", ["237:366:765:43"] = "442672, 442673", ["249:183:595:225"] = "271389", ["308:335:630:0"] = "438354, 438355, 438356, 438357", ["376:347:398:0"] = "271410, 271396, 438352, 438353", ["398:302:100:366"] = "438341, 438342, 438343, 438344", ["409:318:0:27"] = "438348, 438349, 438350, 438351", ["437:249:50:227"] = "271398, 438347",},
	[33] = {["304:244:243:424"] = "450682, 450683", ["365:393:0:75"] = "254509, 254510, 254511, 254512", ["375:307:0:361"] = "254503, 254504, 450680, 450681", ["392:355:588:0"] = "254505, 254506, 254507, 254508", ["429:301:255:38"] = "450692, 450693, 450694, 450695", ["441:266:531:241"] = "450684, 450685, 450686, 450687", ["481:360:232:171"] = "254529, 254530, 254531, 254532", ["571:308:413:360"] = "254527, 254528, 450688, 450689, 450690, 450691",},
	[37] = {["182:360:0:0"] = "270938, 455906", ["274:263:568:151"] = "270927, 455911, 455912, 455913", ["274:413:253:255"] = "270933, 270943, 270921, 270928, 270933, 270943, 270921, 270928", ["281:388:79:0"] = "270919, 270911, 455907, 455908", ["298:410:419:258"] = "270920, 270914, 270908, 270929", ["320:385:235:0"] = "270912, 270909, 455909, 455910", ["324:354:421:0"] = "270922, 270934, 270923, 270937", ["350:341:646:7"] = "270944, 270910, 270935, 270945", ["362:431:0:237"] = "270941, 270925, 270926, 270917", ["383:413:615:255"] = "270906, 270918, 270936, 270942",},
	[41] = {["220:207:417:327"] = "271560", ["230:206:396:430"] = "271582", ["269:248:240:420"] = "271576, 438414", ["269:313:116:355"] = "438426, 438427, 438428, 438429", ["270:241:529:287"] = "271573, 438425", ["276:231:247:294"] = "271567, 438415", ["285:194:708:442"] = "271557, 271583", ["287:216:532:424"] = "271559, 438412", ["294:243:703:292"] = "271578, 438413", ["295:296:355:138"] = "271572, 438416, 438417, 438418", ["340:272:552:186"] = "271584, 271565, 438419, 438420", ["512:422:0:0"] = "438421, 438422, 438423, 438424",},
	[46] = {["350:449:433:208"] = "271092, 271085, 271086, 271089", ["513:358:92:310"] = "271095, 271079, 440578, 440579, 440580, 440581", ["617:522:83:0"] = "271075, 271076, 271080, 271081, 440573, 440574, 440575, 440576, 440577",},
	[52] = {["189:307:0:152"] = "271453, 271454", ["205:157:96:292"] = "438381", ["219:182:661:122"] = "271466", ["233:248:401:396"] = "271449", ["268:282:228:355"] = "271448, 271456, 438391, 438392", ["279:399:497:112"] = "271470, 271477, 438379, 438380", ["291:244:627:344"] = "438385, 438386", ["291:263:539:368"] = "271455, 438382, 438383, 438384", ["299:296:32:348"] = "271444, 271483, 438377, 438378", ["320:388:314:101"] = "438387, 438388, 438389, 438390", ["323:309:91:132"] = "271473, 271463, 271467, 271464", ["329:314:640:128"] = "271471, 271461, 271450, 271451", ["931:235:71:26"] = "271481, 271460, 271474, 271468",},
	[53] = {["225:252:221:0"] = "252884", ["273:230:245:324"] = "252862, 252863", ["273:294:177:345"] = "252886, 252887, 440640, 440641", ["294:249:549:52"] = "252880, 252881", ["310:345:0:311"] = "252899, 440647, 440648, 440649", ["319:289:16:0"] = "252882, 252883, 440638, 440639", ["330:474:340:81"] = "252894, 252895, 252896, 252897", ["333:200:339:0"] = "440642, 440643", ["349:292:570:209"] = "252890, 252891, 252892, 252893", ["397:291:481:296"] = "252866, 252867, 440636, 440637", ["455:295:0:146"] = "252898, 440644, 440645, 440646",},
	[54] = {["189:193:445:286"] = "440660", ["228:247:350:139"] = "272334", ["228:420:480:0"] = "440672, 440673", ["306:324:688:283"] = "440668, 440669, 440670, 440671", ["316:182:525:302"] = "272347, 272371", ["323:406:0:256"] = "272364, 272348, 272358, 272359", ["357:246:214:0"] = "272357, 272342", ["392:352:148:316"] = "272344, 272354, 272350, 272339", ["410:256:0:110"] = "272351, 272340", ["413:292:37:0"] = "272362, 272356, 440664, 440665", ["427:291:451:377"] = "272369, 272363, 440666, 440667", ["428:463:574:0"] = "272372, 440661, 440662, 440663", ["464:250:81:214"] = "272335, 272343",},
	[55] = {["139:150:354:184"] = "440798", ["157:173:387:246"] = "440805", ["159:137:267:168"] = "440793", ["167:179:298:228"] = "440797", ["190:176:566:164"] = "440795", ["227:190:306:63"] = "440807", ["228:265:158:0"] = "440810, 440811", ["230:170:398:375"] = "440796", ["234:206:543:253"] = "440806", ["236:224:140:208"] = "440812", ["239:205:397:243"] = "440794", ["240:228:413:95"] = "440800", ["244:238:499:0"] = "440799", ["302:166:306:0"] = "440808, 440809", ["324:263:9:22"] = "440819, 440820, 440821, 440822", ["350:259:488:364"] = "440801, 440802, 440803, 440804", ["376:560:626:0"] = "440813, 440814, 440815, 440816, 440817, 440818",},
	[56] = {["229:418:703:80"] = "272739, 272746", ["238:343:194:236"] = "272747, 272763", ["257:229:575:238"] = "272772, 272760", ["262:193:600:0"] = "442700, 442701", ["266:284:161:79"] = "272736, 442717, 442718, 442719", ["268:285:0:80"] = "272759, 272750, 442713, 442714", ["268:316:7:242"] = "442702, 442703, 442704, 442705", ["292:360:331:24"] = "272768, 272770, 442720, 442721", ["330:342:478:0"] = "442706, 442707, 442708, 442709", ["347:303:540:360"] = "272740, 272773, 442715, 442716", ["357:308:297:258"] = "272742, 272751, 272752, 272764", ["402:668:600:0"] = "272756, 272737, 272769, 442710, 442711, 442712",},
	[57] = {["184:217:294:168"] = "441034", ["193:273:531:200"] = "273125, 441031", ["196:229:311:0"] = "441026", ["197:213:394:0"] = "273145", ["201:195:203:376"] = "273142", ["202:179:474:0"] = "273143", ["202:224:348:118"] = "273126", ["211:167:221:477"] = "273141", ["229:265:404:226"] = "273137, 441027", ["232:213:308:325"] = "273130", ["235:306:199:79"] = "273149, 441025", ["244:237:451:81"] = "273146", ["292:273:303:395"] = "273124, 441028, 441029, 441030", ["317:261:480:378"] = "273131, 273134, 441032, 441033", ["346:222:167:263"] = "273129, 273133",},
	[61] = {["185:224:372:76"] = "273173", ["236:256:359:201"] = "273159", ["250:269:460:102"] = "441042, 441043", ["250:282:218:0"] = "441048, 441049", ["256:245:599:123"] = "273181", ["257:185:356:7"] = "273164, 441041", ["258:207:371:335"] = "273174, 441054", ["276:243:121:63"] = "273178, 273167", ["298:215:346:419"] = "441039, 441040", ["298:447:185:195"] = "273155, 441055, 441056, 441057", ["300:316:532:352"] = "441050, 441051, 441052, 441053", ["301:232:37:240"] = "273163, 441035", ["321:248:31:102"] = "273171, 441036", ["325:363:0:297"] = "273156, 441044, 441045, 441046", ["329:228:506:34"] = "441037, 441038", ["369:235:506:232"] = "273177, 441047",},
	[62] = {["140:210:345:243"] = "272807", ["144:226:432:109"] = "440837", ["165:249:382:83"] = "272822", ["175:235:374:221"] = "272826", ["178:186:466:237"] = "440833", ["187:196:544:217"] = "272815", ["194:244:276:90"] = "272830", ["198:181:347:355"] = "272814", ["241:217:481:104"] = "272811", ["289:202:422:310"] = "272810, 440834", ["298:337:149:181"] = "272806, 272812, 440831, 440832", ["317:220:329:448"] = "440835, 440836",},
	[67] = {["200:263:517:28"] = "271043, 438260", ["203:194:280:182"] = "438259", ["244:201:207:467"] = "438258", ["245:147:565:0"] = "438262", ["250:241:596:16"] = "438261", ["277:281:391:54"] = "438254, 438255, 438256, 438257", ["303:185:277:483"] = "271044, 438263", ["314:193:280:378"] = "438264, 438265", ["326:145:294:330"] = "271045, 438251", ["328:250:305:118"] = "438266, 438267", ["330:192:300:239"] = "438252, 438253", ["453:340:0:0"] = "2175173, 2175174, 2175175, 2175176",},
	[68] = {["166:211:836:148"] = "270387", ["184:232:112:148"] = "270380", ["203:310:377:121"] = "437337, 437338", ["221:257:595:253"] = "270401, 437321", ["231:223:771:265"] = "270390", ["231:256:481:221"] = "270402", ["235:236:696:154"] = "270388", ["236:271:210:331"] = "270398, 437328", ["244:251:143:0"] = "437322", ["246:361:188:0"] = "437319, 437320", ["251:271:255:164"] = "270386, 437312", ["262:390:0:0"] = "270376, 437333, 437334, 437335", ["277:333:714:317"] = "270405, 437316, 437317, 437318", ["287:276:529:385"] = "270375, 437313, 437314, 437315", ["306:283:40:275"] = "437329, 437330, 437331, 437332", ["314:241:255:78"] = "270389, 437336", ["325:239:473:97"] = "270400, 437327", ["347:308:338:335"] = "437323, 437324, 437325, 437326",},
	[69] = {["234:203:527:465"] = "442249", ["246:256:756:412"] = "442250", ["246:380:0:134"] = "272968, 442244", ["272:232:136:0"] = "272963, 442255", ["280:325:0:0"] = "442268, 442269, 442270, 442271", ["317:252:169:116"] = "272962, 442240", ["358:418:125:241"] = "442264, 442265, 442266, 442267", ["361:314:298:0"] = "442245, 442246, 442247, 442248", ["374:339:347:329"] = "442260, 442261, 442262, 442263", ["411:411:591:257"] = "442256, 442257, 442258, 442259", ["431:410:571:49"] = "442251, 442252, 442253, 442254", ["436:271:276:186"] = "272954, 442241, 442242, 442243",},
	[70] = {["164:258:479:401"] = "440778, 440779", ["176:189:516:289"] = "440780", ["183:196:588:341"] = "440771", ["194:156:532:512"] = "272628", ["210:189:252:121"] = "440773", ["211:131:618:537"] = "272650", ["221:235:367:411"] = "440772", ["222:222:353:285"] = "272646", ["241:192:366:95"] = "440768", ["244:247:417:143"] = "272624", ["265:206:654:369"] = "440776, 440777", ["267:352:468:263"] = "272648, 272634, 272635, 272623", ["277:274:199:368"] = "272633, 272647, 440774, 440775", ["290:297:220:189"] = "440764, 440765, 440766, 440767", ["305:244:265:0"] = "272632, 272641", ["322:220:602:448"] = "440769, 440770", ["374:287:533:179"] = "272630, 272649, 272642, 272636",},
	[71] = {["161:141:210:0"] = "438321", ["212:186:275:376"] = "438337", ["220:205:440:49"] = "271111", ["222:299:142:369"] = "271125, 438327", ["231:257:573:0"] = "271114, 438320", ["250:215:360:273"] = "271127", ["274:145:399:0"] = "271126, 438336", ["274:196:207:472"] = "271122, 438317", ["289:244:613:170"] = "438318, 438319", ["292:266:637:402"] = "271105, 438324, 438325, 438326", ["309:349:589:319"] = "438328, 438329, 438330, 438331", ["312:285:415:156"] = "438313, 438314, 438315, 438316", ["317:293:655:0"] = "271104, 271124, 438322, 438323", ["321:275:170:196"] = "271106, 271129, 438338, 438339", ["326:311:381:357"] = "271108, 271112, 271113, 271109", ["338:342:208:24"] = "438332, 438333, 438334, 438335",},
	[74] = {["159:218:607:170"] = "440592", ["172:198:568:287"] = "440586", ["174:220:671:181"] = "271675", ["191:179:457:281"] = "440591", ["192:157:663:116"] = "271696", ["194:304:375:343"] = "271700, 271682", ["206:237:467:354"] = "271699", ["207:209:756:191"] = "271680", ["208:204:186:229"] = "440593", ["217:192:362:237"] = "440590", ["232:206:652:298"] = "440596", ["265:284:485:101"] = "271687, 440587, 440588, 440589", ["350:334:271:0"] = "271705, 271686, 440594, 440595",},
	[75] = {["206:200:656:21"] = "271494", ["270:353:428:0"] = "271507, 271504, 438410, 438411", ["279:301:358:169"] = "438397, 438398, 438399, 438400", ["305:247:542:223"] = "271500, 438407", ["317:230:137:188"] = "438405, 438406", ["344:183:199:0"] = "438393, 438394", ["384:249:133:59"] = "438395, 438396", ["433:351:109:313"] = "438401, 438402, 438403, 438404", ["436:299:359:369"] = "271503, 271509, 438408, 438409",},
	[76] = {["173:163:380:341"] = "272798", ["178:243:615:201"] = "440825", ["179:190:258:211"] = "272792", ["189:180:412:92"] = "272774", ["195:163:413:211"] = "272800", ["213:173:507:238"] = "272789", ["214:149:293:99"] = "272776", ["221:293:185:280"] = "272781, 440827", ["224:216:431:452"] = "272801", ["225:187:448:364"] = "272805", ["231:177:305:257"] = "272782", ["232:211:301:349"] = "272784", ["254:341:479:9"] = "440823, 440824", ["255:194:297:148"] = "272799", ["269:190:255:431"] = "440828, 440829", ["274:186:437:289"] = "272795, 440826", ["315:190:184:0"] = "272788, 440830",},
	[81] = {["184:213:353:396"] = "438209", ["206:329:316:168"] = "270412, 438210", ["207:232:407:403"] = "438208", ["210:232:245:377"] = "270409", ["218:237:228:229"] = "270414", ["219:193:575:121"] = "438207", ["243:262:343:3"] = "438197, 438198", ["250:230:70:222"] = "438199", ["256:224:113:141"] = "438185", ["260:267:204:53"] = "438193, 438194, 438195, 438196", ["295:267:476:401"] = "270410, 438204, 438205, 438206", ["306:337:684:22"] = "270434, 438211, 438212, 438213", ["321:247:477:0"] = "270432, 438192", ["352:274:22:344"] = "438200, 438201, 438202, 438203", ["587:381:395:127"] = "438186, 438187, 438188, 438189, 438190, 438191",},
	[82] = {["173:163:410:505"] = "271658", ["187:176:476:484"] = "271657", ["209:226:531:57"] = "271653", ["229:210:288:458"] = "271663", ["261:273:406:55"] = "271673, 438433, 438434, 438435", ["263:199:303:9"] = "271652, 438436", ["268:214:278:359"] = "271664, 438438", ["274:212:394:382"] = "271659, 438431", ["307:161:471:0"] = "271660, 438432", ["319:176:234:317"] = "271669, 438437", ["343:250:243:107"] = "271665, 438439", ["345:192:220:231"] = "271666, 438430",},
	[83] = {["186:185:328:179"] = "440938", ["197:222:706:201"] = "273051", ["204:170:462:330"] = "440937", ["224:191:557:0"] = "440936", ["263:412:573:256"] = "273072, 273039, 273037, 273063", ["309:277:145:226"] = "273043, 273075, 273069, 273061", ["316:293:162:357"] = "273046, 273053, 273071, 273047", ["321:288:356:192"] = "273042, 273065, 273050, 273036", ["332:332:157:0"] = "440943, 440944, 440945, 440946", ["337:321:565:39"] = "440939, 440940, 440941, 440942", ["381:274:335:384"] = "273059, 273066, 273073, 273054", ["432:294:305:0"] = "273052, 273062, 273057, 273058",},
	[85] = {["271:296:209:91"] = "440652, 440653, 440654, 440655", ["275:346:542:210"] = "440656, 440657, 440658, 440659", ["346:244:370:135"] = "440650, 440651", ["431:319:219:273"] = "252844, 252845, 252846, 252847",},
	[86] = {["292:260:427:143"] = "440714, 440715, 440716, 440717", ["309:243:550:181"] = "272580, 272544", ["315:285:614:0"] = "440721, 440722, 440723, 440724", ["329:246:126:0"] = "272581, 272562", ["405:267:345:4"] = "272565, 272566, 272577, 272546", ["434:231:100:151"] = "272573, 272545", ["489:358:380:310"] = "272567, 272547, 272555, 272548", ["542:367:0:206"] = "272559, 272543, 272574, 272575, 440718, 440719", ["580:213:0:455"] = "272564, 272553, 440720",},
	[88] = {["194:229:482:195"] = "273191", ["221:209:588:181"] = "273200", ["249:217:581:314"] = "273206", ["254:150:556:439"] = "273199", ["257:238:399:340"] = "273185, 445588", ["271:258:372:268"] = "273192, 445585, 445586, 445587", ["317:183:424:474"] = "273198, 445584", ["332:268:304:0"] = "273184, 445581, 445582, 445583", ["333:255:500:17"] = "273203, 445592", ["362:252:92:302"] = "273187, 445593", ["367:340:229:33"] = "273207, 445589, 445590, 445591", ["376:289:93:118"] = "273202, 445578, 445579, 445580",},
	[99] = {["128:193:554:475"] = "271603", ["128:197:584:471"] = "271598", ["128:248:511:420"] = "271592", ["128:253:183:415"] = "271625", ["128:256:292:319"] = "271633", ["128:256:580:399"] = "271630", ["256:128:231:404"] = "271627", ["256:128:243:469"] = "271635", ["256:128:255:507"] = "271596", ["256:128:524:359"] = "271591", ["256:128:539:305"] = "271628", ["256:172:378:496"] = "271614", ["256:174:464:494"] = "271615", ["256:256:215:298"] = "271601", ["256:256:307:136"] = "271608", ["256:256:324:384"] = "271599", ["256:256:361:298"] = "271637", ["256:256:386:386"] = "271612", ["256:256:460:373"] = "271588", ["256:256:474:314"] = "271610", ["256:256:605:253"] = "271604", ["256:256:669:228"] = "271586", ["256:353:648:315"] = "271587, 271590", ["512:512:195:5"] = "271619, 271602, 271589, 271638", ["512:512:440:87"] = "271632, 271600, 271617, 271618",},
	[100] = {["256:256:184:238"] = "271744", ["256:256:210:126"] = "271716", ["256:256:40:287"] = "271752", ["256:256:585:0"] = "271761", ["256:262:364:406"] = "271711, 271717", ["256:449:340:219"] = "271740, 271730", ["256:512:365:2"] = "271762, 271751", ["256:512:448:150"] = "271741, 271723", ["256:512:60:117"] = "271754, 271733", ["404:436:598:232"] = "271742, 271728, 271758, 271706", ["427:256:575:0"] = "271735, 271736", ["429:256:573:136"] = "271715, 271745", ["512:256:326:0"] = "271729, 271707", ["512:256:460:0"] = "271731, 271719", ["512:293:95:375"] = "271721, 271725, 271714, 271737", ["512:431:466:237"] = "271712, 271757, 271713, 271734", ["512:512:44:0"] = "271726, 271756, 271727, 271710",},
	[102] = {["128:256:462:349"] = "270497", ["256:128:356:0"] = "270493", ["256:222:23:446"] = "270498", ["256:247:220:421"] = "270482", ["256:256:174:363"] = "270492", ["256:256:176:303"] = "270463", ["256:256:281:305"] = "270509", ["256:256:291:3"] = "270510", ["256:256:352:378"] = "270481", ["256:256:365:49"] = "270488", ["256:256:383:249"] = "270513", ["256:256:449:183"] = "270508", ["256:256:488:24"] = "270474", ["256:256:507:350"] = "270512", ["256:256:515:279"] = "270476", ["475:512:527:104"] = "270511, 270483, 270489, 270484", ["512:512:74:85"] = "270475, 270515, 270495, 270505",},
	[105] = {["256:256:182:412"] = "271830", ["256:256:206:110"] = "271835", ["256:256:34:142"] = "271836", ["256:256:467:154"] = "271852", ["256:256:469:298"] = "271848", ["256:256:705:368"] = "271843", ["256:260:308:408"] = "271838, 271861", ["256:378:25:290"] = "271850, 271864", ["256:458:338:210"] = "271855, 271833", ["256:512:326:45"] = "271840, 271849", ["256:512:579:128"] = "271866, 271821", ["256:512:737:156"] = "271854, 271825", ["422:238:580:430"] = "271826, 271822", ["512:255:261:413"] = "271856, 271820", ["512:256:477:6"] = "271867, 271842", ["512:342:183:326"] = "271862, 271844, 271823, 271831", ["512:512:38:152"] = "271851, 271841, 271865, 271853", ["512:512:478:25"] = "271863, 271857, 271845, 271839",},
	[107] = {["256:128:124:0"] = "273241", ["256:207:720:461"] = "273266", ["256:256:175:232"] = "273267", ["256:256:31:339"] = "273262", ["256:256:342:249"] = "273233", ["256:256:512:303"] = "273271", ["256:256:596:412"] = "273280", ["256:256:81:152"] = "273222", ["256:256:88:50"] = "273235", ["256:343:141:325"] = "273224, 273225", ["256:512:219:51"] = "273268, 273226", ["256:512:329:25"] = "273223, 273272", ["256:512:462:90"] = "273253, 273242", ["256:512:569:112"] = "273249, 273238", ["286:512:716:128"] = "273243, 273273, 273250, 273251", ["308:256:694:321"] = "273276, 273246", ["512:256:20:202"] = "273248, 273279", ["512:336:314:332"] = "273221, 273269, 273236, 273277",},
	[109] = {["256:256:143:256"] = "272431", ["256:256:520:93"] = "272421", ["256:256:554:308"] = "272461", ["256:512:290:129"] = "272451, 272471", ["396:512:606:126"] = "272429, 272470, 272446, 272450", ["492:223:510:445"] = "272442, 272443", ["512:358:343:310"] = "272454, 272426, 272439, 272455", ["512:410:469:258"] = "272448, 272449, 272469, 272452", ["512:439:168:229"] = "272430, 272460, 272434, 272435", ["512:512:104:155"] = "272436, 272440, 272441, 272427", ["512:512:116:35"] = "272428, 272424, 272433, 272445", ["512:512:348:8"] = "272467, 272465, 272422, 272453", ["512:512:394:90"] = "272459, 272438, 272463, 272447",},
	[110] = {["256:128:563:151"] = "270643", ["256:240:271:428"] = "270622", ["256:254:446:414"] = "270642", ["256:256:254:176"] = "270663", ["256:256:286:28"] = "270625", ["256:256:412:95"] = "270631", ["256:256:422:0"] = "270665", ["256:256:439:210"] = "270649", ["256:256:527:81"] = "270611", ["256:256:585:0"] = "270651", ["256:256:623:147"] = "270666", ["256:256:629:406"] = "270667", ["256:256:658:297"] = "270655", ["256:256:673:71"] = "270626", ["256:256:733:109"] = "270609", ["256:297:342:371"] = "270669, 270657", ["256:318:289:350"] = "270638, 270630", ["256:336:533:332"] = "270612, 270658", ["256:396:405:272"] = "270664, 270659", ["256:410:554:258"] = "270629, 270606", ["256:419:512:249"] = "270644, 270610", ["256:462:166:206"] = "270652, 270653", ["256:507:314:161"] = "270619, 270620", ["256:512:479:98"] = "270616, 270617", ["416:256:586:147"] = "270628, 270605", ["512:252:144:416"] = "270662, 270632", ["512:256:214:55"] = "270621, 270633",},
	[111] = {["128:128:180:216"] = "270671", ["239:256:763:256"] = "270710", ["256:185:309:483"] = "270718", ["256:198:503:470"] = "270687", ["256:256:205:39"] = "270701", ["256:256:221:136"] = "270676", ["256:256:232:242"] = "270703", ["256:256:250:404"] = "270739", ["256:256:293:285"] = "270728", ["256:256:297:136"] = "270733", ["256:256:302:27"] = "270727", ["256:256:367:209"] = "270679", ["256:256:414:406"] = "270700", ["256:256:437:258"] = "270698", ["256:256:451:29"] = "270734", ["256:256:481:117"] = "270720", ["256:256:546:410"] = "270699", ["256:256:555:87"] = "270741", ["256:256:556:216"] = "270740", ["256:256:598:338"] = "270677", ["256:256:613:82"] = "270709", ["256:256:637:0"] = "270714", ["256:256:657:78"] = "270712", ["256:256:729:54"] = "270682", ["256:512:44:62"] = "270690, 270729", ["485:141:517:527"] = "270711, 270723", ["512:242:177:426"] = "270674, 270731", ["512:430:43:238"] = "270692, 270673, 270702, 270672",},
	[112] = {["256:241:558:427"] = "272204", ["256:256:157:32"] = "272235", ["256:256:162:154"] = "272198", ["256:256:219:199"] = "272231", ["256:256:277:54"] = "272242", ["256:256:335:193"] = "272213", ["256:256:351:52"] = "272237", ["256:256:387:390"] = "272220", ["256:256:391:258"] = "272230", ["256:256:431:143"] = "272188", ["256:256:504:53"] = "272208", ["256:256:532:363"] = "272236", ["256:256:533:267"] = "272206", ["256:256:598:79"] = "272232", ["256:256:666:233"] = "272244", ["256:334:660:334"] = "272196, 272197", ["256:512:10:107"] = "272199, 272200", ["512:334:168:334"] = "272205, 272229, 272190, 272238", ["512:420:36:248"] = "272224, 272233, 272191, 272212",},
	[113] = {["128:256:316:268"] = "272840", ["256:208:321:460"] = "272889", ["256:234:247:434"] = "272843", ["256:256:116:4"] = "272878", ["256:256:222:362"] = "272846", ["256:256:245:289"] = "272881", ["256:256:310:345"] = "272887", ["256:256:314:0"] = "272837", ["256:256:377:272"] = "272836", ["256:256:397:165"] = "272839", ["256:256:417:327"] = "272873", ["256:256:478:19"] = "272880", ["256:256:480:277"] = "272866", ["256:256:505:154"] = "272886", ["256:256:521:275"] = "272835", ["256:367:103:301"] = "272844, 272847", ["256:512:455:34"] = "272879, 272834", ["385:512:617:149"] = "272860, 272855, 272850, 272856", ["512:256:143:171"] = "272851, 272867", ["512:320:449:348"] = "272876, 272888, 272857, 272877", ["512:512:104:4"] = "272861, 272831, 272883, 272838",},
	[114] = {["256:128:241:388"] = "272255", ["256:145:490:523"] = "272274", ["256:179:357:489"] = "272288", ["256:213:239:455"] = "272292", ["256:217:454:451"] = "272253", ["256:256:132:294"] = "272262", ["256:256:171:155"] = "272247", ["256:256:229:38"] = "272263", ["256:256:237:22"] = "272273", ["256:256:253:301"] = "272283", ["256:256:298:134"] = "272285", ["256:256:328:397"] = "272280", ["256:256:356:261"] = "272249", ["256:256:396:10"] = "272269", ["256:256:411:20"] = "272248", ["256:256:465:336"] = "272260", ["256:256:481:208"] = "272264", ["256:256:513:138"] = "272282", ["256:256:644:173"] = "272287", ["256:387:147:281"] = "272279, 272265", ["409:384:593:284"] = "272267, 272254, 272268, 272284", ["512:256:354:49"] = "272296, 272294",},
	[119] = {["186:276:272:237"] = "270870, 270743", ["203:209:662:11"] = "270848", ["244:214:325:140"] = "270785", ["244:319:397:66"] = "270900, 270819", ["259:302:457:264"] = "270903, 270781, 270794, 270855", ["260:278:329:237"] = "270851, 270871, 270795, 270769", ["267:378:153:238"] = "270822, 270894, 270835, 270784", ["289:279:707:181"] = "270765, 270824, 270887, 270801", ["290:292:712:15"] = "270826, 270865, 270759, 270763", ["375:342:480:0"] = "270869, 270890, 270764, 270762", ["382:258:293:383"] = "270761, 270879, 270880, 270787", ["385:316:509:214"] = "270898, 270840, 270899, 270812", ["396:203:314:0"] = "270806, 270810", ["460:381:50:0"] = "270821, 270758, 270797, 270775",},
	[120] = {["188:211:374:208"] = "271192", ["196:218:543:362"] = "271358", ["213:219:403:0"] = "271232", ["214:261:614:358"] = "271313, 271133", ["226:212:661:264"] = "271378", ["229:259:487:0"] = "271146, 271257", ["229:299:42:187"] = "271267, 271201", ["235:337:134:165"] = "271254, 271233", ["235:354:569:7"] = "271149, 271222", ["236:218:258:203"] = "271170", ["258:225:433:118"] = "271239, 271157", ["299:278:703:7"] = "271351, 271270, 271175, 271330", ["301:286:698:332"] = "271280, 271346, 271164, 271387", ["304:203:256:104"] = "271352, 271244", ["306:242:210:0"] = "271187, 271231", ["311:272:691:160"] = "271333, 271199, 271364, 271162", ["317:353:453:219"] = "271205, 271248, 271252, 271236", ["356:300:217:313"] = "271322, 271298, 271290, 271337",},
	[121] = {["249:235:232:129"] = "271764", ["274:207:18:461"] = "271794, 271778", ["278:290:217:244"] = "271801, 271773, 271779, 271806", ["283:247:176:421"] = "271789, 271812", ["294:227:358:187"] = "271785, 271817", ["324:265:548:137"] = "271790, 271765, 271766, 271767", ["328:260:331:32"] = "271809, 271771, 271772, 271776", ["329:246:509:0"] = "271769, 271770", ["332:294:17:307"] = "271768, 271783, 271795, 271810", ["351:284:607:41"] = "271791, 271807, 271774, 271796", ["356:224:7:207"] = "271781, 271784", ["382:285:0:46"] = "271792, 271775, 271813, 271797", ["455:400:547:257"] = "271798, 271780, 271814, 271799", ["475:362:312:294"] = "271803, 271788, 271816, 271805",},
	[122] = {["174:173:576:170"] = "271946", ["177:191:342:351"] = "271992", ["178:208:595:240"] = "271945", ["181:178:490:161"] = "271993", ["187:263:397:208"] = "271980, 271994", ["193:201:668:223"] = "271950", ["213:256:283:203"] = "271976", ["222:168:222:100"] = "271959", ["223:209:354:0"] = "271957", ["223:338:664:25"] = "271956, 271974", ["232:216:585:336"] = "271941", ["238:232:343:108"] = "271984", ["242:189:225:0"] = "271954", ["244:305:621:327"] = "271969, 271989", ["248:382:477:216"] = "271985, 271968", ["251:192:490:0"] = "271970", ["263:265:99:37"] = "271940, 271975, 271953, 271991", ["266:210:420:57"] = "271952, 271967", ["284:308:415:360"] = "271997, 271998, 271963, 271964", ["298:306:572:0"] = "271977, 271978, 271979, 271958", ["333:265:99:278"] = "271962, 271987, 271983, 271988", ["347:220:90:180"] = "271986, 271960", ["350:258:168:410"] = "271965, 271966, 271972, 271973",},
	[123] = {["204:268:0:167"] = "254677, 254678", ["219:283:218:291"] = "254688, 254689", ["223:207:444:276"] = "254695", ["223:399:321:15"] = "254690, 254691", ["227:210:327:305"] = "254687", ["238:240:217:50"] = "254692", ["245:239:690:267"] = "254679", ["248:243:538:181"] = "254684", ["269:217:715:390"] = "254693, 254694", ["283:231:558:329"] = "254685, 254686", ["300:343:626:31"] = "254680, 254681, 254682, 254683", ["308:202:392:466"] = "254659, 254660", ["308:212:342:392"] = "254657, 254658", ["314:224:616:30"] = "294026, 294027", ["373:375:355:37"] = "254653, 254654, 254655, 254656", ["393:474:22:122"] = "254673, 254674, 254675, 254676",},
	[124] = {["207:235:427:244"] = "272524", ["233:286:705:236"] = "272529, 272506", ["239:313:265:355"] = "272530, 272516", ["249:248:172:135"] = "272507", ["268:288:138:58"] = "272517, 272534, 272496, 272502", ["293:229:396:51"] = "272500, 272501", ["294:327:308:34"] = "272523, 272487, 272539, 272532", ["312:369:501:134"] = "272494, 272495, 272504, 272533", ["322:265:596:92"] = "272521, 272515, 272522, 272499", ["329:293:76:375"] = "272509, 272491, 272520, 272484", ["455:316:82:186"] = "272535, 272518, 272490, 272519", ["468:329:359:339"] = "272498, 272531, 272510, 272541",},
	[125] = {["169:164:239:301"] = "272922", ["180:239:214:144"] = "272933", ["182:270:570:113"] = "272927, 272910", ["184:191:395:470"] = "272909", ["205:232:162:143"] = "272920", ["210:179:316:296"] = "272945", ["221:200:108:206"] = "272906", ["228:158:98:318"] = "272924", ["244:220:134:429"] = "272919", ["251:200:242:468"] = "272921", ["305:298:339:370"] = "272904, 272925, 272926, 272952", ["306:484:627:179"] = "272934, 272923, 272908, 272930", ["309:383:481:285"] = "272939, 272953, 272905, 272935", ["322:195:109:375"] = "272948, 272950", ["363:341:292:122"] = "272912, 272913, 272914, 272946", ["369:265:218:0"] = "272943, 272944, 272931, 272917",},
	[126] = {["218:291:174:191"] = "273324, 273292", ["237:248:288:168"] = "273329", ["247:304:431:127"] = "273322, 273320", ["249:258:479:241"] = "273304, 273305", ["261:288:607:251"] = "273309, 273286, 273310, 273328", ["265:257:533:345"] = "273296, 273300, 273285, 273287", ["266:254:289:287"] = "273330, 273291", ["272:268:0:247"] = "273318, 273298, 273336, 273303", ["286:265:326:358"] = "273311, 273297, 273331, 273317", ["302:231:380:437"] = "273323, 273289", ["307:256:7:412"] = "273326, 273333", ["311:317:575:88"] = "273325, 273307, 273308, 273319", ["321:305:181:363"] = "273312, 273332, 273282, 273302", ["336:297:629:0"] = "273295, 273301, 273321, 273288",},
	[127] = {["512:416:252:252"] = "272721, 272732, 272715, 272722", ["512:512:251:4"] = "272716, 272728, 272723, 272733",},
	[132] = {["252:260:0:91"] = "270966, 271005", ["264:303:0:176"] = "270987, 270962, 270973, 270997", ["288:222:0:0"] = "253268, 271000", ["416:424:0:244"] = "270970, 270961, 270971, 270996", ["446:369:536:40"] = "253267, 270960, 270995, 270989", ["502:477:500:105"] = "253269, 270985, 253270, 270986", ["544:668:129:0"] = "253264, 271003, 270968, 270965, 253265, 253266, 271002, 271004, 270984", ["558:285:444:383"] = "253271, 253272, 270974, 270975, 271001, 270980",},
	[179] = {["142:133:377:359"] = "440843", ["156:142:433:11"] = "440842", ["159:230:264:144"] = "440863", ["168:205:416:368"] = "440853", ["172:175:189:408"] = "440859", ["173:180:351:21"] = "440840", ["177:172:129:348"] = "440838", ["190:186:416:131"] = "440860", ["210:258:492:161"] = "440851, 440852", ["212:193:279:68"] = "440862", ["212:216:440:452"] = "440854", ["221:211:508:345"] = "440850", ["222:190:244:458"] = "440841", ["231:216:213:325"] = "440861", ["248:209:462:43"] = "440839", ["305:288:323:185"] = "440855, 440856, 440857, 440858", ["350:517:581:21"] = "440844, 440845, 440846, 440847, 440848, 440849",},
	[184] = {["177:219:293:449"] = "438477", ["194:236:167:352"] = "438476", ["210:166:261:427"] = "438440", ["222:268:393:386"] = "438482, 438483", ["244:241:141:202"] = "438475", ["267:314:387:0"] = "438484, 438485, 438486, 438487", ["280:224:504:394"] = "438498, 438499", ["280:342:298:95"] = "438478, 438479, 438480, 438481", ["281:351:639:43"] = "438443, 438444, 438445, 438446", ["282:263:483:210"] = "438447, 438448, 438449, 438450", ["282:298:482:14"] = "438488, 438489, 438490, 438491", ["286:178:272:333"] = "438441, 438442", ["321:203:516:465"] = "438492, 438493", ["328:336:160:0"] = "438500, 438501, 438502, 438503", ["350:345:652:290"] = "438494, 438495, 438496, 438497",},
	[199] = {["1002:664:0:4"] = "466830, 466834, 466835, 466836, 466837, 466838, 466839, 466840, 466841, 466831, 466832, 466833",},
	[203] = {["270:173:303:197"] = "438644, 438645", ["270:300:320:5"] = "438632, 438633, 438634, 438635, 438632, 438633, 438634, 438635, 438632, 438633, 438634, 438635", ["272:334:622:320"] = "438646, 438647, 438648, 438649", ["277:232:139:436"] = "438668, 438669", ["282:418:6:78"] = "438636, 438637, 438638, 438639", ["291:321:116:17"] = "438670, 438671, 438672, 438673", ["320:471:682:128"] = "438640, 438641, 438642, 438643", ["365:264:411:216"] = "438678, 438679, 438680, 438681", ["419:290:318:378"] = "438682, 438683, 438684, 438685", ["441:319:52:253"] = "438674, 438675, 438676, 438677", ["537:323:392:0"] = "438662, 438663, 438664, 438665, 438666, 438667",},
	[204] = {["214:140:273:528"] = "440758", ["216:172:423:251"] = "440749", ["218:178:300:64"] = "440753", ["242:195:269:436"] = "440750", ["254:214:267:196"] = "440763", ["269:211:398:457"] = "440745, 440746", ["280:279:548:147"] = "440754, 440755, 440756, 440757", ["285:171:244:286"] = "440759, 440760", ["315:170:201:0"] = "440751, 440752", ["355:226:289:117"] = "440761, 440762", ["384:248:274:307"] = "440747, 440748",},
	[206] = {["220:189:528:228"] = "440974", ["227:207:399:280"] = "440977", ["278:315:210:35"] = "440984, 440985, 440986, 440987", ["291:206:380:43"] = "440982, 440983", ["311:217:451:325"] = "440975, 440976", ["316:267:456:401"] = "440978, 440979, 440980, 440981", ["340:225:365:162"] = "440988, 440989",},
	[209] = {["225:250:415:183"] = "440973", ["267:374:266:280"] = "440955, 440956, 440957, 440958", ["298:251:315:110"] = "440963, 440964", ["306:293:162:210"] = "440969, 440970, 440971, 440972", ["363:262:275:32"] = "440959, 440960, 440961, 440962", ["370:385:412:283"] = "440965, 440966, 440967, 440968", ["371:394:50:263"] = "440947, 440948, 440949, 440950", ["491:470:497:0"] = "440951, 440952, 440953, 440954",},
	[210] = {["197:223:554:175"] = "440998", ["272:180:270:222"] = "440992, 440993", ["286:269:460:261"] = "440994, 440995, 440996, 440997", ["335:223:407:445"] = "440990, 440991", ["339:278:400:0"] = "441003, 441004, 441005, 441006", ["349:361:217:268"] = "440999, 441000, 441001, 441002", ["480:319:150:32"] = "441007, 441008, 441009, 441010",},
	[212] = {["237:198:297:384"] = "438312", ["274:156:434:0"] = "438306, 438307", ["292:285:458:383"] = "438294, 438295, 438296, 438297", ["355:345:287:177"] = "438298, 438299, 438300, 438301", ["370:285:0:146"] = "438280, 438281, 438282, 438283", ["371:354:0:314"] = "438290, 438291, 438292, 438293", ["378:359:20:0"] = "438276, 438277, 438278, 438279", ["411:248:570:420"] = "438310, 438311", ["430:230:141:438"] = "438308, 438309", ["454:343:549:297"] = "438272, 438273, 438274, 438275", ["462:400:540:12"] = "438268, 438269, 438270, 438271", ["467:273:85:0"] = "438302, 438303, 438304, 438305", ["516:287:448:0"] = "438284, 438285, 438286, 438287, 438288, 438289",},
	[215] = {["155:221:468:119"] = "438752", ["184:176:533:181"] = "438751", ["225:255:289:341"] = "438740", ["236:276:340:392"] = "438754, 438755", ["238:260:345:0"] = "438743, 438744", ["240:264:471:404"] = "438747, 438748", ["244:209:452:0"] = "438753", ["246:221:292:213"] = "438750", ["253:242:408:248"] = "438749", ["271:204:528:73"] = "438741, 438742", ["356:221:208:116"] = "438745, 438746",},
	[216] = {["177:219:293:449"] = "438541", ["194:236:167:352"] = "438540", ["210:166:261:427"] = "438504", ["222:268:393:386"] = "438546, 438547", ["244:241:141:202"] = "438539", ["250:298:482:14"] = "438552, 438553", ["267:314:387:0"] = "438548, 438549, 438550, 438551", ["280:224:504:394"] = "438562, 438563", ["280:342:298:95"] = "438542, 438543, 438544, 438545", ["281:351:639:43"] = "438507, 438508, 438509, 438510", ["282:263:483:210"] = "438523, 438524, 438525, 438526", ["286:178:272:333"] = "438505, 438506", ["321:203:516:465"] = "438556, 438557", ["328:336:160:0"] = "438564, 438565, 438566, 438567", ["350:345:652:290"] = "438558, 438559, 438560, 438561",},
	[220] = {["177:219:293:449"] = "438605", ["194:236:167:352"] = "438604", ["210:166:261:427"] = "438568", ["222:268:393:386"] = "438610, 438611", ["244:241:141:202"] = "438603", ["267:314:387:0"] = "438612, 438613, 438614, 438615", ["280:224:504:394"] = "438626, 438627", ["280:342:298:95"] = "438606, 438607, 438608, 438609", ["281:351:639:43"] = "438571, 438572, 438573, 438574", ["282:263:483:210"] = "438587, 438588, 438589, 438590", ["282:298:482:14"] = "438616, 438617, 438618, 438619", ["286:178:272:333"] = "438569, 438570", ["321:203:516:465"] = "438620, 438621", ["328:336:160:0"] = "438628, 438629, 438630, 438631", ["350:345:652:290"] = "438622, 438623, 438624, 438625",},
	[225] = {["142:133:377:359"] = "457676", ["156:142:433:11"] = "457675", ["159:230:264:144"] = "457696", ["168:205:416:368"] = "457686", ["172:175:189:408"] = "457692", ["173:180:351:21"] = "457673", ["177:172:129:348"] = "457671", ["190:186:416:131"] = "457693", ["210:258:492:161"] = "457684, 457685", ["212:193:279:68"] = "457695", ["212:216:440:452"] = "457687", ["221:211:508:345"] = "457683", ["222:190:244:458"] = "457674", ["231:216:213:325"] = "457694", ["248:209:462:43"] = "457672", ["305:288:323:185"] = "457688, 457689, 457690, 457691", ["350:517:581:21"] = "457677, 457678, 457679, 457680, 457681, 457682",},
	[226] = {["142:133:377:359"] = "440869", ["156:142:433:11"] = "440868", ["159:230:264:144"] = "440913", ["168:205:416:368"] = "440879", ["172:175:189:408"] = "440885", ["173:180:351:21"] = "440866", ["177:172:129:348"] = "440864", ["190:186:416:131"] = "440886", ["210:258:492:161"] = "440877, 440878", ["212:193:279:68"] = "440912", ["212:216:440:452"] = "440880", ["221:211:508:345"] = "440876", ["222:190:244:458"] = "440867", ["231:216:213:325"] = "440911", ["248:209:462:43"] = "440865", ["305:288:323:185"] = "440881, 440882, 440883, 440884", ["350:517:581:21"] = "440870, 440871, 440872, 440873, 440874, 440875",},
	[227] = {["270:173:303:197"] = "438698, 438699", ["270:300:320:5"] = "438686, 438687, 438688, 438689, 438686, 438687, 438688, 438689, 438686, 438687, 438688, 438689", ["272:334:622:320"] = "438700, 438701, 438702, 438703", ["277:232:139:436"] = "438722, 438723", ["282:418:6:78"] = "438690, 438691, 438692, 438693", ["291:321:116:17"] = "438724, 438725, 438726, 438727", ["320:471:682:128"] = "438694, 438695, 438696, 438697", ["365:264:411:216"] = "438732, 438733, 438734, 438735", ["419:290:318:378"] = "438736, 438737, 438738, 438739", ["441:319:52:253"] = "438728, 438729, 438730, 438731, 438728, 438729, 438730, 438731", ["537:323:392:0"] = "438716, 438717, 438718, 438719, 438720, 438721",},
	[228] = {["1002:668:0:0"] = "464052, 464056, 464057, 464058, 464059, 464060, 464061, 464062, 464063, 464053, 464054, 464055, 464052, 464056, 464057, 464058, 464059, 464060, 464061, 464062, 464063, 464053, 464054, 464055, 464052, 464056, 464057, 464058, 464059, 464060, 464061, 464062, 464063, 464053, 464054, 464055, 464052, 464056, 464057, 464058, 464059, 464060, 464061, 464062, 464063, 464053, 464054, 464055, 464052, 464056, 464057, 464058, 464059, 464060, 464061, 464062, 464063, 464053, 464054, 464055",},
	[252] = {["143:141:344:89"] = "458560", ["165:199:327:356"] = "458579", ["174:190:291:89"] = "458554", ["175:180:269:179"] = "458572", ["177:159:302:306"] = "458587", ["182:195:370:447"] = "458548", ["191:198:205:232"] = "458589", ["194:170:543:220"] = "458555", ["197:218:395:367"] = "458552", ["198:201:622:169"] = "458570", ["199:212:312:192"] = "458574", ["203:208:387:268"] = "458547", ["206:182:296:0"] = "458569", ["211:210:498:121"] = "458571", ["214:190:358:0"] = "458588", ["215:157:416:205"] = "458546", ["215:181:499:265"] = "458553", ["220:227:697:403"] = "458558", ["226:232:654:0"] = "458573", ["230:276:83:223"] = "458556, 458557", ["238:229:374:93"] = "458580", ["239:232:482:330"] = "458559", ["251:207:631:245"] = "458551", ["260:202:610:345"] = "458581, 458582", ["283:206:76:120"] = "458549, 458550", ["308:267:482:0"] = "458561, 458562, 458563, 458564", ["324:264:71:16"] = "458583, 458584, 458585, 458586", ["342:288:436:380"] = "458565, 458566, 458567, 458568", ["361:354:151:314"] = "458575, 458576, 458577, 458578",},
	[260] = {["150:159:545:193"] = "458658", ["151:144:479:215"] = "458668", ["160:193:406:174"] = "458641", ["161:236:647:15"] = "458663", ["164:185:471:277"] = "458634", ["196:170:551:121"] = "458646", ["202:169:341:402"] = "458635", ["203:215:542:0"] = "458638", ["203:249:217:289"] = "458653", ["206:204:657:349"] = "458664", ["209:254:407:384"] = "458643", ["213:195:656:473"] = "458665", ["228:227:411:67"] = "458650", ["233:321:527:291"] = "458639, 458640", ["237:194:583:162"] = "458642", ["237:316:752:170"] = "458661, 458662", ["249:243:264:136"] = "458649", ["269:203:340:282"] = "458647, 458648", ["269:242:599:184"] = "458636, 458637", ["270:229:229:433"] = "458666, 458667", ["278:173:365:0"] = "458651, 458652", ["296:209:132:127"] = "458659, 458660", ["312:289:28:221"] = "458654, 458655, 458656, 458657", ["400:224:110:0"] = "458644, 458645",},
	[289] = {["150:159:545:193"] = "458693", ["151:144:479:215"] = "458715", ["160:193:406:174"] = "458676", ["161:236:647:15"] = "458698", ["164:185:471:277"] = "458669", ["196:170:551:121"] = "458681", ["202:169:341:402"] = "458670", ["203:215:542:0"] = "458673", ["203:249:217:289"] = "458688", ["206:204:657:349"] = "458699", ["209:254:407:384"] = "458678", ["213:195:656:473"] = "458700", ["228:227:411:67"] = "458685", ["233:321:527:291"] = "458674, 458675", ["237:194:583:162"] = "458677", ["237:316:752:170"] = "458696, 458697", ["249:243:264:136"] = "458684", ["269:203:340:282"] = "458682, 458683", ["269:242:599:184"] = "458671, 458672", ["270:229:229:433"] = "458701, 458702", ["278:173:365:0"] = "458686, 458687", ["296:209:132:127"] = "458694, 458695", ["312:289:28:221"] = "458689, 458690, 458691, 458692", ["400:224:110:0"] = "458679, 458680",},
	[338] = {["143:141:344:89"] = "458604", ["165:199:327:356"] = "458623, 458623", ["174:190:291:89"] = "458598", ["175:180:269:179"] = "458616", ["177:159:302:306"] = "458631", ["182:195:370:447"] = "458592", ["191:198:205:232"] = "458633", ["194:170:543:220"] = "458599", ["197:218:395:367"] = "458596", ["198:201:622:169"] = "458614", ["199:212:312:192"] = "458618", ["203:208:387:268"] = "458591", ["206:182:296:0"] = "458613", ["211:210:498:121"] = "458615", ["214:190:358:0"] = "458632", ["215:157:416:205"] = "458590", ["215:181:499:265"] = "458597", ["220:227:697:403"] = "458602", ["226:232:654:0"] = "458617", ["230:276:83:223"] = "458600, 458601", ["238:229:374:93"] = "458624", ["239:232:482:330"] = "458603", ["251:207:631:245"] = "458595", ["260:202:610:345"] = "458625, 458626", ["283:206:76:120"] = "458593, 458594", ["308:267:482:0"] = "458605, 458606, 458607, 458608", ["324:264:71:16"] = "458627, 458628, 458629, 458630", ["342:288:436:380"] = "458609, 458610, 458611, 458612", ["361:354:151:314"] = "458619, 458620, 458621, 458622",},
	[339] = {["887:668:115:0"] = "462974, 462978, 462979, 462980, 462981, 462982, 462983, 462984, 462985, 462975, 462976, 462977",},
	[383] = {["179:180:428:416"] = "614290", ["191:216:388:299"] = "614289", ["196:158:316:0"] = "614288", ["196:166:181:75"] = "614284", ["202:204:430:21"] = "614278", ["210:158:202:0"] = "614297", ["218:148:474:520"] = "614277", ["219:186:346:482"] = "614294", ["219:205:189:151"] = "614287", ["219:256:290:330"] = "614286", ["227:198:300:56"] = "614275", ["234:210:325:178"] = "614276", ["236:142:400:146"] = "614285", ["242:210:481:215"] = "614293", ["251:348:539:43"] = "614295, 614296", ["253:229:182:214"] = "614283", ["264:211:468:295"] = "614291, 614292", ["278:310:525:358"] = "614279, 614280, 614281, 614282",},
	[388] = {["175:291:170:130"] = "615423, 615424", ["199:304:224:74"] = "615411, 615412", ["206:245:438:177"] = "615408", ["208:292:438:41"] = "615404, 615405", ["209:308:0:343"] = "615402, 615403", ["213:246:513:58"] = "615418", ["230:217:561:161"] = "615413", ["249:342:104:326"] = "615414, 615415", ["254:259:530:253"] = "615421, 615422", ["257:288:227:380"] = "615425, 615426, 615427, 615428", ["260:251:5:239"] = "615409, 615410", ["273:246:12:105"] = "615416, 615417", ["277:245:582:301"] = "615419, 615420", ["286:392:253:75"] = "615429, 615430, 615431, 615432", ["303:323:699:114"] = "615437, 615438, 615439, 615440", ["314:212:334:325"] = "615406, 615407", ["380:317:622:0"] = "615433, 615434, 615435, 615436", ["510:264:215:404"] = "615398, 615399, 615400, 615401",},
	[390] = {["220:188:297:324"] = "538846", ["234:286:134:9"] = "538829, 571508", ["261:315:203:36"] = "538836, 538837, 538838, 538839", ["313:321:183:198"] = "538847, 538848, 538849, 538850", ["346:263:124:405"] = "538851, 538852, 538853, 538854", ["372:475:545:12"] = "538874, 538875, 538876, 538877", ["385:373:504:295"] = "538870, 538871, 538872, 538873", ["607:461:395:182"] = "538855, 538856, 538857, 538858, 538859, 538860", ["610:374:392:294"] = "538830, 538831, 538832, 538833, 538834, 538835", ["651:262:351:406"] = "538840, 538841, 538842, 538843, 538844, 538845", ["677:668:325:0"] = "538861, 538862, 538863, 538864, 538865, 538866, 538867, 538868, 538869", ["989:466:13:202"] = "538890, 538891, 538892, 538893, 538894, 538895, 538896, 538897",},
	[391] = {["224:172:322:496"] = "614341", ["224:241:453:191"] = "614367", ["229:262:603:313"] = "614351, 614352", ["240:198:607:470"] = "614340", ["250:260:587:170"] = "614361, 614362", ["252:257:233:360"] = "614346, 614347", ["253:208:462:411"] = "614348", ["259:233:602:4"] = "614344, 614345", ["261:162:449:506"] = "614342, 614343", ["287:277:333:63"] = "614353, 614354, 614355, 614356", ["298:219:502:64"] = "614368, 614369", ["310:276:398:310"] = "614363, 614364, 614365, 614366", ["313:208:228:264"] = "614349, 614350", ["385:385:88:92"] = "614357, 614358, 614359, 614360",},
	[400] = {["213:170:413:385"] = "614385", ["238:296:560:185"] = "614379, 614380", ["247:221:417:447"] = "614374", ["255:269:420:209"] = "614372, 614373", ["261:235:306:433"] = "614388, 614389", ["271:205:545:369"] = "614394, 614395", ["282:306:692:362"] = "614381, 614382, 614383, 614384", ["294:283:92:192"] = "614390, 614391, 614392, 614393", ["296:359:213:241"] = "614375, 614376, 614377, 614378", ["300:246:125:0"] = "614386, 614387", ["353:200:546:468"] = "614370, 614371",},
	[402] = {["242:254:328:16"] = "614447", ["267:281:278:170"] = "614466, 614467, 614468, 614469", ["267:308:349:316"] = "614458, 614459, 614460, 614461", ["272:522:444:97"] = "614452, 614453, 614454, 614455, 614456, 614457", ["298:262:482:10"] = "614462, 614463, 614464, 614465", ["310:305:200:363"] = "614435, 614436, 614437, 614438", ["337:349:87:3"] = "614431, 614432, 614433, 614434", ["350:429:0:234"] = "614443, 614444, 614445, 614446", ["361:333:4:107"] = "614470, 614471, 614472, 614473", ["373:385:629:22"] = "614439, 614440, 614441, 614442", ["446:359:556:267"] = "614448, 614449, 614450, 614451",},
	[430] = {["188:412:397:59"] = "614501, 614502", ["190:282:513:3"] = "614482, 614483", ["204:383:444:44"] = "614495, 614496", ["211:395:125:88"] = "614497, 614498", ["212:265:317:63"] = "614493, 614494", ["214:393:218:77"] = "614484, 614485", ["217:279:589:27"] = "614490, 614491", ["219:259:300:215"] = "614499, 614500", ["246:240:343:373"] = "614492", ["252:313:23:267"] = "614507, 614508, 614507, 614508", ["257:300:0:79"] = "614503, 614504, 614505, 614506", ["258:170:330:498"] = "614509, 614510", ["265:194:545:205"] = "614478, 614479", ["272:250:176:376"] = "614480, 614481", ["286:268:701:19"] = "614486, 614487, 614488, 614489", ["306:204:612:0"] = "614511, 614512",},
	[434] = {["209:234:593:92"] = "642686", ["209:318:341:125"] = "642670, 642671", ["218:186:236:32"] = "642683", ["236:206:458:110"] = "642680", ["250:218:351:0"] = "642665", ["262:293:191:122"] = "642674, 642675, 642676, 642677", ["268:241:450:406"] = "642684, 642685", ["290:283:162:385"] = "642687, 642688, 642689, 642690", ["322:211:437:313"] = "642672, 642673", ["323:194:441:224"] = "642678, 642679", ["325:190:485:0"] = "642681, 642682", ["325:270:214:311"] = "642666, 642667, 642668, 642669",},
	[435] = {["164:191:565:289"] = "651259", ["213:257:565:126"] = "651260, 651261", ["362:222:414:96"] = "651257, 651258", ["385:146:206:173"] = "651255, 651256",},
	[445] = {["290:191:412:477"] = "615054, 615055, 615054, 615055", ["294:220:433:0"] = "614718, 614719", ["479:493:371:175"] = "614714, 614715, 614716, 614717",},
	[498] = {["206:200:656:21"] = "656197", ["270:353:428:0"] = "656230, 656231, 656232, 656233", ["279:301:358:169"] = "656202, 656203, 656204, 656205", ["305:247:542:223"] = "656224, 656225", ["317:230:137:188"] = "656222, 656223", ["344:183:199:0"] = "656198, 656199", ["384:249:133:59"] = "656200, 656201", ["433:351:109:313"] = "656218, 656219, 656220, 656221", ["436:299:359:369"] = "656226, 656227, 656228, 656229",},
	[499] = {["188:412:397:59"] = "660517, 660518", ["190:282:513:3"] = "660486, 660487", ["204:383:444:44"] = "660511, 660512", ["211:395:125:88"] = "660513, 660514", ["212:265:317:63"] = "660509, 660510", ["214:393:218:77"] = "660488, 660489", ["217:279:589:27"] = "660506, 660507", ["219:259:300:215"] = "660515, 660516", ["246:240:343:373"] = "660508", ["257:300:0:79"] = "660519, 660520, 660521, 660522", ["258:170:330:498"] = "660527, 660528", ["272:250:176:376"] = "660484, 660485", ["275:329:0:267"] = "660523, 660524, 660525, 660526, 660523, 660524, 660525, 660526", ["295:293:701:19"] = "660490, 660491, 660492, 660493", ["306:204:612:0"] = "660529, 660530", ["347:199:545:200"] = "660482, 660483",},
	[521] = {["278:325:183:95"] = "800842, 800843, 800844, 800845, 800842, 800843, 800844, 800845", ["446:429:396:9"] = "800846, 800847, 800848, 800849, 800846, 800847, 800848, 800849, 800850, 800851, 800852, 800853, 800850, 800851, 800852, 800853, 800854, 800855, 800856, 800857, 800854, 800855, 800856, 800857, 800858, 800859, 800860, 800861, 800858, 800859, 800860, 800861", ["490:290:256:378"] = "800841, 804116, 804117, 804118, 800841, 804116, 804117, 804118",},
	[533] = {["278:325:183:95"] = "803902, 803903, 803904, 803905, 803902, 803903, 803904, 803905", ["446:429:396:9"] = "803910, 803911, 803912, 803913, 803914, 803915, 803916, 803917, 803906, 803907, 803908, 803909, 803918, 803919, 803920, 803921, 803918, 803919, 803920, 803921, 803914, 803915, 803916, 803917, 803910, 803911, 803912, 803913, 803906, 803907, 803908, 803909", ["490:290:256:378"] = "803901, 839100, 839101, 839102, 803901, 839100, 839101, 839102",},
	[542] = {["178:203:597:210"] = "1003336", ["199:335:641:304"] = "1003346, 1003347", ["213:278:609:33"] = "1003352, 1003353", ["217:239:483:33"] = "1003341", ["251:191:306:281"] = "1003354", ["255:191:284:91"] = "1003333", ["256:210:290:192"] = "1003355", ["258:217:311:4"] = "1003327, 1003328", ["266:293:439:137"] = "1003356, 1003357, 1003358, 1003359", ["267:257:336:327"] = "1003342, 1003343, 1003344, 1003345, 1027472, 1027473, 1027474, 1027475, 1027472, 1027473, 1027474, 1027475, 1126503, 1126504, 1126505, 1126506", ["273:349:729:319"] = "1003329, 1003330, 1003331, 1003332", ["274:214:121:0"] = "1003334, 1003335", ["282:341:505:323"] = "1003337, 1003338, 1003339, 1003340", ["317:233:72:292"] = "1003360, 1003361", ["329:294:673:156"] = "1003348, 1003349, 1003350, 1003351", ["356:303:38:117"] = "1003323, 1003324, 1003325, 1003326",},
	[551] = {["174:208:81:367"] = "1126684", ["189:294:303:62"] = "1126693, 1126694", ["209:245:0:264"] = "1126692", ["223:183:392:187"] = "1126689", ["238:229:501:171"] = "1126706", ["246:218:296:383"] = "1126703", ["248:314:170:354"] = "1126704, 1126705", ["270:208:465:313"] = "1126701, 1126702", ["274:251:118:194"] = "1126707, 1126708", ["327:241:254:262"] = "1126690, 1126691", ["333:437:637:136"] = "1126680, 1126681, 1126682, 1126683", ["338:254:54:94"] = "1126699, 1126700", ["343:264:429:392"] = "1126685, 1126686, 1126687, 1126688", ["365:276:392:23"] = "1126695, 1126696, 1126697, 1126698",},
	[552] = {["225:224:472:148"] = "1036473", ["252:280:546:228"] = "1036441, 1036442", ["278:270:165:364"] = "1036451, 1036452, 1036453, 1036454", ["279:267:427:0"] = "1036457, 1036458, 1036459, 1036460", ["287:277:713:35"] = "1036474, 1036475, 1036476, 1036477", ["292:235:567:42"] = "1036445, 1036446", ["307:229:150:264"] = "1036443, 1036444", ["308:276:685:298"] = "1036461, 1036462, 1036463, 1036464", ["309:262:338:356"] = "1036437, 1036438, 1036439, 1036440", ["326:212:352:271"] = "1036471, 1036472", ["389:234:597:178"] = "1036435, 1036436", ["398:149:571:0"] = "1036455, 1036456", ["406:367:173:22"] = "1036465, 1036466, 1036467, 1036468", ["423:290:548:378"] = "1036447, 1036448, 1036449, 1036450", ["497:157:207:511"] = "1036469, 1036470",},
	[556] = {["173:160:309:460"] = "1037676", ["202:201:383:411"] = "1037683", ["223:279:194:0"] = "1037663, 1037664, 1037674, 1037675, 1037674, 1037675, 1126508, 1126509", ["229:240:319:5"] = "1037665", ["260:309:26:0"] = "1037666, 1037667, 1037668, 1037669", ["282:201:468:467"] = "1037655, 1037656", ["282:225:259:315"] = "1037677, 1037678", ["288:261:453:306"] = "1037679, 1037680, 1037681, 1037682", ["291:266:426:0"] = "1037657, 1037658, 1037659, 1037660", ["309:264:140:160"] = "1037651, 1037652, 1037653, 1037654", ["346:252:270:158"] = "1037661, 1037662", ["393:318:537:150"] = "1037670, 1037671, 1037672, 1037673",},
	[559] = {["169:178:374:276"] = "1037704", ["182:244:649:155"] = "1037688", ["188:190:444:255"] = "1037686", ["190:187:282:261"] = "1037689", ["196:284:429:84"] = "1037702, 1037703", ["197:179:310:328"] = "1037705", ["198:232:521:268"] = "1037707", ["209:154:334:210"] = "1037684", ["217:224:533:382"] = "1037687", ["226:193:465:475"] = "1037708", ["229:213:197:198"] = "1037709", ["229:246:410:350"] = "1037685", ["238:295:520:127"] = "1037698, 1037699", ["252:230:281:83"] = "1037706", ["314:304:102:0"] = "1037694, 1037695, 1037696, 1037697", ["371:174:289:0"] = "1037700, 1037701", ["382:274:459:0"] = "1037690, 1037691, 1037692, 1037693",},
	[560] = {["166:161:383:371"] = "1036374", ["208:142:275:416"] = "1036391", ["209:225:411:250"] = "1036382", ["210:193:525:260"] = "1036375", ["211:221:455:74"] = "1036378", ["217:178:259:335"] = "1036390", ["217:180:454:183"] = "1036379", ["250:232:312:77"] = "1036392", ["253:198:444:323"] = "1036389", ["262:221:451:372"] = "1036393, 1036394", ["279:241:258:213"] = "1036380, 1036381", ["285:323:547:73"] = "1036383, 1036384, 1036385, 1036386", ["297:181:281:444"] = "1036376, 1036377", ["315:180:350:0"] = "1036387, 1036388", ["324:161:283:507"] = "1036372, 1036373",},
	[567] = {["234:191:239:259"] = "1036395", ["236:242:283:354"] = "1036410", ["236:372:766:118"] = "1036404, 1036405", ["249:288:753:380"] = "1036413, 1036414", ["250:287:746:25"] = "1036415, 1036416", ["256:301:600:367"] = "1036402, 1036403", ["262:266:366:323"] = "1036417, 1036418, 1036419, 1036420", ["263:287:430:0"] = "1036421, 1036422, 1036423, 1036424", ["274:254:312:98"] = "1036429, 1036430", ["286:274:588:0"] = "1036398, 1036399, 1036400, 1036401", ["296:272:461:353"] = "1036431, 1036432, 1036433, 1036434", ["305:227:256:12"] = "1036396, 1036397", ["316:221:382:187"] = "1036411, 1036412", ["354:315:523:159"] = "1036425, 1036426, 1036427, 1036428", ["471:437:0:0"] = "1036406, 1036407, 1036408, 1036409",},
	[594] = {["143:137:328:251"] = "1027314",},
	[628] = {["168:170:375:102"] = "1085238", ["195:199:436:0"] = "1085237", ["199:191:333:474"] = "1085244", ["218:183:459:97"] = "1085239", ["233:266:386:374"] = "1085242, 1085243", ["235:188:327:182"] = "1085234", ["238:195:225:110"] = "1085231", ["240:270:578:91"] = "1085240, 1085241", ["268:354:533:268"] = "1085249, 1085250, 1085251, 1085252", ["272:206:258:0"] = "1085232, 1085233", ["295:205:530:6"] = "1085235, 1085236", ["308:226:144:175"] = "1085257, 1085258", ["348:357:132:311"] = "1085253, 1085254, 1085255, 1085256", ["370:298:368:179"] = "1085245, 1085246, 1085247, 1085248",},
	[653] = {["181:243:481:340"] = "1414545", ["206:266:396:244"] = "1414541, 1414542", ["220:288:523:233"] = "1414543, 1414544", ["239:303:594:0"] = "1414528, 1414529", ["247:184:450:95"] = "1414530", ["272:192:441:173"] = "1414539, 1414540", ["288:195:477:0"] = "1414546, 1414547", ["315:185:257:0"] = "1414537, 1414538", ["321:267:281:401"] = "1414531, 1414532, 1414533, 1414534", ["330:265:166:202"] = "1414524, 1414525, 1414526, 1414527", ["351:245:219:69"] = "1414535, 1414536",},
	[657] = {["132:145:689:266"] = "1414600", ["135:162:623:81"] = "1414615", ["150:180:741:313"] = "1414613", ["173:163:648:339"] = "1414601", ["177:169:506:345"] = "1414618", ["180:160:510:118"] = "1414619", ["186:158:522:288"] = "1414623", ["194:214:592:226"] = "1414616", ["199:185:361:210"] = "1414596", ["200:174:612:187"] = "1414604", ["205:199:479:183"] = "1414622", ["215:247:457:412"] = "1414599", ["241:194:345:95"] = "1414614", ["252:280:585:372"] = "1414602, 1414603", ["289:172:689:0"] = "1414617, 1417748", ["291:208:316:282"] = "1414620, 1414621", ["297:210:154:129"] = "1414597, 1414598", ["386:314:56:185"] = "1414624, 1414625, 1414626, 1414627", ["509:251:17:0"] = "1414611, 1414612", ["631:315:0:353"] = "1414605, 1414606, 1414607, 1414608, 1414609, 1414610",},
	[664] = {["171:150:457:351"] = "1414675", ["177:156:467:413"] = "1414676", ["216:219:459:240"] = "1414689", ["218:168:342:416"] = "1414690", ["239:301:136:274"] = "1414673, 1414674", ["241:240:587:250"] = "1414665", ["250:253:262:175"] = "1414666", ["254:281:549:380"] = "1414681, 1414682", ["274:344:610:18"] = "1414677, 1414678, 1414679, 1414680", ["294:364:283:0"] = "1414669, 1414670, 1414671, 1414672", ["311:244:259:275"] = "1414667, 1414668", ["326:360:419:0"] = "1414683, 1414684, 1414685, 1414686", ["341:188:324:480"] = "1414687, 1414688",},
	[669] = {["182:245:220:260"] = "1597370", ["276:213:350:13"] = "1597172, 1597166", ["308:244:632:169"] = "1414556, 1414557", ["312:301:500:0"] = "1414560, 1414561, 1414562, 1414563", ["332:276:596:100"] = "1597182, 1597179, 1597167, 1597186", ["338:270:389:180"] = "1597181, 1597168, 1597171, 1597187", ["338:322:254:84"] = "1597169, 1597369, 1597185, 1597180", ["387:314:312:302"] = "1597371, 1597184, 1597183, 1597170",},
	[674] = {["110:98:445:190"] = "1467065", ["172:204:249:236"] = "1414595", ["186:213:391:408"] = "1414568", ["207:302:469:45"] = "1414580, 1414581", ["214:308:314:360"] = "1414578, 1414579", ["217:148:323:249"] = "1414577", ["244:199:332:302"] = "1414594", ["256:326:172:31"] = "1414566, 1414567", ["283:170:331:0"] = "1414582, 1414583", ["288:258:452:410"] = "1414569, 1414570, 1414571, 1414572", ["297:250:307:75"] = "1414564, 1414565", ["311:229:357:179"] = "1414584, 1414585", ["341:328:494:236"] = "1414586, 1414587, 1414588, 1414589", ["344:295:0:244"] = "1414573, 1414574, 1414575, 1414576", ["445:326:0:342"] = "1414590, 1414591, 1414592, 1414593",},
	[700] = {["376:364:0:212"] = "1445120, 1445121, 1445122, 1445123",},
	[704] = {["221:224:264:226"] = "1414656", ["222:311:132:179"] = "1414628, 1414629", ["248:317:23:136"] = "1414634, 1414635", ["289:363:183:305"] = "1414636, 1414637, 1414638, 1414639", ["327:381:492:0"] = "1414630, 1414631, 1414632, 1414633", ["355:291:344:285"] = "1414640, 1414641, 1414642, 1414643", ["387:372:327:0"] = "1414661, 1414662, 1414663, 1414664", ["419:538:583:0"] = "1414644, 1414645, 1414646, 1414647, 1414648, 1414649", ["428:316:201:0"] = "1414652, 1414653, 1414654, 1414655", ["470:337:390:331"] = "1414657, 1414658, 1414659, 1414660", ["480:245:58:0"] = "1414650, 1414651",},
	[738] = {["116:118:271:238"] = "1346187", ["262:188:269:233"] = "1346188, 1346189",},
	[815] = {["848:668:39:0"] = "1417775, 1417779, 1417780, 1417781, 1417782, 1417783, 1417784, 1417785, 1417786, 1417776, 1417777, 1417778",},
	[855] = {["296:336:371:178"] = "1710644, 1710645, 1710646, 1710647", ["307:304:428:364"] = "1710648, 1710649, 1710650, 1710651", ["445:379:557:289"] = "1710660, 1710661, 1710662, 1710663", ["498:530:37:138"] = "1710664, 1710665, 1710666, 1710667, 1710668, 1710669", ["835:422:167:0"] = "1710652, 1710653, 1710654, 1710655, 1710656, 1710657, 1710658, 1710659",},
	[887] = {["1130:672:1357:0"] = "2034223, 2034230, 2034231, 2034232, 2034233, 2034234, 2034235, 2034236, 2034237, 2034224, 2034225, 2034226, 2034227, 2034228, 2034229", ["1243:1287:1046:1273"] = "2034370, 2034381, 2034392, 2034394, 2034395, 2034396, 2034397, 2034398, 2034399, 2034371, 2034372, 2034373, 2034374, 2034375, 2034376, 2034377, 2034378, 2034379, 2034380, 2034382, 2034383, 2034384, 2034385, 2034386, 2034387, 2034388, 2034389, 2034390, 2034391, 2034393", ["1650:1565:321:378"] = "2034162, 2034173, 2034184, 2034195, 2034206, 2034207, 2034208, 2034209, 2034210, 2034163, 2034164, 2034165, 2034166, 2034167, 2034168, 2034169, 2034170, 2034171, 2034172, 2034174, 2034175, 2034176, 2034177, 2034178, 2034179, 2034180, 2034181, 2034182, 2034183, 2034185, 2034186, 2034187, 2034188, 2034189, 2034190, 2034191, 2034192, 2034193, 2034194, 2034196, 2034197, 2034198, 2034199, 2034200, 2034201, 2034202, 2034203, 2034204, 2034205", ["699:1207:1815:260"] = "2034238, 2034245, 2034246, 2034247, 2034248, 2034249, 2034250, 2034251, 2034252, 2034239, 2034240, 2034241, 2034242, 2034243, 2034244", ["726:617:2631:1023"] = "2034361, 2034362, 2034363, 2034364, 2034365, 2034366, 2034367, 2034368, 2034369", ["769:967:2107:327"] = "2034321, 2034329, 2034330, 2034331, 2034332, 2034333, 2034334, 2034335, 2034336, 2034322, 2034323, 2034324, 2034325, 2034326, 2034327, 2034328", ["793:668:2685:633"] = "2034211, 2034215, 2034216, 2034217, 2034218, 2034219, 2034220, 2034221, 2034222, 2034212, 2034213, 2034214", ["888:1512:1312:82"] = "2034269, 2034280, 2034286, 2034287, 2034288, 2034289, 2034290, 2034291, 2034292, 2034270, 2034271, 2034272, 2034273, 2034274, 2034275, 2034276, 2034277, 2034278, 2034279, 2034281, 2034282, 2034283, 2034284, 2034285", ["934:830:2325:1270"] = "2034253, 2034261, 2034262, 2034263, 2034264, 2034265, 2034266, 2034267, 2034268, 2034254, 2034255, 2034256, 2034257, 2034258, 2034259, 2034260", ["943:1559:2144:0"] = "2034293, 2034304, 2034314, 2034315, 2034316, 2034317, 2034318, 2034319, 2034320, 2034294, 2034295, 2034296, 2034297, 2034298, 2034299, 2034300, 2034301, 2034302, 2034303, 2034305, 2034306, 2034307, 2034308, 2034309, 2034310, 2034311, 2034312, 2034313", ["979:912:2409:0"] = "2034400, 2034408, 2034409, 2034410, 2034411, 2034412, 2034413, 2034414, 2034415, 2034401, 2034402, 2034403, 2034404, 2034405, 2034406, 2034407", ["999:1344:1825:1216"] = "2034337, 2034348, 2034354, 2034355, 2034356, 2034357, 2034358, 2034359, 2034360, 2034338, 2034339, 2034340, 2034341, 2034342, 2034343, 2034344, 2034345, 2034346, 2034347, 2034349, 2034350, 2034351, 2034352, 2034353",},
	[888] = {["1065:1103:2309:210"] = "2023868, 2023879, 2023886, 2023887, 2023888, 2023889, 2023890, 2023891, 2023892, 2023869, 2023870, 2023871, 2023872, 2023873, 2023874, 2023875, 2023876, 2023877, 2023878, 2023880, 2023881, 2023882, 2023883, 2023884, 2023885", ["1098:996:2349:871"] = "2023693, 2023704, 2023706, 2023707, 2023708, 2023709, 2023710, 2023711, 2023712, 2023694, 2023695, 2023696, 2023697, 2023698, 2023699, 2023700, 2023701, 2023702, 2023703, 2023705", ["1157:967:484:1539"] = "2023923, 2023934, 2023936, 2023937, 2023938, 2023939, 2023940, 2023941, 2023942, 2023924, 2023925, 2023926, 2023927, 2023928, 2023929, 2023930, 2023931, 2023932, 2023933, 2023935", ["1225:1249:620:565"] = "2024017, 2024028, 2024035, 2024036, 2024037, 2024038, 2024039, 2024040, 2024041, 2024018, 2024019, 2024020, 2024021, 2024022, 2024023, 2024024, 2024025, 2024026, 2024027, 2024029, 2024030, 2024031, 2024032, 2024033, 2024034", ["1289:809:1072:1676"] = "2023943, 2023954, 2023960, 2023961, 2023962, 2023963, 2023964, 2023965, 2023966, 2023944, 2023945, 2023946, 2023947, 2023948, 2023949, 2023950, 2023951, 2023952, 2023953, 2023955, 2023956, 2023957, 2023958, 2023959", ["1349:1029:1682:0"] = "2023967, 2023978, 2023989, 2023991, 2023992, 2023993, 2023994, 2023995, 2023996, 2023968, 2023969, 2023970, 2023971, 2023972, 2023973, 2023974, 2023975, 2023976, 2023977, 2023979, 2023980, 2023981, 2023982, 2023983, 2023984, 2023985, 2023986, 2023987, 2023988, 2023990", ["1534:1119:1097:281"] = "2023893, 2023904, 2023915, 2023917, 2023918, 2023919, 2023920, 2023921, 2023922, 2023894, 2023895, 2023896, 2023897, 2023898, 2023899, 2023900, 2023901, 2023902, 2023903, 2023905, 2023906, 2023907, 2023908, 2023909, 2023910, 2023911, 2023912, 2023913, 2023914, 2023916", ["534:709:1298:1561"] = "2024042, 2024043, 2024044, 2024045, 2024046, 2024047, 2024048, 2024049, 2024050", ["800:991:1511:1043"] = "2023713, 2023721, 2023722, 2023723, 2023724, 2023725, 2023726, 2023727, 2023728, 2023714, 2023715, 2023716, 2023717, 2023718, 2023719, 2023720", ["841:1075:1807:1043"] = "2023997, 2024008, 2024010, 2024011, 2024012, 2024013, 2024014, 2024015, 2024016, 2023998, 2023999, 2024000, 2024001, 2024002, 2024003, 2024004, 2024005, 2024006, 2024007, 2024009",},
	[889] = {["1086:703:576:902"] = "2033989, 2033996, 2033997, 2033998, 2033999, 2034000, 2034001, 2034002, 2034003, 2033990, 2033991, 2033992, 2033993, 2033994, 2033995", ["1139:822:1569:1281"] = "2033845, 2033856, 2033858, 2033859, 2033860, 2033861, 2033862, 2033863, 2033864, 2033846, 2033847, 2033848, 2033849, 2033850, 2033851, 2033852, 2033853, 2033854, 2033855, 2033857", ["1223:843:1733:0"] = "2034004, 2034015, 2034017, 2034018, 2034019, 2034020, 2034021, 2034022, 2034023, 2034005, 2034006, 2034007, 2034008, 2034009, 2034010, 2034011, 2034012, 2034013, 2034014, 2034016", ["1287:876:1469:1684"] = "2033821, 2033832, 2033838, 2033839, 2033840, 2033841, 2033842, 2033843, 2033844, 2033822, 2033823, 2033824, 2033825, 2033826, 2033827, 2033828, 2033829, 2033830, 2033831, 2033833, 2033834, 2033835, 2033836, 2033837", ["666:856:1180:1255"] = "2033961, 2033965, 2033966, 2033967, 2033968, 2033969, 2033970, 2033971, 2033972, 2033962, 2033963, 2033964", ["769:816:739:1332"] = "2033973, 2033981, 2033982, 2033983, 2033984, 2033985, 2033986, 2033987, 2033988, 2033974, 2033975, 2033976, 2033977, 2033978, 2033979, 2033980", ["794:542:1362:2018"] = "2033949, 2033953, 2033954, 2033955, 2033956, 2033957, 2033958, 2033959, 2033960, 2033950, 2033951, 2033952", ["849:672:1316:895"] = "2033865, 2033869, 2033870, 2033871, 2033872, 2033873, 2033874, 2033875, 2033876, 2033866, 2033867, 2033868", ["881:897:1006:341"] = "2033917, 2033925, 2033926, 2033927, 2033928, 2033929, 2033930, 2033931, 2033932, 2033918, 2033919, 2033920, 2033921, 2033922, 2033923, 2033924", ["913:727:2063:517"] = "2033877, 2033881, 2033882, 2033883, 2033884, 2033885, 2033886, 2033887, 2033888, 2033878, 2033879, 2033880", ["915:966:1579:220"] = "2033933, 2033941, 2033942, 2033943, 2033944, 2033945, 2033946, 2033947, 2033948, 2033934, 2033935, 2033936, 2033937, 2033938, 2033939, 2033940", ["926:688:807:1801"] = "2033905, 2033909, 2033910, 2033911, 2033912, 2033913, 2033914, 2033915, 2033916, 2033906, 2033907, 2033908", ["969:835:1880:859"] = "2033889, 2033897, 2033898, 2033899, 2033900, 2033901, 2033902, 2033903, 2033904, 2033890, 2033891, 2033892, 2033893, 2033894, 2033895, 2033896",},
	[907] = {["265:310:278:284"] = "1710620, 1710621, 1710622, 1710623", ["284:264:410:375"] = "1710634, 1710635, 1710636, 1710637", ["313:353:498:111"] = "1710616, 1710617, 1710618, 1710619", ["463:519:265:54"] = "1710624, 1710625, 1710626, 1710627, 1710628, 1710629", ["498:461:0:0"] = "1710630, 1710631, 1710632, 1710633", ["701:323:0:0"] = "1710638, 1710639, 1710640, 1710641, 1710642, 1710643",},
	[910] = {["467:430:535:238"] = "1710612, 1710613, 1710614, 1710615", ["626:385:293:0"] = "1710597, 1710598, 1710599, 1710600, 1710601, 1710602", ["660:668:0:0"] = "1710603, 1710604, 1710605, 1710606, 1710607, 1710608, 1710609, 1710610, 1710611",},
	[920] = {["1047:821:2314:1739"] = "2033525, 2033536, 2033538, 2033539, 2033540, 2033541, 2033542, 2033543, 2033544, 2033526, 2033527, 2033528, 2033529, 2033530, 2033531, 2033532, 2033533, 2033534, 2033535, 2033537", ["1242:944:2451:1035"] = "2033605, 2033616, 2033618, 2033619, 2033620, 2033621, 2033622, 2033623, 2033624, 2033606, 2033607, 2033608, 2033609, 2033610, 2033611, 2033612, 2033613, 2033614, 2033615, 2033617", ["1306:678:802:0"] = "2033803, 2033813, 2033814, 2033815, 2033816, 2033817, 2033818, 2033819, 2033820, 2033804, 2033805, 2033806, 2033807, 2033808, 2033809, 2033810, 2033811, 2033812", ["1432:1009:2117:332"] = "2033473, 2033484, 2033490, 2033491, 2033492, 2033493, 2033494, 2033495, 2033496, 2033474, 2033475, 2033476, 2033477, 2033478, 2033479, 2033480, 2033481, 2033482, 2033483, 2033485, 2033486, 2033487, 2033488, 2033489", ["1777:900:1806:0"] = "2033497, 2033508, 2033518, 2033519, 2033520, 2033521, 2033522, 2033523, 2033524, 2033498, 2033499, 2033500, 2033501, 2033502, 2033503, 2033504, 2033505, 2033506, 2033507, 2033509, 2033510, 2033511, 2033512, 2033513, 2033514, 2033515, 2033516, 2033517", ["828:899:766:100"] = "2033569, 2033577, 2033578, 2033579, 2033580, 2033581, 2033582, 2033583, 2033584, 2033570, 2033571, 2033572, 2033573, 2033574, 2033575, 2033576", ["859:788:1108:451"] = "2033457, 2033465, 2033466, 2033467, 2033468, 2033469, 2033470, 2033471, 2033472, 2033458, 2033459, 2033460, 2033461, 2033462, 2033463, 2033464", ["891:1057:2852:1503"] = "2033625, 2033636, 2033638, 2033639, 2033640, 2033641, 2033642, 2033643, 2033644, 2033626, 2033627, 2033628, 2033629, 2033630, 2033631, 2033632, 2033633, 2033634, 2033635, 2033637", ["908:1284:1538:176"] = "2033545, 2033556, 2033562, 2033563, 2033564, 2033565, 2033566, 2033567, 2033568, 2033546, 2033547, 2033548, 2033549, 2033550, 2033551, 2033552, 2033553, 2033554, 2033555, 2033557, 2033558, 2033559, 2033560, 2033561", ["953:1223:1772:1199"] = "2033783, 2033794, 2033796, 2033797, 2033798, 2033799, 2033800, 2033801, 2033802, 2033784, 2033785, 2033786, 2033787, 2033788, 2033789, 2033790, 2033791, 2033792, 2033793, 2033795", ["978:1171:2054:995"] = "2033585, 2033596, 2033598, 2033599, 2033600, 2033601, 2033602, 2033603, 2033604, 2033586, 2033587, 2033588, 2033589, 2033590, 2033591, 2033592, 2033593, 2033594, 2033595, 2033597",},
	[921] = {["1079:1204:1261:0"] = "2038112, 2038123, 2038130, 2038131, 2038132, 2038133, 2038134, 2038135, 2038136, 2038113, 2038114, 2038115, 2038116, 2038117, 2038118, 2038119, 2038120, 2038121, 2038122, 2038124, 2038125, 2038126, 2038127, 2038128, 2038129", ["1090:1169:1847:1025"] = "2038087, 2038098, 2038105, 2038106, 2038107, 2038108, 2038109, 2038110, 2038111, 2038088, 2038089, 2038090, 2038091, 2038092, 2038093, 2038094, 2038095, 2038096, 2038097, 2038099, 2038100, 2038101, 2038102, 2038103, 2038104", ["1125:880:1812:760"] = "2037819, 2037830, 2037832, 2037833, 2037834, 2037835, 2037836, 2037837, 2037838, 2037820, 2037821, 2037822, 2037823, 2037824, 2037825, 2037826, 2037827, 2037828, 2037829, 2037831", ["1139:1154:377:939"] = "2037884, 2037895, 2037902, 2037903, 2037904, 2037905, 2037906, 2037907, 2037908, 2037885, 2037886, 2037887, 2037888, 2037889, 2037890, 2037891, 2037892, 2037893, 2037894, 2037896, 2037897, 2037898, 2037899, 2037900, 2037901", ["1154:1059:1839:0"] = "2037839, 2037850, 2037857, 2037858, 2037859, 2037860, 2037861, 2037862, 2037863, 2037840, 2037841, 2037842, 2037843, 2037844, 2037845, 2037846, 2037847, 2037848, 2037849, 2037851, 2037852, 2037853, 2037854, 2037855, 2037856", ["1188:1421:933:863"] = "2037789, 2037800, 2037811, 2037813, 2037814, 2037815, 2037816, 2037817, 2037818, 2037790, 2037791, 2037792, 2037793, 2037794, 2037795, 2037796, 2037797, 2037798, 2037799, 2037801, 2037802, 2037803, 2037804, 2037805, 2037806, 2037807, 2037808, 2037809, 2037810, 2037812", ["1239:839:388:570"] = "2037864, 2037875, 2037877, 2037878, 2037879, 2037880, 2037881, 2037882, 2037883, 2037865, 2037866, 2037867, 2037868, 2037869, 2037870, 2037871, 2037872, 2037873, 2037874, 2037876", ["1373:1010:0:0"] = "2038137, 2038148, 2038154, 2038155, 2038156, 2038157, 2038158, 2038159, 2038160, 2038138, 2038139, 2038140, 2038141, 2038142, 2038143, 2038144, 2038145, 2038146, 2038147, 2038149, 2038150, 2038151, 2038152, 2038153", ["1424:1026:438:0"] = "2038197, 2038208, 2038219, 2038221, 2038222, 2038223, 2038224, 2038225, 2038226, 2038198, 2038199, 2038200, 2038201, 2038202, 2038203, 2038204, 2038205, 2038206, 2038207, 2038209, 2038210, 2038211, 2038212, 2038213, 2038214, 2038215, 2038216, 2038217, 2038218, 2038220", ["1521:1323:1212:1237"] = "2038161, 2038172, 2038183, 2038191, 2038192, 2038193, 2038194, 2038195, 2038196, 2038162, 2038163, 2038164, 2038165, 2038166, 2038167, 2038168, 2038169, 2038170, 2038171, 2038173, 2038174, 2038175, 2038176, 2038177, 2038178, 2038179, 2038180, 2038181, 2038182, 2038184, 2038185, 2038186, 2038187, 2038188, 2038189, 2038190", ["770:1181:2386:1049"] = "2038067, 2038078, 2038080, 2038081, 2038082, 2038083, 2038084, 2038085, 2038086, 2038068, 2038069, 2038070, 2038071, 2038072, 2038073, 2038074, 2038075, 2038076, 2038077, 2038079", ["948:1081:1644:361"] = "2038047, 2038058, 2038060, 2038061, 2038062, 2038063, 2038064, 2038065, 2038066, 2038048, 2038049, 2038050, 2038051, 2038052, 2038053, 2038054, 2038055, 2038056, 2038057, 2038059",},
	[967] = {["1030:1134:1288:1426"] = "2033070, 2033081, 2033088, 2033089, 2033090, 2033091, 2033092, 2033093, 2033094, 2033071, 2033072, 2033073, 2033074, 2033075, 2033076, 2033077, 2033078, 2033079, 2033080, 2033082, 2033083, 2033084, 2033085, 2033086, 2033087", ["1052:1466:1918:0"] = "2033199, 2033210, 2033221, 2033223, 2033224, 2033225, 2033226, 2033227, 2033228, 2033200, 2033201, 2033202, 2033203, 2033204, 2033205, 2033206, 2033207, 2033208, 2033209, 2033211, 2033212, 2033213, 2033214, 2033215, 2033216, 2033217, 2033218, 2033219, 2033220, 2033222", ["1167:1224:1750:1336"] = "2033045, 2033056, 2033063, 2033064, 2033065, 2033066, 2033067, 2033068, 2033069, 2033046, 2033047, 2033048, 2033049, 2033050, 2033051, 2033052, 2033053, 2033054, 2033055, 2033057, 2033058, 2033059, 2033060, 2033061, 2033062", ["1325:1981:2515:0"] = "2033229, 2033240, 2033251, 2033262, 2033272, 2033273, 2033274, 2033275, 2033276, 2033230, 2033231, 2033232, 2033233, 2033234, 2033235, 2033236, 2033237, 2033238, 2033239, 2033241, 2033242, 2033243, 2033244, 2033245, 2033246, 2033247, 2033248, 2033249, 2033250, 2033252, 2033253, 2033254, 2033255, 2033256, 2033257, 2033258, 2033259, 2033260, 2033261, 2033263, 2033264, 2033265, 2033266, 2033267, 2033268, 2033269, 2033270, 2033271", ["1403:711:1153:1056"] = "2033161, 2033171, 2033172, 2033173, 2033174, 2033175, 2033176, 2033177, 2033178, 2033162, 2033163, 2033164, 2033165, 2033166, 2033167, 2033168, 2033169, 2033170", ["1628:1457:0:1103"] = "2033415, 2033426, 2033437, 2033448, 2033452, 2033453, 2033454, 2033455, 2033456, 2033416, 2033417, 2033418, 2033419, 2033420, 2033421, 2033422, 2033423, 2033424, 2033425, 2033427, 2033428, 2033429, 2033430, 2033431, 2033432, 2033433, 2033434, 2033435, 2033436, 2033438, 2033439, 2033440, 2033441, 2033442, 2033443, 2033444, 2033445, 2033446, 2033447, 2033449, 2033450, 2033451", ["1659:1491:2181:1069"] = "2033095, 2033106, 2033117, 2033128, 2033132, 2033133, 2033134, 2033135, 2033136, 2033096, 2033097, 2033098, 2033099, 2033100, 2033101, 2033102, 2033103, 2033104, 2033105, 2033107, 2033108, 2033109, 2033110, 2033111, 2033112, 2033113, 2033114, 2033115, 2033116, 2033118, 2033119, 2033120, 2033121, 2033122, 2033123, 2033124, 2033125, 2033126, 2033127, 2033129, 2033130, 2033131", ["859:1050:840:475"] = "2033179, 2033190, 2033192, 2033193, 2033194, 2033195, 2033196, 2033197, 2033198, 2033180, 2033181, 2033182, 2033183, 2033184, 2033185, 2033186, 2033187, 2033188, 2033189, 2033191", ["929:1380:1365:0"] = "2033137, 2033148, 2033154, 2033155, 2033156, 2033157, 2033158, 2033159, 2033160, 2033138, 2033139, 2033140, 2033141, 2033142, 2033143, 2033144, 2033145, 2033146, 2033147, 2033149, 2033150, 2033151, 2033152, 2033153",},
	[968] = {["107:98:648:258"] = "1998395, 2018419", ["135:91:457:278"] = "2018445, 2018420", ["78:78:352:227"] = "1998396, 2018422",},
	[1176] = {["105:88:425:38"] = "2481586",},
	[1184] = {["1002:668:0:0"] = "2481373, 2481377, 2481378, 2481379, 2481380, 2481381, 2481382, 2481383, 2481384, 2481374, 2481375, 2481376",},
	[1186] = {["1224:1131:935:1429"] = "3020691, 3020702, 3020709, 3020710, 3020711, 3020712, 3020713, 3020714, 3020715, 3020692, 3020693, 3020694, 3020695, 3020696, 3020697, 3020698, 3020699, 3020700, 3020701, 3020703, 3020704, 3020705, 3020706, 3020707, 3020708", ["1411:710:895:1151"] = "3020640, 3020650, 3020651, 3020652, 3020653, 3020654, 3020655, 3020656, 3020657, 3020641, 3020642, 3020643, 3020644, 3020645, 3020646, 3020647, 3020648, 3020649", ["510:520:1653:708"] = "3020618, 3020619, 3020620, 3020621, 3020622, 3020623", ["527:528:1987:49"] = "3020682, 3020683, 3020684, 3020685, 3020686, 3020687, 3020688, 3020689, 3020690", ["558:602:1297:693"] = "3020732, 3020733, 3020734, 3020735, 3020736, 3020737, 3020738, 3020739, 3020740", ["583:800:2321:57"] = "3020574, 3020578, 3020579, 3020580, 3020581, 3020582, 3020583, 3020584, 3020585, 3020575, 3020576, 3020577", ["648:650:1876:340"] = "3020549, 3020550, 3020551, 3020552, 3020553, 3020554, 3020555, 3020556, 3020557", ["703:905:2213:691"] = "3020658, 3020662, 3020663, 3020664, 3020665, 3020666, 3020667, 3020668, 3020669, 3020659, 3020660, 3020661", ["737:461:1570:1432"] = "3020676, 3020677, 3020678, 3020679, 3020680, 3020681", ["738:490:1007:1200"] = "3020670, 3020671, 3020672, 3020673, 3020674, 3020675", ["770:835:1110:118"] = "3020716, 3020724, 3020725, 3020726, 3020727, 3020728, 3020729, 3020730, 3020731, 3020717, 3020718, 3020719, 3020720, 3020721, 3020722, 3020723", ["783:597:2574:909"] = "3020598, 3020602, 3020603, 3020604, 3020605, 3020606, 3020607, 3020608, 3020609, 3020599, 3020600, 3020601", ["790:517:1360:1027"] = "3020586, 3020590, 3020591, 3020592, 3020593, 3020594, 3020595, 3020596, 3020597, 3020587, 3020588, 3020589", ["795:866:1863:804"] = "3020558, 3020566, 3020567, 3020568, 3020569, 3020570, 3020571, 3020572, 3020573, 3020559, 3020560, 3020561, 3020562, 3020563, 3020564, 3020565", ["815:1065:729:315"] = "3020529, 3020540, 3020542, 3020543, 3020544, 3020545, 3020546, 3020547, 3020548, 3020530, 3020531, 3020532, 3020533, 3020534, 3020535, 3020536, 3020537, 3020538, 3020539, 3020541", ["850:835:1469:50"] = "3020624, 3020632, 3020633, 3020634, 3020635, 3020636, 3020637, 3020638, 3020639, 3020625, 3020626, 3020627, 3020628, 3020629, 3020630, 3020631", ["979:480:2502:692"] = "3020610, 3020611, 3020612, 3020613, 3020614, 3020615, 3020616, 3020617", ["990:564:2490:365"] = "3020741, 3020745, 3020746, 3020747, 3020748, 3020749, 3020750, 3020751, 3020752, 3020742, 3020743, 3020744",},
	[1276] = {["1009:1191:1910:557"] = "3022276, 3022287, 3022289, 3022290, 3022291, 3022292, 3022293, 3022294, 3022295, 3022277, 3022278, 3022279, 3022280, 3022281, 3022282, 3022283, 3022284, 3022285, 3022286, 3022288", ["1014:1022:2513:406"] = "3022368, 3022376, 3022377, 3022378, 3022379, 3022380, 3022381, 3022382, 3022383, 3022369, 3022370, 3022371, 3022372, 3022373, 3022374, 3022375", ["1049:1055:2791:121"] = "3022412, 3022423, 3022430, 3022431, 3022432, 3022433, 3022434, 3022435, 3022436, 3022413, 3022414, 3022415, 3022416, 3022417, 3022418, 3022419, 3022420, 3022421, 3022422, 3022424, 3022425, 3022426, 3022427, 3022428, 3022429", ["1169:1264:1154:496"] = "3022251, 3022262, 3022269, 3022270, 3022271, 3022272, 3022273, 3022274, 3022275, 3022252, 3022253, 3022254, 3022255, 3022256, 3022257, 3022258, 3022259, 3022260, 3022261, 3022263, 3022264, 3022265, 3022266, 3022267, 3022268", ["1366:1426:2172:1134"] = "3022332, 3022343, 3022354, 3022362, 3022363, 3022364, 3022365, 3022366, 3022367, 3022333, 3022334, 3022335, 3022336, 3022337, 3022338, 3022339, 3022340, 3022341, 3022342, 3022344, 3022345, 3022346, 3022347, 3022348, 3022349, 3022350, 3022351, 3022352, 3022353, 3022355, 3022356, 3022357, 3022358, 3022359, 3022360, 3022361", ["1424:1511:46:978"] = "3022437, 3022448, 3022459, 3022467, 3022468, 3022469, 3022470, 3022471, 3022472, 3022438, 3022439, 3022440, 3022441, 3022442, 3022443, 3022444, 3022445, 3022446, 3022447, 3022449, 3022450, 3022451, 3022452, 3022453, 3022454, 3022455, 3022456, 3022457, 3022458, 3022460, 3022461, 3022462, 3022463, 3022464, 3022465, 3022466", ["1479:1338:1125:1222"] = "3022296, 3022307, 3022318, 3022326, 3022327, 3022328, 3022329, 3022330, 3022331, 3022297, 3022298, 3022299, 3022300, 3022301, 3022302, 3022303, 3022304, 3022305, 3022306, 3022308, 3022309, 3022310, 3022311, 3022312, 3022313, 3022314, 3022315, 3022316, 3022317, 3022319, 3022320, 3022321, 3022322, 3022323, 3022324, 3022325", ["1723:945:1315:40"] = "3022384, 3022395, 3022405, 3022406, 3022407, 3022408, 3022409, 3022410, 3022411, 3022385, 3022386, 3022387, 3022388, 3022389, 3022390, 3022391, 3022392, 3022393, 3022394, 3022396, 3022397, 3022398, 3022399, 3022400, 3022401, 3022402, 3022403, 3022404",},
	[1321] = {["1115:704:881:993"] = "3192874, 3192881, 3192882, 3192883, 3192884, 3192885, 3192886, 3192887, 3192888, 3192875, 3192876, 3192877, 3192878, 3192879, 3192880", ["1357:856:495:250"] = "3192889, 3192900, 3192906, 3192907, 3192908, 3192909, 3192910, 3192911, 3192912, 3192890, 3192891, 3192892, 3192893, 3192894, 3192895, 3192896, 3192897, 3192898, 3192899, 3192901, 3192902, 3192903, 3192904, 3192905", ["591:503:1566:1551"] = "3192856, 3192857, 3192858, 3192859, 3192860, 3192861", ["746:528:1793:1220"] = "3192941, 3192942, 3192943, 3192944, 3192945, 3192946, 3192947, 3192948, 3192949", ["783:542:1167:1387"] = "3192986, 3192990, 3192991, 3192992, 3192993, 3192994, 3192995, 3192996, 3192997, 3192987, 3192988, 3192989", ["804:564:1626:1949"] = "3192862, 3192866, 3192867, 3192868, 3192869, 3192870, 3192871, 3192872, 3192873, 3192863, 3192864, 3192865", ["826:494:2004:1590"] = "3192962, 3192963, 3192964, 3192965, 3192966, 3192967, 3192968, 3192969", ["839:558:1068:1768"] = "3192998, 3193002, 3193003, 3193004, 3193005, 3193006, 3193007, 3193008, 3193009, 3192999, 3193000, 3193001", ["881:911:2110:588"] = "3192970, 3192978, 3192979, 3192980, 3192981, 3192982, 3192983, 3192984, 3192985, 3192971, 3192972, 3192973, 3192974, 3192975, 3192976, 3192977", ["892:763:1975:155"] = "3192913, 3192917, 3192918, 3192919, 3192920, 3192921, 3192922, 3192923, 3192924, 3192914, 3192915, 3192916", ["984:847:1400:48"] = "3192925, 3192933, 3192934, 3192935, 3192936, 3192937, 3192938, 3192939, 3192940, 3192926, 3192927, 3192928, 3192929, 3192930, 3192931, 3192932", ["985:652:1475:706"] = "3192950, 3192954, 3192955, 3192956, 3192957, 3192958, 3192959, 3192960, 3192961, 3192951, 3192952, 3192953",},
	[1338] = {["1179:1340:379:811"] = "3604311, 3604322, 3604333, 3604335, 3604336, 3604337, 3604338, 3604339, 3604340, 3604312, 3604313, 3604314, 3604315, 3604316, 3604317, 3604318, 3604319, 3604320, 3604321, 3604323, 3604324, 3604325, 3604326, 3604327, 3604328, 3604329, 3604330, 3604331, 3604332, 3604334", ["563:685:2107:638"] = "3604377, 3604378, 3604379, 3604380, 3604381, 3604382, 3604383, 3604384, 3604385", ["669:747:1993:885"] = "3604302, 3604303, 3604304, 3604305, 3604306, 3604307, 3604308, 3604309, 3604310", ["686:742:1487:945"] = "3604293, 3604294, 3604295, 3604296, 3604297, 3604298, 3604299, 3604300, 3604301", ["688:1139:1679:54"] = "3604262, 3604269, 3604270, 3604271, 3604272, 3604273, 3604274, 3604275, 3604276, 3604263, 3604264, 3604265, 3604266, 3604267, 3604268", ["770:603:1736:1234"] = "3604341, 3604345, 3604346, 3604347, 3604348, 3604349, 3604350, 3604351, 3604352, 3604342, 3604343, 3604344", ["798:896:1701:1607"] = "3604277, 3604285, 3604286, 3604287, 3604288, 3604289, 3604290, 3604291, 3604292, 3604278, 3604279, 3604280, 3604281, 3604282, 3604283, 3604284", ["803:645:2211:168"] = "3604353, 3604357, 3604358, 3604359, 3604360, 3604361, 3604362, 3604363, 3604364, 3604354, 3604355, 3604356", ["845:1048:1190:1242"] = "3604226, 3604237, 3604239, 3604240, 3604241, 3604242, 3604243, 3604244, 3604245, 3604227, 3604228, 3604229, 3604230, 3604231, 3604232, 3604233, 3604234, 3604235, 3604236, 3604238", ["847:783:1036:316"] = "3604198, 3604206, 3604207, 3604208, 3604209, 3604210, 3604211, 3604212, 3604213, 3604199, 3604200, 3604201, 3604202, 3604203, 3604204, 3604205", ["864:650:946:723"] = "3604365, 3604369, 3604370, 3604371, 3604372, 3604373, 3604374, 3604375, 3604376, 3604366, 3604367, 3604368", ["886:821:2339:1049"] = "3604246, 3604254, 3604255, 3604256, 3604257, 3604258, 3604259, 3604260, 3604261, 3604247, 3604248, 3604249, 3604250, 3604251, 3604252, 3604253", ["904:714:2338:474"] = "3604214, 3604218, 3604219, 3604220, 3604221, 3604222, 3604223, 3604224, 3604225, 3604215, 3604216, 3604217",},
	[1306] = {["1019:737:2290:474"] = "3730584, 3730588, 3730589, 3730590, 3730591, 3730592, 3730593, 3730594, 3730595, 3730585, 3730586, 3730587, 3730584, 3730588, 3730589, 3730590, 3730591, 3730592, 3730593, 3730594, 3730595, 3730585, 3730586, 3730587", ["1030:1129:1200:1407"] = "3730837, 3730848, 3730855, 3730856, 3730857, 3730858, 3730859, 3730860, 3730861, 3730838, 3730839, 3730840, 3730841, 3730842, 3730843, 3730844, 3730845, 3730846, 3730847, 3730849, 3730850, 3730851, 3730852, 3730853, 3730854, 3730837, 3730848, 3730855, 3730856, 3730857, 3730858, 3730859, 3730860, 3730861, 3730838, 3730839, 3730840, 3730841, 3730842, 3730843, 3730844, 3730845, 3730846, 3730847, 3730849, 3730850, 3730851, 3730852, 3730853, 3730854", ["1087:878:869:1682"] = "3730730, 3730741, 3730743, 3730744, 3730745, 3730746, 3730747, 3730748, 3730749, 3730731, 3730732, 3730733, 3730734, 3730735, 3730736, 3730737, 3730738, 3730739, 3730740, 3730742, 3730730, 3730741, 3730743, 3730744, 3730745, 3730746, 3730747, 3730748, 3730749, 3730731, 3730732, 3730733, 3730734, 3730735, 3730736, 3730737, 3730738, 3730739, 3730740, 3730742", ["1192:963:485:0"] = "3730707, 3730718, 3730720, 3730721, 3730725, 3730726, 3730727, 3730728, 3730729, 3730708, 3730709, 3730710, 3730711, 3730712, 3730713, 3730714, 3730715, 3730716, 3730717, 3730719", ["1207:1465:433:596"] = "3730807, 3730818, 3730829, 3730831, 3730832, 3730833, 3730834, 3730835, 3730836, 3730808, 3730809, 3730810, 3730811, 3730812, 3730813, 3730814, 3730815, 3730816, 3730817, 3730819, 3730820, 3730821, 3730822, 3730823, 3730824, 3730825, 3730826, 3730827, 3730828, 3730830, 3730807, 3730818, 3730829, 3730831, 3730832, 3730833, 3730834, 3730835, 3730836, 3730808, 3730809, 3730810, 3730811, 3730812, 3730813, 3730814, 3730815, 3730816, 3730817, 3730819, 3730820, 3730821, 3730822, 3730823, 3730824, 3730825, 3730826, 3730827, 3730828, 3730830", ["1339:746:1974:919"] = "3730750, 3730760, 3730761, 3730762, 3730763, 3730764, 3730765, 3730766, 3730767, 3730751, 3730752, 3730753, 3730754, 3730755, 3730756, 3730757, 3730758, 3730759, 3730750, 3730760, 3730761, 3730762, 3730763, 3730764, 3730765, 3730766, 3730767, 3730751, 3730752, 3730753, 3730754, 3730755, 3730756, 3730757, 3730758, 3730759", ["586:1091:1306:555"] = "3730641, 3730648, 3730649, 3730650, 3730651, 3730652, 3730653, 3730657, 3730669, 3730642, 3730643, 3730644, 3730645, 3730646, 3730647",  ["685:688:1527:300"] = "3730685, 3730688, 3730690, 3730694, 3730695, 3730698, 3730701, 3730704, 3730706, 3730768, 3730769, 3730770, 3730771, 3730772, 3730773, 3730774, 3730775, 3730776, 3730768, 3730769, 3730770, 3730771, 3730772, 3730773, 3730774, 3730775, 3730776, 3730768, 3730769, 3730770, 3730771, 3730772, 3730773, 3730774, 3730775, 3730776", ["711:1183:1987:1377"] = "3730628, 3730633, 3730634, 3730635, 3730636, 3730637, 3730638, 3730639, 3730640, 3730629, 3730630, 3730631, 3730722, 3730723, 3730632", ["718:847:2597:1316"] = "3730596, 3730600, 3730601, 3730602, 3730603, 3730604, 3730605, 3730606, 3730607, 3730597, 3730598, 3730599, 3730596, 3730600, 3730601, 3730602, 3730603, 3730604, 3730605, 3730606, 3730607, 3730597, 3730598, 3730599", ["720:578:1487:1982"] = "3730777, 3730778, 3730779, 3730780, 3730781, 3730782, 3730783, 3730784, 3730785, 3730777, 3730778, 3730779, 3730780, 3730781, 3730782, 3730783, 3730784, 3730785", ["835:1040:2324:1520"] = "3730786, 3730797, 3730799, 3730800, 3730801, 3730802, 3730803, 3730804, 3730805, 3730787, 3730788, 3730789, 3730790, 3730791, 3730792, 3730793, 3730794, 3730795, 3730796, 3730798, 3730786, 3730797, 3730799, 3730800, 3730801, 3730802, 3730803, 3730804, 3730805, 3730787, 3730788, 3730789, 3730790, 3730791, 3730792, 3730793, 3730794, 3730795, 3730796, 3730798", ["885:1060:1647:484"] = "3730608, 3730619, 3730621, 3730622, 3730623, 3730624, 3730625, 3730626, 3730627, 3730609, 3730610, 3730611, 3730612, 3730613, 3730614, 3730615, 3730616, 3730617, 3730618, 3730620",},
	[1323] = {["1149:703:284:1085"] = "3745117, 3745124, 3745125, 3745126, 3745127, 3745128, 3745129, 3745130, 3745131, 3745118, 3745119, 3745120, 3745121, 3745122, 3745123", ["1194:998:2438:785"] = "3745289, 3745300, 3745302, 3745303, 3745304, 3745305, 3745306, 3745307, 3745308, 3745290, 3745291, 3745292, 3745293, 3745294, 3745295, 3745296, 3745297, 3745298, 3745299, 3745301", ["1231:1391:261:65"] = "3745353, 3745364, 3745375, 3745377, 3745378, 3745379, 3745380, 3745381, 3745382, 3745354, 3745355, 3745356, 3745357, 3745358, 3745359, 3745360, 3745361, 3745362, 3745363, 3745365, 3745366, 3745367, 3745368, 3745369, 3745370, 3745371, 3745372, 3745373, 3745374, 3745376", ["1363:1137:2232:13"] = "3745189, 3745200, 3745211, 3745213, 3745214, 3745215, 3745216, 3745217, 3745218, 3745190, 3745191, 3745192, 3745193, 3745194, 3745195, 3745196, 3745197, 3745198, 3745199, 3745201, 3745202, 3745203, 3745204, 3745205, 3745206, 3745207, 3745208, 3745209, 3745210, 3745212", ["1508:1209:330:1351"] = "3745219, 3745230, 3745241, 3745243, 3745244, 3745245, 3745246, 3745247, 3745248, 3745220, 3745221, 3745222, 3745223, 3745224, 3745225, 3745226, 3745227, 3745228, 3745229, 3745231, 3745232, 3745233, 3745234, 3745235, 3745236, 3745237, 3745238, 3745239, 3745240, 3745242", ["1925:1136:1582:1424"] = "3745249, 3745260, 3745271, 3745282, 3745284, 3745285, 3745286, 3745287, 3745288, 3745250, 3745251, 3745252, 3745253, 3745254, 3745255, 3745256, 3745257, 3745258, 3745259, 3745261, 3745262, 3745263, 3745264, 3745265, 3745266, 3745267, 3745268, 3745269, 3745270, 3745272, 3745273, 3745274, 3745275, 3745276, 3745277, 3745278, 3745279, 3745280, 3745281, 3745283", ["673:788:1171:836"] = "3745341, 3745345, 3745346, 3745347, 3745348, 3745349, 3745350, 3745351, 3745352, 3745342, 3745343, 3745344", ["694:666:1815:517"] = "3745132, 3745133, 3745134, 3745135, 3745136, 3745137, 3745138, 3745139, 3745140", ["719:802:2028:894"] = "3745141, 3745145, 3745146, 3745147, 3745148, 3745149, 3745150, 3745151, 3745152, 3745142, 3745143, 3745144", ["730:730:1566:862"] = "3745383, 3745384, 3745385, 3745386, 3745387, 3745388, 3745389, 3745390, 3745391", ["757:985:1551:1342"] = "3745309, 3745313, 3745314, 3745315, 3745316, 3745317, 3745318, 3745319, 3745320, 3745310, 3745311, 3745312", ["858:1178:1202:0"] = "3745321, 3745332, 3745334, 3745335, 3745336, 3745337, 3745338, 3745339, 3745340, 3745322, 3745323, 3745324, 3745325, 3745326, 3745327, 3745328, 3745329, 3745330, 3745331, 3745333", ["932:919:1692:0"] = "3745173, 3745181, 3745182, 3745183, 3745184, 3745185, 3745186, 3745187, 3745188, 3745174, 3745175, 3745176, 3745177, 3745178, 3745179, 3745180", ["951:1071:631:46"] = "3745153, 3745164, 3745166, 3745167, 3745168, 3745169, 3745170, 3745171, 3745172, 3745154, 3745155, 3745156, 3745157, 3745158, 3745159, 3745160, 3745161, 3745162, 3745163, 3745165",},
	[1329] = {["1009:835:1442:1262"] = "3745832, 3745840, 3745841, 3745842, 3745843, 3745844, 3745845, 3745846, 3745847, 3745833, 3745834, 3745835, 3745836, 3745837, 3745838, 3745839,", 
		["1053:934:49:918"] = "3745893, 3745904, 3745906, 3745907, 3745908, 3745909, 3745910, 3745911, 3745912, 3745894, 3745895, 3745896, 3745897, 3745898, 3745899, 3745900, 3745901, 3745902, 3745903, 3745905,",
		["1078:824:772:598"] = "3746082, 3746093, 3746095, 3746096, 3746097, 3746098, 3746099, 3746100, 3746101, 3746083, 3746084, 3746085, 3746086, 3746087, 3746088, 3746089, 3746090, 3746091, 3746092, 3746094,", 
		["1186:821:1100:696"] = "3745873, 3745884, 3745886, 3745887, 3745888, 3745889, 3745890, 3745891, 3745892, 3745874, 3745875, 3745876, 3745877, 3745878, 3745879, 3745880, 3745881, 3745882, 3745883, 3745885,",
		["1232:1236:0:342"] = "3745848, 3745859, 3745866, 3745867, 3745868, 3745869, 3745870, 3745871, 3745872, 3745849, 3745850, 3745851, 3745852, 3745853, 3745854, 3745855, 3745856, 3745857, 3745858, 3745860, 3745861, 3745862, 3745863, 3745864, 3745865,",
		["1395:932:183:0"] = "3746024, 3746035, 3746041, 3746042, 3746043, 3746044, 3746045, 3746046, 3746047, 3746025, 3746026, 3746027, 3746028, 3746029, 3746030, 3746031, 3746032, 3746033, 3746034, 3746036, 3746037, 3746038, 3746039, 3746040,",
		["1408:988:1856:1572"] = "3746048, 3746059, 3746065, 3746066, 3746067, 3746068, 3746069, 3746070, 3746071, 3746049, 3746050, 3746051, 3746052, 3746053, 3746054, 3746055, 3746056, 3746057, 3746058, 3746060, 3746061, 3746062, 3746063, 3746064,",
		["1488:1946:1797:0"] = "3745913, 3745924, 3745935, 3745948, 3745959, 3745960, 3745961, 3745962, 3745963, 3745914, 3745915, 3745916, 3745917, 3745918, 3745919, 3745920, 3745921, 3745922, 3745923, 3745925, 3745926, 3745927, 3745928, 3745929, 3745930, 3745931, 3745932, 3745933, 3745934, 3745936, 3745937, 3745938, 3745939, 3745940, 3745942, 3745943, 3745944, 3745946, 3745947, 3745949, 3745950, 3745951, 3745953, 3745954, 3745955, 3745956, 3745957, 3745958,", 
		["1504:929:1171:0"] = "3745964, 3745975, 3745981, 3745982, 3745983, 3745984, 3745985, 3745986, 3745987, 3745965, 3745966, 3745967, 3745968, 3745969, 3745970, 3745971, 3745972, 3745973, 3745974, 3745976, 3745977, 3745978, 3745979, 3745980,",
		["928:1359:808:1201"] = "3746000, 3746011, 3746017, 3746018, 3746019, 3746020, 3746021, 3746022, 3746023, 3746001, 3746002, 3746003, 3746004, 3746005, 3746006, 3746007, 3746008, 3746009, 3746010, 3746012, 3746013, 3746014, 3746015, 3746016,", 
		["928:729:1404:1831"] = "3745988, 3745992, 3745993, 3745994, 3745995, 3745996, 3745997, 3745998, 3745999, 3745989, 3745990, 3745991,",
		["954:1076:262:1423"] = "3745812, 3745823, 3745825, 3745826, 3745827, 3745828, 3745829, 3745830, 3745831, 3745813, 3745814, 3745815, 3745816, 3745817, 3745818, 3745819, 3745820, 3745821, 3745822, 3745824,",
	},
	[1342] = {
        ["438:658:0:0"] = "3155826, 3155827, 3155828, 3155829, 3155830, 3155831",
        ["604:636:11:0"] = "3155832, 3155833, 3155834, 3155835, 3155836, 3155837, 3155838, 3155839, 3155840",
        ["613:558:315:31"] = "3155841, 3155842, 3155843, 3155844, 3155845, 3155846, 3155847, 3155848, 3155849",
    },
    [1343] = {
        ["448:651:328:7"] = "3165092, 3165093, 3165094, 3165095, 3165096, 3165097",
        ["504:602:448:0"] = "3165098, 3165099, 3165100, 3165101, 3165102, 3165103",
        ["575:570:61:0"] = "3165083, 3165084, 3165085, 3165086, 3165087, 3165088, 3165089, 3165090, 3165091",
    },
    [1375] = {
        ["1022:918:1693:66"] = "3767907, 3767922, 3767924, 3767926, 3767928, 3767930, 3767932, 3767934, 3767936, 3767909, 3767911, 3767913, 3767915, 3767916, 3767918, 3767920",
        ["1064:818:1982:1742"] = "3768002, 3768023, 3768027, 3768029, 3768031, 3768033, 3768035, 3768036, 3768038, 3768004, 3768006, 3768008, 3768010, 3768012, 3768014, 3768016, 3768017, 3768019, 3768021, 3768025",
        ["1539:723:577:1835"] = "3767961, 3767983, 3767989, 3767991, 3767993, 3767995, 3767997, 3767998, 3768000, 3767963, 3767965, 3767967, 3767970, 3767971, 3767973, 3767975, 3767977, 3767979, 3767981, 3767985, 3767987",
        ["1875:1551:1167:485"] = "3768040, 3768062, 3768083, 3768105, 3768126, 3768141, 3768143, 3768145, 3768147, 3768042, 3768044, 3768046, 3768048, 3768050, 3768052, 3768054, 3768056, 3768058, 3768060, 3768064, 3768066, 3768068, 3768070, 3768072, 3768074, 3768076, 3768077, 3768079, 3768081, 3768085, 3768087, 3768089, 3768091, 3768093, 3768095, 3768097, 3768099, 3768101, 3768103, 3768107, 3768109, 3768111, 3768113, 3768115, 3768117, 3768119, 3768121, 3768123, 3768124, 3768128, 3768130, 3768132, 3768134, 3768136, 3768138, 3768139",
        ["636:1035:1207:9"] = "3767878, 3767891, 3767893, 3767895, 3767897, 3767899, 3767901, 3767903, 3767905, 3767879, 3767881, 3767883, 3767885, 3767887, 3767889",
        ["665:937:594:1017"] = "3767938, 3767945, 3767947, 3767949, 3767951, 3767953, 3767955, 3767957, 3767959, 3767940, 3767942, 3767943",
        ["699:1107:677:56"] = "3767848, 3767862, 3767864, 3767866, 3767868, 3767870, 3767872, 3767874, 3767876, 3767850, 3767852, 3767854, 3767856, 3767858, 3767860",
    },
    [1376] = {
        ["1033:709:1363:1189"] = "3770207, 3770214, 3770215, 3770216, 3770217, 3770218, 3770219, 3770220, 3770221, 3770208, 3770209, 3770210, 3770211, 3770212, 3770213",
        ["1046:464:1356:892"] = "3770146, 3770148, 3770149, 3770150, 3770151, 3770152, 3770153, 3770154, 3770155, 3770147",
        ["1392:979:1382:1562"] = "3770228, 3770239, 3770245, 3770246, 3770247, 3770248, 3770249, 3770250, 3770251, 3770229, 3770230, 3770231, 3770232, 3770233, 3770234, 3770235, 3770236, 3770237, 3770238, 3770240, 3770241, 3770242, 3770243, 3770244",
        ["476:725:2283:1231"] = "3770222, 3770223, 3770224, 3770225, 3770226, 3770227",
        ["537:1134:2214:233"] = "3770172, 3770179, 3770180, 3770181, 3770182, 3770183, 3770184, 3770185, 3770186, 3770173, 3770174, 3770175, 3770176, 3770177, 3770178",
        ["718:769:961:26"] = "3770043, 3770114, 3770116, 3770118, 3770120, 3770122, 3770124, 3770126, 3770128, 3770045, 3770047, 3770049",
        ["846:1103:642:1186"] = "3770187, 3770198, 3770200, 3770201, 3770202, 3770203, 3770204, 3770205, 3770206, 3770188, 3770189, 3770190, 3770191, 3770192, 3770193, 3770194, 3770195, 3770196, 3770197, 3770199",
        ["943:977:1383:26"] = "3770156, 3770164, 3770165, 3770166, 3770167, 3770168, 3770169, 3770170, 3770171, 3770157, 3770158, 3770159, 3770160, 3770161, 3770162, 3770163",
        ["996:680:723:659"] = "3770129, 3770136, 3770137, 3770138, 3770139, 3770140, 3770141, 3770144, 3770145, 3770132, 3770134, 3770135",
    },
    [1377] = {
        ["1028:1024:1472:1536"] = "3771119, 3771133, 3771135, 3771136, 3771137, 3771138, 3771139, 3771140, 3771141, 3771120, 3771121, 3771122, 3771126, 3771127, 3771128, 3771129, 3771130, 3771131, 3771132, 3771134",
        ["1080:487:1809:585"] = "3771091, 3771093, 3771094, 3771095, 3771096, 3771097, 3771098, 3771099, 3771100, 3771092",
        ["1434:734:1483:920"] = "3771101, 3771111, 3771112, 3771113, 3771114, 3771115, 3771116, 3771117, 3771118, 3771102, 3771103, 3771104, 3771105, 3771106, 3771107, 3771108, 3771109, 3771110",
        ["535:705:1779:0"] = "3771050, 3771051, 3771052, 3771053, 3771054, 3771055, 3771056, 3771057, 3771058",
        ["940:647:970:158"] = "3771059, 3771063, 3771064, 3771065, 3771066, 3771067, 3771068, 3771069, 3771070, 3771060, 3771061, 3771062",
        ["983:1029:960:617"] = "3771071, 3771082, 3771084, 3771085, 3771086, 3771087, 3771088, 3771089, 3771090, 3771072, 3771073, 3771074, 3771075, 3771076, 3771077, 3771078, 3771079, 3771080, 3771081, 3771083",
    },
    [1378] = {
        ["1058:629:2050:189"] = "3771407, 3771414, 3771415, 3771416, 3771417, 3771418, 3771419, 3771420, 3771421, 3771408, 3771409, 3771410, 3771411, 3771412, 3771413",
        ["1134:804:1039:30"] = "3771422, 3771433, 3771435, 3771436, 3771437, 3771438, 3771439, 3771440, 3771441, 3771423, 3771424, 3771425, 3771426, 3771427, 3771428, 3771429, 3771430, 3771431, 3771432, 3771434",
        ["1456:869:1004:1691"] = "3771466, 3771477, 3771483, 3771484, 3771485, 3771486, 3771487, 3771488, 3771489, 3771467, 3771468, 3771469, 3771470, 3771471, 3771472, 3771473, 3771474, 3771475, 3771476, 3771478, 3771479, 3771480, 3771481, 3771482",
        ["571:1007:2339:1553"] = "3771526, 3771530, 3771531, 3771532, 3771533, 3771534, 3771535, 3771536, 3771537, 3771527, 3771528, 3771529",
        ["830:1232:1660:728"] = "3771490, 3771501, 3771503, 3771504, 3771505, 3771506, 3771507, 3771508, 3771509, 3771491, 3771492, 3771493, 3771494, 3771495, 3771496, 3771497, 3771498, 3771499, 3771500, 3771502",
        ["889:972:2008:697"] = "3771510, 3771518, 3771519, 3771520, 3771521, 3771522, 3771523, 3771524, 3771525, 3771511, 3771512, 3771513, 3771514, 3771515, 3771516, 3771517",
        ["988:1315:788:648"] = "3771442, 3771453, 3771459, 3771460, 3771461, 3771462, 3771463, 3771464, 3771465, 3771443, 3771444, 3771445, 3771446, 3771447, 3771448, 3771449, 3771450, 3771451, 3771452, 3771454, 3771455, 3771456, 3771457, 3771458",
    },
    [1379] = {
        ["1173:780:815:1389"] = "3771635, 3771646, 3771648, 3771649, 3771650, 3771651, 3771652, 3771653, 3771654, 3771636, 3771637, 3771638, 3771639, 3771640, 3771641, 3771642, 3771643, 3771644, 3771645, 3771647",
        ["1369:1087:832:428"] = "3771589, 3771600, 3771611, 3771613, 3771614, 3771615, 3771616, 3771617, 3771618, 3771590, 3771591, 3771592, 3771593, 3771594, 3771595, 3771596, 3771597, 3771598, 3771599, 3771601, 3771602, 3771603, 3771604, 3771605, 3771606, 3771607, 3771608, 3771609, 3771610, 3771612",
        ["1795:555:798:1995"] = "3771655, 3771666, 3771672, 3771673, 3771674, 3771675, 3771676, 3771677, 3771678, 3771656, 3771657, 3771658, 3771659, 3771660, 3771661, 3771662, 3771663, 3771664, 3771665, 3771667, 3771668, 3771669, 3771670, 3771671",
        ["508:1023:834:38"] = "3771554, 3771555, 3771556, 3771557, 3771558, 3771559, 3771560, 3771561",
        ["589:1233:2053:6"] = "3771574, 3771581, 3771582, 3771583, 3771584, 3771585, 3771586, 3771587, 3771588, 3771575, 3771576, 3771577, 3771578, 3771579, 3771580",
        ["957:536:1215:16"] = "3771562, 3771566, 3771567, 3771568, 3771569, 3771570, 3771571, 3771572, 3771573, 3771563, 3771564, 3771565",
        ["983:970:1869:1134"] = "3771619, 3771627, 3771628, 3771629, 3771630, 3771631, 3771632, 3771633, 3771634, 3771620, 3771621, 3771622, 3771623, 3771624, 3771625, 3771626",
    },
    [1381] = {
        ["1005:1040:1728:1510"] = "3772384, 3772395, 3772397, 3772398, 3772399, 3772400, 3772401, 3772402, 3772403, 3772385, 3772386, 3772387, 3772388, 3772389, 3772390, 3772391, 3772392, 3772393, 3772394, 3772396",
        ["1016:785:814:1775"] = "3772359, 3772367, 3772368, 3772369, 3772370, 3772371, 3772372, 3772373, 3772374, 3772360, 3772361, 3772362, 3772363, 3772364, 3772365, 3772366",
        ["1158:1228:1936:397"] = "3772273, 3772284, 3772291, 3772292, 3772293, 3772294, 3772295, 3772296, 3772297, 3772274, 3772275, 3772276, 3772277, 3772278, 3772279, 3772280, 3772281, 3772282, 3772283, 3772285, 3772286, 3772287, 3772288, 3772289, 3772290",
        ["444:1283:1913:873"] = "3772307, 3772311, 3772312, 3772313, 3772314, 3772315, 3772316, 3772317, 3772318, 3772308, 3772309, 3772310",
        ["696:779:1766:0"] = "3772261, 3772265, 3772266, 3772267, 3772268, 3772269, 3772270, 3772271, 3772272, 3772262, 3772263, 3772264",
        ["742:686:1275:1523"] = "3772375, 3772376, 3772377, 3772378, 3772379, 3772380, 3772381, 3772382, 3772383",
        ["746:747:2499:1054"] = "3772298, 3772299, 3772300, 3772301, 3772302, 3772303, 3772304, 3772305, 3772306",
        ["840:553:553:1330"] = "3772347, 3772351, 3772352, 3772353, 3772354, 3772355, 3772356, 3772357, 3772358, 3772348, 3772349, 3772350",
        ["863:770:1284:902"] = "3772319, 3772327, 3772328, 3772329, 3772330, 3772331, 3772332, 3772333, 3772334, 3772320, 3772321, 3772322, 3772323, 3772324, 3772325, 3772326",
        ["976:734:656:695"] = "3772335, 3772339, 3772340, 3772341, 3772342, 3772343, 3772344, 3772345, 3772346, 3772336, 3772337, 3772338",
    },
    [1382] = {
        ["1050:870:890:47"] = "3772457, 3772468, 3772470, 3772471, 3772472, 3772473, 3772474, 3772475, 3772476, 3772458, 3772459, 3772460, 3772461, 3772462, 3772463, 3772464, 3772465, 3772466, 3772467, 3772469",
        ["1084:1084:2444:436"] = "3772404, 3772415, 3772422, 3772423, 3772424, 3772425, 3772426, 3772427, 3772428, 3772405, 3772406, 3772407, 3772408, 3772409, 3772410, 3772411, 3772412, 3772413, 3772414, 3772416, 3772417, 3772418, 3772419, 3772420, 3772421",
        ["1165:810:963:1719"] = "3772507, 3772518, 3772520, 3772521, 3772522, 3772523, 3772524, 3772525, 3772526, 3772508, 3772509, 3772510, 3772511, 3772512, 3772513, 3772514, 3772515, 3772516, 3772517, 3772519",
        ["1447:1179:653:680"] = "3772477, 3772488, 3772499, 3772501, 3772502, 3772503, 3772504, 3772505, 3772506, 3772478, 3772479, 3772480, 3772481, 3772482, 3772483, 3772484, 3772485, 3772486, 3772487, 3772489, 3772490, 3772491, 3772492, 3772493, 3772494, 3772495, 3772496, 3772497, 3772498, 3772500",
        ["848:1116:237:1426"] = "3772527, 3772538, 3772540, 3772541, 3772542, 3772543, 3772544, 3772545, 3772546, 3772528, 3772529, 3772530, 3772531, 3772532, 3772533, 3772534, 3772535, 3772536, 3772537, 3772539",
        ["959:1721:1631:40"] = "3772429, 3772440, 3772450, 3772451, 3772452, 3772453, 3772454, 3772455, 3772456, 3772430, 3772431, 3772432, 3772433, 3772434, 3772435, 3772436, 3772437, 3772438, 3772439, 3772441, 3772442, 3772443, 3772444, 3772445, 3772446, 3772447, 3772448, 3772449",
    },
    [1383] = {
        ["565:1404:1748:591"] = "3774161, 3774171, 3774172, 3774173, 3774174, 3774175, 3774176, 3774177, 3774178, 3774162, 3774163, 3774164, 3774165, 3774166, 3774167, 3774168, 3774169, 3774170",
        ["677:1389:1198:595"] = "3774179, 3774189, 3774190, 3774191, 3774192, 3774193, 3774194, 3774195, 3774196, 3774180, 3774181, 3774182, 3774183, 3774184, 3774185, 3774186, 3774187, 3774188",
        ["792:1469:1817:173"] = "3774217, 3774228, 3774234, 3774235, 3774236, 3774237, 3774238, 3774239, 3774240, 3774218, 3774219, 3774220, 3774221, 3774222, 3774223, 3774224, 3774225, 3774226, 3774227, 3774229, 3774230, 3774231, 3774232, 3774233",
        ["802:1035:1336:1500"] = "3774197, 3774208, 3774210, 3774211, 3774212, 3774213, 3774214, 3774215, 3774216, 3774198, 3774199, 3774200, 3774201, 3774202, 3774203, 3774204, 3774205, 3774206, 3774207, 3774209",
    },
    [1386] = {
        ["1114:879:1161:1076"] = "3774335, 3774346, 3774348, 3774349, 3774350, 3774351, 3774352, 3774353, 3774354, 3774336, 3774337, 3774338, 3774339, 3774340, 3774341, 3774342, 3774343, 3774344, 3774345, 3774347",
        ["1290:756:833:1754"] = "3774367, 3774377, 3774378, 3774379, 3774380, 3774381, 3774382, 3774383, 3774384, 3774368, 3774369, 3774370, 3774371, 3774372, 3774373, 3774374, 3774375, 3774376",
        ["519:902:1306:384"] = "3774323, 3774327, 3774328, 3774329, 3774330, 3774331, 3774332, 3774333, 3774334, 3774324, 3774325, 3774326",
        ["688:1013:786:529"] = "3774311, 3774315, 3774316, 3774317, 3774318, 3774319, 3774320, 3774321, 3774322, 3774312, 3774313, 3774314",
        ["835:1344:1710:388"] = "3774287, 3774298, 3774304, 3774305, 3774306, 3774307, 3774308, 3774309, 3774310, 3774288, 3774289, 3774290, 3774291, 3774292, 3774293, 3774294, 3774295, 3774296, 3774297, 3774299, 3774300, 3774301, 3774302, 3774303",
        ["931:654:858:1427"] = "3774355, 3774359, 3774360, 3774361, 3774362, 3774363, 3774364, 3774365, 3774366, 3774356, 3774357, 3774358",
        ["999:1527:1955:22"] = "3774263, 3774274, 3774280, 3774281, 3774282, 3774283, 3774284, 3774285, 3774286, 3774264, 3774265, 3774266, 3774267, 3774268, 3774269, 3774270, 3774271, 3774272, 3774273, 3774275, 3774276, 3774277, 3774278, 3774279",
    },
    [1389] = {
        ["1044:733:1741:1635"] = "3776647, 3776654, 3776655, 3776656, 3776657, 3776658, 3776659, 3776660, 3776661, 3776648, 3776649, 3776650, 3776651, 3776652, 3776653",
        ["1370:940:1943:26"] = "3776574, 3776585, 3776591, 3776592, 3776593, 3776594, 3776595, 3776596, 3776597, 3776575, 3776576, 3776577, 3776578, 3776579, 3776580, 3776581, 3776582, 3776583, 3776584, 3776586, 3776587, 3776588, 3776589, 3776590",
        ["1439:1606:483:810"] = "3776662, 3776673, 3776684, 3776695, 3776699, 3776700, 3776701, 3776702, 3776703, 3776663, 3776664, 3776665, 3776666, 3776667, 3776668, 3776669, 3776670, 3776671, 3776672, 3776674, 3776675, 3776676, 3776677, 3776678, 3776679, 3776680, 3776681, 3776682, 3776683, 3776685, 3776686, 3776687, 3776688, 3776689, 3776690, 3776691, 3776692, 3776693, 3776694, 3776696, 3776697, 3776698",
        ["1873:1221:1807:812"] = "3776598, 3776609, 3776620, 3776631, 3776633, 3776634, 3776635, 3776636, 3776637, 3776599, 3776600, 3776601, 3776602, 3776603, 3776604, 3776605, 3776606, 3776607, 3776608, 3776610, 3776611, 3776612, 3776613, 3776614, 3776615, 3776616, 3776617, 3776618, 3776619, 3776621, 3776622, 3776623, 3776624, 3776625, 3776626, 3776627, 3776628, 3776629, 3776630, 3776632",
        ["603:579:1819:1159"] = "3776638, 3776639, 3776640, 3776641, 3776642, 3776643, 3776644, 3776645, 3776646",
        ["842:1244:400:1273"] = "3776704, 3776715, 3776717, 3776718, 3776719, 3776720, 3776721, 3776722, 3776723, 3776705, 3776706, 3776707, 3776708, 3776709, 3776710, 3776711, 3776712, 3776713, 3776714, 3776716",
    },
    [1393] = {
        ["1048:440:1238:1099"] = "3776981, 3776983, 3776984, 3776985, 3776986, 3776987, 3776988, 3776989, 3776990, 3776982",
        ["1131:960:1605:57"] = "3776941, 3776952, 3776954, 3776955, 3776956, 3776957, 3776958, 3776959, 3776960, 3776942, 3776943, 3776944, 3776945, 3776946, 3776947, 3776948, 3776949, 3776950, 3776951, 3776953",
        ["839:1123:1484:1437"] = "3776991, 3777002, 3777004, 3777005, 3777006, 3777007, 3777008, 3777009, 3777010, 3776992, 3776993, 3776994, 3776995, 3776996, 3776997, 3776998, 3776999, 3777000, 3777001, 3777003",
        ["861:668:1943:914"] = "3776969, 3776973, 3776974, 3776975, 3776976, 3776977, 3776978, 3776979, 3776980, 3776970, 3776971, 3776972",
        ["951:400:1250:800"] = "3776961, 3776962, 3776963, 3776964, 3776965, 3776966, 3776967, 3776968",
    },
    [1439] = {
        ["294:330:2036:1272"] = "3719472, 3719473, 3719474, 3719475",
        ["298:270:1381:453"] = "3719397, 3719398, 3719399, 3719400",
        ["303:279:1657:1012"] = "3719437, 3719438, 3719439, 3719440",
        ["337:359:2229:426"] = "3719413, 3719414, 3719415, 3719416",
        ["337:394:1378:674"] = "3719421, 3719422, 3719423, 3719424",
        ["339:534:2224:1619"] = "3719507, 3719508, 3719509, 3719510, 3719511, 3719512",
        ["344:389:2232:676"] = "3719425, 3719426, 3719427, 3719428",
        ["371:388:1394:1244"] = "3719464, 3719465, 3719466, 3719467",
        ["375:378:1102:400"] = "3719393, 3719394, 3719395, 3719396",
        ["377:402:1385:1520"] = "3719480, 3719481, 3719482, 3719483",
        ["383:389:1099:679"] = "3719417, 3719418, 3719419, 3719420",
        ["383:404:1104:1519"] = "3719476, 3719477, 3719478, 3719479",
        ["384:335:1379:957"] = "3719433, 3719434, 3719435, 3719436",
        ["387:328:1113:167"] = "3719386, 3719387, 3719388, 3719389",
        ["387:763:2225:960"] = "3719454, 3719455, 3719456, 3719457, 3719458, 3719459",
        ["457:334:989:1295"] = "3719460, 3719461, 3719462, 3719463",
        ["474:430:1855:933"] = "3719441, 3719442, 3719443, 3719451",
        ["487:419:1656:1228"] = "3719468, 3719469, 3719470, 3719471",
        ["502:321:975:961"] = "3719429, 3719430, 3719431, 3719432",
        ["572:338:1101:1815"] = "3719484, 3719485, 3719486, 3719487, 3719488, 3719489",
        ["749:786:1582:204"] = "3719401, 3719405, 3719406, 3719407, 3719408, 3719409, 3719410, 3719411, 3719412, 3719402, 3719403, 3719404",
        ["763:854:1568:1575"] = "3719490, 3719494, 3719500, 3719501, 3719502, 3719503, 3719504, 3719505, 3719506, 3719491, 3719492, 3719493",
    },
    [1453] = {
        ["252:240:273:411"] = "3754203",
    },
    [1464] = {
        ["1520:1017:1483:1230"] = "3765000, 3765011, 3765017, 3765018, 3765019, 3765020, 3765021, 3765022, 3765023, 3765001, 3765002, 3765003, 3765004, 3765005, 3765006, 3765007, 3765008, 3765009, 3765010, 3765012, 3765013, 3765014, 3765015, 3765016",
        ["2447:1356:600:85"] = "3764928, 3764939, 3764950, 3764961, 3764972, 3764983, 3764985, 3764986, 3764987, 3764929, 3764930, 3764931, 3764932, 3764933, 3764934, 3764935, 3764936, 3764937, 3764938, 3764940, 3764941, 3764942, 3764943, 3764944, 3764945, 3764946, 3764947, 3764948, 3764949, 3764951, 3764952, 3764953, 3764954, 3764955, 3764956, 3764957, 3764958, 3764959, 3764960, 3764962, 3764963, 3764964, 3764965, 3764966, 3764967, 3764968, 3764969, 3764970, 3764971, 3764973, 3764974, 3764975, 3764976, 3764977, 3764978, 3764979, 3764980, 3764981, 3764982, 3764984",
        ["651:949:2373:1518"] = "3765024, 3765028, 3765029, 3765030, 3765031, 3765032, 3765033, 3765034, 3765035, 3765025, 3765026, 3765027",
        ["792:729:1413:1021"] = "3764988, 3764992, 3764993, 3764994, 3764995, 3764996, 3764997, 3764998, 3764999, 3764989, 3764990, 3764991",
    },
    [1465] = {
        ["1038:725:1140:184"] = "3765210, 3765224, 3765226, 3765228, 3765230, 3765236, 3765238, 3765240, 3765242, 3765213, 3765215, 3765217, 3765218, 3765220, 3765222",
        ["1134:710:1143:1198"] = "3765274, 3765288, 3765290, 3765292, 3765294, 3765296, 3765298, 3765300, 3765302, 3765276, 3765278, 3765280, 3765282, 3765284, 3765286",
        ["1135:615:1120:749"] = "3765244, 3765258, 3765260, 3765262, 3765264, 3765266, 3765268, 3765270, 3765272, 3765246, 3765248, 3765250, 3765252, 3765254, 3765256",
        ["823:808:1474:1747"] = "3765304, 3765320, 3765322, 3765324, 3765326, 3765328, 3765330, 3765332, 3765334, 3765306, 3765308, 3765310, 3765312, 3765314, 3765316, 3765318",
    },
    [1474] = {
        ["1079:1464:756:212"] = "3779767, 3779778, 3779789, 3779791, 3779792, 3779793, 3779794, 3779795, 3779796, 3779768, 3779769, 3779770, 3779771, 3779772, 3779773, 3779774, 3779775, 3779776, 3779777, 3779779, 3779780, 3779781, 3779782, 3779783, 3779784, 3779785, 3779786, 3779787, 3779788, 3779790",
        ["1094:978:1710:1545"] = "3779817, 3779828, 3779830, 3779831, 3779832, 3779833, 3779834, 3779835, 3779836, 3779818, 3779819, 3779820, 3779821, 3779822, 3779823, 3779824, 3779825, 3779826, 3779827, 3779829",
        ["1106:973:727:1534"] = "3779797, 3779808, 3779810, 3779811, 3779812, 3779813, 3779814, 3779815, 3779816, 3779798, 3779799, 3779800, 3779801, 3779802, 3779803, 3779804, 3779805, 3779806, 3779807, 3779809",
        ["1401:1434:1715:208"] = "3779837, 3779848, 3779859, 3779867, 3779868, 3779869, 3779870, 3779871, 3779872, 3779838, 3779839, 3779840, 3779841, 3779842, 3779843, 3779844, 3779845, 3779846, 3779847, 3779849, 3779850, 3779851, 3779852, 3779853, 3779854, 3779855, 3779856, 3779857, 3779858, 3779860, 3779861, 3779862, 3779863, 3779864, 3779865, 3779866",
    },
    [1475] = {
        ["1562:2440:61:90"] = "3780023, 3780063, 3780074, 3780106, 3780117, 3780135, 3780146, 3780148, 3780149, 3780032, 3780033, 3780034, 3780035, 3780036, 3780037, 3780038, 3780042, 3780043, 3780054, 3780064, 3780065, 3780066, 3780067, 3780068, 3780069, 3780070, 3780071, 3780072, 3780073, 3780075, 3780076, 3780077, 3780078, 3780079, 3780080, 3780081, 3780082, 3780087, 3780105, 3780107, 3780108, 3780109, 3780110, 3780111, 3780112, 3780113, 3780114, 3780115, 3780116, 3780118, 3780119, 3780120, 3780121, 3780122, 3780123, 3780124, 3780125, 3780126, 3780134, 3780136, 3780137, 3780138, 3780139, 3780140, 3780141, 3780142, 3780143, 3780144, 3780145, 3780147",
        ["1660:2374:2076:111"] = "3780180, 3780191, 3780202, 3780213, 3780224, 3780238, 3780249, 3780251, 3780252, 3780181, 3780182, 3780183, 3780184, 3780185, 3780186, 3780187, 3780188, 3780189, 3780190, 3780192, 3780193, 3780194, 3780195, 3780196, 3780197, 3780198, 3780199, 3780200, 3780201, 3780203, 3780204, 3780205, 3780206, 3780207, 3780208, 3780209, 3780210, 3780211, 3780212, 3780214, 3780215, 3780216, 3780217, 3780218, 3780219, 3780220, 3780221, 3780222, 3780223, 3780225, 3780229, 3780230, 3780231, 3780232, 3780233, 3780234, 3780235, 3780236, 3780237, 3780239, 3780240, 3780241, 3780242, 3780243, 3780244, 3780245, 3780246, 3780247, 3780248, 3780250",
        ["725:2425:1478:102"] = "3780150, 3780161, 3780172, 3780174, 3780175, 3780176, 3780177, 3780178, 3780179, 3780151, 3780152, 3780153, 3780154, 3780155, 3780156, 3780157, 3780158, 3780159, 3780160, 3780162, 3780163, 3780164, 3780165, 3780166, 3780167, 3780168, 3780169, 3780170, 3780171, 3780173",
    },
    [1477] = {
        ["1208:1747:499:289"] = "3788374, 3788385, 3788396, 3788403, 3788404, 3788405, 3788406, 3788407, 3788408, 3788375, 3788376, 3788377, 3788378, 3788379, 3788380, 3788381, 3788382, 3788383, 3788384, 3788386, 3788387, 3788388, 3788389, 3788390, 3788391, 3788392, 3788393, 3788394, 3788395, 3788397, 3788398, 3788399, 3788400, 3788401, 3788402",
        ["1442:1755:2130:293"] = "3788427, 3788438, 3788449, 3788460, 3788464, 3788465, 3788466, 3788467, 3788468, 3788428, 3788429, 3788430, 3788431, 3788432, 3788433, 3788434, 3788435, 3788436, 3788437, 3788439, 3788440, 3788441, 3788442, 3788443, 3788444, 3788445, 3788446, 3788447, 3788448, 3788450, 3788451, 3788452, 3788453, 3788454, 3788455, 3788456, 3788457, 3788458, 3788459, 3788461, 3788462, 3788463",
        ["647:1310:1594:934"] = "3788409, 3788419, 3788420, 3788421, 3788422, 3788423, 3788424, 3788425, 3788426, 3788410, 3788411, 3788412, 3788413, 3788414, 3788415, 3788416, 3788417, 3788418",
        ["669:597:1587:449"] = "3788469, 3788470, 3788471, 3788472, 3788473, 3788474, 3788475, 3788476, 3788477",
    },
    [1478] = {
        ["1117:1052:2055:1290"] = "3788748, 3788760, 3788767, 3788768, 3788769, 3788770, 3788771, 3788772, 3788773, 3788749, 3788751, 3788752, 3788753, 3788754, 3788755, 3788756, 3788757, 3788758, 3788759, 3788761, 3788762, 3788763, 3788764, 3788765, 3788766",
        ["1290:1210:892:1302"] = "3788717, 3788728, 3788740, 3788742, 3788743, 3788744, 3788745, 3788746, 3788747, 3788718, 3788719, 3788720, 3788721, 3788722, 3788723, 3788724, 3788725, 3788726, 3788727, 3788729, 3788730, 3788731, 3788732, 3788733, 3788734, 3788735, 3788737, 3788738, 3788739, 3788741",
        ["1592:1281:415:134"] = "3788675, 3788686, 3788697, 3788708, 3788712, 3788713, 3788714, 3788715, 3788716, 3788676, 3788677, 3788678, 3788679, 3788680, 3788681, 3788682, 3788683, 3788684, 3788685, 3788687, 3788688, 3788689, 3788690, 3788691, 3788692, 3788693, 3788694, 3788695, 3788696, 3788698, 3788699, 3788700, 3788701, 3788702, 3788703, 3788704, 3788705, 3788706, 3788707, 3788709, 3788710, 3788711",
        ["1811:1114:1912:287"] = "3788774, 3788785, 3788796, 3788807, 3788809, 3788810, 3788811, 3788812, 3788813, 3788775, 3788776, 3788777, 3788778, 3788779, 3788780, 3788781, 3788782, 3788783, 3788784, 3788786, 3788787, 3788788, 3788789, 3788790, 3788791, 3788792, 3788793, 3788794, 3788795, 3788797, 3788798, 3788799, 3788800, 3788801, 3788802, 3788803, 3788804, 3788805, 3788806, 3788808",
    },
    [1479] = {
        ["1384:1253:1106:1279"] = "3789143, 3789154, 3789165, 3789167, 3789168, 3789169, 3789170, 3789171, 3789172, 3789144, 3789145, 3789146, 3789147, 3789148, 3789149, 3789150, 3789151, 3789152, 3789153, 3789155, 3789156, 3789157, 3789158, 3789159, 3789160, 3789161, 3789162, 3789163, 3789164, 3789166",
        ["854:1010:2003:375"] = "3789127, 3789135, 3789136, 3789137, 3789138, 3789139, 3789140, 3789141, 3789142, 3789128, 3789129, 3789130, 3789131, 3789132, 3789133, 3789134",
        ["876:1317:739:152"] = "3789079, 3789090, 3789096, 3789097, 3789098, 3789099, 3789100, 3789101, 3789102, 3789080, 3789081, 3789082, 3789083, 3789084, 3789085, 3789086, 3789087, 3789088, 3789089, 3789091, 3789092, 3789093, 3789094, 3789095",
        ["902:1372:1496:0"] = "3789103, 3789114, 3789120, 3789121, 3789122, 3789123, 3789124, 3789125, 3789126, 3789104, 3789105, 3789106, 3789107, 3789108, 3789109, 3789110, 3789111, 3789112, 3789113, 3789115, 3789116, 3789117, 3789118, 3789119",
    },
    [1482] = {
        ["1060:1166:2122:1027"] = "3790858, 3790879, 3790892, 3790894, 3790896, 3790897, 3790899, 3790901, 3790903, 3790860, 3790862, 3790864, 3790866, 3790867, 3790869, 3790871, 3790873, 3790875, 3790877, 3790881, 3790882, 3790884, 3790886, 3790888, 3790890",
        ["1166:1131:2059:0"] = "3790950, 3790971, 3790984, 3790986, 3790988, 3790990, 3790992, 3790994, 3790996, 3790952, 3790954, 3790956, 3790958, 3790960, 3790962, 3790963, 3790965, 3790967, 3790969, 3790973, 3790975, 3790977, 3790979, 3790980, 3790982",
        ["775:2043:744:116"] = "3790754, 3790775, 3790800, 3790808, 3790810, 3790812, 3790814, 3790816, 3790818, 3790756, 3790758, 3790760, 3790762, 3790764, 3790766, 3790768, 3790769, 3790771, 3790773, 3790777, 3790779, 3790781, 3790783, 3790785, 3790787, 3790788, 3790790, 3790792, 3790798, 3790802, 3790804, 3790806",
        ["906:1314:1610:453"] = "3790905, 3790926, 3790937, 3790939, 3790941, 3790943, 3790945, 3790946, 3790948, 3790907, 3790908, 3790910, 3790912, 3790914, 3790916, 3790918, 3790920, 3790922, 3790924, 3790928, 3790930, 3790931, 3790933, 3790935",
        ["977:1180:1266:1179"] = "3790819, 3790840, 3790844, 3790846, 3790848, 3790850, 3790852, 3790854, 3790856, 3790821, 3790823, 3790825, 3790827, 3790829, 3790831, 3790833, 3790835, 3790837, 3790838, 3790842",
    },
    [1484] = {
        ["1108:919:1745:1408"] = "3791457, 3791468, 3791470, 3791471, 3791472, 3791473, 3791474, 3791475, 3791476, 3791458, 3791459, 3791460, 3791461, 3791462, 3791463, 3791464, 3791465, 3791466, 3791467, 3791469",
        ["1132:1401:719:1038"] = "3791427, 3791438, 3791449, 3791451, 3791452, 3791453, 3791454, 3791455, 3791456, 3791428, 3791429, 3791430, 3791431, 3791432, 3791433, 3791434, 3791435, 3791436, 3791437, 3791439, 3791440, 3791441, 3791442, 3791443, 3791444, 3791445, 3791446, 3791447, 3791448, 3791450",
        ["1338:1490:1727:18"] = "3791477, 3791488, 3791499, 3791507, 3791508, 3791509, 3791510, 3791511, 3791512, 3791478, 3791479, 3791480, 3791481, 3791482, 3791483, 3791484, 3791485, 3791486, 3791487, 3791489, 3791490, 3791491, 3791492, 3791493, 3791494, 3791495, 3791496, 3791497, 3791498, 3791500, 3791501, 3791502, 3791503, 3791504, 3791505, 3791506",
    },
    [1485] = {
        ["1807:872:1286:951"] = "3791702, 3791713, 3791724, 3791728, 3791729, 3791730, 3791731, 3791732, 3791733, 3791703, 3791704, 3791705, 3791706, 3791707, 3791708, 3791709, 3791710, 3791711, 3791712, 3791714, 3791715, 3791716, 3791717, 3791718, 3791719, 3791720, 3791721, 3791722, 3791723, 3791725, 3791726, 3791727",
        ["938:1010:1680:49"] = "3791686, 3791694, 3791695, 3791696, 3791697, 3791698, 3791699, 3791700, 3791701, 3791687, 3791688, 3791689, 3791690, 3791691, 3791692, 3791693",
        ["945:1059:828:56"] = "3791666, 3791677, 3791679, 3791680, 3791681, 3791682, 3791683, 3791684, 3791685, 3791667, 3791668, 3791669, 3791670, 3791671, 3791672, 3791673, 3791674, 3791675, 3791676, 3791678",
        ["971:827:1559:1717"] = "3791734, 3791742, 3791743, 3791744, 3791745, 3791746, 3791747, 3791748, 3791749, 3791735, 3791736, 3791737, 3791738, 3791739, 3791740, 3791741",
    },
    [1492] = {
        ["1226:1196:1303:1301"] = "3795577, 3795588, 3795595, 3795596, 3795597, 3795598, 3795599, 3795600, 3795601, 3795578, 3795579, 3795580, 3795581, 3795582, 3795583, 3795584, 3795585, 3795586, 3795587, 3795589, 3795590, 3795591, 3795592, 3795593, 3795594",
        ["3006:1749:408:22"] = "3795602, 3795613, 3795624, 3795635, 3795646, 3795657, 3795668, 3795679, 3795685, 3795603, 3795604, 3795605, 3795606, 3795607, 3795608, 3795609, 3795610, 3795611, 3795612, 3795614, 3795615, 3795616, 3795617, 3795618, 3795619, 3795620, 3795621, 3795622, 3795623, 3795625, 3795626, 3795627, 3795628, 3795629, 3795630, 3795631, 3795632, 3795633, 3795634, 3795636, 3795637, 3795638, 3795639, 3795640, 3795641, 3795642, 3795643, 3795644, 3795645, 3795647, 3795648, 3795649, 3795650, 3795651, 3795652, 3795653, 3795654, 3795655, 3795656, 3795658, 3795659, 3795660, 3795661, 3795662, 3795663, 3795664, 3795665, 3795666, 3795667, 3795669, 3795670, 3795671, 3795672, 3795673, 3795674, 3795675, 3795676, 3795677, 3795678, 3795680, 3795681, 3795682, 3795683, 3795684",
    },
    [1502] = {
        ["1005:825:2011:180"] = "3801103, 3801118, 3801120, 3801122, 3801124, 3801126, 3801128, 3801130, 3801132, 3801105, 3801107, 3801109, 3801111, 3801113, 3801115, 3801116",
        ["1014:1487:501:486"] = "3800970, 3800993, 3801005, 3801007, 3801008, 3801010, 3801012, 3801014, 3801016, 3800973, 3800975, 3800977, 3800979, 3800981, 3800983, 3800985, 3800987, 3800989, 3800991, 3800995, 3800997, 3800999, 3801001, 3801003",
        ["1323:670:2000:885"] = "3801134, 3801154, 3801156, 3801158, 3801160, 3801162, 3801164, 3801166, 3801168, 3801136, 3801138, 3801140, 3801142, 3801144, 3801146, 3801148, 3801150, 3801152",
        ["810:682:1319:877"] = "3801018, 3801026, 3801028, 3801030, 3801032, 3801034, 3801036, 3801038, 3801040, 3801020, 3801022, 3801024",
        ["877:812:1227:184"] = "3801072, 3801088, 3801090, 3801091, 3801093, 3801095, 3801097, 3801099, 3801101, 3801074, 3801076, 3801078, 3801080, 3801082, 3801084, 3801086",
        ["964:948:1144:1431"] = "3801042, 3801057, 3801059, 3801061, 3801063, 3801065, 3801067, 3801069, 3801071, 3801044, 3801046, 3801048, 3801050, 3801052, 3801053, 3801055",
        ["979:954:2013:1428"] = "3801170, 3801185, 3801187, 3801189, 3801191, 3801193, 3801195, 3801197, 3801199, 3801172, 3801174, 3801176, 3801178, 3801179, 3801181, 3801183",
    },
    [1503] = {
        ["1007:1460:467:612"] = "3802618, 3802629, 3802635, 3802636, 3802637, 3802638, 3802639, 3802640, 3802641, 3802619, 3802620, 3802621, 3802622, 3802623, 3802624, 3802625, 3802626, 3802627, 3802628, 3802630, 3802631, 3802632, 3802633, 3802634",
        ["1586:1924:1920:448"] = "3802674, 3802685, 3802696, 3802707, 3802718, 3802726, 3802727, 3802728, 3802729, 3802675, 3802676, 3802677, 3802678, 3802679, 3802680, 3802681, 3802682, 3802683, 3802684, 3802686, 3802687, 3802688, 3802689, 3802690, 3802691, 3802692, 3802693, 3802694, 3802695, 3802697, 3802698, 3802699, 3802700, 3802701, 3802702, 3802703, 3802704, 3802705, 3802706, 3802708, 3802709, 3802710, 3802711, 3802712, 3802713, 3802714, 3802715, 3802716, 3802717, 3802719, 3802720, 3802721, 3802722, 3802723, 3802724, 3802725",
        ["833:1871:1274:228"] = "3802642, 3802653, 3802664, 3802668, 3802669, 3802670, 3802671, 3802672, 3802673, 3802643, 3802644, 3802645, 3802646, 3802647, 3802648, 3802649, 3802650, 3802651, 3802652, 3802654, 3802655, 3802656, 3802657, 3802658, 3802659, 3802660, 3802661, 3802662, 3802663, 3802665, 3802666, 3802667",
    },
    [1510] = {
        ["1480:978:1247:1460"] = "3804855, 3804866, 3804872, 3804873, 3804874, 3804875, 3804876, 3804877, 3804878, 3804856, 3804857, 3804858, 3804859, 3804860, 3804861, 3804862, 3804863, 3804864, 3804865, 3804867, 3804868, 3804869, 3804870, 3804871",
        ["1664:1327:1104:231"] = "3804879, 3804890, 3804901, 3804912, 3804916, 3804917, 3804918, 3804919, 3804920, 3804880, 3804881, 3804882, 3804883, 3804884, 3804885, 3804886, 3804887, 3804888, 3804889, 3804891, 3804892, 3804893, 3804894, 3804895, 3804896, 3804897, 3804898, 3804899, 3804900, 3804902, 3804903, 3804904, 3804905, 3804906, 3804907, 3804908, 3804909, 3804910, 3804911, 3804913, 3804914, 3804915",
    },
    [1512] = {
        ["1297:1026:1998:1191"] = "3805283, 3805294, 3805305, 3805307, 3805308, 3805309, 3805310, 3805311, 3805312, 3805284, 3805285, 3805286, 3805287, 3805288, 3805289, 3805290, 3805291, 3805292, 3805293, 3805295, 3805296, 3805297, 3805298, 3805299, 3805300, 3805301, 3805302, 3805303, 3805304, 3805306",
        ["1415:1037:251:1197"] = "3805235, 3805246, 3805257, 3805259, 3805260, 3805261, 3805262, 3805263, 3805264, 3805236, 3805237, 3805238, 3805239, 3805240, 3805241, 3805242, 3805243, 3805244, 3805245, 3805247, 3805248, 3805249, 3805250, 3805251, 3805252, 3805253, 3805254, 3805255, 3805256, 3805258",
        ["2454:1432:750:12"] = "3805313, 3805324, 3805335, 3805346, 3805357, 3805368, 3805370, 3805371, 3805372, 3805314, 3805315, 3805316, 3805317, 3805318, 3805319, 3805320, 3805321, 3805322, 3805323, 3805325, 3805326, 3805327, 3805328, 3805329, 3805330, 3805331, 3805332, 3805333, 3805334, 3805336, 3805337, 3805338, 3805339, 3805340, 3805341, 3805342, 3805343, 3805344, 3805345, 3805347, 3805348, 3805349, 3805350, 3805351, 3805352, 3805353, 3805354, 3805355, 3805356, 3805358, 3805359, 3805360, 3805361, 3805362, 3805363, 3805364, 3805365, 3805366, 3805367, 3805369",
        ["623:1489:1521:906"] = "3805265, 3805275, 3805276, 3805277, 3805278, 3805279, 3805280, 3805281, 3805282, 3805266, 3805267, 3805268, 3805269, 3805270, 3805271, 3805272, 3805273, 3805274",
    },
    [1513] = {
        ["754:5050:1547:231"] = "3805692, 3805703, 3805712, 3805713, 3805714, 3805715, 3805716, 3805717, 3805718, 3805693, 3805694, 3805695, 3805696, 3805697, 3805698, 3805699, 3805700, 3805701, 3805702, 3805704, 3805705, 3805706, 3805707, 3805708, 3805709, 3805710, 3805711, 0",
        ["765:1894:959:406"] = "3805668, 3805679, 3805685, 3805686, 3805687, 3805688, 3805689, 3805690, 3805691, 3805669, 3805670, 3805671, 3805672, 3805673, 3805674, 3805675, 3805676, 3805677, 3805678, 3805680, 3805681, 3805682, 3805683, 3805684",
        ["786:1887:2142:396"] = "3805719, 3805730, 3805742, 3805747, 3805748, 3805749, 3805750, 3805751, 3805752, 3805720, 3805721, 3805722, 3805723, 3805724, 3805725, 3805726, 3805727, 3805728, 3805729, 3805731, 3805732, 3805733, 3805734, 3805735, 3805737, 3805738, 3805739, 3805740, 3805741, 3805743, 3805745, 3805746",
    },
    [1514] = {
        ["1156:465:602:1062"] = "3806122, 3806124, 3806125, 3806126, 3806127, 3806128, 3806129, 3806130, 3806131, 3806123",
        ["1225:708:489:510"] = "3806107, 3806114, 3806115, 3806116, 3806117, 3806118, 3806119, 3806120, 3806121, 3806108, 3806109, 3806110, 3806111, 3806112, 3806113",
        ["1259:509:2156:653"] = "3806150, 3806152, 3806153, 3806154, 3806155, 3806156, 3806157, 3806158, 3806159, 3806151",
        ["1266:941:2151:1041"] = "3806160, 3806171, 3806173, 3806174, 3806175, 3806176, 3806177, 3806178, 3806179, 3806161, 3806162, 3806163, 3806164, 3806165, 3806166, 3806167, 3806168, 3806169, 3806170, 3806172",
        ["727:1420:1579:396"] = "3806132, 3806142, 3806143, 3806144, 3806145, 3806146, 3806147, 3806148, 3806149, 3806133, 3806134, 3806135, 3806136, 3806137, 3806138, 3806139, 3806140, 3806141",
    },
    [1515] = {
        ["1350:1420:1160:120"] = "3811387, 3811398, 3811409, 3811417, 3811418, 3811419, 3811420, 3811421, 3811422, 3811388, 3811389, 3811390, 3811391, 3811392, 3811393, 3811394, 3811395, 3811396, 3811397, 3811399, 3811400, 3811401, 3811402, 3811403, 3811404, 3811405, 3811406, 3811407, 3811408, 3811410, 3811411, 3811412, 3811413, 3811414, 3811415, 3811416",
        ["1381:1602:1849:696"] = "3811423, 3811434, 3811445, 3811456, 3811460, 3811461, 3811462, 3811463, 3811464, 3811424, 3811425, 3811426, 3811427, 3811428, 3811429, 3811430, 3811431, 3811432, 3811433, 3811435, 3811436, 3811437, 3811438, 3811439, 3811440, 3811441, 3811442, 3811443, 3811444, 3811446, 3811447, 3811448, 3811449, 3811450, 3811451, 3811452, 3811453, 3811454, 3811455, 3811457, 3811458, 3811459",
        ["994:1285:724:555"] = "3811363, 3811374, 3811380, 3811381, 3811382, 3811383, 3811384, 3811385, 3811386, 3811364, 3811365, 3811366, 3811367, 3811368, 3811369, 3811370, 3811371, 3811372, 3811373, 3811375, 3811376, 3811377, 3811378, 3811379",
    },
    [1517] = {
        ["1353:1415:537:717"] = "3806880, 3806891, 3806902, 3806910, 3806911, 3806912, 3806913, 3806914, 3806915, 3806881, 3806882, 3806883, 3806884, 3806885, 3806886, 3806887, 3806888, 3806889, 3806890, 3806892, 3806893, 3806894, 3806895, 3806896, 3806897, 3806898, 3806899, 3806900, 3806901, 3806903, 3806904, 3806905, 3806906, 3806907, 3806908, 3806909",
        ["618:2391:1775:87"] = "3806916, 3806927, 3806945, 3806947, 3806948, 3806949, 3806950, 3806951, 3806952, 3806917, 3806918, 3806919, 3806920, 3806921, 3806922, 3806923, 3806924, 3806925, 3806926, 3806928, 3806929, 3806930, 3806931, 3806932, 3806933, 3806934, 3806935, 3806936, 3806937, 3806946",
        ["949:1036:2246:872"] = "3806953, 3806964, 3806966, 3806967, 3806968, 3806969, 3806970, 3806971, 3806972, 3806954, 3806955, 3806956, 3806957, 3806958, 3806959, 3806960, 3806961, 3806962, 3806963, 3806965",
    },
    [1519] = {
        ["1388:1297:292:102"] = "3808677, 3808688, 3808699, 3808707, 3808708, 3808709, 3808710, 3808711, 3808712, 3808678, 3808679, 3808680, 3808681, 3808682, 3808683, 3808684, 3808685, 3808686, 3808687, 3808689, 3808690, 3808691, 3808692, 3808693, 3808694, 3808695, 3808696, 3808697, 3808698, 3808700, 3808701, 3808702, 3808703, 3808704, 3808705, 3808706",
        ["1408:1211:288:1305"] = "3808721, 3808732, 3808743, 3808745, 3808746, 3808747, 3808748, 3808749, 3808750, 3808722, 3808723, 3808724, 3808725, 3808726, 3808727, 3808728, 3808729, 3808730, 3808731, 3808733, 3808734, 3808735, 3808736, 3808737, 3808738, 3808739, 3808740, 3808741, 3808742, 3808744",
        ["1417:1229:2032:1306"] = "3808790, 3808801, 3808812, 3808814, 3808815, 3808816, 3808817, 3808818, 3808819, 3808791, 3808792, 3808793, 3808794, 3808795, 3808796, 3808797, 3808798, 3808799, 3808800, 3808802, 3808803, 3808804, 3808805, 3808806, 3808807, 3808808, 3808809, 3808810, 3808811, 3808813",
        ["1432:1315:2024:85"] = "3808828, 3808839, 3808850, 3808858, 3808859, 3808860, 3808861, 3808862, 3808863, 3808829, 3808830, 3808831, 3808832, 3808833, 3808834, 3808835, 3808836, 3808837, 3808838, 3808840, 3808841, 3808842, 3808843, 3808844, 3808845, 3808846, 3808847, 3808848, 3808849, 3808851, 3808852, 3808853, 3808854, 3808855, 3808856, 3808857",
        ["559:1052:1589:1508"] = "3808775, 3808782, 3808783, 3808784, 3808785, 3808786, 3808787, 3808788, 3808789, 3808776, 3808777, 3808778, 3808779, 3808780, 3808781",
        ["571:539:1574:1080"] = "3808766, 3808767, 3808768, 3808769, 3808770, 3808771, 3808772, 3808773, 3808774",
        ["673:1186:1515:0"] = "3808751, 3808758, 3808759, 3808760, 3808761, 3808762, 3808763, 3808764, 3808765, 3808752, 3808753, 3808754, 3808755, 3808756, 3808757",
        ["954:507:2005:1105"] = "3808820, 3808821, 3808822, 3808823, 3808824, 3808825, 3808826, 3808827",
        ["970:475:741:1119"] = "3808713, 3808714, 3808715, 3808716, 3808717, 3808718, 3808719, 3808720",
    },
    [1525] = {
        ["1058:629:2050:189"] = "3816506, 3816513, 3816514, 3816515, 3816516, 3816517, 3816518, 3816519, 3816520, 3816507, 3816508, 3816509, 3816510, 3816511, 3816512",
        ["1134:804:1039:30"] = "3816521, 3816532, 3816534, 3816535, 3816536, 3816537, 3816538, 3816539, 3816540, 3816522, 3816523, 3816524, 3816525, 3816526, 3816527, 3816528, 3816529, 3816530, 3816531, 3816533",
        ["1456:869:1004:1691"] = "3816565, 3816576, 3816582, 3816583, 3816584, 3816585, 3816586, 3816587, 3816588, 3816566, 3816567, 3816568, 3816569, 3816570, 3816571, 3816572, 3816573, 3816574, 3816575, 3816577, 3816578, 3816579, 3816580, 3816581",
        ["571:1007:2339:1553"] = "3816626, 3816630, 3816631, 3816632, 3816633, 3816634, 3816635, 3816636, 3816637, 3816627, 3816628, 3816629",
        ["830:1232:1660:728"] = "3816589, 3816600, 3816602, 3816603, 3816604, 3816605, 3816606, 3816607, 3816609, 3816590, 3816591, 3816592, 3816593, 3816594, 3816595, 3816596, 3816597, 3816598, 3816599, 3816601",
        ["889:972:2008:697"] = "3816610, 3816618, 3816619, 3816620, 3816621, 3816622, 3816623, 3816624, 3816625, 3816611, 3816612, 3816613, 3816614, 3816615, 3816616, 3816617",
        ["988:1315:788:648"] = "3816541, 3816552, 3816558, 3816559, 3816560, 3816561, 3816562, 3816563, 3816564, 3816542, 3816543, 3816544, 3816545, 3816546, 3816547, 3816548, 3816549, 3816550, 3816551, 3816553, 3816554, 3816555, 3816556, 3816557",
    },
    [1526] = {
        ["1173:780:815:1389"] = "3816869, 3816880, 3816882, 3816883, 3816884, 3816885, 3816886, 3816887, 3816888, 3816870, 3816871, 3816872, 3816873, 3816874, 3816875, 3816876, 3816877, 3816878, 3816879, 3816881",
        ["1369:1087:832:428"] = "3816823, 3816834, 3816845, 3816847, 3816848, 3816849, 3816850, 3816851, 3816852, 3816824, 3816825, 3816826, 3816827, 3816828, 3816829, 3816830, 3816831, 3816832, 3816833, 3816835, 3816836, 3816837, 3816838, 3816839, 3816840, 3816841, 3816842, 3816843, 3816844, 3816846",
        ["1795:555:798:1995"] = "3816889, 3816900, 3816906, 3816907, 3816908, 3816909, 3816910, 3816911, 3816912, 3816890, 3816891, 3816892, 3816893, 3816894, 3816895, 3816896, 3816897, 3816898, 3816899, 3816901, 3816902, 3816903, 3816904, 3816905",
        ["508:1023:834:38"] = "3816788, 3816789, 3816790, 3816791, 3816792, 3816793, 3816794, 3816795",
        ["589:1233:2053:6"] = "3816808, 3816815, 3816816, 3816817, 3816818, 3816819, 3816820, 3816821, 3816822, 3816809, 3816810, 3816811, 3816812, 3816813, 3816814",
        ["957:536:1215:16"] = "3816796, 3816800, 3816801, 3816802, 3816803, 3816804, 3816805, 3816806, 3816807, 3816797, 3816798, 3816799",
        ["983:970:1869:1134"] = "3816853, 3816861, 3816862, 3816863, 3816864, 3816865, 3816866, 3816867, 3816868, 3816854, 3816855, 3816856, 3816857, 3816858, 3816859, 3816860",
    },
    [1528] = {
        ["1005:1040:1728:1510"] = "3817339, 3817350, 3817352, 3817353, 3817354, 3817355, 3817357, 3817358, 3817359, 3817340, 3817341, 3817342, 3817343, 3817344, 3817345, 3817346, 3817347, 3817348, 3817349, 3817351",
        ["1016:785:814:1775"] = "3817314, 3817322, 3817323, 3817324, 3817325, 3817326, 3817327, 3817328, 0, 3817315, 3817316, 3817317, 3817318, 3817319, 3817320, 3817321",
        ["1158:1228:1936:397"] = "3817228, 3817239, 3817246, 3817247, 3817248, 3817249, 3817250, 3817251, 3817252, 3817229, 3817230, 3817231, 3817232, 3817233, 3817234, 3817235, 3817236, 3817237, 3817238, 3817240, 3817241, 3817242, 3817243, 3817244, 3817245",
        ["444:1283:1913:873"] = "3817262, 3817266, 3817267, 3817268, 3817269, 3817270, 3817271, 3817272, 3817273, 3817263, 3817264, 3817265",
        ["696:779:1766:0"] = "3817216, 3817220, 3817221, 3817222, 3817223, 3817224, 3817225, 3817226, 3817227, 3817217, 3817218, 3817219",
        ["742:686:1275:1523"] = "3817330, 3817331, 3817332, 3817333, 3817334, 3817335, 3817336, 3817337, 3817338",
        ["746:747:2499:1054"] = "3817253, 3817254, 3817255, 3817256, 3817257, 3817258, 3817259, 3817260, 3817261",
        ["840:553:553:1330"] = "3817302, 3817306, 3817307, 3817308, 3817309, 3817310, 3817311, 3817312, 3817313, 3817303, 3817304, 3817305",
        ["863:770:1284:902"] = "3817274, 3817282, 3817283, 3817284, 3817285, 3817286, 3817287, 3817288, 3817289, 3817275, 3817276, 3817277, 3817278, 3817279, 3817280, 3817281",
        ["976:734:656:695"] = "3817290, 3817294, 3817295, 3817296, 3817297, 3817298, 3817299, 3817300, 3817301, 3817291, 3817292, 3817293",
    },
    [1530] = {
        ["1050:870:890:47"] = "3817566, 3817577, 3817579, 3817580, 3817581, 3817582, 3817583, 3817584, 3817585, 3817567, 3817568, 3817569, 3817570, 3817571, 3817572, 3817573, 3817574, 3817575, 3817576, 3817578",
        ["1084:1084:2444:436"] = "3817510, 3817521, 3817529, 3817530, 3817531, 3817533, 3817535, 3817536, 3817537, 3817511, 3817512, 3817513, 3817514, 3817515, 3817516, 3817517, 3817518, 3817519, 3817520, 3817522, 3817524, 3817525, 3817526, 3817527, 3817528",
        ["1165:810:963:1719"] = "3817616, 3817627, 3817629, 3817630, 3817631, 3817632, 3817633, 3817634, 3817635, 3817617, 3817618, 3817619, 3817620, 3817621, 3817622, 3817623, 3817624, 3817625, 3817626, 3817628",
        ["1447:1179:653:680"] = "3817586, 3817597, 3817608, 3817610, 3817611, 3817612, 3817613, 3817614, 3817615, 3817587, 3817588, 3817589, 3817590, 3817591, 3817592, 3817593, 3817594, 3817595, 3817596, 3817598, 3817599, 3817600, 3817601, 3817602, 3817603, 3817604, 3817605, 3817606, 3817607, 3817609",
        ["848:1116:237:1426"] = "3817636, 3817647, 3817649, 3817650, 3817651, 3817652, 3817653, 3817654, 3817655, 3817637, 3817638, 3817639, 3817640, 3817641, 3817642, 3817643, 3817644, 3817645, 3817646, 3817648",
        ["959:1721:1631:40"] = "3817538, 3817549, 3817559, 3817560, 3817561, 3817562, 3817563, 3817564, 3817565, 3817539, 3817540, 3817541, 3817542, 3817543, 3817544, 3817545, 3817546, 3817547, 3817548, 3817550, 3817551, 3817552, 3817553, 3817554, 3817555, 3817556, 3817557, 3817558",
    },
    [1532] = {
        ["1048:440:1238:1099"] = "3819469, 3819471, 3819472, 3819473, 3819474, 3819475, 3819476, 3819477, 3819478, 3819470",
        ["1131:960:1605:57"] = "3819426, 3819440, 3819442, 3819443, 3819444, 3819445, 3819446, 3819447, 3819448, 3819427, 3819428, 3819429, 3819430, 3819431, 3819434, 3819436, 3819437, 3819438, 3819439, 3819441",
        ["839:1123:1484:1437"] = "3819479, 3819490, 3819492, 3819493, 3819494, 3819495, 3819496, 3819497, 3819498, 3819480, 3819481, 3819482, 3819483, 3819484, 3819485, 3819486, 3819487, 3819488, 3819489, 3819491",
        ["861:668:1943:914"] = "3819457, 3819461, 3819462, 3819463, 3819464, 3819465, 3819466, 3819467, 3819468, 3819458, 3819459, 3819460",
        ["951:400:1250:800"] = "3819449, 3819450, 3819451, 3819452, 3819453, 3819454, 3819455, 3819456",
    },
    [1533] = {
        ["565:1404:1748:591"] = "3817806, 3817816, 3817817, 3817818, 3817819, 3817820, 3817821, 3817822, 3817823, 3817807, 3817808, 3817809, 3817810, 3817811, 3817812, 3817813, 3817814, 3817815",
        ["677:1389:1198:595"] = "3817824, 3817834, 3817835, 3817836, 3817837, 3817838, 3817839, 3817840, 3817841, 3817825, 3817826, 3817827, 3817828, 3817829, 3817830, 3817831, 3817832, 3817833",
        ["792:1469:1817:173"] = "3817862, 3817873, 3817879, 3817880, 3817881, 3817882, 3817883, 3817884, 3817885, 3817863, 3817864, 3817865, 3817866, 3817867, 3817868, 3817869, 3817870, 3817871, 3817872, 3817874, 3817875, 3817876, 3817877, 3817878",
        ["802:1035:1336:1500"] = "3817842, 3817853, 3817855, 3817856, 3817857, 3817858, 3817859, 3817860, 3817861, 3817843, 3817844, 3817845, 3817846, 3817847, 3817848, 3817849, 3817850, 3817851, 3817852, 3817854",
    },
    [1535] = {
        ["1114:879:1161:1076"] = "3818458, 3818469, 3818471, 3818472, 3818473, 3818474, 3818475, 3818476, 3818477, 3818459, 3818460, 3818461, 3818462, 3818463, 3818464, 3818465, 3818466, 3818467, 3818468, 3818470",
        ["1290:756:833:1754"] = "3818490, 3818500, 3818501, 3818502, 3818503, 3818504, 3818505, 3818506, 3818507, 3818491, 3818492, 3818493, 3818494, 3818495, 3818496, 3818497, 3818498, 3818499",
        ["519:902:1306:384"] = "3818446, 3818450, 3818451, 3818452, 3818453, 3818454, 3818455, 3818456, 3818457, 3818447, 3818448, 3818449",
        ["688:1013:786:529"] = "3818434, 3818438, 3818439, 3818440, 3818441, 3818442, 3818443, 3818444, 3818445, 3818435, 3818436, 3818437",
        ["835:1344:1710:388"] = "3818410, 3818421, 3818427, 3818428, 3818429, 3818430, 3818431, 3818432, 3818433, 3818411, 3818412, 3818413, 3818414, 3818415, 3818416, 3818417, 3818418, 3818419, 3818420, 3818422, 3818423, 3818424, 3818425, 3818426",
        ["931:654:858:1427"] = "3818478, 3818482, 3818483, 3818484, 3818485, 3818486, 3818487, 3818488, 3818489, 3818479, 3818480, 3818481",
        ["999:1527:1955:22"] = "3818386, 3818397, 3818403, 3818404, 3818405, 3818406, 3818407, 3818408, 3818409, 3818387, 3818388, 3818389, 3818390, 3818391, 3818392, 3818393, 3818394, 3818395, 3818396, 3818398, 3818399, 3818400, 3818401, 3818402",
    },
    [1539] = {
        ["1520:1017:1483:1230"] = "3815339, 3815350, 3815356, 3815357, 3815358, 3815359, 3815360, 3815361, 3815362, 3815340, 3815341, 3815342, 3815343, 3815344, 3815345, 3815346, 3815347, 3815348, 3815349, 3815351, 3815352, 3815353, 3815354, 3815355",
        ["2447:1356:600:85"] = "3815255, 3815270, 3815281, 3815296, 3815307, 3815322, 3815324, 3815325, 3815326, 3815256, 3815261, 3815262, 3815263, 3815264, 3815265, 3815266, 3815267, 3815268, 3815269, 3815271, 3815272, 3815273, 3815274, 3815275, 3815276, 3815277, 3815278, 3815279, 3815280, 3815282, 3815283, 3815284, 3815285, 3815286, 3815287, 3815292, 3815293, 3815294, 3815295, 3815297, 3815298, 3815299, 3815300, 3815301, 3815302, 3815303, 3815304, 3815305, 3815306, 3815308, 3815309, 3815310, 3815311, 3815312, 3815313, 3815314, 3815315, 3815320, 3815321, 3815323",
        ["651:949:2373:1518"] = "3815363, 3815367, 3815368, 3815369, 3815370, 3815371, 3815372, 3815373, 3815374, 3815364, 3815365, 3815366",
        ["792:729:1413:1021"] = "3815327, 3815331, 3815332, 3815333, 3815334, 3815335, 3815336, 3815337, 3815338, 3815328, 3815329, 3815330",
    },
    [1540] = {
        ["1038:725:1140:184"] = "3815529, 3815536, 3815537, 3815538, 3815539, 3815540, 3815541, 3815542, 3815543, 3815530, 3815531, 3815532, 3815533, 3815534, 3815535",
        ["1134:710:1143:1198"] = "3815559, 3815566, 3815567, 3815568, 3815569, 3815570, 3815571, 3815572, 3815577, 3815560, 3815561, 3815562, 3815563, 3815564, 3815565",
        ["1135:615:1120:749"] = "3815544, 3815551, 3815552, 3815553, 3815554, 3815555, 3815556, 3815557, 3815558, 3815545, 3815546, 3815547, 3815548, 3815549, 3815550",
        ["823:808:1474:1747"] = "3815578, 3815586, 3815587, 3815588, 3815589, 3815590, 3815591, 3815592, 3815593, 3815579, 3815580, 3815581, 3815582, 3815583, 3815584, 3815585",
    },
    [1549] = {
        ["1079:1464:756:212"] = "3821078, 3821089, 3821100, 3821102, 3821103, 3821104, 3821105, 3821106, 3821107, 3821079, 3821080, 3821081, 3821082, 3821083, 3821084, 3821085, 3821086, 3821087, 3821088, 3821090, 3821091, 3821092, 3821093, 3821094, 3821095, 3821096, 3821097, 3821098, 3821099, 3821101",
        ["1094:978:1710:1545"] = "3821128, 3821139, 3821141, 3821142, 3821143, 3821144, 3821145, 3821146, 3821147, 3821129, 3821130, 3821131, 3821132, 3821133, 3821134, 3821135, 3821136, 3821137, 3821138, 3821140",
        ["1106:973:727:1534"] = "3821108, 3821119, 3821121, 3821122, 3821123, 3821124, 3821125, 3821126, 3821127, 3821109, 3821110, 3821111, 3821112, 3821113, 3821114, 3821115, 3821116, 3821117, 3821118, 3821120",
        ["1401:1434:1715:208"] = "3821148, 3821159, 3821170, 3821178, 3821179, 3821180, 3821181, 3821182, 3821183, 3821149, 3821150, 3821151, 3821152, 3821153, 3821154, 3821155, 3821156, 3821157, 3821158, 3821160, 3821161, 3821162, 3821163, 3821164, 3821165, 3821166, 3821167, 3821168, 3821169, 3821171, 3821172, 3821173, 3821174, 3821175, 3821176, 3821177",
    },
    [1550] = {
        ["1562:2440:61:90"] = "3821334, 3821345, 3821356, 3821367, 3821378, 3821389, 3821400, 3821402, 3821403, 3821335, 3821336, 3821337, 3821338, 3821339, 3821340, 3821341, 3821342, 3821343, 3821344, 3821346, 3821347, 3821348, 3821349, 3821350, 3821351, 3821352, 3821353, 3821354, 3821355, 3821357, 3821358, 3821359, 3821360, 3821361, 3821362, 3821363, 3821364, 3821365, 3821366, 3821368, 3821369, 3821370, 3821371, 3821372, 3821373, 3821374, 3821375, 3821376, 3821377, 3821379, 3821380, 3821381, 3821382, 3821383, 3821384, 3821385, 3821386, 3821387, 3821388, 3821390, 3821391, 3821392, 3821393, 3821394, 3821395, 3821396, 3821397, 3821398, 3821399, 3821401",
        ["1660:2374:2076:111"] = "3821434, 3821451, 3821463, 3821475, 3821486, 3821498, 3821509, 3821511, 3821512, 3821435, 3821438, 3821440, 3821441, 3821442, 3821445, 3821447, 3821448, 3821449, 3821450, 3821452, 3821453, 3821454, 3821455, 3821456, 3821457, 3821459, 3821460, 3821461, 3821462, 3821464, 3821465, 3821466, 3821467, 3821468, 3821470, 3821471, 3821472, 3821473, 3821474, 3821476, 3821477, 3821478, 3821479, 3821480, 3821481, 3821482, 3821483, 3821484, 3821485, 3821487, 3821489, 3821490, 3821491, 3821492, 3821493, 3821494, 3821495, 3821496, 3821497, 3821499, 3821500, 3821501, 3821502, 3821503, 3821504, 3821505, 3821506, 3821507, 3821508, 3821510",
        ["725:2425:1478:102"] = "3821404, 3821415, 3821426, 3821428, 3821429, 3821430, 3821431, 3821432, 3821433, 3821405, 3821406, 3821407, 3821408, 3821409, 3821410, 3821411, 3821412, 3821413, 3821414, 3821416, 3821417, 3821418, 3821419, 3821420, 3821421, 3821422, 3821423, 3821424, 3821425, 3821427",
    },
    [1552] = {
        ["1117:1052:2055:1290"] = "3822531, 3822552, 3822565, 3822567, 3822568, 3822570, 3822572, 3822574, 3822576, 3822533, 3822535, 3822537, 3822539, 3822541, 3822542, 3822544, 3822546, 3822548, 3822550, 3822554, 3822556, 3822558, 3822559, 3822561, 3822563",
        ["1290:1210:892:1302"] = "3822453, 3822482, 3822509, 3822513, 3822516, 3822519, 3822522, 3822525, 3822528, 3822456, 3822459, 3822461, 3822463, 3822466, 3822469, 3822472, 3822475, 3822478, 3822480, 3822485, 3822487, 3822489, 3822492, 3822494, 3822496, 3822498, 3822500, 3822503, 3822506, 3822512",
        ["1592:1281:415:134"] = "3822348, 3822374, 3822402, 3822431, 3822441, 3822443, 3822445, 3822448, 3822451, 3822350, 3822352, 3822354, 3822357, 3822359, 3822362, 3822363, 3822366, 3822369, 3822371, 3822377, 3822379, 3822382, 3822385, 3822387, 3822390, 3822392, 3822395, 3822397, 3822399, 3822404, 3822407, 3822409, 3822412, 3822415, 3822418, 3822421, 3822424, 3822426, 3822428, 3822434, 3822437, 3822440",
        ["1811:1114:1912:287"] = "3822578, 3822598, 3822618, 3822638, 3822642, 3822643, 3822645, 3822647, 3822649, 3822579, 3822581, 3822583, 3822585, 3822587, 3822589, 3822591, 3822592, 3822594, 3822596, 3822600, 3822602, 3822603, 3822605, 3822607, 3822609, 3822611, 3822613, 3822614, 3822616, 3822620, 3822622, 3822623, 3822625, 3822627, 3822629, 3822631, 3822633, 3822634, 3822636, 3822640",
    },
    [1554] = {
        ["1060:1166:2122:1027"] = "3824052, 3824072, 3824084, 3824086, 3824088, 3824089, 3824091, 3824093, 3824095, 3824054, 3824056, 3824058, 3824059, 3824061, 3824063, 3824065, 3824066, 3824068, 3824070, 3824074, 3824075, 3824077, 3824079, 3824081, 3824082",
        ["1166:1131:2059:0"] = "3824139, 3824159, 3824171, 3824173, 3824174, 3824176, 3824178, 3824180, 3824181, 3824141, 3824143, 3824144, 3824146, 3824148, 3824150, 3824152, 3824153, 3824155, 3824157, 3824160, 3824162, 3824164, 3824166, 3824168, 3824169",
        ["775:2043:744:116"] = "3823960, 3823980, 3823999, 3824006, 3824008, 3824010, 3824011, 3824013, 3824015, 3823962, 3823964, 3823966, 3823967, 3823969, 3823971, 3823973, 3823974, 3823976, 3823978, 3823981, 3823983, 3823985, 3823987, 3823988, 3823990, 3823992, 3823994, 3823995, 3823997, 3824001, 3824002, 3824004",
        ["906:1314:1610:453"] = "3824096, 3824116, 3824127, 3824128, 3824130, 3824132, 3824134, 3824135, 3824137, 3824098, 3824100, 3824102, 3824103, 3824105, 3824107, 3824109, 3824110, 3824112, 3824114, 3824118, 3824119, 3824121, 3824123, 3824125",
        ["977:1180:1266:1179"] = "3824017, 3824036, 3824040, 3824042, 3824043, 3824045, 3824047, 3824049, 3824050, 3824018, 3824020, 3824022, 3824024, 3824025, 3824027, 3824029, 3824031, 3824033, 3824034, 3824038",
    },
    [1555] = {
        ["1350:1420:1160:120"] = "3824750, 3824770, 3824790, 3824804, 3824806, 3824808, 3824809, 3824811, 3824813, 3824752, 3824754, 3824756, 3824757, 3824759, 3824761, 3824763, 3824764, 3824766, 3824768, 3824772, 3824774, 3824776, 3824777, 3824779, 3824781, 3824783, 3824785, 3824786, 3824788, 3824792, 3824794, 3824795, 3824797, 3824799, 3824801, 3824802",
        ["1381:1602:1849:696"] = "3824815, 3824834, 3824854, 3824873, 3824880, 3824882, 3824884, 3824885, 3824887, 3824816, 3824818, 3824820, 3824822, 3824824, 3824825, 3824827, 3824829, 3824831, 3824832, 3824836, 3824838, 3824840, 3824841, 3824843, 3824845, 3824847, 3824848, 3824850, 3824852, 3824855, 3824857, 3824859, 3824861, 3824862, 3824864, 3824866, 3824868, 3824869, 3824871, 3824875, 3824877, 3824878",
        ["994:1285:724:555"] = "3824707, 3824727, 3824737, 3824739, 3824741, 3824743, 3824745, 3824746, 3824748, 3824709, 3824710, 3824712, 3824714, 3824716, 3824718, 3824720, 3824721, 3824723, 3824725, 3824729, 3824730, 3824732, 3824734, 3824736",
    },
    [1556] = {
        ["1108:919:1745:1408"] = "3825207, 3825227, 3825230, 3825232, 3825234, 3825236, 3825237, 3825239, 3825241, 3825209, 3825210, 3825212, 3825214, 3825216, 3825218, 3825220, 3825221, 3825223, 3825225, 3825228",
        ["1132:1401:719:1038"] = "3825153, 3825173, 3825192, 3825196, 3825198, 3825200, 3825201, 3825203, 3825205, 3825155, 3825157, 3825158, 3825160, 3825162, 3825164, 3825166, 3825167, 3825169, 3825171, 3825175, 3825176, 3825178, 3825180, 3825182, 3825184, 3825185, 3825187, 3825189, 3825191, 3825194",
        ["1338:1490:1727:18"] = "3825243, 3825263, 3825282, 3825296, 3825298, 3825300, 3825302, 3825304, 3825306, 3825245, 3825246, 3825248, 3825250, 3825252, 3825254, 3825255, 3825257, 3825259, 3825261, 3825264, 3825266, 3825268, 3825270, 3825271, 3825273, 3825275, 3825277, 3825279, 3825280, 3825284, 3825286, 3825288, 3825289, 3825291, 3825293, 3825295",
    },
    [1557] = {
        ["1807:872:1286:951"] = "3825564, 3825579, 3825594, 3825600, 3825601, 3825603, 3825604, 3825605, 3825606, 3825566, 3825567, 3825568, 3825570, 3825571, 3825573, 3825574, 3825575, 3825576, 3825578, 3825580, 3825582, 3825583, 3825585, 3825586, 3825587, 3825589, 3825590, 3825592, 3825593, 3825596, 3825597, 3825599",
        ["938:1010:1680:49"] = "3825544, 3825553, 3825554, 3825556, 3825557, 3825559, 3825560, 3825561, 3825563, 3825545, 3825546, 3825547, 3825548, 3825549, 3825550, 3825552",
        ["945:1059:828:56"] = "3825524, 3825535, 3825537, 3825538, 3825539, 3825540, 3825541, 3825542, 3825543, 3825525, 3825526, 3825527, 3825528, 3825529, 3825530, 3825531, 3825532, 3825533, 3825534, 3825536",
        ["971:827:1559:1717"] = "3825607, 3825618, 3825619, 3825621, 3825622, 3825624, 3825625, 3825626, 3825627, 3825609, 3825610, 3825612, 3825613, 3825614, 3825615, 3825617",
    },
    [1571] = {
        ["1005:825:2011:180"] = "3828534, 3828542, 3828543, 3828544, 3828545, 3828546, 3828547, 3828548, 3828549, 3828535, 3828536, 3828537, 3828538, 3828539, 3828540, 3828541",
        ["1014:1487:501:486"] = "3828466, 3828477, 3828483, 3828484, 3828485, 3828486, 3828487, 3828488, 3828489, 3828467, 3828468, 3828469, 3828470, 3828471, 3828472, 3828473, 3828474, 3828475, 3828476, 3828478, 3828479, 3828480, 3828481, 3828482",
        ["1323:670:2000:885"] = "3828550, 3828560, 3828561, 3828562, 3828563, 3828564, 3828565, 3828566, 3828567, 3828551, 3828552, 3828553, 3828554, 3828555, 3828556, 3828557, 3828558, 3828559",
        ["810:682:1319:877"] = "3828490, 3828494, 3828495, 3828496, 3828497, 3828498, 3828499, 3828500, 3828501, 3828491, 3828492, 3828493",
        ["877:812:1227:184"] = "3828518, 3828526, 3828527, 3828528, 3828529, 3828530, 3828531, 3828532, 3828533, 3828519, 3828520, 3828521, 3828522, 3828523, 3828524, 3828525",
        ["964:948:1144:1431"] = "3828502, 3828510, 3828511, 3828512, 3828513, 3828514, 3828515, 3828516, 3828517, 3828503, 3828504, 3828505, 3828506, 3828507, 3828508, 3828509",
        ["979:954:2013:1428"] = "3828568, 3828576, 3828577, 3828578, 3828579, 3828580, 3828581, 3828582, 3828583, 3828569, 3828570, 3828571, 3828572, 3828573, 3828574, 3828575",
    },
    [1572] = {
        ["1007:1460:467:612"] = "3828734, 3828745, 3828751, 3828752, 3828753, 3828754, 3828755, 3828756, 3828757, 3828735, 3828736, 3828737, 3828738, 3828739, 3828740, 3828741, 3828742, 3828743, 3828744, 3828746, 3828747, 3828748, 3828749, 3828750",
        ["1586:1924:1920:448"] = "3828790, 3828801, 3828812, 3828823, 3828834, 3828842, 3828843, 3828844, 3828845, 3828791, 3828792, 3828793, 3828794, 3828795, 3828796, 3828797, 3828798, 3828799, 3828800, 3828802, 3828803, 3828804, 3828805, 3828806, 3828807, 3828808, 3828809, 3828810, 3828811, 3828813, 3828814, 3828815, 3828816, 3828817, 3828818, 3828819, 3828820, 3828821, 3828822, 3828824, 3828825, 3828826, 3828827, 3828828, 3828829, 3828830, 3828831, 3828832, 3828833, 3828835, 3828836, 3828837, 3828838, 3828839, 3828840, 3828841",
        ["833:1871:1274:228"] = "3828758, 3828769, 3828780, 3828784, 3828785, 3828786, 3828787, 3828788, 3828789, 3828759, 3828760, 3828761, 3828762, 3828763, 3828764, 3828765, 3828766, 3828767, 3828768, 3828770, 3828771, 3828772, 3828773, 3828774, 3828775, 3828776, 3828777, 3828778, 3828779, 3828781, 3828782, 3828783",
    },
    [1578] = {
        ["1297:1026:1998:1191"] = "3830310, 3830321, 3830332, 3830334, 3830335, 3830336, 3830337, 3830338, 3830339, 3830311, 3830312, 3830313, 3830314, 3830315, 3830316, 3830317, 3830318, 3830319, 3830320, 3830322, 3830323, 3830324, 3830325, 3830326, 3830327, 3830328, 3830329, 3830330, 3830331, 3830333",
        ["1415:1037:251:1197"] = "3830262, 3830273, 3830284, 3830286, 3830287, 3830288, 3830289, 3830290, 3830291, 3830263, 3830264, 3830265, 3830266, 3830267, 3830268, 3830269, 3830270, 3830271, 3830272, 3830274, 3830275, 3830276, 3830277, 3830278, 3830279, 3830280, 3830281, 3830282, 3830283, 3830285",
        ["2454:1432:750:12"] = "3830340, 3830351, 3830362, 3830373, 3830384, 3830395, 3830397, 3830398, 3830399, 3830341, 3830342, 3830343, 3830344, 3830345, 3830346, 3830347, 3830348, 3830349, 3830350, 3830352, 3830353, 3830354, 3830355, 3830356, 3830357, 3830358, 3830359, 3830360, 3830361, 3830363, 3830364, 3830365, 3830366, 3830367, 3830368, 3830369, 3830370, 3830371, 3830372, 3830374, 3830375, 3830376, 3830377, 3830378, 3830379, 3830380, 3830381, 3830382, 3830383, 3830385, 3830386, 3830387, 3830388, 3830389, 3830390, 3830391, 3830392, 3830393, 3830394, 3830396",
        ["623:1489:1521:906"] = "3830292, 3830302, 3830303, 3830304, 3830305, 3830306, 3830307, 3830308, 3830309, 3830293, 3830294, 3830295, 3830296, 3830297, 3830298, 3830299, 3830300, 3830301",
    },
    [1579] = {
        ["754:5050:1547:231"] = "3830574, 3830585, 3830594, 3830595, 3830596, 3830597, 3830598, 3830599, 3830600, 3830575, 3830576, 3830577, 3830578, 3830579, 3830580, 3830581, 3830582, 3830583, 3830584, 3830586, 3830587, 3830588, 3830589, 3830590, 3830591, 3830592, 3830593, 0",
        ["765:1894:959:406"] = "3830550, 3830561, 3830567, 3830568, 3830569, 3830570, 3830571, 3830572, 3830573, 3830551, 3830552, 3830553, 3830554, 3830555, 3830556, 3830557, 3830558, 3830559, 3830560, 3830562, 3830563, 3830564, 3830565, 3830566",
        ["786:1887:2142:396"] = "3830601, 3830612, 3830623, 3830627, 3830628, 3830629, 3830630, 3830631, 3830632, 3830602, 3830603, 3830604, 3830605, 3830606, 3830607, 3830608, 3830609, 3830610, 3830611, 3830613, 3830614, 3830615, 3830616, 3830617, 3830618, 3830619, 3830620, 3830621, 3830622, 3830624, 3830625, 3830626",
    },
    [1580] = {
        ["1156:465:602:1062"] = "3830798, 3830800, 3830801, 3830802, 3830803, 3830804, 3830805, 3830806, 3830807, 3830799",
        ["1225:708:489:510"] = "3830783, 3830790, 3830791, 3830792, 3830793, 3830794, 3830795, 3830796, 3830797, 3830784, 3830785, 3830786, 3830787, 3830788, 3830789",
        ["1259:509:2156:653"] = "3830826, 3830828, 3830829, 3830830, 3830831, 3830832, 3830833, 3830834, 3830835, 3830827",
        ["1266:941:2151:1041"] = "3830836, 3830847, 3830849, 3830850, 3830851, 3830852, 3830853, 3830854, 3830855, 3830837, 3830838, 3830839, 3830840, 3830841, 3830842, 3830843, 3830844, 3830845, 3830846, 3830848",
        ["727:1420:1579:396"] = "3830808, 3830818, 3830819, 3830820, 3830821, 3830822, 3830823, 3830824, 3830825, 3830809, 3830810, 3830811, 3830812, 3830813, 3830814, 3830815, 3830816, 3830817",
    },
    [1582] = {
        ["1353:1415:537:717"] = "3831310, 3831321, 3831332, 3831340, 3831341, 3831342, 3831343, 3831344, 3831345, 3831311, 3831312, 3831313, 3831314, 3831315, 3831316, 3831317, 3831318, 3831319, 3831320, 3831322, 3831323, 3831324, 3831325, 3831326, 3831327, 3831328, 3831329, 3831330, 3831331, 3831333, 3831334, 3831335, 3831336, 3831337, 3831338, 3831339",
        ["618:2391:1775:87"] = "3831346, 3831357, 3831368, 3831370, 3831371, 3831372, 3831373, 3831374, 3831375, 3831347, 3831348, 3831349, 3831350, 3831351, 3831352, 3831353, 3831354, 3831355, 3831356, 3831358, 3831359, 3831360, 3831361, 3831362, 3831363, 3831364, 3831365, 3831366, 3831367, 3831369",
        ["949:1036:2246:872"] = "3831376, 3831387, 3831389, 3831390, 3831391, 3831392, 3831393, 3831394, 3831395, 3831377, 3831378, 3831379, 3831380, 3831381, 3831382, 3831383, 3831384, 3831385, 3831386, 3831388",
    },
    [1585] = {
        ["1028:1024:1472:1536"] = "3816328, 3816339, 3816341, 3816342, 3816343, 3816344, 3816345, 3816349, 3816355, 3816329, 3816330, 3816331, 3816332, 3816333, 3816334, 3816335, 3816336, 3816337, 3816338, 3816340",
        ["1080:487:1809:585"] = "3816300, 3816302, 3816303, 3816304, 3816305, 3816306, 3816307, 3816308, 3816309, 3816301",
        ["1434:734:1483:920"] = "3816310, 3816320, 3816321, 3816322, 3816323, 3816324, 3816325, 3816326, 3816327, 3816311, 3816312, 3816313, 3816314, 3816315, 3816316, 3816317, 3816318, 3816319",
        ["535:705:1779:0"] = "3816259, 3816260, 3816261, 3816262, 3816263, 3816264, 3816265, 3816266, 3816267",
        ["940:647:970:158"] = "3816268, 3816272, 3816273, 3816274, 3816275, 3816276, 3816277, 3816278, 3816279, 3816269, 3816270, 3816271",
        ["983:1029:960:617"] = "3816280, 3816291, 3816293, 3816294, 3816295, 3816296, 3816297, 3816298, 3816299, 3816281, 3816282, 3816283, 3816284, 3816285, 3816286, 3816287, 3816288, 3816289, 3816290, 3816292",
    },
    [1586] = {
        ["1044:733:1741:1635"] = "3819049, 3819056, 3819057, 3819058, 3819059, 3819060, 3819061, 3819062, 3819063, 3819050, 3819051, 3819052, 3819053, 3819054, 3819055",
        ["1370:940:1943:26"] = "3818973, 3818984, 3818990, 3818991, 3818992, 3818993, 3818994, 3818995, 3818996, 3818974, 3818975, 3818976, 3818977, 3818978, 3818979, 3818980, 3818981, 3818982, 3818983, 3818985, 3818986, 3818987, 3818988, 3818989",
        ["1439:1606:483:810"] = "3819064, 3819075, 3819086, 3819097, 3819101, 3819102, 3819103, 3819104, 3819105, 3819065, 3819066, 3819067, 3819068, 3819069, 3819070, 3819071, 3819072, 3819073, 3819074, 3819076, 3819077, 3819078, 3819079, 3819080, 3819081, 3819082, 3819083, 3819084, 3819085, 3819087, 3819088, 3819089, 3819090, 3819091, 3819092, 3819093, 3819094, 3819095, 3819096, 3819098, 3819099, 3819100",
        ["1873:1221:1807:812"] = "3818998, 3819011, 3819022, 3819033, 3819035, 3819036, 3819037, 3819038, 3819039, 3819001, 3819002, 3819003, 3819004, 3819005, 3819006, 3819007, 3819008, 3819009, 3819010, 3819012, 3819013, 3819014, 3819015, 3819016, 3819017, 3819018, 3819019, 3819020, 3819021, 3819023, 3819024, 3819025, 3819026, 3819027, 3819028, 3819029, 3819030, 3819031, 3819032, 3819034",
        ["603:579:1819:1159"] = "3819040, 3819041, 3819042, 3819043, 3819044, 3819045, 3819046, 3819047, 3819048",
        ["842:1244:400:1273"] = "3819106, 3819117, 3819119, 3819120, 3819121, 3819122, 3819123, 3819124, 3819125, 3819107, 3819108, 3819109, 3819110, 3819111, 3819112, 3819113, 3819114, 3819115, 3819116, 3819118",
    },
    [1587] = {
        ["1208:1747:499:289"] = "3821845, 3821865, 3821885, 3821900, 3821902, 3821904, 3821905, 3821907, 3821909, 3821847, 3821849, 3821851, 3821852, 3821854, 3821856, 3821858, 3821860, 3821862, 3821863, 3821867, 3821869, 3821871, 3821873, 3821874, 3821876, 3821878, 3821880, 3821882, 3821883, 3821889, 3821891, 3821893, 3821895, 3821896, 3821898",
        ["1442:1755:2130:293"] = "3821944, 3821964, 3821984, 3822004, 3822011, 3822013, 3822015, 3822017, 3822019, 3821946, 3821947, 3821949, 3821951, 3821953, 3821955, 3821957, 3821958, 3821960, 3821962, 3821966, 3821967, 3821969, 3821971, 3821973, 3821975, 3821976, 3821978, 3821980, 3821982, 3821986, 3821988, 3821989, 3821991, 3821993, 3821995, 3821997, 3821999, 3822001, 3822002, 3822006, 3822008, 3822010",
        ["647:1310:1594:934"] = "3821911, 3821929, 3821931, 3821933, 3821935, 3821936, 3821938, 3821940, 3821942, 3821913, 3821914, 3821916, 3821918, 3821920, 3821922, 3821924, 3821925, 3821927",
        ["669:597:1587:449"] = "3822021, 3822022, 3822024, 3822026, 3822028, 3822030, 3822032, 3822034, 3822035",
    },
    [1590] = {
        ["1388:1297:292:102"] = "3814600, 3814611, 3814622, 3814630, 3814631, 3814632, 3814633, 3814634, 3814635, 3814601, 3814602, 3814603, 3814604, 3814605, 3814606, 3814607, 3814608, 3814609, 3814610, 3814612, 3814613, 3814614, 3814615, 3814616, 3814617, 3814618, 3814619, 3814620, 3814621, 3814623, 3814624, 3814625, 3814626, 3814627, 3814628, 3814629",
        ["1408:1211:288:1305"] = "3814644, 3814655, 3814666, 3814668, 3814669, 3814670, 3814671, 3814672, 3814673, 3814645, 3814646, 3814647, 3814648, 3814649, 3814650, 3814651, 3814652, 3814653, 3814654, 3814656, 3814657, 3814658, 3814659, 3814660, 3814661, 3814662, 3814663, 3814664, 3814665, 3814667",
        ["1417:1229:2032:1306"] = "3814713, 3814724, 3814735, 3814737, 3814738, 3814739, 3814740, 3814741, 3814742, 3814714, 3814715, 3814716, 3814717, 3814718, 3814719, 3814720, 3814721, 3814722, 3814723, 3814725, 3814726, 3814727, 3814728, 3814729, 3814730, 3814731, 3814732, 3814733, 3814734, 3814736",
        ["1432:1315:2024:85"] = "3814751, 3814762, 3814773, 3814781, 3814782, 3814783, 3814784, 3814785, 3814786, 3814752, 3814753, 3814754, 3814755, 3814756, 3814757, 3814758, 3814759, 3814760, 3814761, 3814763, 3814764, 3814765, 3814766, 3814767, 3814768, 3814769, 3814770, 3814771, 3814772, 3814774, 3814775, 3814776, 3814777, 3814778, 3814779, 3814780",
        ["559:1052:1589:1508"] = "3814698, 3814705, 3814706, 3814707, 3814708, 3814709, 3814710, 3814711, 3814712, 3814699, 3814700, 3814701, 3814702, 3814703, 3814704",
        ["571:539:1574:1080"] = "3814689, 3814690, 3814691, 3814692, 3814693, 3814694, 3814695, 3814696, 3814697",
        ["673:1186:1515:0"] = "3814674, 3814681, 3814682, 3814683, 3814684, 3814685, 3814686, 3814687, 3814688, 3814675, 3814676, 3814677, 3814678, 3814679, 3814680",
        ["954:507:2005:1105"] = "3814743, 3814744, 3814745, 3814746, 3814747, 3814748, 3814749, 3814750",
        ["970:475:741:1119"] = "3814636, 3814637, 3814638, 3814639, 3814640, 3814641, 3814642, 3814643",
    },
    [1591] = {
        ["1384:1253:1106:1279"] = "3823023, 3823042, 3823064, 3823068, 3823071, 3823074, 3823077, 3823078, 3823081, 3823025, 3823026, 3823028, 3823030, 3823032, 3823033, 3823035, 3823037, 3823039, 3823040, 3823044, 3823046, 3823048, 3823049, 3823051, 3823053, 3823055, 3823056, 3823059, 3823061, 3823066",
        ["854:1010:2003:375"] = "3822995, 3823009, 3823011, 3823012, 3823014, 3823016, 3823017, 3823019, 3823021, 3822997, 3822998, 3823000, 3823002, 3823004, 3823005, 3823007",
        ["876:1317:739:152"] = "3822911, 3822930, 3822941, 3822943, 3822944, 3822946, 3822948, 3822950, 3822951, 3822913, 3822915, 3822916, 3822918, 3822920, 3822922, 3822923, 3822925, 3822927, 3822929, 3822932, 3822934, 3822936, 3822937, 3822939",
        ["902:1372:1496:0"] = "3822953, 3822972, 3822983, 3822984, 3822986, 3822988, 3822990, 3822991, 3822993, 3822955, 3822957, 3822958, 3822960, 3822962, 3822964, 3822965, 3822967, 3822969, 3822971, 3822974, 3822976, 3822978, 3822979, 3822981",
    },
    [1592] = {
        ["1226:1196:1303:1301"] = "3826854, 3826865, 3826873, 3826874, 3826875, 3826876, 3826877, 3826878, 3826879, 3826855, 3826856, 3826857, 3826858, 3826859, 3826860, 3826861, 3826862, 3826863, 3826864, 3826866, 3826945, 3826947, 3826870, 3826871, 3826872",
        ["3006:1749:408:22"] = "3826880, 3826891, 3826901, 3826912, 3826923, 3826934, 3826946, 3826958, 3826964, 3826881, 3826882, 3826883, 3826884, 3826885, 3826886, 3826887, 3826888, 3826889, 3826890, 3826892, 3826893, 3826894, 3826976, 3826895, 3826896, 3826897, 3826898, 3826899, 3826900, 3826902, 3826903, 3826904, 3826905, 3826906, 3826907, 3826908, 3826909, 3826910, 3826911, 3826913, 3826914, 3826915, 3826916, 3826917, 3826918, 3826919, 3826920, 3826921, 3826922, 3826924, 3826925, 3826926, 3826927, 3826928, 3826929, 3826930, 3826931, 3826932, 3826933, 3826935, 3826936, 3826937, 3826938, 3826939, 3826940, 3826941, 3826942, 3826943, 3826944, 3826948, 3826949, 3826950, 3826951, 3826952, 3826953, 3826954, 3826955, 3826956, 3826957, 3826959, 3826960, 3826961, 3826962, 3826963",
    },
    [1600] = {
        ["1022:918:1693:66"] = "3815964, 3815972, 3815973, 3815974, 3815975, 3815976, 3815977, 3815978, 3815979, 3815965, 3815966, 3815967, 3815968, 3815969, 3815970, 3815971",
        ["1064:818:1982:1742"] = "3816013, 3816024, 3816026, 3816027, 3816028, 3816029, 3816030, 3816031, 3816032, 3816014, 3816015, 3816016, 3816017, 3816018, 3816019, 3816020, 3816021, 3816022, 3816023, 3816025",
        ["1539:723:577:1835"] = "3815992, 3816003, 3816006, 3816007, 3816008, 3816009, 3816010, 3816011, 3816012, 3815993, 3815994, 3815995, 3815996, 3815997, 3815998, 3815999, 3816000, 3816001, 3816002, 3816004, 3816005",
        ["1875:1551:1167:485"] = "3816033, 3816044, 3816055, 3816066, 3816077, 3816085, 3816086, 3816091, 3816092, 3816034, 3816035, 3816036, 3816037, 3816038, 3816039, 3816040, 3816041, 3816042, 3816043, 3816045, 3816046, 3816047, 3816048, 3816049, 3816050, 3816051, 3816052, 3816053, 3816054, 3816056, 3816057, 3816058, 3816059, 3816060, 3816061, 3816062, 3816063, 3816064, 3816065, 3816067, 3816068, 3816069, 3816070, 3816071, 3816072, 3816073, 3816074, 3816075, 3816076, 3816078, 3816079, 3816080, 3816081, 3816082, 3816083, 3816084",
        ["636:1035:1207:9"] = "3815949, 3815956, 3815957, 3815958, 3815959, 3815960, 3815961, 3815962, 3815963, 3815950, 3815951, 3815952, 3815953, 3815954, 3815955",
        ["665:937:594:1017"] = "3815980, 3815984, 3815985, 3815986, 3815987, 3815988, 3815989, 3815990, 3815991, 3815981, 3815982, 3815983",
        ["699:1107:677:56"] = "3815926, 3815933, 3815934, 3815935, 3815936, 3815945, 3815946, 3815947, 3815948, 3815927, 3815928, 3815929, 3815930, 3815931, 3815932",
    },
    [1601] = {
        ["1480:978:1247:1460"] = "3829896, 3829907, 3829913, 3829914, 3829915, 3829916, 3829917, 3829918, 3829919, 3829897, 3829898, 3829899, 3829900, 3829901, 3829902, 3829903, 3829904, 3829905, 3829906, 3829908, 3829909, 3829910, 3829911, 3829912",
        ["1664:1327:1104:231"] = "3829920, 3829931, 3829942, 3829953, 3829957, 3829958, 3829959, 3829960, 3829961, 3829921, 3829922, 3829923, 3829924, 3829925, 3829926, 3829927, 3829928, 3829929, 3829930, 3829932, 3829933, 3829934, 3829935, 3829936, 3829937, 3829938, 3829939, 3829940, 3829941, 3829943, 3829944, 3829945, 3829946, 3829947, 3829948, 3829949, 3829950, 3829951, 3829952, 3829954, 3829955, 3829956",
    },
	[1693] = {
		["1078:824:772:598"] = "4178966, 4178967, 4178968, 4178969, 4178970, 4178971, 4178972, 4178973, 4178974, 4178975, 4178976, 4178977, 4178978, 4178979, 4178980, 4178981, 4178982, 4178983, 4178984, 4178985",
		["954:1076:262:1423"] = "4178902, 4178903, 4178904, 4178905, 4178906, 4178907, 4178908, 4178909, 4178910, 4178911, 4178912, 4178913, 4178914, 4178915, 4178916, 4178917, 4178918, 4178919, 4178920, 4178921",
		["1053:934:49:918"] = "4178986, 4178987, 4178988, 4178989, 4178990, 4178991, 4178992, 4178993, 4178994, 4178995, 4178996, 4178997, 4178998, 4178999, 4179000, 4179001, 4179002, 4179003, 4179004, 4179005",
		["1488:1946:1797:0"] = "4178854, 4178855, 4178856, 4178857, 4178858, 4178859, 4178860, 4178861, 4178862, 4178863, 4178864, 4178865, 4178866, 4178867, 4178868, 4178869, 4178870, 4178871, 4178872, 4178873, 4178874, 4178875, 4178876, 4178877, 4178878, 4178879, 4178880, 4178881, 4178882, 4178883, 4178884, 4178885, 4178886, 4178887, 4178888, 4178889, 4178890, 4178891, 4178892, 4178893, 4178894, 4178895, 4178896, 4178897, 4178898, 4178899, 4178900, 4178901",
		["1504:929:1171:0"] = "4179055, 4179056, 4179057, 4179058, 4179059, 4179060, 4179061, 4179062, 4179063, 4179064, 4179065, 4179066, 4179067, 4179068, 4179069, 4179070, 4179071, 4179072, 4179073, 4179074, 4179075, 4179076, 4179077, 4179078",
		["928:729:1404:1831"] = "4178826, 4178827, 4178828, 4178829, 4178830, 4178831, 4178832, 4178833, 4178834, 4178835, 4178836, 4178837",
		["928:1359:808:1201"] = "4178922, 4178923, 4178924, 4178925, 4178926, 4178927, 4178928, 4178929, 4178930, 4178931, 4178932, 4178933, 4178934, 4178935, 4178936, 4178937, 4178938, 4178939, 4178940, 4178941, 4178942, 4178943, 4178944, 4178945",
		["1232:1236:0:342"] = "4179006, 4179007, 4179008, 4179009, 4179010, 4179011, 4179012, 4179013, 4179014, 4179015, 4179016, 4179017, 4179018, 4179019, 4179020, 4179021, 4179022, 4179023, 4179024, 4179025, 4179026, 4179027, 4179028, 4179029, 4179030",
		["1408:988:1856:1572"] = "4178802, 4178803, 4178804, 4178805, 4178806, 4178807, 4178808, 4178809, 4178810, 4178811, 4178812, 4178813, 4178814, 4178815, 4178816, 4178817, 4178818, 4178819, 4178820, 4178821, 4178822, 4178823, 4178824, 4178825",
		["1009:835:1442:1262"] = "4178838, 4178839, 4178840, 4178841, 4178842, 4178843, 4178844, 4178845, 4178846, 4178847, 4178848, 4178849, 4178850, 4178851, 4178852, 4178853",
		["1395:932:183:0"] = "4179031, 4179032, 4179033, 4179034, 4179035, 4179036, 4179037, 4179038, 4179039, 4179040, 4179041, 4179042, 4179043, 4179044, 4179045, 4179046, 4179047, 4179048, 4179049, 4179050, 4179051, 4179052, 4179053, 4179054",
		["1186:821:1100:696"] = "4178946, 4178947, 4178948, 4178949, 4178950, 4178951, 4178952, 4178953, 4178954, 4178955, 4178956, 4178957, 4178958, 4178959, 4178960, 4178961, 4178962, 4178963, 4178964, 4178965",
	},
	[1648] = {
		["929:817:597:1053"] = "4075090, 4075098, 4075099, 4075100, 4075101, 4075102, 4075103, 4075104, 4075105, 4075091, 4075092, 4075093, 4075094, 4075095, 4075096, 4075097",
		["1871:1010:1231:1429"] = "4075058, 4075069, 4075080, 4075084, 4075085, 4075086, 4075087, 4075088, 4075089, 4075059, 4075060, 4075061, 4075062, 4075063, 4075064, 4075065, 4075066, 4075067, 4075068, 4075070, 4075071, 4075072, 4075073, 4075074, 4075075, 4075076, 4075077, 4075078, 4075079, 4075081, 4075082, 4075083",
		["1412:792:1474:891"] = "4075034, 4075045, 4075051, 4075052, 4075053, 4075054, 4075055, 4075056, 4075057, 4075035, 4075036, 4075037, 4075038, 4075039, 4075040, 4075041, 4075042, 4075043, 4075044, 4075046, 4075047, 4075048, 4075049, 4075050",
		["1264:715:1841:645"] = "4075019, 4075026, 4075027, 4075028, 4075029, 4075030, 4075031, 4075032, 4075033, 4075020, 4075021, 4075022, 4075023, 4075024, 4075025",
		["834:696:1500:0"] = "4075007, 4075011, 4075012, 4075013, 4075014, 4075015, 4075016, 4075017, 4075018, 4075008, 4075009, 4075010",
		["1362:1088:945:0"] = "4074977, 4074988, 4074999, 4075001, 4075002, 4075003, 4075004, 4075005, 4075006, 4074978, 4074979, 4074980, 4074981, 4074982, 4074983, 4074984, 4074985, 4074986, 4074987, 4074989, 4074990, 4074991, 4074992, 4074993, 4074994, 4074995, 4074996, 4074997, 4074998, 4075000",
		["844:875:2113:0"] = "4074961, 4074969, 4074970, 4074971, 4074972, 4074973, 4074974, 4074975, 4074976, 4074962, 4074963, 4074964, 4074965, 4074966, 4074967, 4074968",
		["1612:1268:153:0"] = "4074926, 4074937, 4074948, 4074955, 4074956, 4074957, 4074958, 4074959, 4074960, 4074927, 4074928, 4074929, 4074930, 4074931, 4074932, 4074933, 4074934, 4074935, 4074936, 4074938, 4074939, 4074940, 4074941, 4074942, 4074943, 4074944, 4074945, 4074946, 4074947, 4074949, 4074950, 4074951, 4074952, 4074953, 4074954",
		["766:637:958:997"] = "4074917, 4074918, 4074919, 4074920, 4074921, 4074922, 4074923, 4074924, 4074925",
	},
}

-- Create table to store revealed overlays
local overlayTextures = {}

-- Function to refresh overlays (Blizzard_SharedMapDataProviders\MapExplorationDataProvider)
local function RefMap(self, fullUpdate)
	overlayTextures = {}
	local mapID = WorldMapFrame.mapID; if not mapID then return end
	local artID = C_Map.GetMapArtID(mapID); if not artID or not MapInfoData[artID] then return end
	local MapInfoZone = MapInfoData[artID]


	-- Store already explored tiles in a table so they can be ignored
	local TileExists = {}
	local exploredMapTextures = C_MapExplorationInfo.GetExploredMapTextures(mapID)
	if exploredMapTextures then
		for i, exploredTextureInfo in ipairs(exploredMapTextures) do
			local key = exploredTextureInfo.textureWidth .. ":" .. exploredTextureInfo.textureHeight .. ":" .. exploredTextureInfo.offsetX .. ":" .. exploredTextureInfo.offsetY
			TileExists[key] = true
		end
	end

	-- Get the sizes
	self.layerIndex = self:GetMap():GetCanvasContainer():GetCurrentLayerIndex()
	local layers = C_Map.GetMapArtLayers(mapID)
	local layerInfo = layers and layers[self.layerIndex]
	if not layerInfo then return end
	local TILE_SIZE_WIDTH = layerInfo.tileWidth
	local TILE_SIZE_HEIGHT = layerInfo.tileHeight

	-- Show textures if they are in database and have not been explored
	for key, files in pairs(MapInfoZone) do
		if not TileExists[key] then
			local width, height, offsetX, offsetY = strsplit(":", key)
			local fileDataIDs = { strsplit(",", files) }
			local numTexturesWide = ceil(width/TILE_SIZE_WIDTH)
			local numTexturesTall = ceil(height/TILE_SIZE_HEIGHT)
			local texturePixelWidth, textureFileWidth, texturePixelHeight, textureFileHeight
			for j = 1, numTexturesTall do
				if ( j < numTexturesTall ) then
					texturePixelHeight = TILE_SIZE_HEIGHT
					textureFileHeight = TILE_SIZE_HEIGHT
				else
					texturePixelHeight = mod(height, TILE_SIZE_HEIGHT)
					if ( texturePixelHeight == 0 ) then
						texturePixelHeight = TILE_SIZE_HEIGHT
					end
					textureFileHeight = 16
					while(textureFileHeight < texturePixelHeight) do
						textureFileHeight = textureFileHeight * 2
					end
				end
				for k = 1, numTexturesWide do
					local texture = self.overlayTexturePool:Acquire()
					if ( k < numTexturesWide ) then
						texturePixelWidth = TILE_SIZE_WIDTH
						textureFileWidth = TILE_SIZE_WIDTH
					else
						texturePixelWidth = mod(width, TILE_SIZE_WIDTH)
						if ( texturePixelWidth == 0 ) then
							texturePixelWidth = TILE_SIZE_WIDTH
						end
						textureFileWidth = 16
						while(textureFileWidth < texturePixelWidth) do
							textureFileWidth = textureFileWidth * 2
						end
					end
					texture:SetSize(texturePixelWidth, texturePixelHeight)
					texture:SetTexCoord(0, texturePixelWidth/textureFileWidth, 0, texturePixelHeight/textureFileHeight)
					texture:SetPoint("TOPLEFT", offsetX + (TILE_SIZE_WIDTH * (k-1)), -(offsetY + (TILE_SIZE_HEIGHT * (j - 1))))
					texture:SetTexture(tonumber(fileDataIDs[((j - 1) * numTexturesWide) + k]), nil, nil, "TRILINEAR")
					texture:SetDrawLayer("ARTWORK", -1)
					if optRevealMap == "On" then 
						texture:Show()
					else
						texture:Hide()
					end
					tinsert(overlayTextures, texture)
					if fullUpdate then
						self.textureLoadGroup:AddTexture(texture)
					end
				end
			end
		end
	end
end

-- Show overlays on startup
for pin in WorldMapFrame:EnumeratePinsByTemplate("MapExplorationPinTemplate") do
	hooksecurefunc(pin, "RefreshOverlays", function() RefMap(pin, fullUpdate) end)
end

-- Toggle overlays when reveal button is clicked
revBtn:HookScript("OnClick", function()
	if optRevealMap == "On" then 
		for i = 1, #overlayTextures  do
			overlayTextures[i]:Hide()
		end
		optRevealMap = "Off"
	else
		for i = 1, #overlayTextures  do
			overlayTextures[i]:Show()
		end	
		optRevealMap = "On"
	end
	SetRevBtn()
end)

----------------------------------------------------------------------
-- Character coordinates
----------------------------------------------------------------------

-- Create character coordinates frame
local cChar = CreateFrame("Frame", nil, WorldMapFrame.BorderFrame)
cChar:SetWidth(38); cChar:SetHeight(16)
cChar:SetPoint("TOPRIGHT", revBtn, "TOPLEFT", -7, -4)

cChar.x = cChar:CreateFontString(nil, "ARTWORK", "GameFontNormal") 
cChar.x:SetAllPoints(); cChar.x:SetJustifyH"LEFT"

cChar.y = cChar:CreateFontString(nil, "ARTWORK", "GameFontNormal") 
cChar.y:SetPoint("LEFT", cChar.x, "RIGHT", 0, 0)
cChar.y:SetJustifyH"LEFT"

-- Initialisation
local mapRects = {}
local tempVec2D = CreateVector2D(0, 0)
local cMapID, void

-- Function to get player map position
local function GetPlayerMapPos(cMapID)
	tempVec2D.x, tempVec2D.y = UnitPosition('player')
	if not tempVec2D.x then return end

	local mapRect = mapRects[cMapID]
	if not mapRect then
		local _, pos1 = C_Map.GetWorldPosFromMapPos(cMapID, CreateVector2D(0, 0))
		local _, pos2 = C_Map.GetWorldPosFromMapPos(cMapID, CreateVector2D(1, 1))
		if not pos1 or not pos2 then return end

		mapRect = {pos1, pos2}
		mapRect[2]:Subtract(mapRect[1])
		mapRects[cMapID] = mapRect
	end
	tempVec2D:Subtract(mapRect[1])

	return (tempVec2D.y/mapRect[2].y), (tempVec2D.x/mapRect[2].x)

end

-- Set MapID on zone changes and hide coordinates frame if player zone is different to map
hooksecurefunc(WorldMapFrame, "OnMapChanged", function(self)
	if WorldMapFrame.mapID == C_Map.GetBestMapForUnit("player") then
		cMapID = self:GetMapID()
		cChar:Show()
	else
		cMapID = nil
		cChar:Hide()
	end
end)

-- Function to update coordinates
local cx, cy
local stimer = 0
local function UpdateCoords(self, elapsed)
	stimer = stimer + elapsed
	if stimer > 0.2 then
		if not cMapID then
			cChar.x:SetText("") 
			cChar.y:SetText("")
		else
			cx, cy = GetPlayerMapPos(cMapID)
			if not cx or (cx == 0 and cy == 0) then
				cChar.x:SetText("") 
				cChar.y:SetText("")
			else
				cChar.x:SetFormattedText("%0.1f", 100 * cx) 
				cChar.y:SetFormattedText("%0.1f", 100 * cy)
			end
		end
		stimer = 0
	end
end

-- Update coordinates when the frame is being shown and on startup
cChar:SetScript("OnUpdate", UpdateCoords)
UpdateCoords(self, 1)

-- Hide coordinates frame when player zone is different to world map
cChar:RegisterEvent("ZONE_CHANGED_NEW_AREA")
cChar:RegisterEvent("ZONE_CHANGED")
cChar:RegisterEvent("ZONE_CHANGED_INDOORS")
cChar:RegisterEvent("NEW_WMO_CHUNK")
cChar:SetScript("OnEvent", function()
	if WorldMapFrame.mapID == C_Map.GetBestMapForUnit("player") then
		cMapID = WorldMapFrame.mapID
		cChar:Show()
	else
		cMapID = nil
		cChar:Hide()
	end
end)

----------------------------------------------------------------------
-- Cursor coordinates
----------------------------------------------------------------------

-- Create cursor coordinates frame
local cCursor = CreateFrame("FRAME", nil, WorldMapFrame.BorderFrame)
cCursor:SetWidth(38); cCursor:SetHeight(16)
cCursor:SetPoint("TOPRIGHT", cChar, "TOPLEFT", -50, 0)

cCursor.x = cCursor:CreateFontString(nil, "ARTWORK", "GameFontNormal") 
cCursor.x:SetAllPoints(); cCursor.x:SetJustifyH"LEFT"

cCursor.y = cCursor:CreateFontString(nil, "ARTWORK", "GameFontNormal") 
cCursor.y:SetPoint("LEFT", cCursor.x, "RIGHT", 0, 0)
cCursor.y:SetJustifyH"LEFT"

-- Initialise timer
local mTimer = 0

-- Cursor coordinates update function
local function UpdateCursorCoords(self, elapsed)
	mTimer = mTimer + elapsed
	if mTimer > 0.1 then
		local x, y = WorldMapFrame.ScrollContainer:GetNormalizedCursorPosition()
		if x and y and MouseIsOver(WorldMapFrame.ScrollContainer) then
			cCursor.x:SetFormattedText("%0.1f", (floor(x * 1000 + 0.5)) / 10)
			cCursor.y:SetFormattedText("%0.1f", (floor(y * 1000 + 0.5)) / 10)
		else
			cCursor.x:SetText("")
			cCursor.y:SetText("")
		end
		mTimer = 0
	end
end
cCursor:SetScript("OnUpdate", UpdateCursorCoords)
