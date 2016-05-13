local T, Viks, L, _ = unpack(select(2, ...))
if not Viks.misc.classtimer == true then return end

local mediaPath = "Interface\\AddOns\\ViksUI\\media\\Other\\"
local texture = "Interface\\Buttons\\WHITE8x8"
local glowTex = mediaPath.."glowTex"
fontsize = 10
fontsize1 =  10
local buttonTex = mediaPath.."buttontex"

local CreateSpellEntry = function( id, castByAnyone, color, unitType, castSpellId )
	return { id = id, castByAnyone = castByAnyone, color = color, unitType = unitType or 0, castSpellId = castSpellId };
end

local CreateColor = function( red, green, blue, alpha )
	return { red / 255, green / 255, blue / 255, alpha };
end

local BAR_HEIGHT = 14;
local BAR_SPACING = 1;
local LAYOUT = 4;
local BACKGROUND_ALPHA = 1;
local ICON_POSITION = 0;
local ICON_COLOR = CreateColor( 0, 0, 0, 1 );
local SPARK = false;
local CAST_SEPARATOR = true;
local CAST_SEPARATOR_COLOR = CreateColor( .1,.1,.1,1 );
local TEXT_MARGIN = 5;
local MASTER_FONT, STACKS_FONT;
MASTER_FONT = { Viks.media.font, fontsize };
STACKS_FONT = { Viks.media.font, fontsize1 };
local PERMANENT_AURA_VALUE = 1;
local PLAYER_BAR_COLOR = CreateColor( 70, 70, 150, 1 );
local PLAYER_DEBUFF_COLOR = nil;
local TARGET_BAR_COLOR = CreateColor( 70, 150, 70, 1 );
local TARGET_DEBUFF_COLOR = CreateColor( 150, 70, 70, 1 );
local TRINKET_BAR_COLOR = CreateColor( 150, 150, 70, 1 );
local SORT_DIRECTION = true;
local TENTHS_TRESHOLD = 1

local TRINKET_FILTER = {
		
	CreateSpellEntry( 2825, true ), CreateSpellEntry( 32182, true ), CreateSpellEntry( 80353, true), -- Bloodlust/Heroism/Timewarp
	CreateSpellEntry( 90355, true ), -- Ancient Hysteria, bloodlust from hunters pet
	CreateSpellEntry( 26297 ), -- Berserking (troll racial)
	CreateSpellEntry( 33702 ), CreateSpellEntry( 33697 ), CreateSpellEntry( 20572 ), -- Blood Fury (orc racial)
	CreateSpellEntry( 57933 ), -- Tricks of Trade (15% dmg buff)
		
	-- Professions
    CreateSpellEntry( 74497 ), -- Lifeblood Rank 8 (Herbalism)
    CreateSpellEntry( 74245 ), -- Landslide (Enchanting)
    CreateSpellEntry( 74221 ), -- Hurricane (Enchanting)

	--Raid buff
	CreateSpellEntry( 80627 ), -- Stolen Power
		
	-- Racials
	CreateSpellEntry( 20954 ), -- Stoneform (Dwarf)
	CreateSpellEntry( 59752 ), -- Every Man for Himself (Human)
	CreateSpellEntry( 57901 ), -- Gift of the Naaru (Draenei)
	CreateSpellEntry( 68992 ), -- Darkflight (Worgen)
	CreateSpellEntry( 7744 ), -- Will of the Forsaken (Undead)
	CreateSpellEntry( 20577 ), -- Cannibalize (Undead)
	CreateSpellEntry( 26297 ), -- Berserking (Troll)
	CreateSpellEntry( 20572 ), -- Blood Fury for Attack Power (Orc)
	CreateSpellEntry( 33702 ), -- Blood Fury for Spell Power (Orc)
	CreateSpellEntry( 33697 ), -- Blood Fury for Both (Orc)
	CreateSpellEntry( 69041 ), -- Rocket Barrage
		
	--Darkmoon Cards
	CreateSpellEntry( 89181 ), -- Earthquake
	CreateSpellEntry( 89182 ), -- Tsunami
	CreateSpellEntry( 89091 ), -- Volcano
	
	-- Blackwing Descent
	CreateSpellEntry( 91322 ), -- Jar of Ancient Remedies Normal
	CreateSpellEntry( 92331 ), -- Jar of Ancient Remedies Heroic
	CreateSpellEntry( 91007 ), -- Bell of Enraging Reasonance
	CreateSpellEntry( 91816 ), -- Heart of Rage
	CreateSpellEntry( 92235 ), -- Symbiotic Worm
	CreateSpellEntry( 91832 ), -- Fury of Angerforge Stacks
    CreateSpellEntry( 91836 ), -- Fury of Angerforge on use
		
	--The Bastion of Twilight
	CreateSpellEntry( 92126 ), -- Essence of the Cyclone Normal
	CreateSpellEntry( 92351 ), -- Essence of the Cyclone Heroic
	CreateSpellEntry( 91184 ), -- Fall of mortality
	CreateSpellEntry( 92213 ), -- Vial of Stolen Memories
	CreateSpellEntry( 91024 ), -- Theralion's Mirror
	CreateSpellEntry( 91821 ), -- Crushing Weight
	CreateSpellEntry( 91027 ), -- Heart of Ignacious Stacks
	CreateSpellEntry( 91041 ), -- Heart of Ignacious on use
		
	CreateSpellEntry( 96980 ), -- Accelerated (Vessel of Acceleration)
	CreateSpellEntry( 97142 ), -- Accelerated (Vessel of Acceleration) H
	CreateSpellEntry( 96911 ), -- Devour (The Hungerer)
	CreateSpellEntry( 97125 ), -- Devour (The Hungerer) H
	CreateSpellEntry( 96988 ), -- Stay of Execution
	CreateSpellEntry( 97145 ), -- Stay of Execution H
	CreateSpellEntry( 96945 ), -- Loom of Fate (Spidersilk Spindle)
	CreateSpellEntry( 97129 ), -- Loom of Fate (Spidersilk Spindle) H
	CreateSpellEntry( 97007 ), -- Mark of the Firelord (Rune of Zeth)
	CreateSpellEntry( 97146 ), -- Mark of the Firelord (Rune of Zeth) H
	CreateSpellEntry( 96907 ), -- Victorious Jaws of Defeat
	CreateSpellEntry( 97120 ), -- Victorious Jaws of Defeat H
	CreateSpellEntry( 97008 ), -- Fiery Quintessence
	CreateSpellEntry( 97176 ), -- Fiery Quintessence H
	CreateSpellEntry( 97010 ), -- Essence of the Eternal Flame
	CreateSpellEntry( 97179 ), -- Essence of the Eternal Flame
	CreateSpellEntry( 97009 ), -- Ancient Petrified Seed
	CreateSpellEntry( 97177 ), -- Ancient Petrified Seed H

	CreateSpellEntry( 90459 ), -- DPS set
		
	--Druid
	CreateSpellEntry( 90159 ), -- Resto
	CreateSpellEntry( 90164 ), -- Moonkin
	CreateSpellEntry( 90166 ), -- Feral
		
	--Paladin
	CreateSpellEntry( 90311 ), -- Holy
		
	--Priest
	CreateSpellEntry( 89911 ), -- Holy/Disc
		
	--Rogue
	CreateSpellEntry( 90472 ),
		
	--Shaman
	CreateSpellEntry( 90498 ), -- Resto
		
	--Warlock
	CreateSpellEntry( 89937 ),
	CreateSpellEntry( 126659 ),
	CreateSpellEntry( 128985 ),	
	CreateSpellEntry( 125487 ),	
	CreateSpellEntry( 104510 ),
	CreateSpellEntry( 104423 ),
	--Warrior
	CreateSpellEntry( 90294 ), --DPS
};
	
--[[ Class specific filters

Examples:

	Track "Frost Fever" and "Blood Plague" on target and "Bone Shield" on player:
	
		DEATHKNIGHT = { 
			target = { 
				CreateSpellEntry( "Frost Fever" ),
				CreateSpellEntry( "Blood Plague" ),
			},
			player = { 
				CreateSpellEntry( "Bone Shield" ),
			}
		},

	Track "Frost Fever" and "Blood Plague" on target and nothing on player:
	
		DEATHKNIGHT = { 
			target = { 
				CreateSpellEntry( "Frost Fever" ),
				CreateSpellEntry( "Blood Plague" ),
			},
		},

	Track nothing on target and nothing on player:
	
		DEATHKNIGHT = { 

		},
		
	or
	
				
		
		( ^^^ yes nothing ^^^ )
]]--

local CLASS_FILTERS = {
		MONK = { 
			target = {
				CreateSpellEntry( 107428 ), -- Risin Sun Kick
				CreateSpellEntry( 124273 ), -- Heavy Stagger
				CreateSpellEntry( 116330 ), -- Dizzying Haze
				CreateSpellEntry( 123725 ), -- Breath of Fire
				CreateSpellEntry( 115804 ), -- Mortal Wounds
			},
			player = {
				CreateSpellEntry( 124081 ), -- Zensphere
				CreateSpellEntry( 125195 ), -- Tigereye Brew
				CreateSpellEntry( 120954 ), -- Fortifying Brew
				CreateSpellEntry( 125359 ), -- Tiger Power
				CreateSpellEntry( 115307 ), -- Shuffle
				CreateSpellEntry( 125174 ), -- Touch of Karma
				CreateSpellEntry( 115295 ), -- Guard 
				CreateSpellEntry( 115308 ), -- Elusive Brew
				CreateSpellEntry( 122783 ), -- Diffuse Magic
				CreateSpellEntry( 115288 ), -- Energizing Brew
				CreateSpellEntry( 119085 ), -- Momentum
				CreateSpellEntry( 118674 ), -- Vital Mists
				CreateSpellEntry( 127722 ), -- Serpent's Zeal
			},
			procs = {
				CreateSpellEntry( 116768 ), -- Combobreaker: Blackout-Kick
				CreateSpellEntry( 120273 ), -- Tiger Strikes
				CreateSpellEntry( 118864 ), -- Combobreaker: Tigerpalm
				CreateSpellEntry( 104993 ), -- Jade Spirit
				CreateSpellEntry( 128985 ), -- Relic of Yu'lon
			}
		},
		DEATHKNIGHT = { 
			target = {
				CreateSpellEntry( 55095 ), -- Frost Fever
				CreateSpellEntry( 55078 ), -- Blood Plague
				CreateSpellEntry( 81130 ), -- Scarlet Fever
				CreateSpellEntry( 50536 ), -- Unholy Blight
				CreateSpellEntry( 65142 ), -- Ebon Plague
				CreateSpellEntry( 51714 ), -- Razorice
				CreateSpellEntry( 98957 ), -- Burning Blood Tank T12
				CreateSpellEntry( 22744 ), -- Chains of Ice
				CreateSpellEntry( 155159 ), -- Necrotic Plague
			},
			player = {
				CreateSpellEntry( 59052 ), -- Freezing Fog
				CreateSpellEntry( 51124 ), -- Killing Machine
				CreateSpellEntry( 57330 ), -- Horn of Winter
				CreateSpellEntry( 77535 ), -- Blood Shield
				CreateSpellEntry( 55233 ), -- Vampiric Blood
				CreateSpellEntry( 81141 ), -- Crimson Scourge
				CreateSpellEntry( 45529 ), -- Blood Tap
				CreateSpellEntry( 49222 ), -- Bone sheild
				CreateSpellEntry( 48792 ), -- Ice Bound Fortitude
				CreateSpellEntry( 81256 ), -- Dancing Rune Weapon
				CreateSpellEntry( 51271 ), -- Pillar of Frost
				CreateSpellEntry( 48707 ), -- Anti-Magic Shell
				CreateSpellEntry( 49039 ), -- Lichborne
				CreateSpellEntry( 96268 ), -- Death's Advance
				CreateSpellEntry( 115989 ), -- Unholy Blight
			},
			procs = {
				CreateSpellEntry( 53365 ), -- Unholy Strength
				CreateSpellEntry( 50421 ), -- Scent of Blood
				CreateSpellEntry( 70657 ), -- Advantage
				CreateSpellEntry( 81340 ), -- Sudden Doom
				CreateSpellEntry( 51128 ), -- Killing Machine
				CreateSpellEntry( 114851 ), -- Blood Charge
				CreateSpellEntry( 63560 ), -- Dark Transformation
				CreateSpellEntry( 91342 ), -- Shadow Infusion
			}		
		},
		DRUID = { 
			target = { 
				CreateSpellEntry( 48438 ), -- Wild Growth
				CreateSpellEntry( 774 ), -- Rejuvenation
				CreateSpellEntry( 8936, false, nil, nil, 8936 ), -- Regrowth
				CreateSpellEntry( 33763 ), -- Lifebloom
				CreateSpellEntry( 164812 ), -- Moonfire
				CreateSpellEntry( 339 ), -- Entangling Roots
				CreateSpellEntry( 33786 ), -- Cyclone
				CreateSpellEntry( 2908 ), -- Soothe
				CreateSpellEntry( 50259 ), -- Feral Charge (Cat) - daze
				CreateSpellEntry( 45334 ), -- Feral Charge (Bear) - immobilize
				CreateSpellEntry( 58180 ), -- Infected Wounds
				CreateSpellEntry( 6795 ), -- Growl
				CreateSpellEntry( 99 ), -- Demoralizing Roar
				CreateSpellEntry( 33745 ), -- Lacerate
				CreateSpellEntry( 5211 ), -- Bash
				CreateSpellEntry( 22570 ), -- Maim
				CreateSpellEntry( 155722 ), -- Rake
				CreateSpellEntry( 1079 ), -- Rip
				CreateSpellEntry( 770, true ), -- Farie Fire
				CreateSpellEntry( 78675 ), -- Solar Beam
				CreateSpellEntry( 164815 ), -- Sunfire
				CreateSpellEntry( 77758 ), -- Thrash
			},
			player = {
				CreateSpellEntry( 48505 ), -- Starfall
				CreateSpellEntry( 22812 ), -- Barkskin
				CreateSpellEntry( 5215 ), -- Prowl
				CreateSpellEntry( 170856 ), -- Nature's Grasp
				CreateSpellEntry( 52610 ), -- Savage Roar
				CreateSpellEntry( 5217 ), -- Tiger's Fury
				CreateSpellEntry( 1850 ), -- Dash
				CreateSpellEntry( 22842 ), -- Frenzied Regeneration
				CreateSpellEntry( 50334 ), -- Berserk
				CreateSpellEntry( 61336 ), -- Survival Instincts
				CreateSpellEntry( 48438 ), -- Wild Growth
				CreateSpellEntry( 774 ), -- Rejuvenation
				CreateSpellEntry( 8936, false, nil, nil, 8936 ), -- Regrowth
				CreateSpellEntry( 33763 ), -- Lifebloom
				CreateSpellEntry( 16870 ), -- Clearcasting				
				CreateSpellEntry( 117679 ), -- Incarnation: Tree of Life
				CreateSpellEntry( 102560 ), -- Incarnation: Chosen of Elunee
				CreateSpellEntry( 102543 ), -- Incarnation: King of the Jungle
				CreateSpellEntry( 102558 ), -- Incarnation: Son of Ursoc
				CreateSpellEntry( 124974 ), -- Nature's Vigil
				CreateSpellEntry( 132402 ), -- Savage Defense
				CreateSpellEntry( 112071 ), -- Celestial Alignment
				CreateSpellEntry( 108294 ), -- Heart of the Wild
				CreateSpellEntry( 102351 ), -- Cenarion Ward		
			},
			procs = {
				CreateSpellEntry( 69369 ), -- Predator's Swiftness
				CreateSpellEntry( 93400 ), -- Shooting Stars
				CreateSpellEntry( 104993 ), -- Jade Spirit
				CreateSpellEntry( 128985 ), -- Relic of Yu'lon
				CreateSpellEntry( 171743 ), -- Lunar Peak
				CreateSpellEntry( 171744 ), -- Solar Peak
				CreateSpellEntry( 96206 ), -- Glyph of Rejuvenation
				CreateSpellEntry( 114108 ), -- Soul of the Forest
				CreateSpellEntry( 135286 ), -- Tooth and Claw
				
			},
		},
		HUNTER = { 
			target = {
				CreateSpellEntry( 87935 ), -- Serpent Sting
				CreateSpellEntry( 3674 ), -- Black Arrow
				CreateSpellEntry( 53301 ), -- Explosive Shot
				CreateSpellEntry( 136634 ), -- Narrow Escape
				CreateSpellEntry( 19386 ), -- Wyvern Sting
				CreateSpellEntry( 131894 ), -- A Murder of Crows
				CreateSpellEntry( 1130, true ), -- Hunters mark
			},
			player = {
				CreateSpellEntry( 3045 ), -- Rapid Fire
				CreateSpellEntry( 19574 ), --Bestial Wrath
				CreateSpellEntry( 19263 ), --Deterrence
				CreateSpellEntry( 82692 ), --Focus Fire
				CreateSpellEntry( 90361 ), --Spirit Mend
				CreateSpellEntry( 118922 ), --Posthaste
				CreateSpellEntry( 19615 ), -- Frenzy
				CreateSpellEntry( 34720 ), --Thrill of the Hunt
				CreateSpellEntry( 64418 ), CreateSpellEntry( 64419 ), CreateSpellEntry( 64420 ), -- Sniper Training Rank 1/2/3
			},
			procs = {
				CreateSpellEntry( 53257 ), -- cobra strikes 
				CreateSpellEntry( 6150 ), -- Quick Shots
				CreateSpellEntry( 168980 ), -- Lock and Load
				CreateSpellEntry( 136 ), -- Mend Pet
				CreateSpellEntry( 109092 ), -- Mirror Scope (Crit)
				CreateSpellEntry( 109085 ), -- Lord Blastington's Scope of Doom (Agility)
			},
		},
		MAGE = {
			target = { 
				CreateSpellEntry( 44457 ), -- Living Bomb
				CreateSpellEntry( 118 ), -- Polymorph
				CreateSpellEntry( 28271 ), -- Polymorph Turtle
				CreateSpellEntry( 31589 ), -- Slow
				CreateSpellEntry( 116 ), -- Frostbolt
				CreateSpellEntry( 120 ), -- Cone of Cold
				CreateSpellEntry( 122 ), -- Frost Nova
				CreateSpellEntry( 44614 ), -- Frostfire Bolt
				CreateSpellEntry( 11366 ), -- Pyroblast!
				CreateSpellEntry( 12654 ), -- Ignite
				CreateSpellEntry( 83853 ), -- Combustion
				CreateSpellEntry( 31661 ), -- Dragon's Breath
				CreateSpellEntry( 44572 ), -- Deep Freeze
				CreateSpellEntry( 82691 ), -- Ring of Frost
				CreateSpellEntry( 114923 ), -- Nether Tempest
				CreateSpellEntry( 112948 ), -- Frost Bomb
				CreateSpellEntry( 33395 ), -- Freeze (Pet)
				CreateSpellEntry( 111340 ), -- Ice Ward
			},
			player = {
				CreateSpellEntry( 36032 ), -- Arcane Blast
				CreateSpellEntry( 12042 ), -- Arcane Power
				CreateSpellEntry( 32612 ), -- Invisibility
				CreateSpellEntry( 1463 ), -- Incanter's Flow
				CreateSpellEntry( 11426 ), -- Ice Barrier
				CreateSpellEntry( 45438 ), -- Ice Block
				CreateSpellEntry( 12472 ), -- Icy Veins
				CreateSpellEntry( 130 ), -- Slow Fall
				CreateSpellEntry( 57761 ), -- Brain Freeze	
				CreateSpellEntry( 110960 ), -- Greater Invisibility
				CreateSpellEntry( 111264 ), -- Ice Ward
				CreateSpellEntry( 48107 ), -- Heating Up
				CreateSpellEntry( 108839 ), -- Ice Floes
				CreateSpellEntry( 110909 ), -- Alter Time
				CreateSpellEntry( 115610 ), -- Temporal Shield
				CreateSpellEntry( 116014 ), -- Rune of Power		
			},
			procs = {
				CreateSpellEntry( 44544 ), -- Fingers of Frost
				CreateSpellEntry( 79683 ), -- Arcane Missiles!
				CreateSpellEntry( 48108 ), -- Hot Streak
			},
		},
		PALADIN = { 
			target = {
				CreateSpellEntry( 31803 ), -- Censure --
				CreateSpellEntry( 20066 ), -- Repentance --
				CreateSpellEntry( 853 ), -- Hammer of Justice --
				CreateSpellEntry( 31935 ), -- Avenger's Shield --
				CreateSpellEntry( 20170 ), -- Seal of Justice --
				CreateSpellEntry( 26017 ), -- Vindication --
				CreateSpellEntry( 86273 ), -- Illuminated Healing				
				CreateSpellEntry( 25771 ), -- Forbearance
				CreateSpellEntry( 63529 ), -- Glyph of Dazing Shield
				CreateSpellEntry( 2812 ), -- Denounce		
			},
			player = {
				CreateSpellEntry( 642 ), -- Divine Shield
				CreateSpellEntry( 31850 ), -- Ardent Defender
				CreateSpellEntry( 498 ), -- Divine Protection
				CreateSpellEntry( 31884 ), -- Avenging Wrath
				CreateSpellEntry( 25771 ), -- Debuff: Forbearance
				CreateSpellEntry( 1044 ), -- Hand of Freedom
				CreateSpellEntry( 1022 ), -- Hand of Protection
				CreateSpellEntry( 1038 ), -- Hand of Salvation
				CreateSpellEntry( 53563 ), -- Beacon of Light
				CreateSpellEntry( 31821 ), -- Aura Mastery
				CreateSpellEntry( 31482 ), -- Divine Favor
				CreateSpellEntry( 6940 ), -- Hand of Sacrifice
				CreateSpellEntry( 86659 ), -- Guardian of Ancient Kings
				CreateSpellEntry( 105809 ), -- Holy Avenger
				CreateSpellEntry( 114163 ), -- Eternal Flame
				CreateSpellEntry( 20925 ), -- Sacred Shield				
			},
			procs = {
				CreateSpellEntry( 59578 ), -- The Art of War
				CreateSpellEntry( 90174 ), -- Hand of Light
				CreateSpellEntry( 71396 ), -- Rage of the Fallen		
				CreateSpellEntry( 54149 ), -- Infusion of Light (Rank1/Rank2)
				CreateSpellEntry( 85499 ), -- Speed of Light
				CreateSpellEntry( 88819 ), -- Daybreak
				CreateSpellEntry( 114637 ), -- Bastion of Glory
				CreateSpellEntry( 114250 ), -- Selfless Healer
				CreateSpellEntry( 85416 ), -- Grand Crusader
				CreateSpellEntry( 87173 ), -- Long Arm of the Law				
			},
		},
		PRIEST = { 
			target = { 
				CreateSpellEntry( 17 ), -- Power Word: Shield
				CreateSpellEntry( 6788, true, nil, 1 ), -- Weakened Soul
				CreateSpellEntry( 139 ), -- Renew
				CreateSpellEntry( 33076 ), -- Prayer of Mending
				CreateSpellEntry( 63877 ), -- Pain Suppression
				CreateSpellEntry( 34914, false, nil, nil, 34914 ), -- Vampiric Touch
				CreateSpellEntry( 589 ), -- Shadow Word: Pain
				CreateSpellEntry( 2944 ), -- Devouring Plague
				CreateSpellEntry( 48153 ), -- Guardian Spirit
				CreateSpellEntry( 77489 ), -- Echo of Light			
				CreateSpellEntry( 114404 ), -- Void Tendril's Grasp
				CreateSpellEntry( 87194 ), -- Glyph of Mind Blast
				CreateSpellEntry( 9484 ), -- Shackle Undead
				CreateSpellEntry( 8122 ), -- Psychic Scream				
			},
			player = {
				CreateSpellEntry( 96219 ), -- Strength of Soul (silence immun)
				CreateSpellEntry( 89489 ), -- priest slow immun
				CreateSpellEntry( 139 ), -- Renew
				CreateSpellEntry( 17 ), -- Power Word: Shield
				CreateSpellEntry( 10060 ), -- Power Infusion
				CreateSpellEntry( 47585 ), -- Dispersion
				CreateSpellEntry( 81700 ), -- Archangel
				CreateSpellEntry( 81208 ), -- Chakra Heal
				CreateSpellEntry( 81209 ), -- Chakra Smite
				CreateSpellEntry( 81206 ), -- Prayer of Healing
				CreateSpellEntry( 109964 ), -- Spirit Shell
				CreateSpellEntry( 15286 ), -- Vampiric Embrace
				CreateSpellEntry( 586 ), -- Fade
				CreateSpellEntry( 45242 ), -- Focused Will
			},
			procs = {
				CreateSpellEntry( 63735 ), -- Serendipity
				CreateSpellEntry( 114255 ), -- Surge of Light
				CreateSpellEntry( 77487 ), -- Shadow Orb
				CreateSpellEntry( 71572 ), -- Cultivated Power
				CreateSpellEntry( 81661 ), -- Evangelism
				CreateSpellEntry( 72418 ), -- Kuhlendes Wissen
				CreateSpellEntry( 71584 ), -- Revitalize
				CreateSpellEntry( 59889 ), -- Borrowed Time
				CreateSpellEntry( 104993 ), -- Jade Spirit
				CreateSpellEntry( 128985 ), -- Relic of Yu'lon
				CreateSpellEntry( 124430 ), -- Divine Insight
				CreateSpellEntry( 87160 ), -- Surge of Darkness
				CreateSpellEntry( 81292 ), -- Glyph of Mind Spike
				CreateSpellEntry( 123254 ), -- Twist of Fate
			},
		},
		ROGUE = { 
			target = { 
				CreateSpellEntry( 1833 ), -- Cheap Shot
				CreateSpellEntry( 408 ), -- Kidney Shot
				CreateSpellEntry( 1776 ), -- Gouge
				CreateSpellEntry( 2094 ), -- Blind
				CreateSpellEntry( 2818 ), -- Deadly Poison
				CreateSpellEntry( 8680 ), -- Wound Posion
				CreateSpellEntry( 3409 ),  -- Crippling Poison 
				CreateSpellEntry( 6770 ), -- Sap
				CreateSpellEntry( 1943 ), -- Rupture
				CreateSpellEntry( 703 ), -- Garrote
				CreateSpellEntry( 79140 ), -- vendetta
				CreateSpellEntry( 16511 ), -- Hemorrhage
				CreateSpellEntry( 84745 ), -- Shallow Insight
				CreateSpellEntry( 84746 ), -- Moderate Insight
				CreateSpellEntry( 84747 ), -- Deep Insight
				CreateSpellEntry( 84747 ), -- Revealing Strike
				CreateSpellEntry( 84747 ), -- Find Weakness	
			},
			player = {
				CreateSpellEntry( 13750 ), -- adrenalin stuff
				CreateSpellEntry( 32645 ), -- Envenom
				CreateSpellEntry( 2983 ), -- Sprint
				CreateSpellEntry( 5277 ), -- Evasion
				CreateSpellEntry( 1776 ), -- Gouge
				CreateSpellEntry( 51713 ), -- Shadow Dance
				CreateSpellEntry( 1966 ), -- Feint
				CreateSpellEntry( 73651 ), -- Recuperate
				CreateSpellEntry( 5171 ), -- Slice and Dice
				CreateSpellEntry( 13877 ), -- Blade Flurry
				CreateSpellEntry( 74001 ), -- Combat Readiness		
				CreateSpellEntry( 84747 ), -- Master of Subtlety
				CreateSpellEntry( 84747 ), -- Cloak of Shadows
				CreateSpellEntry( 84747 ), -- Vanish
				CreateSpellEntry( 84747 ), -- Combat Insight
				CreateSpellEntry( 84747 ), -- Cheating Death
				CreateSpellEntry( 84747 ), -- Subterfuge		
			},
			procs = {
				CreateSpellEntry( 71396 ), -- Rage of the Fallen				
				CreateSpellEntry( 115189 ), -- Anticipation
				CreateSpellEntry( 84745 ), -- Shallow Insight
				CreateSpellEntry( 84746 ), -- Moderate Insight
				CreateSpellEntry( 84747 ), -- Deep Insight
				CreateSpellEntry( 121153 ), -- Blindside			
			},
		},
		SHAMAN = {
			target = {
				CreateSpellEntry( 974 ), -- Earth Shield
				CreateSpellEntry( 8050), -- Flame Shock
				CreateSpellEntry( 8056 ), -- Frost Shock
				CreateSpellEntry( 17364 ), -- Storm Strike
				CreateSpellEntry( 61295 ), -- Riptide
				CreateSpellEntry( 64695 ), -- Earthgrab
				CreateSpellEntry( 51514 ), -- Hex			
			},
				player = {
				CreateSpellEntry( 324 ), -- Lightning Shield
				CreateSpellEntry( 52127 ), -- Water Shield
				CreateSpellEntry( 974 ), -- Earth Shield
				CreateSpellEntry( 30823 ), -- Shamanistic Rage
				CreateSpellEntry( 61295 ), -- Riptide				
				CreateSpellEntry( 53817 ), -- Maelstorm Weapon
				CreateSpellEntry( 16166 ), -- Elemental Mastery
				CreateSpellEntry( 114049 ), -- Ascendance
				CreateSpellEntry( 79206 ), -- Spiritwalker's Grace
				CreateSpellEntry( 73683 ), -- Unleash Flame
				CreateSpellEntry( 73685 ), -- Unleash Life
				CreateSpellEntry( 31616 ), -- Nature Guardian
				CreateSpellEntry( 114893 ), -- Stone Bulwark
				CreateSpellEntry( 108281 ), -- Ancestral Guidance
				CreateSpellEntry( 108271 ), -- Astral Shift
			},
			procs = {
				CreateSpellEntry( 53817 ), -- Maelstrom Weapon
				CreateSpellEntry( 104993 ), -- Jade Spirit
				CreateSpellEntry( 128985 ), -- Relic of Yu'lon
				CreateSpellEntry( 77762 ), -- Lava Surge
				CreateSpellEntry( 118522 ), -- Elemental Blast
				CreateSpellEntry( 53390 ), -- Tidal Waves
			},
		},
		WARLOCK = {
			target = {
				CreateSpellEntry( 980 ), -- Bane of Agony
				CreateSpellEntry( 603 ), -- Bane of Doom
				CreateSpellEntry( 80240 ), -- Bane of Havoc
				CreateSpellEntry( 146739 ), -- Corruption
				CreateSpellEntry( 27243, false, nil, nil, 27243 ), -- Seed of Corruption
				CreateSpellEntry( 48181, false, nil, nil, 48181 ), -- Haunt
				CreateSpellEntry( 30108, false, nil, nil, 30108 ), -- Unstable Affliction
				CreateSpellEntry( 157736, false, nil, nil, 157736 ), -- Immolate
				CreateSpellEntry( 5782 ), -- Fear
				CreateSpellEntry( 710 ), -- Banish
				CreateSpellEntry( 5484 ), -- Howl of Terror
				CreateSpellEntry( 6789 ), -- Deathcoil
				CreateSpellEntry( 114790 ), -- Seed of Corruption

			},
				player = {
				CreateSpellEntry( 17941 ), -- Shadow Trance
				CreateSpellEntry( 110913 ), -- Dark Bargain
				CreateSpellEntry( 104773 ), -- Unending Resolve
				CreateSpellEntry( 113861 ), -- Dark Soul: Knowledge
				CreateSpellEntry( 113860 ), -- Dark Soul: Misery
				CreateSpellEntry( 113858 ), -- Dark Soul: Instability
				CreateSpellEntry( 74434 ), -- Soulburn
				CreateSpellEntry( 86211 ), -- Soul Swap
				CreateSpellEntry( 111400 ), -- Burning Rush
				CreateSpellEntry( 108683 ), -- Fire and Brimstone
			},
			procs = {
				CreateSpellEntry( 86121 ), -- Soul Swap
				CreateSpellEntry( 117828 ), -- Backdraft
				CreateSpellEntry( 122355 ), -- Molten Core
			},
		},
		WARRIOR = { 
			target = {
				CreateSpellEntry( 94009 ), -- Rend
				CreateSpellEntry( 12294 ), -- Mortal Strike
				CreateSpellEntry( 1160 ), -- Demoralizing Shout
				CreateSpellEntry( 64382 ), -- Shattering Throw
				CreateSpellEntry( 86346 ), -- Colossus Smash
				CreateSpellEntry( 7922 ), -- Charge (stun)
				CreateSpellEntry( 1715 ), -- Hamstring
				CreateSpellEntry( 18498 ), -- Gag Order
				CreateSpellEntry( 6343 ), -- Thunderclap
				CreateSpellEntry( 108126 ), -- DPS Colossus Smash T13
			},
			player = {
				CreateSpellEntry( 469 ), -- Commanding Shout
				CreateSpellEntry( 6673 ), -- Battle Shout
				CreateSpellEntry( 55694 ), -- Enraged Regeneration
				CreateSpellEntry( 23920 ), -- Spell Reflection
				CreateSpellEntry( 871 ), -- Shield Wall
				CreateSpellEntry( 1719 ), -- Recklessness
				CreateSpellEntry( 2565 ), -- Shield Block
				CreateSpellEntry( 32216 ), -- Victorious (Victory Rush enabled)
				CreateSpellEntry( 12292 ), -- Bloodbath
				CreateSpellEntry( 12975 ), -- Last Stand
				CreateSpellEntry( 112048 ), -- Shield Barrier
				CreateSpellEntry( 118038 ), -- Die by the Sword
				CreateSpellEntry( 18499 ), -- Berserker Rage
				CreateSpellEntry( 107574 ), -- Avatar
				CreateSpellEntry( 12328 ), -- Sweeping Strikes
			},
			procs = {
				CreateSpellEntry( 46916 ), -- Bloodsurge Slam (Free & Instant)
				CreateSpellEntry( 50227 ), -- Sword and Board
				CreateSpellEntry( 122510 ), -- Ultimatum
				CreateSpellEntry( 85739 ), -- Meat Cleaver
				CreateSpellEntry( 12880 ), -- Enrage
				CreateSpellEntry( 86663 ), -- Rude Interruption
			},
		},
};

local CreateUnitAuraDataSource;
do
	local auraTypes = { "HELPFUL", "HARMFUL" };

	-- private
	local CheckFilter = function( self, id, caster, filter )
		if ( filter == nil ) then return false; end
			
		local byPlayer = caster == "player" or caster == "pet" or caster == "vehicle";
			
		for _, v in ipairs( filter ) do
			if ( v.id == id and ( v.castByAnyone or byPlayer ) ) then return v; end
		end
		
		return false;
	end
	
	local CheckUnit = function( self, unit, filter, result )
		if ( not UnitExists( unit ) ) then return 0; end

		local unitIsFriend = UnitIsFriend( "player", unit );

		for _, auraType in ipairs( auraTypes ) do
			local isDebuff = auraType == "HARMFUL";
		
			for index = 1, 40 do
				local name, _, texture, stacks, _, duration, expirationTime, caster, _, _, spellId = UnitAura( unit, index, auraType );		
				if ( name == nil ) then
					break;
				end							
				
				local filterInfo = CheckFilter( self, spellId, caster, filter );
				if ( filterInfo and ( filterInfo.unitType ~= 1 or unitIsFriend ) and ( filterInfo.unitType ~= 2 or not unitIsFriend ) ) then 					
					filterInfo.name = name;
					filterInfo.texture = texture;
					filterInfo.duration = duration;
					filterInfo.expirationTime = expirationTime;
					filterInfo.stacks = stacks;
					filterInfo.unit = unit;
					filterInfo.isDebuff = isDebuff;
					table.insert( result, filterInfo );
				end
			end
		end
	end

	-- public 
	local Update = function( self )
		local result = self.table;

		for index = 1, #result do
			table.remove( result );
		end				

		CheckUnit( self, self.unit, self.filter, result );
		if ( self.includePlayer ) then
			CheckUnit( self, "player", self.playerFilter, result );
		end
		
		self.table = result;
	end

	local SetSortDirection = function( self, descending )
		self.sortDirection = descending;
	end
	
	local GetSortDirection = function( self )
		return self.sortDirection;
	end
	
	local Sort = function( self )
		local direction = self.sortDirection;
		local time = GetTime();
	
		local sorted;
		repeat
			sorted = true;
			for key, value in pairs( self.table ) do
				local nextKey = key + 1;
				local nextValue = self.table[ nextKey ];
				if ( nextValue == nil ) then break; end
				
				local currentRemaining = value.expirationTime == 0 and 4294967295 or math.max( value.expirationTime - time, 0 );
				local nextRemaining = nextValue.expirationTime == 0 and 4294967295 or math.max( nextValue.expirationTime - time, 0 );
				
				if ( ( direction and currentRemaining < nextRemaining ) or ( not direction and currentRemaining > nextRemaining ) ) then
					self.table[ key ] = nextValue;
					self.table[ nextKey ] = value;
					sorted = false;
				end				
			end			
		until ( sorted == true )
	end
	
	local Get = function( self )
		return self.table;
	end
	
	local Count = function( self )
		return #self.table;
	end
	
	local AddFilter = function( self, filter, defaultColor, debuffColor )
		if ( filter == nil ) then return; end
		
		for _, v in pairs( filter ) do
			local clone = { };
			
			clone.id = v.id;
			clone.castByAnyone = v.castByAnyone;
			clone.color = v.color;
			clone.unitType = v.unitType;
			clone.castSpellId = v.castSpellId;
			
			clone.defaultColor = defaultColor;
			clone.debuffColor = debuffColor;
			
			table.insert( self.filter, clone );
		end
	end
	
	local AddPlayerFilter = function( self, filter, defaultColor, debuffColor )
		if ( filter == nil ) then return; end

		for _, v in pairs( filter ) do
			local clone = { };
			
			clone.id = v.id;
			clone.castByAnyone = v.castByAnyone;
			clone.color = v.color;
			clone.unitType = v.unitType;
			clone.castSpellId = v.castSpellId;
			
			clone.defaultColor = defaultColor;
			clone.debuffColor = debuffColor;
			
			table.insert( self.playerFilter, clone );
		end
	end
	
	local GetUnit = function( self )
		return self.unit;
	end
	
	local GetIncludePlayer = function( self )
		return self.includePlayer;
	end
	
	local SetIncludePlayer = function( self, value )
		self.includePlayer = value;
	end
	
	-- constructor
	CreateUnitAuraDataSource = function( unit )
		local result = {  };

		result.Sort = Sort;
		result.Update = Update;
		result.Get = Get;
		result.Count = Count;
		result.SetSortDirection = SetSortDirection;
		result.GetSortDirection = GetSortDirection;
		result.AddFilter = AddFilter;
		result.AddPlayerFilter = AddPlayerFilter;
		result.GetUnit = GetUnit; 
		result.SetIncludePlayer = SetIncludePlayer; 
		result.GetIncludePlayer = GetIncludePlayer; 
		
		result.unit = unit;
		result.includePlayer = false;
		result.filter = { };
		result.playerFilter = { };
		result.table = { };
		
		return result;
	end
end

local CreateFramedTexture;
do
	-- public
	local SetTexture = function( self, ... )
		return self.texture:SetTexture( ... );
	end
	
	local GetTexture = function( self )
		return self.texture:GetTexture();
	end
	
	local GetTexCoord = function( self )
		return self.texture:GetTexCoord();
	end
	
	local SetTexCoord = function( self, ... )
		return self.texture:SetTexCoord( ... );
	end
	
	local SetBorderColor = function( self, ... )
		return self.border:SetVertexColor( ... );
	end
	
	-- constructor
	CreateFramedTexture = function( parent )
		local result = parent:CreateTexture( nil, "BACKGROUND", nil );
		local border = parent:CreateTexture( nil, "BORDER", nil );
		local background = parent:CreateTexture( nil, "ARTWORK", nil );
		local texture = parent:CreateTexture( nil, "OVERLAY", nil );		
		
		result:SetTexture(unpack(Viks.media.backdropcolor));
		border:SetTexture(unpack(Viks.media.bordercolor));
		background:SetTexture(unpack(Viks.media.backdropcolor));
		
		border:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
		border:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
		
		background:SetPoint( "TOPLEFT", border, "TOPLEFT", 1, -1 );
		background:SetPoint( "BOTTOMRIGHT", border, "BOTTOMRIGHT", -1, 1 );

		texture:SetPoint( "TOPLEFT", background, "TOPLEFT", 1, -1 );
		texture:SetPoint( "BOTTOMRIGHT", background, "BOTTOMRIGHT", -1, 1 );
			
		result.border = border;
		result.background = background;
		result.texture = texture;
			
		result.SetBorderColor = SetBorderColor;
		
		result.SetTexture = SetTexture;
		result.GetTexture = GetTexture;
		result.SetTexCoord = SetTexCoord;
		result.GetTexCoord = GetTexCoord;
			
		return result;
	end
end

local CreateAuraBarFrame;
do
	-- classes
	local CreateAuraBar;
	do
		-- private 
		local OnUpdate = function( self, elapsed )	
			local time = GetTime();
		
			if ( time > self.expirationTime ) then
				self.bar:SetScript( "OnUpdate", nil );
				self.bar:SetValue( 0 );
				self.time:SetText( "" );
				
				local spark = self.spark;
				if ( spark ) then			
					spark:Hide();
				end
			else
				local remaining = self.expirationTime - time;
				self.bar:SetValue( remaining );
				
				local timeText = "";
				if ( remaining >= 3600 ) then
					timeText = tostring( math.floor( remaining / 3600 ) ) .. "h";
				elseif ( remaining >= 60 ) then
					timeText = tostring( math.floor( remaining / 60 ) ) .. "m";
				elseif ( remaining > TENTHS_TRESHOLD ) then
					timeText = tostring( math.floor( remaining ) );
				elseif ( remaining > 0 ) then
					timeText = tostring( math.floor( remaining * 10 ) / 10 );
				end
				self.time:SetText( timeText );
				
				local barWidth = self.bar:GetWidth();
				
				local spark = self.spark;
				if ( spark ) then			
					spark:SetPoint( "CENTER", self.bar, "LEFT", barWidth * remaining / self.duration, 0 );
				end
				
				local castSeparator = self.castSeparator;
				if ( castSeparator and self.castSpellId ) then
					local _, _, _, _, _, _, castTime, _, _ = GetSpellInfo( self.castSpellId );

					castTime = castTime / 1000;
					if ( castTime and remaining > castTime ) then
						castSeparator:SetPoint( "CENTER", self.bar, "LEFT", barWidth * ( remaining - castTime ) / self.duration, 0 );
					else
						castSeparator:Hide();
					end
				end
			end
		end
		
		-- public
		local SetIcon = function( self, icon )
			if ( not self.icon ) then return; end
			
			self.icon:SetTexture( icon );
		end
		
		local SetTime = function( self, expirationTime, duration )
			self.expirationTime = expirationTime;
			self.duration = duration;
			
			if ( expirationTime > 0 and duration > 0 ) then		
				self.bar:SetMinMaxValues( 0, duration );
				OnUpdate( self, 0 );
		
				local spark = self.spark;
				if ( spark ) then 
					spark:Show();
				end
		
				self:SetScript( "OnUpdate", OnUpdate );
			else
				self.bar:SetMinMaxValues( 0, 1 );
				self.bar:SetValue( PERMANENT_AURA_VALUE );
				self.time:SetText( "" );
				
				local spark = self.spark;
				if ( spark ) then 
					spark:Hide();
				end
				
				self:SetScript( "OnUpdate", nil );
			end
		end
		
		local SetName = function( self, name )
			self.name:SetText( name );
		end
		
		local SetStacks = function( self, stacks )
			if ( not self.stacks ) then
				if ( stacks ~= nil and stacks > 1 ) then
					local name = self.name;
					
					name:SetText( tostring( stacks ) .. "  " .. name:GetText() );
				end
			else			
				if ( stacks ~= nil and stacks > 1 ) then
					self.stacks:SetText( stacks );
				else
					self.stacks:SetText( "" );
				end
			end
		end
		
		local SetColor = function( self, color )
			self.bar:SetStatusBarColor( unpack( color ) );
		end
		
		local SetCastSpellId = function( self, id )
			self.castSpellId = id;
			
			local castSeparator = self.castSeparator;
			if ( castSeparator ) then
				if ( id ) then
					self.castSeparator:Show();
				else
					self.castSeparator:Hide();
				end
			end
		end
		
		local SetAuraInfo = function( self, auraInfo )
			self:SetName( auraInfo.name );
			self:SetIcon( auraInfo.texture );	
			self:SetTime( auraInfo.expirationTime, auraInfo.duration );
			self:SetStacks( auraInfo.stacks );
			self:SetCastSpellId( auraInfo.castSpellId );
		end
		
		-- constructor
		CreateAuraBar = function( parent )
			local result = CreateFrame( "Frame", nil, parent, nil );

			if ( bit.band( ICON_POSITION, 4 ) == 0 ) then		
				local icon = CreateFramedTexture( result, "ARTWORK" );
				icon:SetTexCoord( 0.15, 0.85, 0.15, 0.85 );
				icon:SetBorderColor( unpack( ICON_COLOR ) );
				
				local iconAnchor1;
				local iconAnchor2;
				local iconOffset;
				if ( bit.band( ICON_POSITION, 1 ) == 1 ) then
					iconAnchor1 = "TOPLEFT";
					iconAnchor2 = "TOPRIGHT";
					iconOffset = 1;
				else
					iconAnchor1 = "TOPRIGHT";
					iconAnchor2 = "TOPLEFT";
					iconOffset = -1;
				end			
				
				if ( bit.band( ICON_POSITION, 2 ) == 2 ) then
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * 6, 1 );
				else
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * ( -BAR_HEIGHT - 1 ), 1 );
				end			
				icon:SetWidth( BAR_HEIGHT + 2 );
				icon:SetHeight( BAR_HEIGHT + 2 );	

				result.icon = icon;
				
				local stacks = result:CreateFontString( nil, "OVERLAY", nil );
				stacks:SetFont( unpack( STACKS_FONT ) );
				stacks:SetShadowColor( 0, 0, 0 );
				stacks:SetShadowOffset( 1.25, -1.25 );
				stacks:SetJustifyH( "RIGHT" );
				stacks:SetJustifyV( "BOTTOM" );
				stacks:SetPoint( "TOPLEFT", icon, "TOPLEFT", 0, 0 );
				stacks:SetPoint( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 3 );
				result.stacks = stacks;
			end
			
			local bar = CreateFrame( "StatusBar", nil, result, nil );
			bar:SetStatusBarTexture( texture );
			if ( bit.band( ICON_POSITION, 2 ) == 2 or bit.band( ICON_POSITION, 4 ) == 4 ) then
				bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
				bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
			else
				if ( bit.band( ICON_POSITION, 1 ) == 1 ) then
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", -BAR_HEIGHT - 1, 0 );
				else
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", BAR_HEIGHT + 1, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );					
				end	
			end
			result.bar = bar;
			
			if ( SPARK ) then
				local spark = bar:CreateTexture( nil, "OVERLAY", nil );
				spark:SetTexture( [[Interface\CastingBar\UI-CastingBar-Spark]] );
				spark:SetWidth( 12 );
				spark:SetBlendMode( "ADD" );
				spark:Show();
				result.spark = spark;
			end
			
			if ( CAST_SEPARATOR ) then
				local castSeparator = bar:CreateTexture( nil, "OVERLAY", nil );
				castSeparator:SetTexture( unpack( CAST_SEPARATOR_COLOR ) );
				castSeparator:SetWidth( 1 );
				castSeparator:SetHeight( BAR_HEIGHT );
				castSeparator:Show();
				result.castSeparator = castSeparator;
			end
						
			local name = bar:CreateFontString( nil, "OVERLAY", nil );
			name:SetFont( unpack( MASTER_FONT ) );
			name:SetJustifyH( "LEFT" );
			name:SetShadowColor( 0, 0, 0 );
			name:SetShadowOffset( 1.25, -1.25 );
			name:SetPoint( "TOPLEFT", bar, "TOPLEFT", TEXT_MARGIN, 0 );
			name:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -45, 2 );
			result.name = name;
			
			local time = bar:CreateFontString( nil, "OVERLAY", nil );
			time:SetFont( unpack( MASTER_FONT ) );
			time:SetJustifyH( "RIGHT" );
			time:SetShadowColor( 0, 0, 0 );
			time:SetShadowOffset( 1.25, -1.25 );
			time:SetPoint( "TOPLEFT", name, "TOPRIGHT", 0, 0 );
			time:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -TEXT_MARGIN, 2 );
			result.time = time;
			
			result.SetIcon = SetIcon;
			result.SetTime = SetTime;
			result.SetName = SetName;
			result.SetStacks = SetStacks;
			result.SetAuraInfo = SetAuraInfo;
			result.SetColor = SetColor;
			result.SetCastSpellId = SetCastSpellId;
			
			return result;
		end
	end

	-- private
	local SetAuraBar = function( self, index, auraInfo )
		local line = self.lines[ index ]
		if ( line == nil ) then
			line = CreateAuraBar( self );
			if ( index == 1 ) then
				line:SetPoint( "TOPLEFT", self, "BOTTOMLEFT", 0, BAR_HEIGHT );
				line:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0 );
			else
				local anchor = self.lines[ index - 1 ];
				line:SetPoint( "TOPLEFT", anchor, "TOPLEFT", 0, BAR_HEIGHT + BAR_SPACING );
				line:SetPoint( "BOTTOMRIGHT", anchor, "TOPRIGHT", 0, BAR_SPACING );
			end
			tinsert( self.lines, index, line );
		end	
		
		line:SetAuraInfo( auraInfo );
		if ( auraInfo.color ) then
			line:SetColor( auraInfo.color );
		elseif ( auraInfo.debuffColor and auraInfo.isDebuff ) then
			line:SetColor( auraInfo.debuffColor );
		elseif ( auraInfo.defaultColor ) then
			line:SetColor( auraInfo.defaultColor );
		end
		
		line:Show();
	end
	
	local function OnUnitAura( self, unit )
		if ( unit ~= self.unit and ( self.dataSource:GetIncludePlayer() == false or unit ~= "player" ) ) then
			return;
		end
		
		self:Render();
	end
	
	local function OnPlayerTargetChanged( self, method )
		self:Render();
	end
	
	local function OnPlayerEnteringWorld( self )
		self:Render();
	end
	
	local function OnEvent( self, event, ... )
		if ( event == "UNIT_AURA" ) then
			OnUnitAura( self, ... );
		elseif ( event == "PLAYER_TARGET_CHANGED" ) then
			OnPlayerTargetChanged( self, ... );
		elseif ( event == "PLAYER_ENTERING_WORLD" ) then
			OnPlayerEnteringWorld( self );
		else
			error( "Unhandled event " .. event );
		end
	end
	
	-- public
	local function Render( self )
		local dataSource = self.dataSource;	

		dataSource:Update();
		dataSource:Sort();
		
		local count = dataSource:Count();

		for index, auraInfo in ipairs( dataSource:Get() ) do
			SetAuraBar( self, index, auraInfo );
		end
		
		for index = count + 1, 80 do
			local line = self.lines[ index ];
			if ( line == nil or not line:IsShown() ) then
				break;
			end
			line:Hide();
		end
		
		if ( count > 0 ) then
			self:SetHeight( ( BAR_HEIGHT + BAR_SPACING ) * count - BAR_SPACING );
			self:Show();
		else
			self:Hide();
			self:SetHeight( self.hiddenHeight or 1 );
		end
	end
	
	local function SetHiddenHeight( self, height )
		self.hiddenHeight = height;
	end

	-- constructor
	CreateAuraBarFrame = function( dataSource, parent )
		local result = CreateFrame( "Frame", nil, parent, nil );
		local unit = dataSource:GetUnit();
		
		result.unit = unit;
		
		result.lines = { };		
		result.dataSource = dataSource;
		
		local background = result:CreateTexture( nil, "BACKGROUND", nil );
		background:SetAlpha( BACKGROUND_ALPHA );
		background:SetTexture( texture );
		background:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
		background:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
		background:SetVertexColor( .1,.1,.1,1 );
		result.background = background;
		
		local border = CreateFrame( "Frame", nil, result, nil );
		border:SetAlpha( BACKGROUND_ALPHA );
		border:SetFrameStrata( "BACKGROUND" );
		border:SetBackdrop( {
			edgeFile = glowTex, edgeSize = 5,
			insets = { left = 3, right = 3, top = 3, bottom = 3 }
		} );
		border:SetBackdropColor( 0, 0, 0, 0 );
		border:SetBackdropBorderColor( 0, 0, 0 );
		border:SetPoint( "TOPLEFT", result, "TOPLEFT", -5, 5 );
		border:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 5, -5 );
		result.border = border;		
		frame1px1(border)
		result:RegisterEvent( "PLAYER_ENTERING_WORLD" );
		result:RegisterEvent( "UNIT_AURA" );
		if ( unit == "target" ) then
			result:RegisterEvent( "PLAYER_TARGET_CHANGED" );
		end
		
		result:SetScript( "OnEvent", OnEvent );
		
		result.Render = Render;
		result.SetHiddenHeight = SetHiddenHeight;
		
		return result;
	end
end

local _, playerClass = UnitClass( "player" );
local classFilter = CLASS_FILTERS[ playerClass ];
classtimerload = CreateFrame("Frame")
classtimerload:RegisterEvent("PLAYER_LOGIN")
classtimerload:SetScript("OnEvent", function(self, event, addon)
if ( LAYOUT == 1 ) then
	local dataSource = CreateUnitAuraDataSource( "target" );

	dataSource:SetSortDirection( SORT_DIRECTION );
	
	dataSource:AddPlayerFilter( TRINKET_FILTER, TRINKET_BAR_COLOR );
	
	if ( classFilter ) then
		dataSource:AddFilter( classFilter.target, TARGET_BAR_COLOR, TARGET_DEBUFF_COLOR );
		dataSource:AddPlayerFilter( classFilter.player, PLAYER_BAR_COLOR, PLAYER_DEBUFF_COLOR );
		dataSource:AddPlayerFilter( classFilter.procs, TRINKET_BAR_COLOR );
		dataSource:SetIncludePlayer( classFilter.player ~= nil );
	end

	local frame = CreateAuraBarFrame( dataSource,  oUF_Player );
	local yOffset = 1;
	if ( playerClass == "DEATHKNIGHT" or playerClass == "SHAMAN" or playerClass == "WARLOCK"  or playerClass == "PALADIN" or myclass == "MONK") then
		yOffset = yOffset + 80;
	end
	frame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 0, yOffset );
	frame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", 0, yOffset );
	frame:Show(); 
elseif ( LAYOUT == 2 ) then
	local targetDataSource = CreateUnitAuraDataSource( "target" );
	local playerDataSource = CreateUnitAuraDataSource( "player" );

	targetDataSource:SetSortDirection( SORT_DIRECTION );
	playerDataSource:SetSortDirection( SORT_DIRECTION );
	
	playerDataSource:AddFilter( TRINKET_FILTER, TRINKET_BAR_COLOR );

	if ( classFilter ) then
		targetDataSource:AddFilter( classFilter.target, TARGET_BAR_COLOR, TARGET_DEBUFF_COLOR );
		playerDataSource:AddFilter( classFilter.player, PLAYER_BAR_COLOR, PLAYER_DEBUFF_COLOR );
		playerDataSource:AddFilter( classFilter.procs, TRINKET_BAR_COLOR );
	end

	local yOffset = 8;

	
	local playerFrame = CreateAuraBarFrame( playerDataSource,  oUF_Player );	
	playerFrame:SetHiddenHeight( -yOffset );
	if ( playerClass == "DEATHKNIGHT" or playerClass == "SHAMAN" or playerClass == "WARLOCK"  or playerClass == "PALADIN" or myclass == "MONK") then
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 0, yOffset + 1 );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", 0, yOffset + 1 );
	else
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 0, yOffset );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", 0, yOffset );
	end
	playerFrame:Show();

	local targetFrame = CreateAuraBarFrame( targetDataSource,  oUF_Player );
	targetFrame:SetPoint( "BOTTOMLEFT", playerFrame, "TOPLEFT", 0, yOffset );
	targetFrame:SetPoint( "BOTTOMRIGHT", playerFrame, "TOPRIGHT", 0, yOffset );
	targetFrame:Show();
elseif ( LAYOUT == 3 ) then
	local yOffset = 15;

	local targetDataSource = CreateUnitAuraDataSource( "target" );
	local playerDataSource = CreateUnitAuraDataSource( "player" );
	local trinketDataSource = CreateUnitAuraDataSource( "player" );
	
	targetDataSource:SetSortDirection( SORT_DIRECTION );
	playerDataSource:SetSortDirection( SORT_DIRECTION );
	trinketDataSource:SetSortDirection( SORT_DIRECTION );
	
	if ( classFilter ) then
		targetDataSource:AddFilter( classFilter.target, TARGET_BAR_COLOR, TARGET_DEBUFF_COLOR );		
		playerDataSource:AddFilter( classFilter.player, PLAYER_BAR_COLOR, PLAYER_DEBUFF_COLOR );
		trinketDataSource:AddFilter( classFilter.procs, TRINKET_BAR_COLOR );
	end
	trinketDataSource:AddFilter( TRINKET_FILTER, TRINKET_BAR_COLOR );

	local playerFrame = CreateAuraBarFrame( playerDataSource,  oUF_Player );
	playerFrame:SetHiddenHeight( -yOffset );
	if ( playerClass == "DEATHKNIGHT" or playerClass == "SHAMAN" or playerClass == "WARLOCK"  or playerClass == "PALADIN" or myclass == "MONK") then
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 0, yOffset + 1 );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", 0, yOffset + 1 );
	else
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 0, yOffset );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", 0, yOffset );
	end
	playerFrame:Show();

	local trinketFrame = CreateAuraBarFrame( trinketDataSource,  oUF_Player );
	trinketFrame:SetHiddenHeight( -yOffset );
	trinketFrame:SetPoint( "BOTTOMLEFT", playerFrame, "TOPLEFT", 0, yOffset );
	trinketFrame:SetPoint( "BOTTOMRIGHT", playerFrame, "TOPRIGHT", 0, yOffset );
	trinketFrame:Show();
	
	local targetFrame = CreateAuraBarFrame( targetDataSource,  oUF_Player );
	targetFrame:SetHiddenHeight( -yOffset );
	targetFrame:SetPoint( "BOTTOMLEFT", trinketFrame, "TOPLEFT", 0, yOffset );
	targetFrame:SetPoint( "BOTTOMRIGHT", trinketFrame, "TOPRIGHT", 0, yOffset );
	targetFrame:Show();
elseif ( LAYOUT == 4 ) then
	local yOffset = 11;

	local targetDataSource = CreateUnitAuraDataSource( "target" );
	local playerDataSource = CreateUnitAuraDataSource( "player" );
	local trinketDataSource = CreateUnitAuraDataSource( "player" );
	
	targetDataSource:SetSortDirection( SORT_DIRECTION );
	playerDataSource:SetSortDirection( SORT_DIRECTION );
	trinketDataSource:SetSortDirection( SORT_DIRECTION );
	
	if ( classFilter ) then
		targetDataSource:AddFilter( classFilter.target, TARGET_BAR_COLOR, TARGET_DEBUFF_COLOR );		
		playerDataSource:AddFilter( classFilter.player, PLAYER_BAR_COLOR, PLAYER_DEBUFF_COLOR );
		trinketDataSource:AddFilter( classFilter.procs, TRINKET_BAR_COLOR );
	end
	trinketDataSource:AddFilter( TRINKET_FILTER, TRINKET_BAR_COLOR );

	local playerFrame = CreateAuraBarFrame( playerDataSource,  oUF_Player );
	playerFrame:SetHiddenHeight( -yOffset );
	if ( playerClass == "DEATHKNIGHT" or playerClass == "SHAMAN" or playerClass == "WARLOCK"  or playerClass == "PALADIN" or myclass == "MONK" or playerClass == "ROGUE" or playerClass == "DRUID") then
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20 );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20 );
	else
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8 );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8 );
	end
	if ( playerClass == "PRIEST") then
		if GetSpecialization() == 3 then
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20 );
		else
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8 );
		end
	end
	if ( playerClass == "PALADIN") then
		if GetSpecialization() == 2 and Viks.unitframe_class_bar.vengeance then
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 28 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 28 );
		else
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20 );
		end
	end
	playerFrame:Show();

	local trinketFrame = CreateAuraBarFrame( trinketDataSource,  oUF_Player );
	trinketFrame:SetHiddenHeight( -yOffset );
	trinketFrame:SetPoint( "BOTTOMLEFT", playerFrame, "TOPLEFT", 0, 10 );
	trinketFrame:SetPoint( "BOTTOMRIGHT", playerFrame, "TOPRIGHT", 0, 10 );
	trinketFrame:Show();
	
	local targetFrame = CreateAuraBarFrame( targetDataSource,  oUF_ViksTarget );
		targetFrame:SetPoint( "BOTTOMLEFT",  oUF_ViksTarget, "TOPLEFT", 1, 8);
		targetFrame:SetPoint( "BOTTOMRIGHT",  oUF_ViksTarget, "TOPRIGHT", -1, 8);
	targetFrame:Show();
else
	error( "Undefined layout " .. tostring( LAYOUT ) );
end
classtimerload:UnregisterEvent("PLAYER_LOGIN")
classtimerload:SetScript("OnEvent", nil)
end)