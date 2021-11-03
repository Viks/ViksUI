local T, C, L, _ = unpack(select(2, ...))

-- Spells lists initialization
C.filger.buff_spells_list = {}
C.filger.proc_spells_list = {}
C.filger.debuff_spells_list = {}
C.filger.aura_bar_spells_list = {}
C.filger.cd_spells_list = {}
C.filger.ignore_spells_list = {}
C.unitframe.plugins_aura_watch_list = {}
C.announcements.spells_list = {}
C.raidcooldown.spells_list = {}
C.raidcooldown.spells_list_ver = 1
C.enemycooldown.spells_list = {}
C.enemycooldown.spells_list_ver = 1
C.nameplate.debuffs_list = {}
C.nameplate.buffs_list = {}
C.chat.spam_list = ""
C.font.global_font = false
C.media.profile = "-- Insert Your code here\n"
C.options = {}

if not IsAddOnLoaded("Viks_ConfigUI") then return end

----------------------------------------------------------------------------------------
--	This Module loads new user settings if Viks_ConfigUI is loaded
----------------------------------------------------------------------------------------
-- Сreate the profile boolean
if not ViksUIOptionsGlobal then ViksUIOptionsGlobal = {} end
if ViksUIOptionsGlobal[T.realm] == nil then ViksUIOptionsGlobal[T.realm] = {} end
if ViksUIOptionsGlobal[T.realm][T.name] == nil then ViksUIOptionsGlobal[T.realm][T.name] = false end

-- Сreate the main options table
if ViksUIOptions == nil then ViksUIOptions = {} end

-- Determine which settings to use
local profile
if ViksUIOptionsGlobal[T.realm][T.name] == true then
	if ViksUIOptionsPerChar == nil then
		ViksUIOptionsPerChar = {}
	end
	profile = ViksUIOptionsPerChar
else
	profile = ViksUIOptions
end

-- Apply or remove saved settings as needed
for group, options in pairs(profile) do
	if C[group] then
		for option, value in pairs(options) do
			if C[group][option] == nil or C[group][option] == value then
				-- remove saved vars if they do not exist in lua config anymore, or are the same as the lua config
				profile[group][option] = nil
			else
				C[group][option] = value
			end
		end
	else
		profile[group] = nil
	end
end

-- Add global options variable
C.options = profile

-- Load edited profile code
loadstring("local T, C, L = unpack(ViksUI)\n"..C["media"].profile)()