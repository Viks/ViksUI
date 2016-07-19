local T, C, L, _ = unpack(select(2, ...))
if C.unitframe.enable ~= true or C.unitframe.show_arena ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Cyclone -> http://www.wowhead.com/spell=33786
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
local function SpellName(id)
	local name = GetSpellInfo(id)
	if name then
		return name
	else
		print("|cffff0000WARNING: spell ID ["..tostring(id).."] no longer exists! Report this to Viks.|r")
		return "Empty"
	end
end

T.ArenaControl = {
	-- Crowd Controls
	-- Death Knight
	[SpellName(91800)] = 5,		-- Gnaw (Ghoul)
	[SpellName(91797)] = 5,		-- Monstrous Blow (Mutated Ghoul)
	[SpellName(108194)] = 5,	-- Asphyxiate
	--BETA [SpellName(115001)] = 5,	-- Remorseless Winter
	-- Druid
	[SpellName(33786)] = 5,		-- Cyclone
	[SpellName(5211)] = 5,		-- Mighty Bash
	[SpellName(22570)] = 5,		-- Maim
	[SpellName(99)] = 5,		-- Incapacitating Roar
	-- Hunter
	[SpellName(3355)] = 5,		-- Freezing Trap
	[SpellName(19386)] = 5,		-- Wyvern Sting
	[SpellName(117526)] = 5,	-- Binding Shot
	[SpellName(24394)] = 5,		-- Intimidation
	-- Mage
	[SpellName(118)] = 5,		-- Polymorph
	--BETA [SpellName(44572)] = 5,	-- Deep Freeze
	[SpellName(82691)] = 5,		-- Ring of Frost
	[SpellName(31661)] = 5,		-- Dragon's Breath
	-- Monk
	[SpellName(115078)] = 5,	-- Paralysis
	[SpellName(119381)] = 5,	-- Leg Sweep
	[SpellName(120086)] = 5,	-- Fists of Fury
	-- BETA [SpellName(119392)] = 5,	-- Charging Ox Wave
	-- Paladin
	[SpellName(853)] = 5,		-- Hammer of Justice
	-- BETA [SpellName(105593)] = 5,	-- Fist of Justice
	[SpellName(20066)] = 5,		-- Repentance
	[SpellName(105421)] = 5,	-- Blinding Light
	[SpellName(145067)] = 5,	-- Turn Evil
	-- Priest
	[SpellName(605)] = 5,		-- Dominate Mind
	[SpellName(8122)] = 5,		-- Psychic Scream
	[SpellName(64044)] = 5,		-- Psychic Horror
	[SpellName(87204)] = 5,		-- Sin and Punishment
	-- Rogue
	[SpellName(6770)] = 5,		-- Sap
	[SpellName(2094)] = 5,		-- Blind
	[SpellName(408)] = 5,		-- Kidney Shot
	[SpellName(1833)] = 5,		-- Cheap Shot
	[SpellName(1776)] = 5,		-- Gouge
	-- Shaman
	[SpellName(51514)] = 5,		-- Hex
	[SpellName(118905)] = 5,	-- Static Charge
	[SpellName(118345)] = 5,	-- Pulverize (Earth Elemental)
	-- Warlock
	[SpellName(118699)] = 5,	-- Fear
	[SpellName(30283)] = 5,		-- Shadowfury
	-- BETA [SpellName(137143)] = 5,	-- Blood Horror
	[SpellName(89766)] = 5,		-- Axe Toss (Felguard)
	[SpellName(5484)] = 5,		-- Howl of Terror
	[SpellName(6789)] = 5,		-- Mortal Coil
	[SpellName(6358)] = 5,		-- Seduction (Succubus)
	[SpellName(115268)] = 5,	-- Mesmerize (Shivarra)
	[SpellName(171156)] = 5,	-- Meteor Strike (Abyssal)
	-- Warrior
	[SpellName(132169)] = 5,	-- Storm Bolt
	[SpellName(132168)] = 5,	-- Shockwave
	[SpellName(5246)] = 5,		-- Intimidating Shout
	-- Racial
	[SpellName(107079)] = 5,	-- Quaking Palm
	[SpellName(20549)] = 5,		-- War Stomp

	-- Silences
	[SpellName(47476)] = 4,		-- Strangulate
	[SpellName(81261)] = 4,		-- Solar Beam
	--BETA [SpellName(114238)] = 4,	-- Fae Silence
	-- BETA [SpellName(102051)] = 4,	-- Frostjaw
	[SpellName(31935)] = 4,		-- Avenger's Shield
	[SpellName(15487)] = 4,		-- Silence
	[SpellName(1330)] = 4,		-- Garrote - Silence
	[SpellName(28730)] = 4,		-- Arcane Torrent

	-- Roots
	[SpellName(96294)] = 3,		-- Chains of Ice
	[SpellName(339)] = 3,		-- Entangling Roots
	[SpellName(102359)] = 3,	-- Mass Entanglement
	[SpellName(45334)] = 3,		-- Immobilized
	[SpellName(135373)] = 3,	-- Entrapment
	[SpellName(136634)] = 3,	-- Narrow Escape
	[SpellName(122)] = 3,		-- Frost Nova
	[SpellName(33395)] = 3,		-- Freeze (Water Elemental)
	--BETA [SpellName(111340)] = 3,	-- Ice Ward
	[SpellName(116706)] = 3,	-- Disable
	--BETA [SpellName(87194)] = 3,	-- Glyph of Mind Blast
	[SpellName(114404)] = 3,	-- Void Tendril's Grasp
	--BETA [SpellName(63685)] = 3,	-- Frozen Power
	[SpellName(64695)] = 3,		-- Earthgrab
	[SpellName(170996)] = 3,	-- Debilitate (Terrorguard)
	[SpellName(107566)] = 3,	-- Staggering Shout

	-- Immunities
	[SpellName(19263)] = 2,		-- Deterrence
	[SpellName(45438)] = 2,		-- Ice Block
	[SpellName(642)] = 2,		-- Divine Shield
	[SpellName(46924)] = 2,		-- Bladestorm

	-- Buffs
	[SpellName(1022)] = 1,		-- Hand of Protection
	[SpellName(6940)] = 1,		-- Hand of Sacrifice
	[SpellName(1044)] = 1,		-- Hand of Freedom
	[SpellName(31821)] = 1,		-- Devotion Aura
	[SpellName(33206)] = 1,		-- Pain Suppression
	[SpellName(8178)] = 1,		-- Grounding Totem

	-- Defense abilities
	[SpellName(48707)] = 1,		-- Anti-Magic Shell
	[SpellName(48792)] = 1,		-- Icebound Fortitude
	[SpellName(31224)] = 1,		-- Cloak of Shadows
	[SpellName(871)] = 1,		-- Shield Wall
	[SpellName(118038)] = 1,	-- Die by the Sword
}