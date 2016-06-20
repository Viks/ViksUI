local T, Viks, L, _ = unpack(select(2, ...))
local addon, ns = ...
local cfg = CreateFrame("Frame")

	-----------------------------
	-- Media Defaults
	-----------------------------
local mediapath = "Interface\\AddOns\\ViksUI\\Media\\"
cfg.statusbar_texture = mediapath.."textures\\normTex"
cfg.powerbar_texture = mediapath.."textures\\normTex"
cfg.Textbar_texture = mediapath.."textures\\backdrop"
cfg.highlight_texture = mediapath.."textures\\raidbg"
cfg.debuffBorder = mediapath.."textures\\iconborder"
cfg.squarefont = mediapath.."Font\\squares.ttf"
cfg.font = Viks.unitframes.UFfont
cfg.symbol = mediapath.."Font\\symbol.ttf"
cfg.symbols2 = mediapath.."Font\\PIZZADUDEBULLETS.ttf"
cfg.fontsize = 12
cfg.raidmarkicon = mediapath.."Other\\raidicons"
cfg.hordepvpico = mediapath.."Other\\Horde"									-- Icon to show for PVP Horde Side.
cfg.alliancepvpico = mediapath.."Other\\Alliance"								-- Icon to show for PVP Horde Side.
cfg.combatico = mediapath.."Other\\combat2"									-- Setting the icon to show when in combat on unitframe
cfg.restico = mediapath.."Other\\resting"										-- Setting the icon to show when in resting on unitframe. Credit to Karma for the icon.
cfg.oUFfont = Viks.unitframes.UFNamefont								-- Font to use on Names
cfg.shadowedge = mediapath.."Other\\glowTex"
cfg.backdropcolor = Viks.media.backdropcolor
cfg.bordercolor = Viks.media.bordercolor
cfg.aurasize = Viks.unitframes.aurasize								-- Aura Size for indicator type 2
cfg.insideAlpha = Viks.unitframes.insideAlpha						-- Alpha when Unitframe is in range	
cfg.outsideAlpha = Viks.unitframes.outsideAlpha						-- Alpha when Unitframe is out of range
cfg.pixelfont = mediapath.."Font\\pixel.ttf"							-- Pixelfont, working on adding this atm!


	-----------------------------
	-- Enable / disable parts (true/false)
	-----------------------------
cfg.ShowRaid = Viks.unitframes.ShowRaid								-- Show Raid Frames
cfg.portraitHPbar = Viks.unitframes.showPortraitHPbar				-- show portraits on Healthbar
cfg.showPortrait = Viks.unitframes.showPortrait						-- show portraits Icon
cfg.HealFrames = Viks.unitframes.HealFrames							-- Healing layout/positions
cfg.HealthcolorClass = Viks.unitframes.HealthcolorClass				-- health color = class color
cfg.showLFDIcons = Viks.unitframes.showLFDIcons						-- Show LFD Icons, must be true to show the other 2 options. False on next 2 to show default icons.
cfg.customLFDIcons = Viks.unitframes.customLFDIcons					-- Use Custom Icons; cfg.customLFDText must be false
cfg.customLFDText = Viks.unitframes.customLFDText					-- Use Text instead of Icon; Tank/Dps/Heal. cfg.customLFDIcons must be false
cfg.RCheckIcon = Viks.unitframes.RCheckIcon							-- Show Ready Check Icons On Health Frames
cfg.Experiencebar = Viks.unitframes.Experiencebar					-- show experience bar
cfg.Reputationbar = Viks.unitframes.Reputationbar					-- show reputation bar
cfg.enableDebuffHighlight = Viks.unitframes.enableDebuffHighlight	-- Highlight Unit Frame if having a Debuffs
cfg.showAuraWatch = Viks.unitframes.showAuraWatch					-- watch specific auras
cfg.showIndicators = Viks.unitframes.showIndicators					-- Show Indicators on frames
cfg.ShowIncHeals = Viks.unitframes.ShowIncHeals						-- Show incoming heals in player and raid frames
cfg.Castbars = Viks.unitframes.Castbars								-- Show built-in castbars
cfg.debuffsOnlyShowPlayer = Viks.unitframes.debuffsOnlyShowPlayer 	-- only show your debuffs on target
cfg.buffsOnlyShowPlayer = Viks.unitframes.buffsOnlyShowPlayer 		-- only show your buffs
cfg.showRaidDebuffs = Viks.unitframes.showRaidDebuffs 				-- Shows debuff as icon on your raid frames
cfg.scale = 1
cfg.showPlayerAuras = Viks.unitframes.showPlayerAuras				-- use a custom player buffs/debuffs frame instead of blizzard's default
cfg.Powercolor = Viks.unitframes.Powercolor							-- power color = class color

cfg.showEclipsebar = Viks.unitframe_class_bar.eclipse				-- Eclipse bar
cfg.showShardbar = Viks.unitframe_class_bar.shard					-- Shard/Burning bar
cfg.showHolybar = Viks.unitframe_class_bar.holy						-- Holy Power bar
cfg.showRunebar = Viks.unitframe_class_bar.rune						-- Rune bar
cfg.showHarmony = Viks.unitframe_class_bar.chi						-- Chi bar
cfg.showShadowOrbsBar = Viks.unitframe_class_bar.shadow				-- Shadow Orbs bar
cfg.TotemBars = Viks.unitframe_class_bar.totem						-- Totem bar
cfg.showVengeance = Viks.unitframe_class_bar.vengeance				-- Vengeance bar
cfg.class_bar_range = Viks.unitframe_class_bar.range				-- Range bar (only for Priest)
cfg.CPoints = Viks.unitframe_class_bar.combo						-- Rogue/Druid Combo bar
cfg.IndicatorIcons2 = Viks.unitframes.IndicatorIcons2				-- Toggles different Indicator types.
cfg.RaidShowAllGroups = Viks.unitframes.RaidShowAllGroups			-- Show All 8 Raid Groups, if not then 5
cfg.RaidShowSolo = Viks.unitframes.RaidShowSolo						-- show raid frames even when solo
cfg.ShowParty = Viks.unitframes.ShowParty							-- show party frames (shown as 5man raid)
cfg.showtot = Viks.unitframes.showtot								-- show target of target frame
cfg.showpet = Viks.unitframes.showpet								-- show pet frame 
cfg.showfocus = Viks.unitframes.showfocus							-- show focus frame
cfg.showfocustarget = Viks.unitframes.showfocustarget				-- show focus targets frame		
cfg.showBossFrames = Viks.unitframes.showBossFrames					-- show boss frame
cfg.showTankFrames = Viks.unitframes.MTFrames						-- show main tank frames			
cfg.indicatorsize = Viks.unitframes.indicatorsize					-- Size on Squares on Indicator type 2
cfg.symbolsize = Viks.unitframes.symbolsize							-- Size on Symbols on Indicator type 2
cfg.fontsizeEdge = Viks.unitframes.fontsizeEdge
cfg.Findoutline = Viks.unitframes.Findoutline




cfg.ABspacing = 59
cfg.showarena = false

--Flytt denne til move.lua
	-----------------------------
	-- Frames Size and Positions
	-----------------------------
	

 cfg.unit_size = { 			
             Portrait = { w=   56, 	h= 56},  
               Player = { w=  245, 	h= 60},  
               Target = { w=  245, 	h= 60},  
         Targettarget = { w=  120, 	h= 27},  
                Focus = { w=  200, 	h= 24},  
          Focustarget = { w=  120, 	h= 27},  
                  Pet = { w=  120, 	h= 27},
            PetTarget = { w=   95, 	h= 24}, 				  
                 Boss = { w=  150,	h= 20},  
                 Tank = { w=  180, 	h= 20},
                TankH = { w=  150, 	h= 20},				 
              Raid10H = { w=  100, 	h= 40},
              Raid25H = { w=   60, 	h= 30},		
			   Raid25 = { w=   45, 	h= 30},
              Raid40H = { w=   40, 	h= 30},
               Raid40 = { w=   40, 	h= 30},				  
	            Party = { w=  100,	h= 40},
                Arena = { w=  245, 	h= 60},
		CastbarPlayer = { w=   	0, 	h= 16},		--Only Hight	
		CastbarTarget = { w=   	0, 	h= 16},		--Only Hight
		 CastbarArena = { w=   	0, 	h= 16},		--Only Hight
		  CastbarBoss = { w=   	0, 	h= 10},		--Only Hight
		 CastbarFocus = { w=   	0, 	h= 13},		--Only Hight		  
}
--Position if healframes
 cfg.unit_positionsH = { 				
             Player = { x= -270, y=   305},  
             Target = { x=	270, y=   305},  
       Targettarget = { x=  560, y=   200},  
              Focus = { x=  196, y=   230},  
                Pet = { x=	  0, y=   289},  
               Boss = { x= -100, y=   -90},  
               Tank = { x=	  0, y=     0},  
               Raid = { x=	  0, y=   180},   
	          Party = { x=	  0, y=     0},
              Arena = { x= 	  0, y=     0},
           PCastbar = { x= 	  0, y=     0},
           TCastbar = { x= 	  0, y=     0},
           FCastbar = { x= 	  0, y=     0},	
           ACastbar = { x= 	  0, y=     0},			   
}
--Positions if not Healframes
 cfg.unit_positions = { 				
             Player = { x= -158, y=   320},  
             Target = { x=	158, y=   320},  
       Targettarget = { x=    0, y=   259},  
              Focus = { x=  430, y=   382},  
                Pet = { x=	  0, y=   289},  
               Boss = { x= -100, y=   -90},  
               Tank = { x=	  0, y=     0},  
               Raid = { x=	  0, y=   180},   
	          Party = { x=	  0, y=     0},
              Arena = { x= 	  0, y=     0},	
           PCastbar = { x= 	 32, y=    -2},
           TCastbar = { x= 	 -6, y=    -2},
           FCastbar = { x= 	 -5, y=   -12},
           ACastbar = { x= 	 -6, y=   -2},		   
}
	-----------------------------
	-- Debuff List
	-----------------------------
	
-- Credit to oUF_Drk Fanupdate for the idea on creating this.
------------------------------------------------------------------------------------------------
-- Indicator list to show on raid frames. These are tags that have to be created inside tag.lua
------------------------------------------------------------------------------------------------
	cfg.IndicatorList = {
		["NUMBERS"] = {
			["DEATHKNIGHT"] 	= "[DK:DeathBarrier]",
			["DRUID"]			= "[Druid:Lifebloom][Druid:Rejuv][Druid:Germination][Druid:Regrowth]",
			["HUNTER"]			= "[Hunter:Misdirection]",
			--["MAGE"]			= ,
			["MONK"]			= "[Monk:EnvelopingMist][Monk:RenewingMist]",
			--["PALADIN"]		= ,
			["PRIEST"]			= "[Priest:Renew][Priest:SpiritShell][Priest:ClarityOfWill][Priest:PowerWordShield]",
			--["ROGUE"]			= tricks,
			["SHAMAN"]			= "[Shaman:Riptide][Shaman:EarthShield]",
			--["WARLOCK"]		= ,
			["WARRIOR"]			= "[Warrior:Vigilance][Warrior:Safeguard]",
		},
		["SQUARE"] = {
			--["DEATHKNIGHT"] 	= ,
			["DRUID"]			= "[Druid:WildGrowth]",
			--["HUNTER"]		= ,
			--["MAGE"]			= ,
			--["MONK"]			= ,
			["PALADIN"]			= "[Paladin:Forbearance][Paladin:Beacon]",
			--["PRIEST"]		= ,
			--["ROGUE"]			= ,
			--["SHAMAN"]		= ,
			--["WARLOCK"]		= ,
			--["WARRIOR"]		= ,
		},
	}
	
------------------------------------------------------------------------------------------------
-- Aura Watch list to show on raid frames. Add the spell id below to add it.
------------------------------------------------------------------------------------------------
	cfg.AuraWatchList = { -- List of all buffs you want to watch on raid frames, sorted by class
			DEATHKNIGHT = {
			},
			DRUID = {
				33763, -- Lifebloom
				8936, -- Regrowth
				774, -- Rejuvenation
				48438, -- Wild Growth
				102342, -- Ironbark
				155777, -- Rejuvenation (Germination)
			},
			HUNTER = {
				34477, -- Misdirection
			},
			MAGE = {
				1459, -- Arcane Brilliance
				61316, -- Dalaran Brilliance
				111264, -- Ice Ward
			},
			MONK = {
				119611, -- Renewing Mist
				132120, -- Enveloping Mist
				124081, -- Zen Sphere
				116849, -- Life Cocoon

			},
			PALADIN = {
				53563, -- Beacon of Light
				20925, -- Sacred Shield
				114163, -- Eternal Flame
				157007, -- Beacon of Insight
				156910, -- Beacon of Faith
				1022, -- Hand of Protection
				1044, -- Hand of Freedom
				1038, -- Hand of Salvation
				6940, -- Hand of Sacrifice
				114039, -- Hand of Purity
			},
			PRIEST = { 
				6788, -- Weakened Soul
				41635, -- Prayer of Mending
				139, -- Renew
				17, -- Power Word: Shield
				33206, -- Pain Suppression
				47788, -- Guardian Spirit
			},
			ROGUE = {
				57934, -- Tricks of the Trade
			},
			SHAMAN = {
				974, -- Earth Shield
				61295, -- Riptide
			},
			WARLOCK = {
				20707, -- Soulstone Resurrection
			},
			WARRIOR = {
				114030, -- Vigilance
				3411, -- Intervene
			},
	}
	cfg.DebuffWatchList = {
		debuffs = {
-----------------------------------------------------------------------------------------------------------------------		
			--?? USAGE: [GetSpellInfo(SpelliD)] = PRIORITY, ??-- Best to use
			--OR--
			--?? USAGE: ["DEBUFF_NAME"] = PRIORITY, ??--
			--?? PRIORITY -> 10: high, 9: medium, 8: low, dispellable debuffs have standard priority of 5. ??--
------------------------------------------------------------------------------------------------------------------------
---------------------------CLASSES/PVP--------------------------------------------------------------------------------------
----------------------------------------------------------------------------			--------------------------------
			-- Death Knight
			[GetSpellInfo(115001)] = 3,	-- Remorseless Winter
			[GetSpellInfo(108194)] = 3,	-- Asphyxiate
			[GetSpellInfo(47476)] = 3,	-- Strangulate
			[GetSpellInfo(47481)] = 3,	-- Gnaw (Ghoul)
			[GetSpellInfo(91797)] = 3,	-- Monstrous Blow (Mutated Ghoul)
			--Druid
			[GetSpellInfo(33786)] = 3,	-- Cyclone
			--WoD[GetSpellInfo(2637)] = 3,	-- Hibernate
			[GetSpellInfo(339)] = 3,		-- Entangling Roots
			[GetSpellInfo(78675)] = 3,	-- Solar Beam
			-- Hunter
			[GetSpellInfo(3355)] = 3,	-- Freezing Trap
			[GetSpellInfo(117526)] = 3,	-- Binding Shot
			--WoD [GetSpellInfo(1513)] = 3,	-- Scare Beast
			--WoD[GetSpellInfo(19503)] = 3,	-- Scatter Shot
			--WoD[GetSpellInfo(34490)] = 3,	-- Silence Shot
			[GetSpellInfo(19386)] = 3,	-- Wyvern Sting

			-- Mage
			[GetSpellInfo(31661)] = 3,	-- Dragon's Breath
			[GetSpellInfo(82691)] = 3,	-- Ring of Frost
			[GetSpellInfo(61305)] = 3,	-- Polymorph
			[GetSpellInfo(102051)] = 3,	-- Frostjaw
			--WoD[GetSpellInfo(55021)] = 3,	-- Improved Counterspell
			[GetSpellInfo(122)] = 3,		-- Frost Nova
			[GetSpellInfo(111340)] = 3,	-- Ice Ward
			-- Monk
			[GetSpellInfo(115078)] = 3,	-- Paralysis
			-- Paladin
			[GetSpellInfo(20066)] = 3,	-- Repentance
			[GetSpellInfo(853)] = 3,	-- Hammer of Justice
			[GetSpellInfo(105593)] = 3,	-- Fist of Justice
			[GetSpellInfo(105421)] = 3,	-- Blinding Light
			[GetSpellInfo(25771)] = 10,	-- Forebance
			-- Priest
			[GetSpellInfo(605)] = 3,		-- Dominate Mind
			[GetSpellInfo(8122)] = 3,	-- Psychic Scream
			--WoD[GetSpellInfo(113792)] = 3,	-- Psychic Terror
			[GetSpellInfo(64044)] = 3,	-- Psychic Horror
			[GetSpellInfo(15487)] = 3,	-- Silence
			[GetSpellInfo(6788)] = 10,	-- Weaken Soul
			-- Rogue
			[GetSpellInfo(2094)] = 3,	-- Blind
			[GetSpellInfo(1776)] = 3,	-- Gouge
			[GetSpellInfo(6770)] = 3,	-- Sap
			-- Shaman
			[GetSpellInfo(51514)] = 3,	-- Hex
			[GetSpellInfo(118905)] = 3,	-- Static Charge
			[GetSpellInfo(3600)] = 3,	-- Earthbind
			[GetSpellInfo(8056)] = 3,	-- Frost Shock
			[GetSpellInfo(63685)] = 3,	-- Freeze
			-- Warlock
			[GetSpellInfo(118699)] = 3,	-- Fear
			--WoD[GetSpellInfo(104045)] = 3,	-- Sleep
			[GetSpellInfo(6789)] = 3,	-- Mortal Coil
			[GetSpellInfo(5484)] = 3,	-- Howl of Terror
			[GetSpellInfo(6358)] = 3,	-- Seduction (Succubus)
			[GetSpellInfo(115268)] = 3,	-- Mesmerize (Shivarra)
			[GetSpellInfo(30283)] = 3,	-- Shadowfury
			-- Warrior
			[GetSpellInfo(46968)] = 3,	-- Shockwave
			--WoD[GetSpellInfo(20511)] = 3,	-- Intimidating Shout
	-- Racial
		[GetSpellInfo(25046)] = 3, --Arcane Torrent
		[GetSpellInfo(20549)] = 3, --War Stomp

-----------------------------------------------------------------
-- Draenor
-----------------------------------------------------------------
-- Hellfire Citadel
	-- Hellfire Assault
	[GetSpellInfo(184369)] = 7, -- Howling Axe (target)
	[GetSpellInfo(180079)] = 4, -- Fellfire Munition
	-- Fel Reaver
	[GetSpellInfo(179897)] = 6, -- Blitz
	[GetSpellInfo(185978)] = 7, -- Firebomb Vulnerability
	[GetSpellInfo(182373)] = 4, -- Firebomb Vulnerability
	[GetSpellInfo(182280)] = 8, -- Artillery
	[GetSpellInfo(182074)] = 3, -- Immolation, Unstable Orb
	[GetSpellInfo(182001)] = 3, -- Immolation, Unstable Orb
	-- Gorefiend
	[GetSpellInfo(179867)] = 3, -- Gorefiend's Corruption
	[GetSpellInfo(181295)] = 4, -- Digest
	[GetSpellInfo(179977)] = 8, -- Touch of Doom
	[GetSpellInfo(179864)] = 6, -- Shadow of Death
	[GetSpellInfo(179909)] = 9, -- Shared Fate (rooted player)
	[GetSpellInfo(179908)] = 8, -- Shared Fate (other players)
	-- Kilrogg Deadeye
	[GetSpellInfo(181488)] = 3, -- Vision of Death
	[GetSpellInfo(188929)] = 7, -- Heart Seeker (target)
	[GetSpellInfo(180389)] = 4, -- Heart Seeker (dot)
	-- Socrethar
	[GetSpellInfo(182038)] = 3, -- Shattered Defense
	[GetSpellInfo(188666)] = 7, -- Eternal Hunger (mythic add fixate)
	[GetSpellInfo(189627)] = 7, -- Volatile Fel Orb (fixate)
	[GetSpellInfo(180415)] = 4, -- Fel Prison
	-- Xhul'horac
	[GetSpellInfo(188208)] = 7, -- Ablaze
	[GetSpellInfo(186073)] = 7, -- Felsinged
	[GetSpellInfo(186407)] = 8, -- Fel Surge
	[GetSpellInfo(186500)] = 9, -- Chains of Fel
	[GetSpellInfo(186063)] = 7, -- Wasting Void
	[GetSpellInfo(186333)] = 8, -- Void Surge
	-- Fel Lord Zakuun
	[GetSpellInfo(181508)] = 9, -- Seed of Destruction
	[GetSpellInfo(181653)] = 7, -- Fel Crystals (too close)
	[GetSpellInfo(179428)] = 8, -- Rumbling Fissure (soak)
	[GetSpellInfo(182008)] = 3, -- Latent Energy (can't soak anymore)
	[GetSpellInfo(179407)] = 6, -- Disembodied (in shadow realm)
	-- Kormrok
	[GetSpellInfo(187819)] = 7, -- Hands
	[GetSpellInfo(181345)] = 7, -- Hand (tank)
	-- Tyrant Velhari
	[GetSpellInfo(185237)] = 6, -- Touch of Harm
	[GetSpellInfo(185238)] = 6, -- Touch of Harm
	[GetSpellInfo(185241)] = 7, -- Edict of Condemnation
	[GetSpellInfo(180526)] = 7, -- Font of Corruption
	-- Shadow-Lord Iskar
	[GetSpellInfo(181957)] = 9, -- Phantasmal Wind
	[GetSpellInfo(182200)] = 4, -- Fel Chakram
	[GetSpellInfo(182178)] = 4, -- Fel Chakram
	[GetSpellInfo(182325)] = 2, -- Phantasmal Wounds
	[GetSpellInfo(179202)] = 1, -- Eye Of Anzu (holding)
	[GetSpellInfo(185239)] = 1, -- Radiance of Anzu
	[GetSpellInfo(185510)] = 3, -- Dark Bindings
	[GetSpellInfo(182600)] = 2, -- Fel Fire (standing in puddle)
	[GetSpellInfo(185747)] = 2, -- Fel Beam Fixate (fixate)
	[GetSpellInfo(179219)] = 3, -- Fel Bomb
	[GetSpellInfo(181753)] = 3, -- Fel Bomb
	-- Mannoroth
	[GetSpellInfo(181275)] = 8, -- Curse of Legion
	[GetSpellInfo(181099)] = 7, -- Mark of Doom
	[GetSpellInfo(181597)] = 4, -- Mannoroths Gaze
	[GetSpellInfo(182006)] = 4, -- Mannoroths Gaze
	[GetSpellInfo(181841)] = 6, -- Shadowforce
	[GetSpellInfo(182088)] = 6, -- Shadowforce
	-- Hellfire Council
	[GetSpellInfo(184360)] = 7, -- Fel Rage
	[GetSpellInfo(184449)] = 5, -- Mark of Necromancer
	[GetSpellInfo(185065)] = 5, -- Mark of Necromancer
	[GetSpellInfo(184450)] = 5, -- Mark of Necromancer
	[GetSpellInfo(185066)] = 5, -- Mark of Necromancer
	[GetSpellInfo(184676)] = 5, -- Mark of Necromancer
	[GetSpellInfo(184652)] = 3, -- Reap
	-- Archimonde
	[GetSpellInfo(184964)] = 7, -- Shackled Torment
	[GetSpellInfo(186123)] = 6, -- Focused Chaos
	[GetSpellInfo(185014)] = 6, -- Wrought Chaos
	[GetSpellInfo(186952)] = 8, -- Nether Banish
	[GetSpellInfo(189891)] = 8, -- Nether Banish
	[GetSpellInfo(186961)] = 8, -- Nether Banish
	[GetSpellInfo(183634)] = 7, -- Shadowfel Burst
	[GetSpellInfo(189895)] = 6, -- Void Star Fixate
	[GetSpellInfo(190049)] = 4, -- Nether Corruption
	
-- Blackrock Foundry
	--Gruul
	[GetSpellInfo(155080)] = 4, -- Inferno Slice
	[GetSpellInfo(155078)] = 3, -- Overwhelming Blows
	[GetSpellInfo(162322)] = 5, -- Inferno Strike
	[GetSpellInfo(155506)] = 2, -- Petrified

	--Oregorger
	[GetSpellInfo(156203)] = 5, -- Retched Blackrock
	[GetSpellInfo(156374)] = 5, -- Explosive Shard
	[GetSpellInfo(156297)] = 3, -- Acid Torrent
	[GetSpellInfo(173471)] = 4, -- Acid Maw
	[GetSpellInfo(155900)] = 2, -- Rolling Fury

	--Blast Furnace
	[GetSpellInfo(156932)] = 5, -- Rupture
	[GetSpellInfo(178279)] = 4, -- Bomb
	[GetSpellInfo(155192)] = 4, -- Bomb
	[GetSpellInfo(176121)] = 6, -- Volatile Fire
	[GetSpellInfo(155196)] = 2, -- Fixate
	[GetSpellInfo(155743)] = 5, -- Slag Pool
	[GetSpellInfo(155240)] = 3, -- Tempered
	[GetSpellInfo(155242)] = 3, -- Heat
	[GetSpellInfo(155225)] = 5, -- Melt
	[GetSpellInfo(155223)] = 5, -- Melt

	--Hans'gar and Franzok
	[GetSpellInfo(157139)] = 3, -- Shattered Vertebrae
	[GetSpellInfo(160838)] = 2, -- Disrupting Roar
	[GetSpellInfo(160845)] = 2, -- Disrupting Roar
	[GetSpellInfo(160847)] = 2, -- Disrupting Roar
	[GetSpellInfo(160848)] = 2, -- Disrupting Roar
	[GetSpellInfo(155818)] = 4, -- Scorching Burns

	--Flamebender Ka'graz
	[GetSpellInfo(154952)] = 3, -- Fixate
	[GetSpellInfo(155074)] = 1, -- Charring Breath
	[GetSpellInfo(155049)] = 2, -- Singe
	[GetSpellInfo(154932)] = 4, -- Molten Torrent
	[GetSpellInfo(155277)] = 5, -- Blazing Radiance
	[GetSpellInfo(155314)] = 1, -- Lava Slash
	[GetSpellInfo(163284)] = 2, -- Rising Flames

	-- Kromog
	[GetSpellInfo(156766)] = 1, -- Warped Armor
	[GetSpellInfo(157059)] = 2, -- Rune of Grasping Earth
	[GetSpellInfo(161839)] = 3, -- Rune of Crushing Earth
	[GetSpellInfo(161923)] = 3, -- Rune of Crushing Earth

	-- Beastlord Darmac
	[GetSpellInfo(154960)] = 4, -- Pinned Down
	[GetSpellInfo(155061)] = 1, -- Rend and Tear
	[GetSpellInfo(162283)] = 1, -- Rend and Tear
	[GetSpellInfo(154989)] = 3, -- Inferno Breath
	[GetSpellInfo(154981)] = 5, -- Conflagration
	[GetSpellInfo(155030)] = 2, -- Seared Flesh
	[GetSpellInfo(155236)] = 2, -- Crush Armor
	[GetSpellInfo(155499)] = 3, -- Superheated Shrapnel
	[GetSpellInfo(155657)] = 4, -- Flame Infusion
	[GetSpellInfo(159044)] = 1, -- Epicenter
	[GetSpellInfo(162277)] = 1, -- Epicenter

	-- Operator Thogar
	[GetSpellInfo(155921)] = 2, -- Enkindle
	[GetSpellInfo(165195)] = 4, -- Prototype Pulse Grenade
	[GetSpellInfo(156310)] = 3, -- Lava Shock
	[GetSpellInfo(159481)] = 3, -- Delayed Siege Bomb
	[GetSpellInfo(164380)] = 2, -- Burning
	[GetSpellInfo(164280)] = 2, -- Heat Blast

	-- Iron Maidens
	[GetSpellInfo(156631)] = 2, -- Rapid Fire
	[GetSpellInfo(164271)] = 3, -- Penetrating Shot
	[GetSpellInfo(158601)] = 1, -- Dominator Blast
	[GetSpellInfo(156214)] = 4, -- Convulsive Shadows
	[GetSpellInfo(158315)] = 2, -- Dark Hunt
	[GetSpellInfo(159724)] = 3, -- Blood Ritual
	[GetSpellInfo(158010)] = 2, -- Bloodsoaked Heartseeker
	[GetSpellInfo(158692)] = 1, -- Deadly Throw
	[GetSpellInfo(158702)] = 2, -- Fixate
	[GetSpellInfo(158683)] = 3, -- Corrupted Blood

	-- Warlord Blackhand
	[GetSpellInfo(156096)] = 5, -- Marked for Death
   	
-- Highmaul
	-- Kargath Bladefist
	[GetSpellInfo(158986)] = 2, -- Berserker Rush
	[GetSpellInfo(159178)] = 5, -- Open Wounds
	[GetSpellInfo(162497)] = 3, -- On the Hunt
	[GetSpellInfo(163130)] = 3, -- Inflamed

	-- The Butcher
	[GetSpellInfo(156151)] = 3, -- The Tenderizer
	[GetSpellInfo(156147)] = 5, -- The Cleaver
	[GetSpellInfo(156152)] = 3, -- Gushing Wounds 
	[GetSpellInfo(163046)] = 4, -- Pale Vitriol

	-- Tectus
	[GetSpellInfo(162346)] = 4, -- crystalline barrage
	[GetSpellInfo(162370)] = 3, -- Crystalline Barrage

	-- Brackenspore
	[GetSpellInfo(163242)] = 5, -- Infesting Spores
	[GetSpellInfo(159426)] = 5, -- Rejuvenating Spores
	[GetSpellInfo(163241)] = 4, -- Rot
	[GetSpellInfo(159220)] = 2, -- Necrotic Breath
	[GetSpellInfo(160179)] = 2, -- Mind Fungus
	[GetSpellInfo(165223)] = 6, -- Burning Infusion
	[GetSpellInfo(163666)] = 3, -- Pulsing Heat

	-- Twin Ogron
	[GetSpellInfo(155569)] = 3, -- Injured
	[GetSpellInfo(158241)] = 4, -- Blaze
	[GetSpellInfo(163372)] = 4, -- Arcane Volatility
	[GetSpellInfo(167200)] = 3, -- Arcane Wound
	[GetSpellInfo(163297)] = 3, -- Arcane Twisted

	-- Koragh
	[GetSpellInfo(172813)] = 5, -- Expel Magic: Frost
	[GetSpellInfo(162185)] = 5, -- Expel Magic: Fire
	[GetSpellInfo(162184)] = 3, -- Expel Magic: Shadow
	[GetSpellInfo(162186)] = 2, -- Expel Magic: Arcane
	[GetSpellInfo(161345)] = 2, -- Suppression Field
	[GetSpellInfo(161242)] = 3, -- Caustic Energy
	[GetSpellInfo(172886)] = 4, -- Mark of Nullification
	[GetSpellInfo(172895)] = 4, -- Expel Magic: Fel
	[GetSpellInfo(172917)] = 4, -- Expel Magic: Fel
	[GetSpellInfo(163472)] = 2, -- Dominating Power

	-- Imperator Mar'gok
	[GetSpellInfo(157763)] = 3,  -- Fixate  
	[GetSpellInfo(159515)] = 4, -- Accelerated Assault       
	[GetSpellInfo(156225)] = 4, -- Branded
	[GetSpellInfo(164004)] = 4, -- Branded: Displacement
	[GetSpellInfo(164006)] = 4, -- Branded: Replication
	[GetSpellInfo(164005)] = 4, -- Branded: Fortification
	[GetSpellInfo(158605)] = 2, -- Mark of Chaos
	[GetSpellInfo(164176)] = 2, -- Mark of Chaos: Displacement
	[GetSpellInfo(164178)] = 2, -- Mark of Chaos: Fortification
	[GetSpellInfo(164191)] = 2, -- Mark of Chaos: Replication

-----------------------------------------------------------------
-- Pandaria
-----------------------------------------------------------------
-- Siege of Orgrimmar
	-- Immerseus
	[GetSpellInfo(143436)] = 3,	-- Corrosive Blast (Tank switch)
	-- The Fallen Protectors
	[GetSpellInfo(143434)] = 4,	-- Shadow Word: Bane (Dispel)
	[GetSpellInfo(143198)] = 3,	-- Garrote (DoT)
	[GetSpellInfo(143842)] = 5,	-- Mark of Anguish
	[GetSpellInfo(147383)] = 3,	-- Debilitation
	-- Norushen
	[GetSpellInfo(146124)] = 4,	-- Self Doubt (Tank switch)
	[GetSpellInfo(144514)] = 3,	-- Lingering Corruption (Dispel)
	-- Sha of Pride
	[GetSpellInfo(144358)] = 4,	-- Wounded Pride (Tank switch)
	[GetSpellInfo(144351)] = 3,	-- Mark of Arrogance (Dispel)
	[GetSpellInfo(146594)] = 3,	-- Gift of the Titans
	[GetSpellInfo(147207)] = 3,	-- Weakened Resolve (Heroic)
	-- Galakras
	[GetSpellInfo(147029)] = 3,	-- Flames of Galakrond (DoT)
	[GetSpellInfo(146902)] = 3,	-- Poison-Tipped Blades (Poison stacks)
	-- Iron Juggernaut
	[GetSpellInfo(144467)] = 4,	-- Ignite Armor (Tank stacks)
	[GetSpellInfo(144459)] = 3,	-- Laser Burn (DoT)
	-- Kor'kron Dark Shaman
	[GetSpellInfo(144215)] = 3,	-- Froststorm Strike (Tank stacks)
	[GetSpellInfo(144089)] = 3,	-- Toxic Mist (DoT)
	[GetSpellInfo(144330)] = 3,	-- Iron Prison (Heroic)
	-- General Nazgrim
	[GetSpellInfo(143494)] = 3,	-- Sundering Blow (Tank stacks)
	[GetSpellInfo(143638)] = 3,	-- Bonecracker (DoT)
	[GetSpellInfo(143431)] = 3,	-- Magistrike (Dispel)
	[GetSpellInfo(143480)] = 3,	-- Assassin's Mark (Fixate)
	-- Malkorok
	[GetSpellInfo(142990)] = 4,	-- Fatal Strike (Tank stacks)
	[GetSpellInfo(142864)] = 3,	-- Ancient Barrier
	[GetSpellInfo(142865)] = 3,	-- Strong Ancient Barrier
	[GetSpellInfo(142913)] = 4,	-- Displaced Energy (Dispel)
	-- Spoils of Pandaria
	[GetSpellInfo(145218)] = 3,	-- Harden Flesh (Dispel)
	[GetSpellInfo(146235)] = 3,	-- Breath of Fire (Dispel)
	-- Thok the Bloodthirsty
	[GetSpellInfo(143766)] = 3,	-- Panic (Tank stacks)
	[GetSpellInfo(143780)] = 3,	-- Acid Breath (Tank stacks)
	[GetSpellInfo(143773)] = 3,	-- Freezing Breath (Tank Stacks)
	[GetSpellInfo(143800)] = 3,	-- Icy Blood (Random Stacks)
	[GetSpellInfo(143767)] = 3,	-- Scorching Breath (Tank Stacks)
	[GetSpellInfo(143791)] = 3,	-- Corrosive Blood (Dispel)
	-- Siegecrafter Blackfuse
	[GetSpellInfo(143385)] = 3,	-- Electrostatic Charge (Tank stacks)
	[GetSpellInfo(144236)] = 3,	-- Pattern Recognition
	-- Paragons of the Klaxxi
	[GetSpellInfo(143974)] = 4,	-- Shield Bash (Tank stun)
	[GetSpellInfo(142315)] = 4,	-- Caustic Blood (Tank stacks)
	[GetSpellInfo(143701)] = 3,	-- Whirling (DoT)
	[GetSpellInfo(142948)] = 3,	-- Aim
	-- Garrosh Hellscream
	[GetSpellInfo(145183)] = 3,	-- Gripping Despair (Tank stacks)
	[GetSpellInfo(145195)] = 3,	-- Empowered Gripping Despair (Tank stacks)
	[GetSpellInfo(145065)] = 3,	-- Touch of Y'Shaarj
	[GetSpellInfo(145171)] = 3,	-- Empowered Touch of Y'Shaarj
-- Throne of Thunder
	-- Jin'rokh the Breaker
	[GetSpellInfo(137162)] = 4,	-- Static Burst (Tank switch)
	[GetSpellInfo(138349)] = 3,	-- Static Wound (Tank stacks)
	[GetSpellInfo(137371)] = 4,	-- Thundering Throw (Tank stun)
	[GetSpellInfo(138732)] = 3,	-- Ionization (Heroic - Dispel)
	[GetSpellInfo(137422)] = 3,	-- Focused Lightning (Fixated - Kiting)
	-- Horridon
	[GetSpellInfo(136767)] = 3,	-- Triple Puncture (Tank stacks)
	[GetSpellInfo(136708)] = 4,	-- Stone Gaze (Stun - Dispel)
	[GetSpellInfo(136654)] = 3,	-- Rending Charge (DoT)
	[GetSpellInfo(136719)] = 3,	-- Blazing Sunlight (Dispel)
	[GetSpellInfo(136587)] = 3,	-- Venom Bolt Volley (Dispel)
	[GetSpellInfo(136710)] = 3,	-- Deadly Plague (Dispel)
	[GetSpellInfo(136512)] = 3,	-- Hex of Confusion (Dispel)
	-- Council of Elders
	[GetSpellInfo(136903)] = 3,	-- Frigid Assault (Tank stacks)
	[GetSpellInfo(136922)] = 3,	-- Frostbite (DoT)
	[GetSpellInfo(136992)] = 3,	-- Biting Cold (DoT)
	[GetSpellInfo(136857)] = 4,	-- Entrapped (Dispel)
	[GetSpellInfo(137359)] = 3,	-- Marked Soul (Fixated - Kiting)
	[GetSpellInfo(137641)] = 3,	-- Soul Fragment (Heroic)
	-- Tortos
	[GetSpellInfo(136753)] = 3,	-- Slashing Talons (Tank DoT)
	[GetSpellInfo(137633)] = 3,	-- Crystal Shell (Heroic)
	[GetSpellInfo(140701)] = 4,	-- Crystal Shell: Full Capacity! (Heroic)
	-- Megaera
	[GetSpellInfo(137731)] = 3,	-- Ignite Flesh (Tank stacks)
	[GetSpellInfo(139843)] = 3,	-- Arctic Freeze (Tank stacks)
	[GetSpellInfo(139840)] = 3,	-- Rot Armor (Tank stacks)
	[GetSpellInfo(134391)] = 4,	-- Cinder (DoT - Dispell)
	[GetSpellInfo(139857)] = 4,	-- Torrent of Ice (Fixated - Kiting)
	[GetSpellInfo(140179)] = 4,	-- Suppression (Heroic - Dispell)
	-- Ji-Kun
	[GetSpellInfo(134366)] = 4,	-- Talon Rake (Tank stacks)
	[GetSpellInfo(140092)] = 3,	-- Infected Talons (Tank DoT)
	[GetSpellInfo(134256)] = 3,	-- Slimed (DoT)
	-- Durumu the Forgotten
	[GetSpellInfo(133768)] = 4,	-- Arterial Cut (Tank DoT)
	[GetSpellInfo(133767)] = 3,	-- Serious Wound (Tank stacks)
	[GetSpellInfo(133798)] = 3,	-- Life Drain (Stun)
	[GetSpellInfo(133597)] = 3,	-- Dark Parasite (Heroic - Dispel)
	-- Primordius
	[GetSpellInfo(136050)] = 3,	-- Malformed Blood (Tank stacks)
	[GetSpellInfo(136228)] = 4,	-- Volatile Pathogen (DoT)
	-- Dark Animus
	[GetSpellInfo(138569)] = 4,	-- Explosive Slam (Tank stacks)
	[GetSpellInfo(138609)] = 4,	-- Matter Swap (Dispel)
	[GetSpellInfo(138659)] = 3,	-- Touch of the Animus (DoT)
	-- Iron Qon
	[GetSpellInfo(134691)] = 3,	-- Impale (Tank stacks)
	[GetSpellInfo(136192)] = 4,	-- Lightning Storm (Stun)
	[GetSpellInfo(136193)] = 3,	-- Arcing Lightning
	-- Twin Consorts
	[GetSpellInfo(137408)] = 3,	-- Fan of Flames (Tank stacks)
	[GetSpellInfo(136722)] = 3,	-- Slumber Spores (Dispel)
	[GetSpellInfo(137341)] = 3,	-- Beast of Nightmares (Fixate)
	[GetSpellInfo(137360)] = 3,	-- Corrupted Healing (Healer stacks)
	-- Lei Shen
	[GetSpellInfo(135000)] = 3,	-- Decapitate (Tank only)
	[GetSpellInfo(136478)] = 3,	-- Fusion Slash (Tank only)
	[GetSpellInfo(136914)] = 3,	-- Electrical Shock (Tank staks)
	[GetSpellInfo(135695)] = 3,	-- Static Shock (Damage Split)
	[GetSpellInfo(136295)] = 3,	-- Overcharged
	[GetSpellInfo(139011)] = 3,	-- Helm of Command (Heroic)
	-- Ra-den
	[GetSpellInfo(138297)] = 3,	-- Unstable Vita
	[GetSpellInfo(138329)] = 3,	-- Unleashed Anima
	[GetSpellInfo(138372)] = 4,	-- Vita Sensitivity
-- Terrace of Endless Spring
	-- Protectors of the Endless
	[GetSpellInfo(117519)] = 3,	-- Touch of Sha
	[GetSpellInfo(117436)] = 4,	-- Lightning Prison
	-- Tsulong
	[GetSpellInfo(122752)] = 3,	-- Shadow Breath
	[GetSpellInfo(123011)] = 3,	-- Terrorize
	[GetSpellInfo(122777)] = 3,	-- Nightmares
	[GetSpellInfo(123036)] = 3,	-- Fright
	-- Lei Shi
	[GetSpellInfo(123121)] = 3,	-- Spray
	[GetSpellInfo(123705)] = 3,	-- Scary Fog
	-- Sha of Fear
	[GetSpellInfo(119086)] = 3,	-- Penetrating Bolt
	[GetSpellInfo(120669)] = 3,	-- Naked and Afraid
	[GetSpellInfo(120629)] = 3,	-- Huddle in Terror
-- Heart of Fear
	-- Imperial Vizier Zor'lok
	[GetSpellInfo(122761)] = 3,	-- Exhale
	[GetSpellInfo(122740)] = 3,	-- Convert
	-- Blade Lord Ta'yak
	[GetSpellInfo(123180)] = 3,	-- Wind Step
	[GetSpellInfo(123474)] = 3,	-- Overwhelming Assault
	-- Garalon
	[GetSpellInfo(122835)] = 3,	-- Pheromones
	[GetSpellInfo(123081)] = 4,	-- Pungency
	-- Wind Lord Mel'jarak
	[GetSpellInfo(129078)] = 4,	-- Amber Prison
	[GetSpellInfo(122055)] = 3,	-- Residue
	[GetSpellInfo(122064)] = 3,	-- Corrosive Resin
	[GetSpellInfo(123963)] = 4,	-- Kor'thik Strike
	-- Amber-Shaper Un'sok
	[GetSpellInfo(121949)] = 3,	-- Parasitic Growth
	[GetSpellInfo(122370)] = 3,	-- Reshape Life
	-- Grand Empress Shek'zeer
	[GetSpellInfo(123707)] = 3,	-- Eyes of the Empress
	[GetSpellInfo(123713)] = 3,	-- Servant of the Empress
	[GetSpellInfo(123788)] = 3,	-- Cry of Terror
	[GetSpellInfo(124849)] = 3,	-- Consuming Terror
	[GetSpellInfo(124863)] = 3,	-- Visions of Demise
-- Mogu'shan Vaults
	-- The Stone Guard
	[GetSpellInfo(125206)] = 3,	-- Rend Flesh
	[GetSpellInfo(130395)] = 3,	-- Jasper Chains
	[GetSpellInfo(116281)] = 3,	-- Cobalt Mine Blast
	-- Feng the Accursed
	[GetSpellInfo(131788)] = 3,	-- Lightning Lash
	[GetSpellInfo(116942)] = 3,	-- Flaming Spear
	[GetSpellInfo(131790)] = 3,	-- Arcane Shock
	[GetSpellInfo(131792)] = 3,	-- Shadowburn
	[GetSpellInfo(116374)] = 4,	-- Lightning Charge
	[GetSpellInfo(116784)] = 3,	-- Wildfire Spark
	[GetSpellInfo(116417)] = 3,	-- Arcane Resonance
	-- Gara'jal the Spiritbinder
	[GetSpellInfo(122151)] = 4,	-- Voodoo Doll
	[GetSpellInfo(116161)] = 3,	-- Crossed Over
	[GetSpellInfo(117723)] = 3,	-- Frail Soul
	-- The Spirit Kings
	[GetSpellInfo(117708)] = 3,	-- Maddening Shout
	[GetSpellInfo(118303)] = 3,	-- Fixate
	[GetSpellInfo(118048)] = 3,	-- Pillaged
	[GetSpellInfo(118135)] = 3,	-- Pinned Down
	[GetSpellInfo(118163)] = 3,	-- Robbed Blind
	-- Elegon
	[GetSpellInfo(117878)] = 3,	-- Overcharged
	[GetSpellInfo(117949)] = 3,	-- Closed Circuit
	[GetSpellInfo(132222)] = 3,	-- Destabilizing Energies
	-- Will of the Emperor
	[GetSpellInfo(116835)] = 3,	-- Devastating Arc
	[GetSpellInfo(116778)] = 3,	-- Focused Defense
	[GetSpellInfo(116525)] = 3,	-- Focused Assault
-- Sha of Anger
	[GetSpellInfo(119626)] = 3,	-- Aggressive Behavior
-- Other
	[GetSpellInfo(87023)] = 4,		-- Cauterize
	[GetSpellInfo(94794)] = 4,		-- Rocket Fuel Leak
	[GetSpellInfo(116888)] = 4,	-- Shroud of Purgatory
	[GetSpellInfo(121175)] = 2,	-- Orb of Power
-----------------------------------------------------------------
-- PvP
-----------------------------------------------------------------
		-- Death Knight
		[GetSpellInfo(115001)] = 3,	-- Remorseless Winter
		[GetSpellInfo(108194)] = 3,	-- Asphyxiate
		[GetSpellInfo(91797)] = 3,	-- Monstrous Blow (Mutated Ghoul)
		[GetSpellInfo(91800)] = 3,	-- Gnaw (Ghoul)
		[GetSpellInfo(47476)] = 3,	-- Strangulate
		-- Druid
		[GetSpellInfo(33786)] = 3,	-- Cyclone
		[GetSpellInfo(339)] = 2,	-- Entangling Roots
		[GetSpellInfo(78675)] = 3,	-- Solar Beam
		-- Hunter
		[GetSpellInfo(3355)] = 3,	-- Freezing Trap
		[GetSpellInfo(19386)] = 3,	-- Wyvern Sting
		[GetSpellInfo(117526)] = 3,	-- Binding Shot
		[GetSpellInfo(24394)] = 3,	-- Intimidation
		-- Mage
		[GetSpellInfo(61305)] = 3,	-- Polymorph
		[GetSpellInfo(82691)] = 3,	-- Ring of Frost
		[GetSpellInfo(44572)] = 3,	-- Deep Freeze
		[GetSpellInfo(31661)] = 3,	-- Dragon's Breath
		[GetSpellInfo(102051)] = 3,	-- Frostjaw
		[GetSpellInfo(122)] = 2,	-- Frost Nova
		[GetSpellInfo(111340)] = 2,	-- Ice Ward
		-- Monk
		[GetSpellInfo(115078)] = 3,	-- Paralysis
		[GetSpellInfo(119381)] = 3,	-- Leg Sweep
		-- Paladin
		[GetSpellInfo(20066)] = 3,	-- Repentance
		[GetSpellInfo(853)] = 3,	-- Hammer of Justice
		[GetSpellInfo(105593)] = 3,	-- Fist of Justice
		[GetSpellInfo(105421)] = 3,	-- Blinding Light
		-- Priest
		[GetSpellInfo(605)] = 3,	-- Dominate Mind
		[GetSpellInfo(8122)] = 3,	-- Psychic Scream
		[GetSpellInfo(64044)] = 3,	-- Psychic Horror
		[GetSpellInfo(15487)] = 3,	-- Silence
		-- Rogue
		[GetSpellInfo(6770)] = 3,	-- Sap
		[GetSpellInfo(2094)] = 3,	-- Blind
		[GetSpellInfo(1776)] = 3,	-- Gouge
		-- Shaman
		[GetSpellInfo(51514)] = 3,	-- Hex
		[GetSpellInfo(118905)] = 3,	-- Static Charge
		[GetSpellInfo(63685)] = 2,	-- Frozen Power
		-- Warlock
		[GetSpellInfo(118699)] = 3,	-- Fear
		[GetSpellInfo(6789)] = 3,	-- Mortal Coil
		[GetSpellInfo(5484)] = 3,	-- Howl of Terror
		[GetSpellInfo(6358)] = 3,	-- Seduction (Succubus)
		[GetSpellInfo(115268)] = 3,	-- Mesmerize (Shivarra)
		[GetSpellInfo(30283)] = 3,	-- Shadowfury
		-- Warrior
		[GetSpellInfo(46968)] = 3,	-- Shockwave
		[GetSpellInfo(132169)] = 3,	-- Storm Bolt
		[GetSpellInfo(194958)] = 3,	-- Intimidating Shout
		},
	}



cfg.spec = nil
cfg.updateSpec = function()
	cfg.spec = GetSpecialization()
end
------------------------------------------------------------------

--Hand it over :)	
ns.cfg = cfg
