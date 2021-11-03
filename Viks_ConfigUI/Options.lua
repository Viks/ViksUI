local T, C
local _, ns = ...
local L = ns

----------------------------------------------------------------------------------------
--	GUI for ViksUI(by Haleth, Solor)
----------------------------------------------------------------------------------------
local realm = GetRealmName()
local name = UnitName("player")

-- Main window
local options = CreateFrame("Frame", "ViksUIOptionsPanel", UIParent)
options:SetSize(800, 770)
options:SetPoint("CENTER")
options:SetFrameStrata("HIGH")
options:EnableMouse(true)
tinsert(UISpecialFrames, options:GetName())

local CloseButton = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
CloseButton:SetPoint("TOPRIGHT", options, "BOTTOMRIGHT", -10, 30)
CloseButton:SetSize(100, 23)
CloseButton:SetText(CLOSE)
CloseButton:SetScript("OnClick", function()
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION)
	options:Hide()
end)

local OkayButton = CreateFrame("Button", "ViksUIOptionsPanelOkayButton", options, "UIPanelButtonTemplate")
OkayButton:SetPoint("RIGHT", CloseButton, "LEFT", -4, 0)
OkayButton:SetSize(100, 23)
OkayButton:SetText(APPLY)
OkayButton:SetScript("OnClick", function()
	ReloadUI()
end)
OkayButton:Disable()

tinsert(ns.buttons, CloseButton)
tinsert(ns.buttons, OkayButton)

local ProfileBox = CreateFrame("CheckButton", nil, options, "InterfaceOptionsCheckButtonTemplate")
ProfileBox:SetPoint("TOPRIGHT", -6, -6)

local label = ProfileBox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
label:SetText(L_GUI_SET_SAVED_SETTTINGS)
label:SetPoint("RIGHT", ProfileBox, "LEFT")

ProfileBox.tooltipText = L_GUI_SET_SAVED_SETTTINGS_DESC
options.ProfileBox = ProfileBox

local reloadText = options:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
reloadText:SetPoint("BOTTOM", 0, 11)
reloadText:SetText("|cffff2735"..L_GUI_NEED_RELOAD.."|r")
reloadText:Hide()
options.reloadText = reloadText

StaticPopupDialogs.VIKSUI_RESET_PERCHAR = {
	text = L_GUI_RESET_CHAR,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		ViksUIOptionsPerChar = {}
		C.options = ViksUIOptionsPerChar
		ReloadUI()
	end,
	whileDead = true,
	hideOnEscape = true,
}

StaticPopupDialogs.VIKSUI_RESET = {
	text = L_GUI_RESET_ALL,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		ViksUIOptions = {}
		C.options = ViksUIOptions
		ReloadUI()
	end,
	whileDead = true,
	hideOnEscape = true,
	showAlert = true,
}

StaticPopupDialogs.VIKSUI_RESET_CATEGORY = {
	text = L_GUI_RESET_CAT,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		if ViksUIOptionsPanelgeneral2:IsShown() then
			C.options.media = {}
			C.options.media.profile = C.media.profile
		else
			C.options[C.category] = {}
		end
		ReloadUI()
	end,
	whileDead = true,
	hideOnEscape = true,
}

local ResetButton = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
ResetButton:SetSize(100, 23)
ResetButton:SetText(DEFAULT)
ResetButton.tooltipText = "|cffFFD100"..L_GUI_RESET_CAT_DESC.."|r"
ResetButton:SetPoint("BOTTOMLEFT", ViksUIOptionsPanel, "BOTTOMLEFT", 10, 7)
ResetButton:SetScript("OnClick", function()
	if IsModifiedClick() then
		if ViksUIOptionsGlobal[realm][name] == true then
			StaticPopup_Show("VIKSUI_RESET_PERCHAR")
		else
			StaticPopup_Show("VIKSUI_RESET")
		end
	else
		StaticPopup_Show("VIKSUI_RESET")
	end
end)
tinsert(ns.buttons, ResetButton)

-- Font
local FontTable
local LSM = LibStub and LibStub:GetLibrary("LibSharedMedia-3.0", true)
if LSM then
	FontTable = LSM:HashTable("font")
else
	FontTable = {
		"Interface\\AddOns\\ViksUI\\Media\\Font\\normal_font.ttf",
		"Interface\\AddOns\\ViksUI\\Media\\Font\\pixel.ttf",
		"Interface\\AddOns\\ViksUI\\Media\\Font\\LinkinPark.ttf",
		"Interface\\AddOns\\ViksUI\\Media\\Font\\ROADWAY.ttf",
		"Interface\\AddOns\\ViksUI\\Media\\Font\\DICTATOR.ttf",
		"Interface\\AddOns\\ViksUI\\Media\\Font\\comic.ttf",
		"Interface\\AddOns\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",
		"Interface\\AddOns\\ViksUI\\Media\\Font\\HOOG0555.ttf",
		STANDARD_TEXT_FONT
	}
end

local FlagsTable = {
	"OUTLINE",
	"MONOCHROMEOUTLINE",
	""
}

local ErrorTable = {
	"BLACKLIST",
	"WHITELIST",
	"COMBAT",
	"NONE"
}

local CollapseTable = {
	"RAID",
	"RELOAD",
	"NONE",
}

local TextureTable
local LSM = LibStub and LibStub:GetLibrary("LibSharedMedia-3.0", true)
if LSM then
	TextureTable = LSM:HashTable("statusbar")
else
	TextureTable = {
		"Interface\\AddOns\\ViksUI\\Media\\Textures\\Texture.tga"
	}
end

local FilgerTable = {
	L.filger_show_buff,
	L.filger_show_proc,
	L.filger_show_debuff,
	L.filger_show_aura_bar,
	L.filger_show_cd,
	IGNORE
}

local FilgerDropDownText = {
	[L.filger_show_buff] = "buff_spells_list",
	[L.filger_show_proc] = "proc_spells_list",
	[L.filger_show_debuff] = "debuff_spells_list",
	[L.filger_show_aura_bar] = "aura_bar_spells_list",
	[L.filger_show_cd] = "cd_spells_list",
	[IGNORE] = "ignore_spells_list",
}

local SpellList = CreateFrame("Frame", "SpellList", ViksUIOptionsPanel, "ButtonFrameTemplate")
SpellList:SetPoint("TOPLEFT", ViksUIOptionsPanel, "TOPRIGHT", 22, 0)
SpellList:SetSize(290, 420)
SpellList:Hide()

_G["SpellListPortrait"]:SetTexture("Interface\\Spellbook\\Spellbook-Icon")

SpellList.title = _G["SpellListTitle"] or SpellList:CreateFontString("SpellListTitle", "OVERLAY", "GameFontNormal")
SpellList.title:SetPoint("TOP", _G["SpellList"], "TOP", 0, -5)
SpellList.title:SetText(L_GUI_SPELL_LIST)

local ScrollSpells = CreateFrame("ScrollFrame", "SpellListScrollFrameSpellList", _G["SpellListInset"], "UIPanelScrollFrameTemplate")
ScrollSpells:SetPoint("TOPLEFT", _G["SpellListInset"], "TOPLEFT", -10, 19)
ScrollSpells:SetPoint("BOTTOMRIGHT", _G["SpellListInset"], "BOTTOMRIGHT", -30, 40)
ScrollSpells.child = CreateFrame("Frame", "SpellListScrollFrameSpellListChild", ScrollSpells)
ScrollSpells.child:SetSize(270, 290)
ScrollSpells:SetScrollChild(ScrollSpells.child)

local isFilger = false
local doubleInput = false
SpellList.makeSpellsList = function(_, db, double)
	local oldb
	local scroll = SpellListScrollFrameSpellListChild

	local i = 1
	while _G["SpellList"..i.."_cbs"] do
		_G["SpellList"..i.."_fs"]:SetText("")
		_G["SpellList"..i.."_fs2"]:SetText("")
		_G["SpellList"..i.."_texture"]:SetTexture(nil)
		_G["SpellList"..i.."_cbs"]:ClearAllPoints()
		_G["SpellList"..i.."_cbs"]:Hide()
		i = i + 1
	end

	local i = 1
	for k, spell in pairs(db) do
		if spell then
			if not isFilger or isFilger and spell[2] == T.class then
				local sp = (double or ViksUIOptionsPanelfilger:IsShown()) and spell[1] or spell
				local name, _, icon = GetSpellInfo(sp)
				local bf = _G["SpellList"..i.."_cbs"] or CreateFrame("Button", "SpellList"..i.."_cbs", scroll, "BackdropTemplate")

				if i == 1 then
					bf:SetPoint("TOPLEFT", scroll, "TOPLEFT", 10, -5)
					bf:SetPoint("BOTTOMRIGHT", scroll, "TOPRIGHT", -10, -29)
				else
					bf:SetPoint("TOPLEFT", oldb, "BOTTOMLEFT", 0, -2)
					bf:SetPoint("BOTTOMRIGHT", oldb, "BOTTOMRIGHT", 0, -26)
				end

				bf:EnableMouse(true)

				bf.tex = bf.tex or bf:CreateTexture("SpellList"..i.."_texture", "OVERLAY")
				bf.tex:SetSize(22, 22)
				bf.tex:SetPoint("LEFT")
				bf.tex:SetTexture(icon)
				if IsAddOnLoaded("Aurora") or C.skins.blizzard_frames == true then
					bf.tex:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				end

				bf.delete = bf.delete or CreateFrame("Button", "SpellList"..i.."_delete", bf)
				bf.delete:SetSize(16, 16)
				bf.delete:SetPoint("RIGHT")
				bf.delete:SetNormalTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
				bf.delete:GetNormalTexture():SetVertexColor(0.8, 0, 0)
				bf.delete:SetPushedTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
				bf.delete:SetHighlightTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
				bf.delete:SetScript("OnClick", function()
					tremove(db, k)
					SpellList:makeSpellsList(db, double)
					ns.setReloadNeeded(true)
				end)

				bf:SetScript("OnEnter", function(self)
					bf.delete:GetNormalTexture():SetVertexColor(1, 0, 0)
					self:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8"})
					self:SetBackdropColor(0.2, 0.2, 0.2, 0.7)
					GameTooltip:SetOwner(bf, "ANCHOR_TOP", 5, 5)
					GameTooltip:SetHyperlink(format("spell:%s", sp))
				end)
				bf:SetScript("OnLeave", function(self)
					bf.delete:GetNormalTexture():SetVertexColor(0.8, 0, 0)
					self:SetBackdrop(nil)
					GameTooltip:Hide()
				end)

				bf.fs = bf.fs or bf:CreateFontString("SpellList"..i.."_fs", "OVERLAY", "GameFontNormal")
				bf.fs:SetText(name)
				bf.fs:SetPoint("RIGHT", bf.delete, "LEFT", -4, 0)
				bf.fs:SetPoint("LEFT", bf.tex, "RIGHT", 5, 0)
				bf.fs:SetWordWrap(false)
				bf.fs:SetJustifyH("RIGHT")

				bf.fs2 = bf.fs2 or bf:CreateFontString("SpellList"..i.."_fs2", "OVERLAY", "GameFontNormal")
				bf.fs2:SetPoint("RIGHT", bf.delete, "LEFT", -4, 0)
				bf.fs2:SetWordWrap(false)
				bf.fs2:SetJustifyH("RIGHT")

				if double and spell[2] and tonumber(spell[2]) > 0 then
					bf.fs2:SetText(format(GARRISON_DURATION_SECONDS, spell[2]))
					bf.fs:SetPoint("RIGHT", bf.fs2, "LEFT", -4, 0)
				end

				bf:Show()
				oldb = bf
				i = i + 1
			end
		end
	end
	SpellList:Show()
	if double then
		SpellListTextInput2:Show()
	else
		SpellListTextInput2:Hide()
	end
end

local function onEnterPressed(self)
	local value = tonumber(self:GetText())
	AddSpellButton:Disable()
	if value and value > 0 then
		local name = GetSpellInfo(value)
		if name then
			self:SetText(name)
			self:SetCursorPosition(0)
			self:ClearFocus()
			self.value = value
			if not SpellListTextInput2:IsShown() or SpellListTextInput2:GetText() ~= "" then
				AddSpellButton:Enable()
			end
		else
			self:SetText(UNKNOWN)
			self.value = value
		end
	else
		self.value = ""
	end
end

local InputSpell = CreateFrame("EditBox", SpellList:GetName().."TextInput", SpellList, "InputBoxTemplate")
InputSpell:SetAutoFocus(false)
InputSpell:SetWidth(150)
InputSpell:SetHeight(18)
InputSpell:SetMaxLetters(99)
InputSpell:SetFontObject(GameFontHighlight)

InputSpell:SetPoint("TOPLEFT", SpellList, "BOTTOMLEFT", -2, 37)

InputSpell.value = ""

InputSpell:SetScript("OnEscapePressed", function(self) self:ClearFocus() self:SetText(InputSpell.value) end)
InputSpell:SetScript("OnEnterPressed", onEnterPressed)
InputSpell:SetScript("OnEditFocusGained", function() InputSpell:SetText(InputSpell.value) end)
InputSpell:SetScript("OnEditFocusLost", onEnterPressed)

local label = InputSpell:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
label:SetWidth(440)
label:SetHeight(20)
label:SetJustifyH("LEFT")
label:SetPoint("BOTTOMLEFT", InputSpell, "TOPLEFT", -2, 2)
label:SetText(L_GUI_SPELL_INPUT)

local function onEnterPressed(self)
	local value = tonumber(self:GetText())
	AddSpellButton:Disable()
	if value and value > 0 then
		self:ClearFocus()
		self.value = value
		if InputSpell.value ~= "" then
			AddSpellButton:Enable()
		end
	end
end

local InputArg = CreateFrame("EditBox", SpellList:GetName().."TextInput2", SpellList, "InputBoxTemplate")
InputArg:SetAutoFocus(false)
InputArg:SetWidth(40)
InputArg:SetHeight(18)
InputArg:SetMaxLetters(4)
InputArg:SetFontObject(GameFontHighlight)

InputArg:SetPoint("LEFT", InputSpell, "RIGHT", 10, 0)

InputArg:SetScript("OnEscapePressed", function(self) self:ClearFocus() self:SetText(InputArg.value) end)
InputArg:SetScript("OnEnterPressed", onEnterPressed)
InputArg:SetScript("OnEditFocusGained", function() InputArg.value = InputArg:GetText() end)
InputArg:SetScript("OnEditFocusLost", onEnterPressed)

local label = InputArg:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
label:SetWidth(440)
label:SetHeight(20)
label:SetJustifyH("LEFT")
label:SetPoint("BOTTOMLEFT", InputArg, "TOPLEFT", -2, 2)
label:SetText(L_GUI_TIME_INPUT)

InputArg:Hide()

local curOption
local function BuildSpellList(option, double, hiding)
	if not hiding and SpellList:IsVisible() then SpellList:Hide() return end
	curOption = option
	doubleInput = double
	isFilger = hiding
	SpellList:makeSpellsList(option, double)
end

ns.HideSpellList = function()
	InputSpell:SetText("")
	InputSpell.value = ""
	InputArg:SetText("")
	UIDropDownMenu_SetText(ViksUIOptionsPanelfilgercategory_listDropDown, "")
	ViksUIOptionsPanelfilgercategory_listDropDown.selectedValue = nil
	AddSpellButton:Disable()
	SpellList:Hide()
end

local AddSpellButton = CreateFrame("Button", "AddSpellButton", SpellList, "UIPanelButtonTemplate")
AddSpellButton:SetPoint("TOPRIGHT", SpellList, "BOTTOMRIGHT", -10, 40)
AddSpellButton:SetSize(100, 23)
AddSpellButton:SetText(ADD)
AddSpellButton:SetWidth(AddSpellButton.Text:GetWidth() + 15)
AddSpellButton:SetScript("OnClick", function()
	if doubleInput then
		tinsert(curOption, {InputSpell.value, InputArg.value})
	else
		if isFilger then
			tinsert(curOption, {InputSpell.value, T.class})
		else
			tinsert(curOption, InputSpell.value)
		end
	end
	InputSpell:SetText("")
	InputSpell.value = ""
	InputArg:SetText("")
	AddSpellButton:Disable()
	ns.setReloadNeeded(true)
	SpellList:makeSpellsList(curOption, doubleInput)
end)

AddSpellButton:SetScript("OnEnter", function()
	GameTooltip:SetOwner(AddSpellButton, "ANCHOR_RIGHT", 5, 5)
	GameTooltip:SetHyperlink(format("spell:%s", InputSpell.value))
end)

AddSpellButton:SetScript("OnLeave", function()
	GameTooltip:Hide()
end)

AddSpellButton:Disable()
tinsert(ns.buttons, AddSpellButton)

-- Expert mode
do
	local frame = CreateFrame("Frame", "ViksUIProfileFrame", UIParent)
	frame:SetWidth(650)
	frame:SetHeight(520)
	frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	frame:SetFrameStrata("DIALOG")
	tinsert(UISpecialFrames, "ViksUIProfileFrame")
	frame:Hide()
	frame:EnableMouse(true)

	local editBox = CreateFrame("EditBox", "ViksUIProfileFrameEditBox", frame)
	editBox:SetMultiLine(true)
	editBox:SetMaxLetters(99999)
	editBox:SetAutoFocus(true)
	editBox:SetFontObject(ChatFontNormal)
	editBox:SetWidth(620)
	editBox:SetHeight(500)
	editBox:SetScript("OnEscapePressed", function() frame:Hide() end)

	local scrollArea = CreateFrame("ScrollFrame", "ViksUIProfileFrameScroll", frame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
	scrollArea:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -29, 34)
	scrollArea:SetScrollChild(editBox)
	ViksUIProfileFrameScrollScrollBar:SetPoint("TOPLEFT", ViksUIProfileFrameScroll, "TOPRIGHT", 8, -12)
	ViksUIProfileFrameScrollScrollBar:SetPoint("BOTTOMLEFT", ViksUIProfileFrameScroll, "BOTTOMRIGHT", 8, 12)

	local CancelButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	CancelButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
	CancelButton:SetSize(100, 23)
	CancelButton:SetText(CLOSE)
	CancelButton:SetWidth(CancelButton.Text:GetWidth() + 15)
	CancelButton:SetScript("OnClick", function()
		frame:Hide()
	end)

	tinsert(ns.buttons, CancelButton)

	local SaveButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	SaveButton:SetPoint("BOTTOMRIGHT", CancelButton, "BOTTOMLEFT", -4, 0)
	SaveButton:SetSize(100, 23)
	SaveButton:SetText(SAVE)
	SaveButton:SetWidth(SaveButton.Text:GetWidth() + 15)
	SaveButton:SetScript("OnClick", function()
		local _, output = loadstring(editBox:GetText())
		if output then
			print("|cffFF0000"..output.."|r")
		else
			C.options.media = C.options.media or {}
			C.options.media.profile = editBox:GetText()
			frame:Hide()
			ns.setReloadNeeded(true)
		end
	end)

	tinsert(ns.buttons, SaveButton)
end
-- Category
ns.addCategory("general", GENERAL_LABEL, L_GUI_GENERAL_SUBTEXT, true)
ns.addCategory("font", L.font, L.font_subtext, true, true)
ns.addCategory("skins", L_GUI_SKINS, L_GUI_SKINS_SUBTEXT)
ns.addCategory("unitframe", UNITFRAME_LABEL, L_GUI_UF_SUBTEXT, true, true)
ns.addCategory("unitframe_class_bar", L_GUI_UF_PLUGINS_CLASS_BAR, L_GUI_UF_PLUGINS_CLASS_BAR_SUBTEXT)
--ns.addCategory("raidframe", RAID_FRAMES_LABEL, L_GUI_UF_RAIDFRAMES_SUBTEXT, true)
ns.addCategory("aura", BUFFOPTIONS_LABEL, BUFFOPTIONS_SUBTEXT)
ns.addCategory("actionbar", L_GUI_ACTIONBAR, ACTIONBARS_SUBTEXT, 2)
ns.addCategory("tooltip", L.tooltip, L.tooltip_subtext, true)
ns.addCategory("chat", SOCIALS, L_GUI_CHAT_SUBTEXT)
ns.addCategory("nameplate", UNIT_NAMEPLATES, L_GUI_NAMEPLATE_SUBTEXT, true)
ns.addCategory("combattext", L_GUI_COMBATTEXT, COMBATTEXT_SUBTEXT.." "..L_GUI_COMBATTEXT_SUBTEXT, true)

ns.addCategory("bag", L_GUI_BAGS, L_GUI_BAGS_SUBTEXT)
ns.addCategory("minimap", MINIMAP_LABEL, L_GUI_MINIMAP_SUBTEXT)
ns.addCategory("loot", LOOT, L_GUI_LOOT_SUBTEXT)
ns.addCategory("filger", L_GUI_FILGER, L_GUI_FILGER_SUBTEXT)
ns.addCategory("announcements", L_GUI_ANNOUNCEMENTS, L_GUI_ANNOUNCEMENTS_SUBTEXT)
ns.addCategory("automation", L_GUI_AUTOMATION, L_GUI_AUTOMATION_SUBTEXT)
ns.addCategory("reminder", L_GUI_REMINDER, L_GUI_REMINDER_SUBTEXT)
ns.addCategory("raidcooldown", L_GUI_COOLDOWN_RAID, L_GUI_COOLDOWN_RAID_SUBTEXT)
ns.addCategory("enemycooldown", L_GUI_COOLDOWN_ENEMY, L_GUI_COOLDOWN_ENEMY_SUBTEXT)
ns.addCategory("pulsecooldown", L_GUI_COOLDOWN_PULSE, L_GUI_COOLDOWN_PULSE_SUBTEXT)
ns.addCategory("threat", L_GUI_THREAT, L_GUI_THREAT_SUBTEXT)
--ns.addCategory("toppanel", L_GUI_TOP_PANEL, L_GUI_TOP_PANEL_SUBTEXT)
--ns.addCategory("stats", L_GUI_STATS, L_GUI_STATS_SUBTEXT)
ns.addCategory("datatext", L_GUI_DATATEXT, L_GUI_DATATEXT_SUBTEXT)
ns.addCategory("panels", L_GUI_PANELS, L_GUI_PANELS_SUBTEXT)
ns.addCategory("trade", L_GUI_TRADE, L_GUI_TRADE_SUBTEXT)
ns.addCategory("misc", OTHER, L_GUI_MISC_SUBTEXT, true)

-- General
do
	local parent = ViksUIOptionsPanel.general

	local welcome_message = ns.CreateCheckBox(parent, "welcome_message", L_GUI_GENERAL_WELCOME_MESSAGE)
	welcome_message:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local auto_scale = ns.CreateCheckBox(parent, "auto_scale", L_GUI_GENERAL_AUTOSCALE)
	auto_scale:SetPoint("TOPLEFT", welcome_message, "BOTTOMLEFT", 0, 0)

	local uiscale = ns.CreateNumberSlider(parent, "uiscale", nil, nil, 0.4, 1.1, 0.01, true, L_GUI_GENERAL_UISCALE)
	uiscale:SetPoint("TOPLEFT", auto_scale, "BOTTOMLEFT", 0, -20)

	local function toggleUIScaleOptions()
		local shown = not auto_scale:GetChecked()
		uiscale:SetShown(shown)
	end

	auto_scale:HookScript("OnClick", toggleUIScaleOptions)
	uiscale:HookScript("OnShow", toggleUIScaleOptions)

	-- Blizzard UI
	local subheader = ns.addSubCategory(parent, L.general_subheader_blizzard)
	subheader:SetPoint("TOPLEFT", uiscale, "BOTTOMLEFT", 0, -10)

	local error_filter = ns.CreateDropDown(parent, "error_filter", true, nil, ErrorTable)
	error_filter:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local vehicle_mouseover = ns.CreateCheckBox(parent, "vehicle_mouseover")
	vehicle_mouseover:SetPoint("TOPLEFT", error_filter, "BOTTOMLEFT", 16, 0)

	local move_blizzard = ns.CreateCheckBox(parent, "move_blizzard")
	move_blizzard:SetPoint("TOPLEFT", vehicle_mouseover, "BOTTOMLEFT", 0, 0)

	local color_picker = ns.CreateCheckBox(parent, "color_picker")
	color_picker:SetPoint("TOPLEFT", move_blizzard, "BOTTOMLEFT", 0, 0)

	--local minimize_mouseover = ns.CreateCheckBox(parent, "minimize_mouseover")
	--minimize_mouseover:SetPoint("TOPLEFT", color_picker, "BOTTOMLEFT", 0, 0)

	local hide_banner = ns.CreateCheckBox(parent, "hide_banner")
	hide_banner:SetPoint("TOPLEFT", color_picker, "BOTTOMLEFT", 0, 0)

	local hide_talking_head = ns.CreateCheckBox(parent, "hide_talking_head")
	hide_talking_head:SetPoint("TOPLEFT", hide_banner, "BOTTOMLEFT", 0, 0)
	
	-- Panel 2
	local parent = ViksUIOptionsPanel.general2

	local border_color = ns.CreateColourPicker(parent, "border_color", true)
	border_color:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 4, 0)

	local backdrop_color = ns.CreateColourPicker(parent, "backdrop_color", true)
	backdrop_color:SetPoint("TOPLEFT", border_color, "BOTTOMLEFT", 0, -8)

	local pxcolor1 = ns.CreateColourPicker(parent, "pxcolor1", true)
	pxcolor1:SetPoint("TOPLEFT", border_color, "TOPRIGHT", 200, 0)
	
	local pxcolor2 = ns.CreateColourPicker(parent, "pxcolor2", true)
	pxcolor2:SetPoint("TOPLEFT", pxcolor1, "BOTTOMLEFT", 0, -8)
	
	local classcolor_border = ns.CreateCheckBox(parent, "classcolor_border")
	classcolor_border:SetPoint("TOPLEFT", backdrop_color, "BOTTOMLEFT", 0, 0)

	local backdrop_alpha = ns.CreateNumberSlider(parent, "backdrop_alpha", nil, nil, 0, 1, 0.05, true)
	backdrop_alpha:SetPoint("TOPLEFT", classcolor_border, "BOTTOMLEFT", 0, -28)

	local texture = ns.CreateDropDown(parent, "texture", true, nil, TextureTable, LSM and true)
	texture:SetPoint("TOPLEFT", backdrop_alpha, "BOTTOMLEFT", -20, -15)

	local texturePreview = CreateFrame("Frame", nil, parent)
	texturePreview:SetSize(100, 30)
	texturePreview:SetPoint("LEFT", texture.label, "RIGHT", 10, 0)
	texturePreview:Hide()

	texturePreview.tex = texturePreview:CreateTexture(nil, "OVERLAY")
	texturePreview.tex:SetPoint("CENTER")
	texturePreview.tex:SetSize(100, 30)

	hooksecurefunc(texture, "SetValue", function()
		texturePreview:Show()
		texturePreview.tex:SetTexture(C.options.media.texture)
		texturePreview.tex:SetVertexColor(unpack(C.media.classborder_color))
	end)

	-- Normal Font
	local subheader = ns.addSubCategory(parent, L.media_subheader_normal)
	subheader:SetPoint("TOPLEFT", texture, "BOTTOMLEFT", 16, -10)

	local normal_font = ns.CreateDropDown(parent, "normal_font", true, L.font_stats_font, FontTable, LSM and true, true)
	normal_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	-- Pixel Font
	local subheader = ns.addSubCategory(parent, L.media_subheader_pixel)
	subheader:SetPoint("TOPLEFT", normal_font, "BOTTOMLEFT", 16, -10)

	local pixel_font = ns.CreateDropDown(parent, "pixel_font", true, L.font_stats_font, FontTable, LSM and true, true)
	pixel_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local pixel_font_style = ns.CreateDropDown(parent, "pixel_font_style", true, L.font_stats_font_style, FlagsTable)
	pixel_font_style:SetPoint("LEFT", pixel_font, "RIGHT", 150, 0)

	local pixel_font_size = ns.CreateNumberSlider(parent, "pixel_font_size", nil, nil, 8, 48, 1, true, FONT_SIZE)
	pixel_font_size:SetPoint("TOPLEFT", pixel_font, "BOTTOMLEFT", 16, -16)
	
	local subheader2 = ns.addSubCategory(parent, "Pixel Header Font")
	subheader2:SetPoint("TOPLEFT", pixel_font_size, "BOTTOMLEFT", 0, -10)

	local pxfontHeader = ns.CreateDropDown(parent, "pxfontHeader", true, "Pixel Font Headers & Datatext", FontTable, LSM and true, true)
	pxfontHeader:SetPoint("TOPLEFT", subheader2, "BOTTOMLEFT", -16, -10)

	local pxfontHFlag = ns.CreateDropDown(parent, "pxfontHFlag", true, "Headers Style", FlagsTable)
	pxfontHFlag:SetPoint("LEFT", pxfontHeader, "RIGHT", 150, 0)

	local pxfontHsize = ns.CreateNumberSlider(parent, "pxfontHsize", nil, nil, 8, 48, 1, true, FONT_SIZE)
	pxfontHsize:SetPoint("TOPLEFT", pxfontHeader, "BOTTOMLEFT", 16, -16)
	
	local yoffsetTop = ns.CreateNumberSlider(parent, "yoffsetTop", nil, nil, -10, -10, 1, true, "Vertical offset for Datatext in Top Panel")
	yoffsetTop:SetPoint("TOPLEFT", pxfontHsize, "BOTTOMLEFT", 0, -30)
	
	local LuaButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	LuaButton:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -20, 5)
	LuaButton:SetSize(100, 23)
	LuaButton:SetText(L_GUI_EXPERT_MODE)
	LuaButton:SetWidth(LuaButton.Text:GetWidth() + 15)
	LuaButton:SetScript("OnClick", function()
		ViksUIProfileFrameEditBox:SetText(C.media.profile)
		C_Timer.After(0.01, function()
			local _, max = ViksUIProfileFrameScrollScrollBar:GetMinMaxValues()
			for _ = 1, max do
				ScrollFrameTemplate_OnMouseWheel(ViksUIProfileFrameScroll, -1)
			end
		end)
		ViksUIProfileFrame:Show()
	end)

	LuaButton:SetScript("OnEnter", function()
		GameTooltip:SetOwner(LuaButton, "ANCHOR_RIGHT", 5, 5)
		GameTooltip:SetText(L_GUI_EXPERT_MODE_DESC, nil, nil, nil, nil, true)
	end)

	LuaButton:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	tinsert(ns.buttons, LuaButton)
end

-- Font
do
	local parent = ViksUIOptionsPanel.font

	local subheader = ns.addSubCategory(parent, L.font_subheader_unit)
	subheader:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local unit_frames_font = ns.CreateDropDown(parent, "unit_frames_font", true, L.font_stats_font, FontTable, LSM and true, true)
	unit_frames_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local unit_frames_font_style = ns.CreateDropDown(parent, "unit_frames_font_style", true, L.font_stats_font_style, FlagsTable)
	unit_frames_font_style:SetPoint("LEFT", unit_frames_font, "RIGHT", 150, 0)

	local unit_frames_font_size = ns.CreateNumberSlider(parent, "unit_frames_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	unit_frames_font_size:SetPoint("TOPLEFT", unit_frames_font, "BOTTOMLEFT", 16, -16)

	local unit_frames_font_shadow = ns.CreateCheckBox(parent, "unit_frames_font_shadow", L.font_stats_font_shadow)
	unit_frames_font_shadow:SetPoint("LEFT", unit_frames_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_aura)
	subheader:SetPoint("TOPLEFT", unit_frames_font_size, "BOTTOMLEFT", 0, -10)

	local auras_font = ns.CreateDropDown(parent, "auras_font", true, L.font_stats_font, FontTable, LSM and true, true)
	auras_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local auras_font_style = ns.CreateDropDown(parent, "auras_font_style", true, L.font_stats_font_style, FlagsTable)
	auras_font_style:SetPoint("LEFT", auras_font, "RIGHT", 150, 0)

	local auras_font_size = ns.CreateNumberSlider(parent, "auras_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	auras_font_size:SetPoint("TOPLEFT", auras_font, "BOTTOMLEFT", 16, -16)

	local auras_font_shadow = ns.CreateCheckBox(parent, "auras_font_shadow", L.font_stats_font_shadow)
	auras_font_shadow:SetPoint("LEFT", auras_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_nameplates)
	subheader:SetPoint("TOPLEFT", auras_font_size, "BOTTOMLEFT", 0, -10)

	local nameplates_font = ns.CreateDropDown(parent, "nameplates_font", true, L.font_stats_font, FontTable, LSM and true, true)
	nameplates_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local nameplates_font_style = ns.CreateDropDown(parent, "nameplates_font_style", true, L.font_stats_font_style, FlagsTable)
	nameplates_font_style:SetPoint("LEFT", nameplates_font, "RIGHT", 150, 0)

	local nameplates_font_size = ns.CreateNumberSlider(parent, "nameplates_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	nameplates_font_size:SetPoint("TOPLEFT", nameplates_font, "BOTTOMLEFT", 16, -16)

	local nameplates_font_shadow = ns.CreateCheckBox(parent, "nameplates_font_shadow", L.font_stats_font_shadow)
	nameplates_font_shadow:SetPoint("LEFT", nameplates_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_action)
	subheader:SetPoint("TOPLEFT", nameplates_font_size, "BOTTOMLEFT", 0, -10)

	local action_bars_font = ns.CreateDropDown(parent, "action_bars_font", true, L.font_stats_font, FontTable, LSM and true, true)
	action_bars_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local action_bars_font_style = ns.CreateDropDown(parent, "action_bars_font_style", true, L.font_stats_font_style, FlagsTable)
	action_bars_font_style:SetPoint("LEFT", action_bars_font, "RIGHT", 150, 0)

	local action_bars_font_size = ns.CreateNumberSlider(parent, "action_bars_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	action_bars_font_size:SetPoint("TOPLEFT", action_bars_font, "BOTTOMLEFT", 16, -16)

	local action_bars_font_shadow = ns.CreateCheckBox(parent, "action_bars_font_shadow", L.font_stats_font_shadow)
	action_bars_font_shadow:SetPoint("LEFT", action_bars_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_cooldown)
	subheader:SetPoint("TOPLEFT", action_bars_font_size, "BOTTOMLEFT", 0, -10)

	local cooldown_timers_font = ns.CreateDropDown(parent, "cooldown_timers_font", true, L.font_stats_font, FontTable, LSM and true, true)
	cooldown_timers_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local cooldown_timers_font_style = ns.CreateDropDown(parent, "cooldown_timers_font_style", true, L.font_stats_font_style, FlagsTable)
	cooldown_timers_font_style:SetPoint("LEFT", cooldown_timers_font, "RIGHT", 150, 0)

	local cooldown_timers_font_size = ns.CreateNumberSlider(parent, "cooldown_timers_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	cooldown_timers_font_size:SetPoint("TOPLEFT", cooldown_timers_font, "BOTTOMLEFT", 16, -16)

	local cooldown_timers_font_shadow = ns.CreateCheckBox(parent, "cooldown_timers_font_shadow", L.font_stats_font_shadow)
	cooldown_timers_font_shadow:SetPoint("LEFT", cooldown_timers_font_size, "RIGHT", 160, 0)

	-- Panel 2
	local parent = ViksUIOptionsPanel.font2

	local subheader = ns.addSubCategory(parent, L.font_subheader_combat)
	subheader:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local combat_text_font = ns.CreateDropDown(parent, "combat_text_font", true, L.font_stats_font, FontTable, LSM and true, true)
	combat_text_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local combat_text_font_style = ns.CreateDropDown(parent, "combat_text_font_style", true, L.font_stats_font_style, FlagsTable)
	combat_text_font_style:SetPoint("LEFT", combat_text_font, "RIGHT", 150, 0)

	local combat_text_font_size = ns.CreateNumberSlider(parent, "combat_text_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	combat_text_font_size:SetPoint("TOPLEFT", combat_text_font, "BOTTOMLEFT", 16, -16)

	local combat_text_font_shadow = ns.CreateCheckBox(parent, "combat_text_font_shadow", L.font_stats_font_shadow)
	combat_text_font_shadow:SetPoint("LEFT", combat_text_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_filger)
	subheader:SetPoint("TOPLEFT", combat_text_font_size, "BOTTOMLEFT", 0, -10)

	local filger_font = ns.CreateDropDown(parent, "filger_font", true, L.font_stats_font, FontTable, LSM and true, true)
	filger_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local filger_font_style = ns.CreateDropDown(parent, "filger_font_style", true, L.font_stats_font_style, FlagsTable)
	filger_font_style:SetPoint("LEFT", filger_font, "RIGHT", 150, 0)

	local filger_font_size = ns.CreateNumberSlider(parent, "filger_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	filger_font_size:SetPoint("TOPLEFT", filger_font, "BOTTOMLEFT", 16, -16)

	local filger_font_shadow = ns.CreateCheckBox(parent, "filger_font_shadow", L.font_stats_font_shadow)
	filger_font_shadow:SetPoint("LEFT", filger_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_threat)
	subheader:SetPoint("TOPLEFT", filger_font_size, "BOTTOMLEFT", 0, -10)

	local threat_meter_font = ns.CreateDropDown(parent, "threat_meter_font", true, L.font_stats_font, FontTable, LSM and true, true)
	threat_meter_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local threat_meter_font_style = ns.CreateDropDown(parent, "threat_meter_font_style", true, L.font_stats_font_style, FlagsTable)
	threat_meter_font_style:SetPoint("LEFT", threat_meter_font, "RIGHT", 150, 0)

	local threat_meter_font_size = ns.CreateNumberSlider(parent, "threat_meter_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	threat_meter_font_size:SetPoint("TOPLEFT", threat_meter_font, "BOTTOMLEFT", 16, -16)

	local threat_meter_font_shadow = ns.CreateCheckBox(parent, "threat_meter_font_shadow", L.font_stats_font_shadow)
	threat_meter_font_shadow:SetPoint("LEFT", threat_meter_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_raidcd)
	subheader:SetPoint("TOPLEFT", threat_meter_font_size, "BOTTOMLEFT", 0, -10)

	local raid_cooldowns_font = ns.CreateDropDown(parent, "raid_cooldowns_font", true, L.font_stats_font, FontTable, LSM and true, true)
	raid_cooldowns_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local raid_cooldowns_font_style = ns.CreateDropDown(parent, "raid_cooldowns_font_style", true, L.font_stats_font_style, FlagsTable)
	raid_cooldowns_font_style:SetPoint("LEFT", raid_cooldowns_font, "RIGHT", 150, 0)

	local raid_cooldowns_font_size = ns.CreateNumberSlider(parent, "raid_cooldowns_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	raid_cooldowns_font_size:SetPoint("TOPLEFT", raid_cooldowns_font, "BOTTOMLEFT", 16, -16)

	local raid_cooldowns_font_shadow = ns.CreateCheckBox(parent, "raid_cooldowns_font_shadow", L.font_stats_font_shadow)
	raid_cooldowns_font_shadow:SetPoint("LEFT", raid_cooldowns_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_loot)
	subheader:SetPoint("TOPLEFT", raid_cooldowns_font_size, "BOTTOMLEFT", 0, -10)

	local loot_font = ns.CreateDropDown(parent, "loot_font", true, L.font_stats_font, FontTable, LSM and true, true)
	loot_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local loot_font_style = ns.CreateDropDown(parent, "loot_font_style", true, L.font_stats_font_style, FlagsTable)
	loot_font_style:SetPoint("LEFT", loot_font, "RIGHT", 150, 0)

	local loot_font_size = ns.CreateNumberSlider(parent, "loot_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	loot_font_size:SetPoint("TOPLEFT", loot_font, "BOTTOMLEFT", 16, -16)

	local loot_font_shadow = ns.CreateCheckBox(parent, "loot_font_shadow", L.font_stats_font_shadow)
	loot_font_shadow:SetPoint("LEFT", loot_font_size, "RIGHT", 160, 0)

	-- Panel 3
	local parent = ViksUIOptionsPanel.font3

	local subheader = ns.addSubCategory(parent, L.font_subheader_bag)
	subheader:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local bags_font = ns.CreateDropDown(parent, "bags_font", true, L.font_stats_font, FontTable, LSM and true, true)
	bags_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local bags_font_style = ns.CreateDropDown(parent, "bags_font_style", true, L.font_stats_font_style, FlagsTable)
	bags_font_style:SetPoint("LEFT", bags_font, "RIGHT", 150, 0)

	local bags_font_size = ns.CreateNumberSlider(parent, "bags_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	bags_font_size:SetPoint("TOPLEFT", bags_font, "BOTTOMLEFT", 16, -16)

	local bags_font_shadow = ns.CreateCheckBox(parent, "bags_font_shadow", L.font_stats_font_shadow)
	bags_font_shadow:SetPoint("LEFT", bags_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_chat)
	subheader:SetPoint("TOPLEFT", bags_font_size, "BOTTOMLEFT", 0, -10)

	local chat_font = ns.CreateDropDown(parent, "chat_font", true, L.font_stats_font, FontTable, LSM and true, true)
	chat_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local chat_font_style = ns.CreateDropDown(parent, "chat_font_style", true, L.font_stats_font_style, FlagsTable)
	chat_font_style:SetPoint("LEFT", chat_font, "RIGHT", 150, 0)

	local chat_font_shadow = ns.CreateCheckBox(parent, "chat_font_shadow", L.font_stats_font_shadow)
	chat_font_shadow:SetPoint("TOPLEFT", chat_font, "BOTTOMLEFT", 16, -7)

	local subheader = ns.addSubCategory(parent, L.font_subheader_chat_tabs)
	subheader:SetPoint("TOPLEFT", chat_font_shadow, "BOTTOMLEFT", 0, -10)

	local chat_tabs_font = ns.CreateDropDown(parent, "chat_tabs_font", true, L.font_stats_font, FontTable, LSM and true, true)
	chat_tabs_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local chat_tabs_font_style = ns.CreateDropDown(parent, "chat_tabs_font_style", true, L.font_stats_font_style, FlagsTable)
	chat_tabs_font_style:SetPoint("LEFT", chat_tabs_font, "RIGHT", 150, 0)

	local chat_tabs_font_size = ns.CreateNumberSlider(parent, "chat_tabs_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	chat_tabs_font_size:SetPoint("TOPLEFT", chat_tabs_font, "BOTTOMLEFT", 16, -16)

	local chat_tabs_font_shadow = ns.CreateCheckBox(parent, "chat_tabs_font_shadow", L.font_stats_font_shadow)
	chat_tabs_font_shadow:SetPoint("LEFT", chat_tabs_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_style)
	subheader:SetPoint("TOPLEFT", chat_tabs_font_size, "BOTTOMLEFT", 0, -10)

	local stylization_font = ns.CreateDropDown(parent, "stylization_font", true, L.font_stats_font, FontTable, LSM and true, true)
	stylization_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local stylization_font_style = ns.CreateDropDown(parent, "stylization_font_style", true, L.font_stats_font_style, FlagsTable)
	stylization_font_style:SetPoint("LEFT", stylization_font, "RIGHT", 150, 0)

	local stylization_font_size = ns.CreateNumberSlider(parent, "stylization_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	stylization_font_size:SetPoint("TOPLEFT", stylization_font, "BOTTOMLEFT", 16, -16)

	local stylization_font_shadow = ns.CreateCheckBox(parent, "stylization_font_shadow", L.font_stats_font_shadow)
	stylization_font_shadow:SetPoint("LEFT", stylization_font_size, "RIGHT", 160, 0)

	local subheader = ns.addSubCategory(parent, L.font_subheader_stats)
	subheader:SetPoint("TOPLEFT", stylization_font_size, "BOTTOMLEFT", 0, -10)

	local stats_font = ns.CreateDropDown(parent, "stats_font", true, nil, FontTable, LSM and true, true)
	stats_font:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	local stats_font_style = ns.CreateDropDown(parent, "stats_font_style", true, nil, FlagsTable)
	stats_font_style:SetPoint("LEFT", stats_font, "RIGHT", 150, 0)

	local stats_font_size = ns.CreateNumberSlider(parent, "stats_font_size", nil, nil, 0, 32, 1, true, FONT_SIZE)
	stats_font_size:SetPoint("TOPLEFT", stats_font, "BOTTOMLEFT", 16, -16)

	local stats_font_shadow = ns.CreateCheckBox(parent, "stats_font_shadow")
	stats_font_shadow:SetPoint("LEFT", stats_font_size, "RIGHT", 160, 0)

end

-- Skins
do
	local parent = ViksUIOptionsPanel.skins

	local blizzard_frames = ns.CreateCheckBox(parent, "blizzard_frames", L_GUI_SKINS_BLIZZARD)
	blizzard_frames:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local minimap_buttons = ns.CreateCheckBox(parent, "minimap_buttons", L_GUI_SKINS_MINIMAP_BUTTONS)
	minimap_buttons:SetPoint("TOPLEFT", blizzard_frames, "BOTTOMLEFT", 0, 0)

	local minimap_buttons_mouseover = ns.CreateCheckBox(parent, "minimap_buttons_mouseover")
	minimap_buttons_mouseover:SetPoint("TOPLEFT", minimap_buttons, "BOTTOMLEFT", 20, 0)

	-- Addons
	local subheader = ns.addSubCategory(parent, L_GUI_SKINS_SUBHEADER)
	subheader:SetPoint("TOPLEFT", minimap_buttons_mouseover, "BOTTOMLEFT", -20, -16)

	local ace3 = ns.CreateCheckBox(parent, "ace3", L_GUI_SKINS_ACE3)
	ace3:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)

	local atlasloot = ns.CreateCheckBox(parent, "atlasloot", L_GUI_SKINS_ATLASLOOT)
	atlasloot:SetPoint("TOPLEFT", ace3, "BOTTOMLEFT", 0, 0)

	local bigwigs = ns.CreateCheckBox(parent, "bigwigs", L_GUI_SKINS_BW)
	bigwigs:SetPoint("LEFT", atlasloot, "RIGHT", 320, 0)

	local blood_shield_tracker = ns.CreateCheckBox(parent, "blood_shield_tracker", L_GUI_SKINS_BLOOD_SHIELD_TRACKER)
	blood_shield_tracker:SetPoint("TOPLEFT", atlasloot, "BOTTOMLEFT", 0, 0)

	local capping = ns.CreateCheckBox(parent, "capping", L_GUI_SKINS_CAPPING)
	capping:SetPoint("LEFT", blood_shield_tracker, "RIGHT", 320, 0)

	local clique = ns.CreateCheckBox(parent, "clique", L_GUI_SKINS_CLIQUE)
	clique:SetPoint("TOPLEFT", blood_shield_tracker, "BOTTOMLEFT", 0, 0)

	local cool_line = ns.CreateCheckBox(parent, "cool_line", L_GUI_SKINS_COOL_LINE)
	cool_line:SetPoint("LEFT", clique, "RIGHT", 320, 0)

	local dbm = ns.CreateCheckBox(parent, "dbm", L_GUI_SKINS_DBM)
	dbm:SetPoint("TOPLEFT", clique, "BOTTOMLEFT", 0, 0)

	local dbm_movable = ns.CreateCheckBox(parent, "dbm_movable", L_GUI_SKINS_DBM_MOVABLE)
	dbm_movable:SetPoint("TOPLEFT", dbm, "BOTTOMLEFT", 20, 0)

	dbm.children = {dbm_movable}

	local details = ns.CreateCheckBox(parent, "details", L_GUI_SKINS_DETAILS)
	details:SetPoint("TOPLEFT", dbm_movable, "BOTTOMLEFT", -20, 0)

	local dominos = ns.CreateCheckBox(parent, "dominos", L_GUI_SKINS_DOMINOS)
	dominos:SetPoint("LEFT", details, "RIGHT", 320, 0)

	local flyout_button = ns.CreateCheckBox(parent, "flyout_button", L_GUI_SKINS_FLYOUT_BUTTON)
	flyout_button:SetPoint("TOPLEFT", details, "BOTTOMLEFT", 0, 0)

	local ls_toasts = ns.CreateCheckBox(parent, "ls_toasts", L_GUI_SKINS_LS_TOASTS)
	ls_toasts:SetPoint("LEFT", flyout_button, "RIGHT", 320, 0)

	local mage_nuggets = ns.CreateCheckBox(parent, "mage_nuggets", L_GUI_SKINS_MAGE_NUGGETS)
	mage_nuggets:SetPoint("TOPLEFT", flyout_button, "BOTTOMLEFT", 0, 0)

	local my_role_play = ns.CreateCheckBox(parent, "my_role_play", L_GUI_SKINS_MY_ROLE_PLAY)
	my_role_play:SetPoint("LEFT", mage_nuggets, "RIGHT", 320, 0)

	local npcscan = ns.CreateCheckBox(parent, "npcscan", L_GUI_SKINS_NPCSCAN)
	npcscan:SetPoint("TOPLEFT", mage_nuggets, "BOTTOMLEFT", 0, 0)

	local nug_running = ns.CreateCheckBox(parent, "nug_running", L_GUI_SKINS_NUG_RUNNING)
	nug_running:SetPoint("LEFT", npcscan, "RIGHT", 320, 0)

	local omen = ns.CreateCheckBox(parent, "omen", L_GUI_SKINS_OMEN)
	omen:SetPoint("TOPLEFT", npcscan, "BOTTOMLEFT", 0, 0)

	local opie = ns.CreateCheckBox(parent, "opie", L_GUI_SKINS_OPIE)
	opie:SetPoint("LEFT", omen, "RIGHT", 320, 0)

	local ovale = ns.CreateCheckBox(parent, "ovale", L_GUI_SKINS_OVALE)
	ovale:SetPoint("TOPLEFT", omen, "BOTTOMLEFT", 0, 0)

	local pawn = ns.CreateCheckBox(parent, "pawn", L_GUI_SKINS_PAWN)
	pawn:SetPoint("LEFT", ovale, "RIGHT", 320, 0)
	
	local postal = ns.CreateCheckBox(parent, "postal", L_GUI_SKINS_POSTAL)
	postal:SetPoint("LEFT", pawn, "RIGHT", 320, 0)

	local recount = ns.CreateCheckBox(parent, "recount", L_GUI_SKINS_RECOUNT)
	recount:SetPoint("TOPLEFT", ovale, "BOTTOMLEFT", 0, 0)

	local rematch = ns.CreateCheckBox(parent, "rematch", L_GUI_SKINS_REMATCH)
	rematch:SetPoint("LEFT", recount, "RIGHT", 320, 0)

	local skada = ns.CreateCheckBox(parent, "skada", L_GUI_SKINS_SKADA)
	skada:SetPoint("TOPLEFT", recount, "BOTTOMLEFT", 0, 0)

	local tiny_dps = ns.CreateCheckBox(parent, "tiny_dps", L_GUI_SKINS_TINY_DPS)
	tiny_dps:SetPoint("LEFT", skada, "RIGHT", 320, 0)

	local vanaskos = ns.CreateCheckBox(parent, "vanaskos", L_GUI_SKINS_VANASKOS)
	vanaskos:SetPoint("TOPLEFT", skada, "BOTTOMLEFT", 0, 0)

	local weak_auras = ns.CreateCheckBox(parent, "weak_auras", L_GUI_SKINS_WEAK_AURAS)
	weak_auras:SetPoint("LEFT", vanaskos, "RIGHT", 320, 0)
end

-- Unit Frames
do
	local parent = ViksUIOptionsPanel.unitframe

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_UF_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local RaidShowSolo = ns.CreateCheckBox(parent, "RaidShowSolo", L_GUI_UF_SOLO_MODE)
	RaidShowSolo:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)
	
	local HealFrames = ns.CreateCheckBox(parent, "HealFrames", L_GUI_UF_HEALFRAMES)
	HealFrames:SetPoint("TOPLEFT", RaidShowSolo, "BOTTOMLEFT", 0, 0)
	
	local HealthcolorClass = ns.CreateCheckBox(parent, "HealthcolorClass", L_GUI_UF_CLASS_COLOR)
	HealthcolorClass:SetPoint("TOPLEFT", HealFrames, "BOTTOMLEFT", 0, 0)

	local uf_color = ns.CreateColourPicker(parent, "uf_color", true, L_GUI_UF_UF_COLOR)
	uf_color:SetPoint("TOPLEFT", HealthcolorClass, "BOTTOMLEFT", 0, -10)
	
	local HealthBarBackGround = ns.CreateColourPicker(parent, "HealthBarBackGround", true, L_GUI_UF_BG_COLOR)
	HealthBarBackGround:SetPoint("TOPLEFT", uf_color, "BOTTOMLEFT", 0, -10)

	local Powercolor = ns.CreateCheckBox(parent, "Powercolor", L_GUI_UF_POWER_COLOR)
	Powercolor:SetPoint("TOPLEFT", HealthBarBackGround, "BOTTOMLEFT", 0, -10)

	local Autohide = ns.CreateCheckBox(parent, "Autohide", L_GUI_UF_AUTOHODE)
	Autohide:SetPoint("TOPLEFT", Powercolor, "BOTTOMLEFT", 0, 0)
	
	local insideAlpha = ns.CreateNumberSlider(parent, "insideAlpha", nil, nil, 0, 1, 0.05, true)
	insideAlpha:SetPoint("TOPLEFT", Autohide, "BOTTOMLEFT", 0, -28)
	
	local outsideAlpha = ns.CreateNumberSlider(parent, "outsideAlpha", nil, nil, 0, 1, 0.05, true)
	outsideAlpha:SetPoint("TOPLEFT", insideAlpha, "BOTTOMLEFT", 0, -28)
	
	local UFfont = ns.CreateDropDown(parent, "UFfont", true, L.unitframe_UFfont, FontTable, LSM and true)
	UFfont:SetPoint("TOPLEFT", outsideAlpha, "BOTTOMLEFT", -16, -10)
	
	local UFNamefont = ns.CreateDropDown(parent, "UFNamefont", true, L.unitframe_UFNamefont, FontTable, LSM and true)
	UFNamefont:SetPoint("TOPLEFT", UFfont, "BOTTOMLEFT", 0, -10)
	
	-- Cast bars
	local subheader = ns.addSubCategory(parent, L_GUI_UF_SUBHEADER_CAST)
	subheader:SetPoint("TOPLEFT", UFNamefont, "BOTTOMLEFT", 16, -10)

	local Castbars = ns.CreateCheckBox(parent, "Castbars", L_GUI_UF_UNIT_CASTBAR)
	Castbars:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)

	local castbar_ticks = ns.CreateCheckBox(parent, "castbar_ticks", L_GUI_UF_CASTBAR_TICKS)
	castbar_ticks:SetPoint("TOPLEFT", Castbars, "BOTTOMLEFT", 0, 0)

	-- Frames
	local subheader = ns.addSubCategory(parent, L_GUI_UF_SUBHEADER_FRAMES)
	subheader:SetPoint("TOPLEFT", castbar_ticks, "BOTTOMLEFT", 0, -12)

	local showpet = ns.CreateCheckBox(parent, "showpet", L_GUI_UF_SHOW_PET)
	showpet:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)

	local showfocus = ns.CreateCheckBox(parent, "showfocus", L_GUI_UF_SHOW_FOCUS)
	showfocus:SetPoint("LEFT", showpet, "RIGHT", 170, 0)
	
	local showfocustarget = ns.CreateCheckBox(parent, "showfocustarget", L_GUI_UF_SHOW_FOCUST)
	showfocustarget:SetPoint("TOPLEFT", showfocus, "BOTTOMLEFT", 0, 0)

	local showtot = ns.CreateCheckBox(parent, "showtot", L_GUI_UF_SHOW_TOT)
	showtot:SetPoint("LEFT", showfocus, "RIGHT", 170, 0)
	
	local MTFrames = ns.CreateCheckBox(parent, "MTFrames", L_GUI_UF_SHOW_TANK)
	MTFrames:SetPoint("TOPLEFT", showpet, "BOTTOMLEFT", 0, 0)

	local showBossFrames = ns.CreateCheckBox(parent, "showBossFrames", L_GUI_UF_SHOW_BOSS)
	showBossFrames:SetPoint("TOPLEFT", MTFrames, "BOTTOMLEFT", 0, 0)
	
	local ShowRaid = ns.CreateCheckBox(parent, "ShowRaid", L_GUI_UF_SHOW_RAID)
	ShowRaid:SetPoint("TOPLEFT", showfocustarget, "BOTTOMLEFT", 0, 0)

	local ShowParty = ns.CreateCheckBox(parent, "ShowParty", L_GUI_UF_SHOW_PARTY)
	ShowParty:SetPoint("TOPLEFT", showtot, "BOTTOMLEFT", 0, 0)
	
	local RaidShowAllGroups = ns.CreateCheckBox(parent, "RaidShowAllGroups", L_GUI_UF_RAID_ALLGROUP)
	RaidShowAllGroups:SetPoint("TOPLEFT", ShowParty, "BOTTOMLEFT", 0, 0)

	-- Panel 2
	local parent = ViksUIOptionsPanel.unitframe2

	local icons_pvp = ns.CreateCheckBox(parent, "icons_pvp")
	icons_pvp:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local icons_combat = ns.CreateCheckBox(parent, "icons_combat", L_GUI_UF_ICONS_COMBAT)
	icons_combat:SetPoint("TOPLEFT", icons_pvp, "BOTTOMLEFT", 0, 0)

	local icons_resting = ns.CreateCheckBox(parent, "icons_resting", L_GUI_UF_ICONS_RESTING)
	icons_resting:SetPoint("TOPLEFT", icons_combat, "BOTTOMLEFT", 0, 0)

	-- Portraits
	local subheader = ns.addSubCategory(parent, L_GUI_UF_SUBHEADER_PORTRAIT)
	subheader:SetPoint("TOPLEFT", icons_resting, "BOTTOMLEFT", 0, -16)

	local showPortrait = ns.CreateCheckBox(parent, "showPortrait", L_GUI_UF_PORTRAIT_ENABLE)
	showPortrait:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)

	local showPortraitHPbar = ns.CreateCheckBox(parent, "showPortraitHPbar", L_GUI_UF_PORTRAIT_BARS)
	showPortraitHPbar:SetPoint("TOPLEFT", showPortrait, "BOTTOMLEFT", 0, 0)

	-- Plugins
	local subheader = ns.addSubCategory(parent, L_GUI_UF_SUBHEADER_PLUGINS)
	subheader:SetPoint("TOPLEFT", showPortraitHPbar, "BOTTOMLEFT", 0, -16)

	local plugins_gcd = ns.CreateCheckBox(parent, "plugins_gcd", L_GUI_UF_PLUGINS_GCD)
	plugins_gcd:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)

	local plugins_swing = ns.CreateCheckBox(parent, "plugins_swing", L_GUI_UF_PLUGINS_SWING)
	plugins_swing:SetPoint("TOPLEFT", plugins_gcd, "BOTTOMLEFT", 0, 0)

	local plugins_reputation_bar = ns.CreateCheckBox(parent, "plugins_reputation_bar")
	plugins_reputation_bar:SetPoint("TOPLEFT", plugins_swing, "BOTTOMLEFT", 0, 0)

	local plugins_experience_bar = ns.CreateCheckBox(parent, "plugins_experience_bar")
	plugins_experience_bar:SetPoint("TOPLEFT", plugins_reputation_bar, "BOTTOMLEFT", 0, 0)

	local plugins_smooth_bar = ns.CreateCheckBox(parent, "plugins_smooth_bar", L_GUI_UF_PLUGINS_SMOOTH_BAR)
	plugins_smooth_bar:SetPoint("TOPLEFT", plugins_experience_bar, "BOTTOMLEFT", 0, 0)

	local plugins_combat_feedback = ns.CreateCheckBox(parent, "plugins_combat_feedback", L_GUI_UF_PLUGINS_COMBAT_FEEDBACK)
	plugins_combat_feedback:SetPoint("TOPLEFT", plugins_smooth_bar, "BOTTOMLEFT", 0, 0)

	local plugins_debuffhighlight_icon = ns.CreateCheckBox(parent, "plugins_debuffhighlight_icon", L_GUI_UF_PLUGINS_DEBUFFHIGHLIGHT_ICON)
	plugins_debuffhighlight_icon:SetPoint("TOPLEFT", plugins_combat_feedback, "BOTTOMLEFT", 0, 0)

	local plugins_aura_watch = ns.CreateCheckBox(parent, "plugins_aura_watch", L_GUI_UF_PLUGINS_AURA_WATCH)
	plugins_aura_watch:SetPoint("TOPLEFT", plugins_debuffhighlight_icon, "BOTTOMLEFT", 0, 0)

	local ListButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	ListButton:SetPoint("LEFT", plugins_aura_watch.Text, "RIGHT", 20, 0)
	ListButton:SetSize(100, 23)
	ListButton:SetText(ADD)
	ListButton:SetWidth(ListButton.Text:GetWidth() + 15)
	ListButton:SetScript("OnClick", function()
		if not C.options["unitframe"] then
			C.options["unitframe"] = {}
		end
		if not C.options["unitframe"]["plugins_aura_watch_list"] then
			C.options["unitframe"]["plugins_aura_watch_list"] = {}
		end
		BuildSpellList(C.options["unitframe"]["plugins_aura_watch_list"])
	end)
	tinsert(ns.buttons, ListButton)

	local function toggleListButton()
		local shown = plugins_aura_watch:GetChecked()
		ListButton:SetEnabled(shown)
	end

	plugins_aura_watch:HookScript("OnClick", toggleListButton)
	ListButton:HookScript("OnShow", toggleListButton)
	
	local plugins_aura_watch_timer = ns.CreateCheckBox(parent, "plugins_aura_watch_timer", L_GUI_UF_PLUGINS_AURA_WATCH_TIMER)
	plugins_aura_watch_timer:SetPoint("TOPLEFT", plugins_aura_watch, "BOTTOMLEFT", 20, 0)

	plugins_aura_watch.children = {plugins_aura_watch_timer}

	local plugins_pvp_debuffs = ns.CreateCheckBox(parent, "plugins_pvp_debuffs", L_GUI_UF_PLUGINS_PVP_DEBUFFS)
	plugins_pvp_debuffs:SetPoint("TOPLEFT", plugins_aura_watch_timer, "BOTTOMLEFT", -20, 0)

	local plugins_healcomm = ns.CreateCheckBox(parent, "plugins_healcomm", L_GUI_UF_PLUGINS_HEALCOMM)
	plugins_healcomm:SetPoint("TOPLEFT", plugins_pvp_debuffs, "BOTTOMLEFT", 0, 0)

	local plugins_auto_resurrection = ns.CreateCheckBox(parent, "plugins_auto_resurrection")
	plugins_auto_resurrection:SetPoint("TOPLEFT", plugins_healcomm, "BOTTOMLEFT", 0, 0)
	
	local LayoutButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	LayoutButton:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -20, 5)
	LayoutButton:SetSize(100, 23)
	LayoutButton:SetText(L_GUI_LAYOUT)
	LayoutButton:SetWidth(LayoutButton.Text:GetWidth() + 15)
	LayoutButton:SetScript("OnClick", function()
		StaticPopup_Show("SWITCH_RAID")
	end)
	tinsert(ns.buttons, LayoutButton)
end

-- Unit Frames Class bar
do
	local parent = ViksUIOptionsPanel.unitframe_class_bar

	local combo = ns.CreateCheckBox(parent, "combo", L_GUI_UF_PLUGINS_COMBO_BAR)
	combo:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local combo_always = ns.CreateCheckBox(parent, "combo_always", L_GUI_UF_PLUGINS_COMBO_BAR_ALWAYS)
	combo_always:SetPoint("TOPLEFT", combo, "BOTTOMLEFT", 20, 0)

	local combo_old = ns.CreateCheckBox(parent, "combo_old", L_GUI_UF_PLUGINS_COMBO_BAR_OLD)
	combo_old:SetPoint("TOPLEFT", combo_always, "BOTTOMLEFT", 0, 0)

	combo.children = {combo_always, combo_old}

	local arcane = ns.CreateCheckBox(parent, "arcane", L_GUI_UF_PLUGINS_ARCANE_BAR)
	arcane:SetPoint("TOPLEFT", combo_old, "BOTTOMLEFT", -20, 0)

	local chi = ns.CreateCheckBox(parent, "chi", L_GUI_UF_PLUGINS_CHI_BAR)
	chi:SetPoint("TOPLEFT", arcane, "BOTTOMLEFT", 0, 0)

	local stagger = ns.CreateCheckBox(parent, "stagger", L_GUI_UF_PLUGINS_STAGGER_BAR)
	stagger:SetPoint("TOPLEFT", chi, "BOTTOMLEFT", 0, 0)

	local holy = ns.CreateCheckBox(parent, "holy", L_GUI_UF_PLUGINS_HOLY_BAR)
	holy:SetPoint("TOPLEFT", stagger, "BOTTOMLEFT", 0, 0)

	local shard = ns.CreateCheckBox(parent, "shard", L_GUI_UF_PLUGINS_SHARD_BAR)
	shard:SetPoint("TOPLEFT", holy, "BOTTOMLEFT", 0, 0)

	local rune = ns.CreateCheckBox(parent, "rune", L_GUI_UF_PLUGINS_RUNE_BAR)
	rune:SetPoint("TOPLEFT", shard, "BOTTOMLEFT", 0, 0)

	local totem = ns.CreateCheckBox(parent, "totem", L_GUI_UF_PLUGINS_TOTEM_BAR)
	totem:SetPoint("TOPLEFT", rune, "BOTTOMLEFT", 0, 0)
end

-- Raid Frames
--do
	--local parent = ViksUIOptionsPanel.raidframe
--[[
	local by_role = ns.CreateCheckBox(parent, "by_role", L_GUI_UF_BY_ROLE)
	by_role:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local aggro_border = ns.CreateCheckBox(parent, "aggro_border", L_GUI_UF_AGGRO_BORDER)
	aggro_border:SetPoint("TOPLEFT", by_role, "BOTTOMLEFT", 0, 0)

	local deficit_health = ns.CreateCheckBox(parent, "deficit_health", L_GUI_UF_DEFICIT_HEALTH)
	deficit_health:SetPoint("TOPLEFT", aggro_border, "BOTTOMLEFT", 0, 0)

	local vertical_health = ns.CreateCheckBox(parent, "vertical_health", L_GUI_UF_VERTICAL_HEALTH)
	vertical_health:SetPoint("TOPLEFT", deficit_health, "BOTTOMLEFT", 0, 0)

	local alpha_health = ns.CreateCheckBox(parent, "alpha_health", L_GUI_UF_ALPHA_HEALTH)
	alpha_health:SetPoint("TOPLEFT", vertical_health, "BOTTOMLEFT", 0, 0)

	local show_range = ns.CreateCheckBox(parent, "show_range", L_GUI_UF_SHOW_RANGE)
	show_range:SetPoint("TOPLEFT", alpha_health, "BOTTOMLEFT", 0, 0)

	local range_alpha = ns.CreateNumberSlider(parent, "range_alpha", nil, nil, 0, 1, 0.05, true, L_GUI_UF_RANGE_ALPHA, L_GUI_UF_RANGE_ALPHA_DESC)
	range_alpha:SetPoint("TOPLEFT", show_range, "BOTTOMLEFT", 0, -20)

	-- Frames
	local subheader = ns.addSubCategory(parent, L_GUI_UF_SUBHEADER_RAIDFRAMES)
	subheader:SetPoint("TOPLEFT", range_alpha, "BOTTOMLEFT", 0, -16)

	local show_party = ns.CreateCheckBox(parent, "show_party", L_GUI_UF_SHOW_PARTY)
	show_party:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)

	local show_raid = ns.CreateCheckBox(parent, "show_raid", L_GUI_UF_SHOW_RAID)
	show_raid:SetPoint("LEFT", show_party, "RIGHT", 320, 0)

	local solo_mode = ns.CreateCheckBox(parent, "solo_mode", L_GUI_UF_SOLO_MODE)
	solo_mode:SetPoint("TOPLEFT", show_party, "BOTTOMLEFT", 0, 0)

	local player_in_party = ns.CreateCheckBox(parent, "player_in_party", L_GUI_UF_PLAYER_PARTY)
	player_in_party:SetPoint("TOPLEFT", solo_mode, "BOTTOMLEFT", 0, 0)

	local raid_tanks = ns.CreateCheckBox(parent, "raid_tanks", L_GUI_UF_SHOW_TANK)
	raid_tanks:SetPoint("TOPLEFT", player_in_party, "BOTTOMLEFT", 0, 0)

	local raid_tanks_tt = ns.CreateCheckBox(parent, "raid_tanks_tt", L_GUI_UF_SHOW_TANK_TT)
	raid_tanks_tt:SetPoint("TOPLEFT", raid_tanks, "BOTTOMLEFT", 0, 0)

	local raid_groups = ns.CreateNumberSlider(parent, "raid_groups", nil, nil, 0, 8, 1, true, L_GUI_UF_RAID_GROUP)
	raid_groups:SetPoint("TOPLEFT", raid_tanks_tt, "BOTTOMLEFT", 0, -20)

	local raid_groups_vertical = ns.CreateCheckBox(parent, "raid_groups_vertical", L_GUI_UF_RAID_VERTICAL_GROUP)
	raid_groups_vertical:SetPoint("TOPLEFT", raid_groups, "BOTTOMLEFT", 0, -10)

	-- Icons
	local subheader = ns.addSubCategory(parent, L_GUI_UF_SUBHEADER_ICONS)
	subheader:SetPoint("TOPLEFT", raid_groups_vertical, "BOTTOMLEFT", 0, -16)

	local icons_role = ns.CreateCheckBox(parent, "icons_role", L_GUI_UF_ICONS_ROLE)
	icons_role:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)

	local icons_raid_mark = ns.CreateCheckBox(parent, "icons_raid_mark", L_GUI_UF_ICONS_RAID_MARK)
	icons_raid_mark:SetPoint("LEFT", icons_role, "RIGHT", 170, 0)

	local icons_ready_check = ns.CreateCheckBox(parent, "icons_ready_check", L_GUI_UF_ICONS_READY_CHECK)
	icons_ready_check:SetPoint("LEFT", icons_raid_mark, "RIGHT", 170, 0)

	local icons_leader = ns.CreateCheckBox(parent, "icons_leader", L_GUI_UF_ICONS_LEADER)
	icons_leader:SetPoint("TOPLEFT", icons_role, "BOTTOMLEFT", 0, 0)

	local icons_sumon = ns.CreateCheckBox(parent, "icons_sumon", L_GUI_UF_ICONS_SUMON)
	icons_sumon:SetPoint("LEFT", icons_leader, "RIGHT", 170, 0)

	-- Panel 2
	local parent = ViksUIOptionsPanel.raidframe2

	local plugins_debuffhighlight_icon = ns.CreateCheckBox(parent, "plugins_debuffhighlight_icon", L_GUI_UF_PLUGINS_DEBUFFHIGHLIGHT_ICON)
	plugins_debuffhighlight_icon:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local plugins_aura_watch = ns.CreateCheckBox(parent, "plugins_aura_watch", L_GUI_UF_PLUGINS_AURA_WATCH)
	plugins_aura_watch:SetPoint("TOPLEFT", plugins_debuffhighlight_icon, "BOTTOMLEFT", 0, 0)

	local ListButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	ListButton:SetPoint("LEFT", plugins_aura_watch.Text, "RIGHT", 20, 0)
	ListButton:SetSize(100, 23)
	ListButton:SetText(ADD)
	ListButton:SetWidth(ListButton.Text:GetWidth() + 15)
	ListButton:SetScript("OnClick", function()
		if not C.options["raidframe"] then
			C.options["raidframe"] = {}
		end
		if not C.options["raidframe"]["plugins_aura_watch_list"] then
			C.options["raidframe"]["plugins_aura_watch_list"] = {}
		end
		BuildSpellList(C.options["raidframe"]["plugins_aura_watch_list"])
	end)
	tinsert(ns.buttons, ListButton)

	local function toggleListButton()
		local shown = plugins_aura_watch:GetChecked()
		ListButton:SetEnabled(shown)
	end

	plugins_aura_watch:HookScript("OnClick", toggleListButton)
	ListButton:HookScript("OnShow", toggleListButton)

	local plugins_aura_watch_timer = ns.CreateCheckBox(parent, "plugins_aura_watch_timer", L_GUI_UF_PLUGINS_AURA_WATCH_TIMER)
	plugins_aura_watch_timer:SetPoint("TOPLEFT", plugins_aura_watch, "BOTTOMLEFT", 20, 0)

	plugins_aura_watch.children = {plugins_aura_watch_timer}

	local plugins_pvp_debuffs = ns.CreateCheckBox(parent, "plugins_pvp_debuffs", L_GUI_UF_PLUGINS_PVP_DEBUFFS)
	plugins_pvp_debuffs:SetPoint("TOPLEFT", plugins_aura_watch_timer, "BOTTOMLEFT", -20, 0)

	local plugins_healcomm = ns.CreateCheckBox(parent, "plugins_healcomm", L_GUI_UF_PLUGINS_HEALCOMM)
	plugins_healcomm:SetPoint("TOPLEFT", plugins_pvp_debuffs, "BOTTOMLEFT", 0, 0)

	local plugins_auto_resurrection = ns.CreateCheckBox(parent, "plugins_auto_resurrection")
	plugins_auto_resurrection:SetPoint("TOPLEFT", plugins_healcomm, "BOTTOMLEFT", 0, 0)
	]]--
--end

-- Announcements
do
	local parent = ViksUIOptionsPanel.announcements

	local drinking = ns.CreateCheckBox(parent, "drinking", L_GUI_ANNOUNCEMENTS_DRINKING)
	drinking:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local interrupts = ns.CreateCheckBox(parent, "interrupts", L_GUI_ANNOUNCEMENTS_INTERRUPTS)
	interrupts:SetPoint("TOPLEFT", drinking, "BOTTOMLEFT", 0, 0)
	
	local spells = ns.CreateCheckBox(parent, "spells", L_GUI_ANNOUNCEMENTS_SPELLS)
	spells:SetPoint("TOPLEFT", interrupts, "BOTTOMLEFT", 0, 0)

	local ListButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	ListButton:SetPoint("LEFT", spells.Text, "RIGHT", 20, 0)
	ListButton:SetSize(100, 23)
	ListButton:SetText(">>")
	ListButton:SetWidth(ListButton.Text:GetWidth() + 15)
	ListButton:SetScript("OnClick", function()
		if not C.options["announcements"] then
			C.options["announcements"] = {}
		end
		if not C.options["announcements"]["spells_list"] then
			C.options["announcements"]["spells_list"] = T.announce_spells
		end
		BuildSpellList(C.options["announcements"]["spells_list"])
	end)
	tinsert(ns.buttons, ListButton)

	local function toggleListButton()
		local shown = spells:GetChecked()
		ListButton:SetEnabled(shown)
		if not T.announce_spells then ListButton:Disable() return end
	end

	spells:HookScript("OnClick", toggleListButton)
	ListButton:HookScript("OnShow", toggleListButton)

	local spells_from_all = ns.CreateCheckBox(parent, "spells_from_all", L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL)
	spells:SetPoint("TOPLEFT", interrupts, "BOTTOMLEFT", 0, 0)

	local spells_from_all = ns.CreateCheckBox(parent, "spells_from_all", L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL)
	spells_from_all:SetPoint("TOPLEFT", spells, "BOTTOMLEFT", 20, 0)

	spells.children = {spells_from_all}

	local toys = ns.CreateCheckBox(parent, "toys", L_GUI_ANNOUNCEMENTS_TOY_TRAIN)
	toys:SetPoint("TOPLEFT", spells_from_all, "BOTTOMLEFT", -20, 0)

	local pull_countdown = ns.CreateCheckBox(parent, "pull_countdown", L_GUI_ANNOUNCEMENTS_PULL_COUNTDOWN)
	pull_countdown:SetPoint("TOPLEFT", toys, "BOTTOMLEFT", 0, 0)

	local flask_food = ns.CreateCheckBox(parent, "flask_food", L_GUI_ANNOUNCEMENTS_FLASK_FOOD)
	flask_food:SetPoint("TOPLEFT", pull_countdown, "BOTTOMLEFT", 0, 0)

	local flask_food_auto = ns.CreateCheckBox(parent, "flask_food_auto", L_GUI_ANNOUNCEMENTS_FLASK_FOOD_AUTO)
	flask_food_auto:SetPoint("TOPLEFT", flask_food, "BOTTOMLEFT", 20, 0)

	local flask_food_raid = ns.CreateCheckBox(parent, "flask_food_raid", L_GUI_ANNOUNCEMENTS_FLASK_FOOD_RAID)
	flask_food_raid:SetPoint("TOPLEFT", flask_food_auto, "BOTTOMLEFT", 0, 0)

	flask_food.children = {flask_food_auto, flask_food_raid}

	local feasts = ns.CreateCheckBox(parent, "feasts", L_GUI_ANNOUNCEMENTS_FEASTS)
	feasts:SetPoint("TOPLEFT", flask_food_raid, "BOTTOMLEFT", -20, 0)

	local portals = ns.CreateCheckBox(parent, "portals", L_GUI_ANNOUNCEMENTS_PORTALS)
	portals:SetPoint("TOPLEFT", feasts, "BOTTOMLEFT", 0, 0)

	local bad_gear = ns.CreateCheckBox(parent, "bad_gear")
	bad_gear:SetPoint("TOPLEFT", portals, "BOTTOMLEFT", 0, 0)

	local safari_hat = ns.CreateCheckBox(parent, "safari_hat", L_GUI_ANNOUNCEMENTS_SAFARI_HAT)
	safari_hat:SetPoint("TOPLEFT", bad_gear, "BOTTOMLEFT", 0, 0)
end

-- Automation
do
	local parent = ViksUIOptionsPanel.automation

	local release = ns.CreateCheckBox(parent, "release")
	release:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local screenshot = ns.CreateCheckBox(parent, "screenshot")
	screenshot:SetPoint("TOPLEFT", release, "BOTTOMLEFT", 0, 0)

	local solve_artifact = ns.CreateCheckBox(parent, "solve_artifact")
	solve_artifact:SetPoint("TOPLEFT", screenshot, "BOTTOMLEFT", 0, 0)

	local accept_invite = ns.CreateCheckBox(parent, "accept_invite")
	accept_invite:SetPoint("TOPLEFT", solve_artifact, "BOTTOMLEFT", 0, 0)

	local decline_duel = ns.CreateCheckBox(parent, "decline_duel")
	decline_duel:SetPoint("TOPLEFT", accept_invite, "BOTTOMLEFT", 0, 0)

	local accept_quest = ns.CreateCheckBox(parent, "accept_quest")
	accept_quest:SetPoint("TOPLEFT", decline_duel, "BOTTOMLEFT", 0, 0)

	local auto_collapse_login = ns.CreateCheckBox(parent, "auto_collapse_login")
	auto_collapse_login:SetPoint("TOPLEFT", accept_quest, "BOTTOMLEFT", 0, 0)
	
	local auto_collapse = ns.CreateCheckBox(parent, "auto_collapse")
	auto_collapse:SetPoint("TOPLEFT", auto_collapse_login, "BOTTOMLEFT", 0, 0)

	local auto_collapse_reload = ns.CreateCheckBox(parent, "auto_collapse_reload")
	auto_collapse_reload:SetPoint("TOPLEFT", auto_collapse, "BOTTOMLEFT", 20, 0)

	auto_collapse.children = {auto_collapse_reload}

	local skip_cinematic = ns.CreateCheckBox(parent, "skip_cinematic")
	skip_cinematic:SetPoint("TOPLEFT", auto_collapse_reload, "BOTTOMLEFT", -20, 0)

	local auto_role = ns.CreateCheckBox(parent, "auto_role")
	auto_role:SetPoint("TOPLEFT", skip_cinematic, "BOTTOMLEFT", 0, 0)

	local cancel_bad_buffs = ns.CreateCheckBox(parent, "cancel_bad_buffs")
	cancel_bad_buffs:SetPoint("TOPLEFT", auto_role, "BOTTOMLEFT", 0, 0)

	local tab_binder = ns.CreateCheckBox(parent, "tab_binder")
	tab_binder:SetPoint("TOPLEFT", cancel_bad_buffs, "BOTTOMLEFT", 0, 0)

	local logging_combat = ns.CreateCheckBox(parent, "logging_combat")
	logging_combat:SetPoint("TOPLEFT", tab_binder, "BOTTOMLEFT", 0, 0)

	local buff_on_scroll = ns.CreateCheckBox(parent, "buff_on_scroll")
	buff_on_scroll:SetPoint("TOPLEFT", logging_combat, "BOTTOMLEFT", 0, 0)

	local open_items = ns.CreateCheckBox(parent, "open_items")
	open_items:SetPoint("TOPLEFT", buff_on_scroll, "BOTTOMLEFT", 0, 0)
	
	local AutoRepair = ns.CreateCheckBox(parent, "AutoRepair")
	AutoRepair:SetPoint("TOPLEFT", open_items, "BOTTOMLEFT", 0, 0)
	
	local AutoRepairG = ns.CreateCheckBox(parent, "AutoRepairG")
	AutoRepairG:SetPoint("TOPLEFT", AutoRepair, "BOTTOMLEFT", 0, 0)
	
	local resurrection = ns.CreateCheckBox(parent, "resurrection")
	resurrection:SetPoint("TOPLEFT", AutoRepairG, "BOTTOMLEFT", 0, 0)

	local summon = ns.CreateCheckBox(parent, "summon")
	summon:SetPoint("TOPLEFT", resurrection, "BOTTOMLEFT", 0, 0)
end

-- Combat text
do
	local parent = ViksUIOptionsPanel.combattext

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_COMBATTEXT_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local blizz_head_numbers = ns.CreateCheckBox(parent, "blizz_head_numbers")
	blizz_head_numbers:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)

	local damage_style = ns.CreateCheckBox(parent, "damage_style")
	damage_style:SetPoint("TOPLEFT", blizz_head_numbers, "BOTTOMLEFT", 20, 0)

	blizz_head_numbers.children = {damage_style}

	local damage = ns.CreateCheckBox(parent, "damage", L_GUI_COMBATTEXT_DAMAGE)
	damage:SetPoint("TOPLEFT", damage_style, "BOTTOMLEFT", -20, 0)

	local healing = ns.CreateCheckBox(parent, "healing", L_GUI_COMBATTEXT_HEALING)
	healing:SetPoint("TOPLEFT", damage, "BOTTOMLEFT", 0, 0)

	local show_hots = ns.CreateCheckBox(parent, "show_hots", L_GUI_COMBATTEXT_HOTS)
	show_hots:SetPoint("TOPLEFT", healing, "BOTTOMLEFT", 0, 0)

	local show_overhealing = ns.CreateCheckBox(parent, "show_overhealing", L_GUI_COMBATTEXT_OVERHEALING)
	show_overhealing:SetPoint("TOPLEFT", show_hots, "BOTTOMLEFT", 0, 0)

	local pet_damage = ns.CreateCheckBox(parent, "pet_damage", L_GUI_COMBATTEXT_PET_DAMAGE)
	pet_damage:SetPoint("TOPLEFT", show_overhealing, "BOTTOMLEFT", 0, 0)

	local dot_damage = ns.CreateCheckBox(parent, "dot_damage", L_GUI_COMBATTEXT_DOT_DAMAGE)
	dot_damage:SetPoint("TOPLEFT", pet_damage, "BOTTOMLEFT", 0, 0)

	local damage_color = ns.CreateCheckBox(parent, "damage_color", L_GUI_COMBATTEXT_DAMAGE_COLOR)
	damage_color:SetPoint("TOPLEFT", dot_damage, "BOTTOMLEFT", 0, 0)

	local crit_prefix = ns.CreateEditBox(parent, "crit_prefix", true, L_GUI_COMBATTEXT_CRIT_PREFIX)
	crit_prefix:SetPoint("TOPLEFT", damage_color, "BOTTOMLEFT", 6, -8)

	local crit_postfix = ns.CreateEditBox(parent, "crit_postfix", true, L_GUI_COMBATTEXT_CRIT_POSTFIX)
	crit_postfix:SetPoint("TOPLEFT", crit_prefix, "BOTTOMLEFT", 0, -10)

	local icons = ns.CreateCheckBox(parent, "icons", L_GUI_COMBATTEXT_ICONS)
	icons:SetPoint("TOPLEFT", crit_postfix, "BOTTOMLEFT", -6, -8)

	local icon_size = ns.CreateNumberSlider(parent, "icon_size", nil, nil, 0, 30, 1, true, L_GUI_COMBATTEXT_ICON_SIZE, L_GUI_COMBATTEXT_ICON_SIZE_DESC)
	icon_size:SetPoint("TOPLEFT", icons, "BOTTOMLEFT", 0, -20)

	local treshold = ns.CreateEditBox(parent, "treshold", true, L_GUI_COMBATTEXT_TRESHOLD, true)
	treshold:SetPoint("TOPLEFT", icon_size, "BOTTOMLEFT", 6, -10)

	local heal_treshold = ns.CreateEditBox(parent, "heal_treshold", true, L_GUI_COMBATTEXT_HEAL_TRESHOLD, true)
	heal_treshold:SetPoint("TOPLEFT", treshold, "BOTTOMLEFT", 0, -10)

	local scrollable = ns.CreateCheckBox(parent, "scrollable", L_GUI_COMBATTEXT_SCROLLABLE)
	scrollable:SetPoint("TOPLEFT", heal_treshold, "BOTTOMLEFT", -6, -8)

	local max_lines = ns.CreateNumberSlider(parent, "max_lines", nil, nil, 0, 30, 1, true, L_GUI_COMBATTEXT_MAX_LINES, L_GUI_COMBATTEXT_MAX_LINES_DESC)
	max_lines:SetPoint("TOPLEFT", scrollable, "BOTTOMLEFT", 0, -20)

	local time_visible = ns.CreateNumberSlider(parent, "time_visible", nil, nil, 0, 10, 1, true, L_GUI_COMBATTEXT_TIME_VISIBLE, L_GUI_COMBATTEXT_TIME_VISIBLE_DESC)
	time_visible:SetPoint("TOPLEFT", max_lines, "BOTTOMLEFT", 0, -20)

	-- Panel 2
	local parent = ViksUIOptionsPanel.combattext2

	local dk_runes = ns.CreateCheckBox(parent, "dk_runes", L_GUI_COMBATTEXT_DK_RUNES)
	dk_runes:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local killingblow = ns.CreateCheckBox(parent, "killingblow", L_GUI_COMBATTEXT_KILLINGBLOW)
	killingblow:SetPoint("TOPLEFT", dk_runes, "BOTTOMLEFT", 0, 0)

	local merge_aoe_spam = ns.CreateCheckBox(parent, "merge_aoe_spam", L_GUI_COMBATTEXT_MERGE_AOE_SPAM)
	merge_aoe_spam:SetPoint("TOPLEFT", killingblow, "BOTTOMLEFT", 0, 0)

	local merge_melee = ns.CreateCheckBox(parent, "merge_melee", L_GUI_COMBATTEXT_MERGE_MELEE)
	merge_melee:SetPoint("TOPLEFT", merge_aoe_spam, "BOTTOMLEFT", 0, 0)

	local dispel = ns.CreateCheckBox(parent, "dispel", L_GUI_COMBATTEXT_DISPEL)
	dispel:SetPoint("TOPLEFT", merge_melee, "BOTTOMLEFT", 0, 0)

	local interrupt = ns.CreateCheckBox(parent, "interrupt", L_GUI_COMBATTEXT_INTERRUPT)
	interrupt:SetPoint("TOPLEFT", dispel, "BOTTOMLEFT", 0, 0)

	local direction = ns.CreateCheckBox(parent, "direction", L_GUI_COMBATTEXT_DIRECTION)
	direction:SetPoint("TOPLEFT", interrupt, "BOTTOMLEFT", 0, 0)

	local short_numbers = ns.CreateCheckBox(parent, "short_numbers", L_GUI_COMBATTEXT_SHORT_NUMBERS)
	short_numbers:SetPoint("TOPLEFT", direction, "BOTTOMLEFT", 0, 0)
end

-- Reminder
do
	local parent = ViksUIOptionsPanel.reminder

	local solo_buffs_enable = ns.CreateCheckBox(parent, "solo_buffs_enable", L_GUI_REMINDER_SOLO_ENABLE)
	solo_buffs_enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local solo_buffs_sound = ns.CreateCheckBox(parent, "solo_buffs_sound", L_GUI_REMINDER_SOLO_SOUND)
	solo_buffs_sound:SetPoint("TOPLEFT", solo_buffs_enable, "BOTTOMLEFT", 0, 0)

	local solo_buffs_size = ns.CreateNumberSlider(parent, "solo_buffs_size", nil, nil, 0, 65, 1, true, L_GUI_REMINDER_SOLO_SIZE, L_GUI_REMINDER_SOLO_SIZE_DESC)
	solo_buffs_size:SetPoint("TOPLEFT", solo_buffs_sound, "BOTTOMLEFT", 0, -20)

	-- Raid buffs
	local subheader = ns.addSubCategory(parent, L_GUI_REMINDER_SUBHEADER)
	subheader:SetPoint("TOPLEFT", solo_buffs_size, "BOTTOMLEFT", 0, -16)

	local raid_buffs_enable = ns.CreateCheckBox(parent, "raid_buffs_enable", L_GUI_REMINDER_RAID_ENABLE)
	raid_buffs_enable:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)

	local raid_buffs_always = ns.CreateCheckBox(parent, "raid_buffs_always", L_GUI_REMINDER_RAID_ALWAYS)
	raid_buffs_always:SetPoint("TOPLEFT", raid_buffs_enable, "BOTTOMLEFT", 0, 0)

	local raid_buffs_size = ns.CreateNumberSlider(parent, "raid_buffs_size", nil, nil, 0, 30, 1, true, L_GUI_REMINDER_RAID_SIZE, L_GUI_REMINDER_RAID_SIZE_DESC)
	raid_buffs_size:SetPoint("TOPLEFT", raid_buffs_always, "BOTTOMLEFT", 0, -20)

	local raid_buffs_alpha = ns.CreateNumberSlider(parent, "raid_buffs_alpha", nil, nil, 0, 1, 0.05, true, L_GUI_REMINDER_RAID_ALPHA, L_GUI_REMINDER_RAID_ALPHA_DESC)
	raid_buffs_alpha:SetPoint("TOPLEFT", raid_buffs_size, "BOTTOMLEFT", 0, -20)
end

-- Raid cooldowns
do
	local parent = ViksUIOptionsPanel.raidcooldown

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_COOLDOWN_RAID_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local height = ns.CreateNumberSlider(parent, "height", nil, nil, 0, 30, 1, true, L_GUI_COOLDOWN_RAID_HEIGHT)
	height:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, -20)

	local width = ns.CreateNumberSlider(parent, "width", nil, nil, 0, 300, 1, true, L_GUI_COOLDOWN_RAID_WIDTH)
	width:SetPoint("TOPLEFT", height, "BOTTOMLEFT", 0, -20)

	local upwards = ns.CreateCheckBox(parent, "upwards", L_GUI_COOLDOWN_RAID_SORT)
	upwards:SetPoint("TOPLEFT", width, "BOTTOMLEFT", 0, -10)

	local expiration = ns.CreateCheckBox(parent, "expiration", L_GUI_COOLDOWN_RAID_EXPIRATION)
	expiration:SetPoint("TOPLEFT", upwards, "BOTTOMLEFT", 0, 0)

	local show_self = ns.CreateCheckBox(parent, "show_self", L_GUI_COOLDOWN_RAID_SHOW_SELF)
	show_self:SetPoint("TOPLEFT", expiration, "BOTTOMLEFT", 0, 0)

	local show_icon = ns.CreateCheckBox(parent, "show_icon", L_GUI_COOLDOWN_RAID_ICONS)
	show_icon:SetPoint("TOPLEFT", show_self, "BOTTOMLEFT", 0, 0)

	local show_inraid = ns.CreateCheckBox(parent, "show_inraid", L_GUI_COOLDOWN_RAID_IN_RAID)
	show_inraid:SetPoint("TOPLEFT", show_icon, "BOTTOMLEFT", 0, 0)

	local show_inparty = ns.CreateCheckBox(parent, "show_inparty", L_GUI_COOLDOWN_RAID_IN_PARTY)
	show_inparty:SetPoint("TOPLEFT", show_inraid, "BOTTOMLEFT", 0, 0)

	local show_inarena = ns.CreateCheckBox(parent, "show_inarena", L_GUI_COOLDOWN_RAID_IN_ARENA)
	show_inarena:SetPoint("TOPLEFT", show_inparty, "BOTTOMLEFT", 0, 0)

	local ListButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	ListButton:SetPoint("TOPLEFT", show_inarena, "BOTTOMLEFT", 3, -5)
	ListButton:SetSize(100, 23)
	ListButton:SetText(L_GUI_SPELL_LIST)
	ListButton:SetWidth(ListButton.Text:GetWidth() + 15)
	ListButton:SetScript("OnClick", function()
		if not C.options["raidcooldown"] then
			C.options["raidcooldown"] = {}
		end
		if not C.options["raidcooldown"]["spells_list"] then
			C.options["raidcooldown"]["spells_list"] = T.raid_spells
			C.options.raidcooldown.spells_list_ver = 2
		end
		BuildSpellList(C.options["raidcooldown"]["spells_list"], true)
	end)
	tinsert(ns.buttons, ListButton)

	local function toggleListButton()
		local shown = enable:GetChecked()
		ListButton:SetEnabled(shown)
		if not T.raid_spells then ListButton:Disable() return end
	end

	enable:HookScript("OnClick", toggleListButton)
	ListButton:HookScript("OnShow", toggleListButton)
end

-- Enemy cooldowns
do
	local parent = ViksUIOptionsPanel.enemycooldown

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_COOLDOWN_ENEMY_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local size = ns.CreateNumberSlider(parent, "size", nil, nil, 0, 60, 1, true, L_GUI_COOLDOWN_ENEMY_SIZE)
	size:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, -20)

	local direction = ns.CreateDropDown(parent, "direction", true, L_GUI_COOLDOWN_ENEMY_DIRECTION, {"RIGHT", "LEFT", "UP", "DOWN"})
	direction:SetPoint("TOPLEFT", size, "BOTTOMLEFT", -16, -10)

	local show_always = ns.CreateCheckBox(parent, "show_always", L_GUI_COOLDOWN_ENEMY_EVERYWHERE)
	show_always:SetPoint("TOPLEFT", direction, "BOTTOMLEFT", 16, 0)

	local show_inpvp = ns.CreateCheckBox(parent, "show_inpvp", L_GUI_COOLDOWN_ENEMY_IN_BG)
	show_inpvp:SetPoint("TOPLEFT", show_always, "BOTTOMLEFT", 0, 0)

	local show_inarena = ns.CreateCheckBox(parent, "show_inarena", L_GUI_COOLDOWN_ENEMY_IN_ARENA)
	show_inarena:SetPoint("TOPLEFT", show_inpvp, "BOTTOMLEFT", 0, 0)

	local show_inparty = ns.CreateCheckBox(parent, "show_inparty")
	show_inparty:SetPoint("TOPLEFT", show_inarena, "BOTTOMLEFT", 0, 0)

	local class_color = ns.CreateCheckBox(parent, "class_color")
	class_color:SetPoint("TOPLEFT", show_inparty, "BOTTOMLEFT", 0, 0)

	local ListButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	ListButton:SetPoint("TOPLEFT", class_color, "BOTTOMLEFT", 3, -5)
	ListButton:SetSize(100, 23)
	ListButton:SetText(L_GUI_SPELL_LIST)
	ListButton:SetWidth(ListButton.Text:GetWidth() + 15)
	ListButton:SetScript("OnClick", function()
		if not C.options["enemycooldown"] then
			C.options["enemycooldown"] = {}
		end
		if not C.options["enemycooldown"]["spells_list"] then
			C.options["enemycooldown"]["spells_list"] = T.enemy_spells
		end
		BuildSpellList(C.options["enemycooldown"]["spells_list"], true)
	end)
	tinsert(ns.buttons, ListButton)

	local function toggleListButton()
		local shown = enable:GetChecked()
		ListButton:SetEnabled(shown)
		if not T.enemy_spells then ListButton:Disable() return end
	end

	enable:HookScript("OnClick", toggleListButton)
	ListButton:HookScript("OnShow", toggleListButton)
end

-- Pulse cooldowns
do
	local parent = ViksUIOptionsPanel.pulsecooldown

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_COOLDOWN_PULSE_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local size = ns.CreateNumberSlider(parent, "size", nil, nil, 0, 100, 1, true, L_GUI_COOLDOWN_ENEMY_SIZE)
	size:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, -20)

	local sound = ns.CreateCheckBox(parent, "sound", L_GUI_COOLDOWN_PULSE_SOUND)
	sound:SetPoint("TOPLEFT", size, "BOTTOMLEFT", 0, -10)

	local anim_scale = ns.CreateNumberSlider(parent, "anim_scale", nil, nil, 0, 3, 0.05, true, L_GUI_COOLDOWN_PULSE_ANIM_SCALE)
	anim_scale:SetPoint("TOPLEFT", sound, "BOTTOMLEFT", 0, -20)

	local hold_time = ns.CreateNumberSlider(parent, "hold_time", nil, nil, 0, 5, 1, true, L_GUI_COOLDOWN_PULSE_HOLD_TIME)
	hold_time:SetPoint("TOPLEFT", anim_scale, "BOTTOMLEFT", 0, -20)

	local threshold = ns.CreateNumberSlider(parent, "threshold", nil, nil, 0, 15, 1, true, L_GUI_COOLDOWN_PULSE_THRESHOLD, L_GUI_COOLDOWN_PULSE_THRESHOLD_DESC)
	threshold:SetPoint("TOPLEFT", hold_time, "BOTTOMLEFT", 0, -20)
end

-- Threat
do
	local parent = ViksUIOptionsPanel.threat

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_THREAT_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local height = ns.CreateNumberSlider(parent, "height", nil, nil, 0, 25, 1, true, L_GUI_THREAT_HEIGHT)
	height:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, -20)

	local width = ns.CreateNumberSlider(parent, "width", nil, nil, 0, 300, 1, true, L_GUI_THREAT_WIDTH)
	width:SetPoint("TOPLEFT", height, "BOTTOMLEFT", 0, -20)

	local bar_rows = ns.CreateNumberSlider(parent, "bar_rows", nil, nil, 0, 15, 5, true, L_GUI_THREAT_ROWS)
	bar_rows:SetPoint("TOPLEFT", width, "BOTTOMLEFT", 0, -20)

	local hide_solo = ns.CreateCheckBox(parent, "hide_solo", L_GUI_THREAT_HIDE_SOLO)
	hide_solo:SetPoint("TOPLEFT", bar_rows, "BOTTOMLEFT", 0, -20)
end

-- Tooltip
do
	local parent = ViksUIOptionsPanel.tooltip

	local enable = ns.CreateCheckBox(parent, "enable")
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local shift_modifer = ns.CreateCheckBox(parent, "shift_modifer")
	shift_modifer:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)

	local cursor = ns.CreateCheckBox(parent, "cursor")
	cursor:SetPoint("TOPLEFT", shift_modifer, "BOTTOMLEFT", 0, 0)

	local item_icon = ns.CreateCheckBox(parent, "item_icon")
	item_icon:SetPoint("TOPLEFT", cursor, "BOTTOMLEFT", 0, 0)

	local health_value = ns.CreateCheckBox(parent, "health_value")
	health_value:SetPoint("TOPLEFT", item_icon, "BOTTOMLEFT", 0, 0)

	local hidebuttons = ns.CreateCheckBox(parent, "hidebuttons")
	hidebuttons:SetPoint("TOPLEFT", health_value, "BOTTOMLEFT", 0, 0)

	local hide_combat = ns.CreateCheckBox(parent, "hide_combat")
	hide_combat:SetPoint("TOPLEFT", hidebuttons, "BOTTOMLEFT", 0, 0)

	-- Plugins
	local subheader = ns.addSubCategory(parent)
	subheader:SetPoint("TOPLEFT", hide_combat, "BOTTOMLEFT", 0, 0)

	local talents = ns.CreateCheckBox(parent, "talents")
	talents:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -4)

	local achievements = ns.CreateCheckBox(parent, "achievements")
	achievements:SetPoint("TOPLEFT", talents, "BOTTOMLEFT", 0, 0)

	local target = ns.CreateCheckBox(parent, "target")
	target:SetPoint("TOPLEFT", achievements, "BOTTOMLEFT", 0, 0)

	local title = ns.CreateCheckBox(parent, "title")
	title:SetPoint("TOPLEFT", target, "BOTTOMLEFT", 0, 0)

	local realm = ns.CreateCheckBox(parent, "realm")
	realm:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, 0)

	local rank = ns.CreateCheckBox(parent, "rank")
	rank:SetPoint("TOPLEFT", realm, "BOTTOMLEFT", 0, 0)

	local spell_id = ns.CreateCheckBox(parent, "spell_id")
	spell_id:SetPoint("TOPLEFT", rank, "BOTTOMLEFT", 0, 0)

	local average_lvl = ns.CreateCheckBox(parent, "average_lvl", STAT_AVERAGE_ITEM_LEVEL)
	average_lvl:SetPoint("TOPLEFT", spell_id, "BOTTOMLEFT", 0, 0)

	local raid_icon = ns.CreateCheckBox(parent, "raid_icon")
	raid_icon:SetPoint("TOPLEFT", average_lvl, "BOTTOMLEFT", 0, 0)

	local who_targetting = ns.CreateCheckBox(parent, "who_targetting")
	who_targetting:SetPoint("TOPLEFT", raid_icon, "BOTTOMLEFT", 0, 0)

	local item_count = ns.CreateCheckBox(parent, "item_count")
	item_count:SetPoint("TOPLEFT", who_targetting, "BOTTOMLEFT", 0, 0)

	local unit_role = ns.CreateCheckBox(parent, "unit_role")
	unit_role:SetPoint("TOPLEFT", item_count, "BOTTOMLEFT", 0, 0)

	local instance_lock = ns.CreateCheckBox(parent, "instance_lock")
	instance_lock:SetPoint("TOPLEFT", unit_role, "BOTTOMLEFT", 0, 0)
	
	local mount = ns.CreateCheckBox(parent, "mount")
	mount:SetPoint("TOPLEFT", instance_lock, "BOTTOMLEFT", 0, 0)
	
	local npc_id = ns.CreateCheckBox(parent, "npc_id", "NPC id")
	npc_id:SetPoint("TOPLEFT", mount, "BOTTOMLEFT", 0, 0)

	local npc_tip = ns.CreateCheckBox(parent, "npc_tip")
	npc_tip:SetPoint("TOPLEFT", npc_id, "BOTTOMLEFT", 0, 0)
	
	-- Page 2
	local parent = ViksUIOptionsPanel.tooltip2
	
	local bottomleft = ns.CreateCheckBox(parent, "bottomleft", "Tooltip Anchor from Bottom Left")
	bottomleft:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)
	
	local bottomright = ns.CreateCheckBox(parent, "bottomright", "Tooltip Anchor from Bottom Right")
	bottomright:SetPoint("TOPLEFT", bottomleft, "BOTTOMLEFT", 0, 0)
	
	local topright = ns.CreateCheckBox(parent, "topright", "Tooltip Anchor from Top Right")
	topright:SetPoint("TOPLEFT", bottomright, "BOTTOMLEFT", 0, 0)

	local topleft = ns.CreateCheckBox(parent, "topleft", "Tooltip Anchor from Top Left")
	topleft:SetPoint("TOPLEFT", topright, "BOTTOMLEFT", 0, 0)	
	
	local DungeonScore = ns.CreateCheckBox(parent, "DungeonScore", "Show Dungeon Score")
	DungeonScore:SetPoint("TOPLEFT", topleft, "BOTTOMLEFT", 0, 0)
end

-- Chat
do
	local parent = ViksUIOptionsPanel.chat

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_CHAT_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local background = ns.CreateCheckBox(parent, "background", L_GUI_CHAT_BACKGROUND)
	background:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)

	local background_alpha = ns.CreateNumberSlider(parent, "background_alpha", nil, nil, 0, 1, 0.05, true, L_GUI_CHAT_BACKGROUND_ALPHA)
	background_alpha:SetPoint("TOPLEFT", background, "BOTTOMLEFT", 0, -20)

	local filter = ns.CreateCheckBox(parent, "filter", L_GUI_CHAT_SPAM)
	filter:SetPoint("TOPLEFT", background_alpha, "BOTTOMLEFT", 0, -10)

	local spam = ns.CreateCheckBox(parent, "spam", L_GUI_CHAT_GOLD)
	spam:SetPoint("TOPLEFT", filter, "BOTTOMLEFT", 0, 0)
	
	local spam_list = ns.CreateEditBox(parent, "spam_list", true)
	spam_list:SetPoint("TOPLEFT", spam, "BOTTOMLEFT", 6, -10)
	spam_list:SetWidth(200)
	spam_list:SetMaxLetters(40)

	local width = ns.CreateNumberSlider(parent, "width", nil, nil, 0, 500, 1, true, L_GUI_CHAT_WIDTH)
	width:SetPoint("TOPLEFT", spam_list, "BOTTOMLEFT", 0, -20)

	local height = ns.CreateNumberSlider(parent, "height", nil, nil, 0, 200, 1, true, L_GUI_CHAT_HEIGHT)
	height:SetPoint("TOPLEFT", width, "BOTTOMLEFT", 0, -20)

	local chat_bar = ns.CreateCheckBox(parent, "chat_bar", L_GUI_CHAT_BAR)
	chat_bar:SetPoint("TOPLEFT", height, "BOTTOMLEFT", 0, -10)

	local chat_bar_mouseover = ns.CreateCheckBox(parent, "chat_bar_mouseover", L_GUI_CHAT_BAR_MOUSEOVER)
	chat_bar_mouseover:SetPoint("TOPLEFT", chat_bar, "BOTTOMLEFT", 20, 0)

	chat_bar.children = {chat_bar_mouseover}

	local time_color = ns.CreateColourPicker(parent, "time_color", true, L_GUI_CHAT_TIMESTAMP)
	time_color:SetPoint("TOPLEFT", chat_bar_mouseover, "BOTTOMLEFT", -16, -10)
	
	local history = ns.CreateCheckBox(parent, "history", HISTORY)
	history:SetPoint("TOPLEFT", time_color, "BOTTOMLEFT", 0, 0)
	
	local whisp_sound = ns.CreateCheckBox(parent, "whisp_sound", L_GUI_CHAT_WHISP)
	whisp_sound:SetPoint("TOPLEFT", history, "BOTTOMLEFT", -4, -10)

	local bubbles = ns.CreateCheckBox(parent, "bubbles", L_GUI_CHAT_SKIN_BUBBLE)
	bubbles:SetPoint("TOPLEFT", whisp_sound, "BOTTOMLEFT", 0, 0)

	local combatlog = ns.CreateCheckBox(parent, "combatlog", L_GUI_CHAT_CL_TAB)
	combatlog:SetPoint("TOPLEFT", bubbles, "BOTTOMLEFT", 0, 0)

	local tabs_mouseover = ns.CreateCheckBox(parent, "tabs_mouseover", L_GUI_CHAT_TABS_MOUSEOVER)
	tabs_mouseover:SetPoint("TOPLEFT", combatlog, "BOTTOMLEFT", 0, 0)

	local sticky = ns.CreateCheckBox(parent, "sticky", L_GUI_CHAT_STICKY)
	sticky:SetPoint("TOPLEFT", tabs_mouseover, "BOTTOMLEFT", 0, 0)

	local damage_meter_spam = ns.CreateCheckBox(parent, "damage_meter_spam", L_GUI_CHAT_DAMAGE_METER_SPAM)
	damage_meter_spam:SetPoint("TOPLEFT", sticky, "BOTTOMLEFT", 0, 0)

	local smileys = ns.CreateCheckBox(parent, "smileys", L.chat_smileys)
	smileys:SetPoint("TOPLEFT", damage_meter_spam, "BOTTOMLEFT", 0, 0)
end

-- Bag
do
	local parent = ViksUIOptionsPanel.bag

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_BAGS_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local ilvl = ns.CreateCheckBox(parent, "ilvl", L_GUI_BAGS_ILVL)
	ilvl:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)
	
	local new_items = ns.CreateCheckBox(parent, "new_items")
	new_items:SetPoint("TOPLEFT", ilvl, "BOTTOMLEFT", 0, 0)

	local button_size = ns.CreateNumberSlider(parent, "button_size", nil, nil, 0, 40, 1, true, L_GUI_BAGS_BUTTON_SIZE)
	button_size:SetPoint("TOPLEFT", new_items, "BOTTOMLEFT", 0, -20)

	local button_space = ns.CreateNumberSlider(parent, "button_space", nil, nil, 0, 7, 1, true, L_GUI_BAGS_BUTTON_SPACE)
	button_space:SetPoint("TOPLEFT", button_size, "BOTTOMLEFT", 0, -20)

	local bank_columns = ns.CreateNumberSlider(parent, "bank_columns", nil, nil, 0, 25, 1, true, L_GUI_BAGS_BANK)
	bank_columns:SetPoint("TOPLEFT", button_space, "BOTTOMLEFT", 0, -20)

	local bag_columns = ns.CreateNumberSlider(parent, "bag_columns", nil, nil, 0, 20, 1, true, L_GUI_BAGS_BAG)
	bag_columns:SetPoint("TOPLEFT", bank_columns, "BOTTOMLEFT", 0, -20)
end

-- Minimap
do
	local parent = ViksUIOptionsPanel.minimap

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_MINIMAP_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local tracking_icon = ns.CreateCheckBox(parent, "tracking_icon", L_GUI_MINIMAP_ICON)
	tracking_icon:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)

	local garrison_icon = ns.CreateCheckBox(parent, "garrison_icon", L_GUI_GARRISON_ICON)
	garrison_icon:SetPoint("TOPLEFT", tracking_icon, "BOTTOMLEFT", 0, 0)

	local size = ns.CreateNumberSlider(parent, "size", nil, nil, 0, 250, 1, true, L_GUI_MINIMAP_SIZE)
	size:SetPoint("TOPLEFT", garrison_icon, "BOTTOMLEFT", 0, -20)

	local hide_combat = ns.CreateCheckBox(parent, "hide_combat", L_GUI_MINIMAP_HIDE_COMBAT)
	hide_combat:SetPoint("TOPLEFT", size, "BOTTOMLEFT", 0, -10)

	local toggle_menu = ns.CreateCheckBox(parent, "toggle_menu", L_GUI_MINIMAP_TOGGLE_MENU)
	toggle_menu:SetPoint("TOPLEFT", hide_combat, "BOTTOMLEFT", 0, 0)
	
	local compass = ns.CreateCheckBox(parent, "compass", L_GUI_MINIMAP_COMPASS)
	compass:SetPoint("TOPLEFT", toggle_menu, "BOTTOMLEFT", 0, 0)

	-- Other
	local subheader = ns.addSubCategory(parent, OTHER)
	subheader:SetPoint("TOPLEFT", compass, "BOTTOMLEFT", 0, -16)

	local bg_map_stylization = ns.CreateCheckBox(parent, "bg_map_stylization")
	bg_map_stylization:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -8)
	
	local minimb1 = ns.CreateCheckBox(parent, "minimb1", L_GUI_MINIMAP_MINIBT_1)
	minimb1:SetPoint("TOPLEFT", bg_map_stylization, "BOTTOMLEFT", 0, -8)
	
	local minimb2 = ns.CreateCheckBox(parent, "minimb2", L_GUI_MINIMAP_MINIBT_2)
	minimb2:SetPoint("TOPLEFT", minimb1, "BOTTOMLEFT", 0, -8)
	
	local zoneMapMultilplier = ns.CreateNumberSlider(parent, "zoneMapMultilplier", nil, nil, 0, 5, 0.1, true, zoneMapMultilplier)
	zoneMapMultilplier:SetPoint("TOPLEFT", minimb2, "BOTTOMLEFT", 0, -20)
	
	local zoneMapScale = ns.CreateNumberSlider(parent, "zoneMapScale", nil, nil, 0, 2, 0.01, true, zoneMapScale)
	zoneMapScale:SetPoint("TOPLEFT", zoneMapMultilplier, "BOTTOMLEFT", 0, -20)
end

-- Loot
do
	local parent = ViksUIOptionsPanel.loot

	local lootframe = ns.CreateCheckBox(parent, "lootframe", L_GUI_LOOT_ENABLE)
	lootframe:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local rolllootframe = ns.CreateCheckBox(parent, "rolllootframe", L_GUI_LOOT_ROLL_ENABLE)
	rolllootframe:SetPoint("TOPLEFT", lootframe, "BOTTOMLEFT", 0, 0)

	local icon_size = ns.CreateNumberSlider(parent, "icon_size", nil, nil, 0, 40, 1, true, L_GUI_LOOT_ICON_SIZE)
	icon_size:SetPoint("TOPLEFT", rolllootframe, "BOTTOMLEFT", 0, -20)

	local width = ns.CreateNumberSlider(parent, "width", nil, nil, 0, 350, 1, true, L_GUI_LOOT_WIDTH)
	width:SetPoint("TOPLEFT", icon_size, "BOTTOMLEFT", 0, -20)

	local auto_greed = ns.CreateCheckBox(parent, "auto_greed", L_GUI_LOOT_AUTOGREED)
	auto_greed:SetPoint("TOPLEFT", width, "BOTTOMLEFT", 0, -10)

	local auto_confirm_de = ns.CreateCheckBox(parent, "auto_confirm_de", L_GUI_LOOT_AUTODE)
	auto_confirm_de:SetPoint("TOPLEFT", auto_greed, "BOTTOMLEFT", 0, 0)
	
	local faster_loot = ns.CreateCheckBox(parent, "faster_loot")
	faster_loot:SetPoint("TOPLEFT", auto_confirm_de, "BOTTOMLEFT", 0, 0)
end

-- Nameplate
do
	local parent = ViksUIOptionsPanel.nameplate
	
	local multScale = 768 / select(2, GetPhysicalScreenSize())
	
	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_NAMEPLATE_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local height = ns.CreateNumberSlider(parent, "height", nil, nil, 0, 20 / multScale, 1, true, L_GUI_NAMEPLATE_HEIGHT)
	height:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, -20)

	local width = ns.CreateNumberSlider(parent, "width", nil, nil, 0, 150 / multScale, 1, true, L_GUI_NAMEPLATE_WIDTH)
	width:SetPoint("LEFT", height, "RIGHT", 120, 0)

	local distance = ns.CreateNumberSlider(parent, "distance", nil, nil, 0, 200, 1, true, L_GUI_NAMEPLATE_DISTANCE)
	distance:SetPoint("TOPLEFT", height, "BOTTOMLEFT", 0, -20)

	local ad_height = ns.CreateNumberSlider(parent, "ad_height", nil, nil, 0, 15 / multScale, 1, true, L_GUI_NAMEPLATE_AD_HEIGHT)
	ad_height:SetPoint("TOPLEFT", distance, "BOTTOMLEFT", 0, -20)

	local ad_width = ns.CreateNumberSlider(parent, "ad_width", nil, nil, 0, 80 / multScale, 1, true, L_GUI_NAMEPLATE_AD_WIDTH)
	ad_width:SetPoint("LEFT", ad_height, "RIGHT", 120, 0)

	local combat = ns.CreateCheckBox(parent, "combat", L_GUI_NAMEPLATE_COMBAT)
	combat:SetPoint("TOPLEFT", ad_height, "BOTTOMLEFT", 0, -20)

	local health_value = ns.CreateCheckBox(parent, "health_value", L_GUI_NAMEPLATE_HEALTH)
	health_value:SetPoint("TOPLEFT", combat, "BOTTOMLEFT", 0, 0)

	local show_castbar_name = ns.CreateCheckBox(parent, "show_castbar_name", L_GUI_NAMEPLATE_CASTBAR_NAME)
	show_castbar_name:SetPoint("TOPLEFT", health_value, "BOTTOMLEFT", 0, 0)

	local class_icons = ns.CreateCheckBox(parent, "class_icons", L_GUI_NAMEPLATE_CLASS_ICON)
	class_icons:SetPoint("TOPLEFT", show_castbar_name, "BOTTOMLEFT", 0, 0)

	local name_abbrev = ns.CreateCheckBox(parent, "name_abbrev", L_GUI_NAMEPLATE_NAME_ABBREV)
	name_abbrev:SetPoint("TOPLEFT", class_icons, "BOTTOMLEFT", 0, 0)

	local clamp = ns.CreateCheckBox(parent, "clamp", L_GUI_NAMEPLATE_CLAMP)
	clamp:SetPoint("TOPLEFT", name_abbrev, "BOTTOMLEFT", 0, 0)

	local track_debuffs = ns.CreateCheckBox(parent, "track_debuffs", L_GUI_NAMEPLATE_SHOW_DEBUFFS)
	track_debuffs:SetPoint("TOPLEFT", clamp, "BOTTOMLEFT", 0, 0)

	local ListButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	ListButton:SetPoint("LEFT", track_debuffs, "RIGHT", 400, 0)
	ListButton:SetSize(100, 23)
	ListButton:SetText(ADD)
	ListButton:SetWidth(ListButton.Text:GetWidth() + 15)
	ListButton:SetScript("OnClick", function()
		if not C.options["nameplate"] then
			C.options["nameplate"] = {}
		end
		if not C.options["nameplate"]["debuffs_list"] then
			C.options["nameplate"]["debuffs_list"] = {}
		end
		BuildSpellList(C.options["nameplate"]["debuffs_list"])
	end)
	tinsert(ns.buttons, ListButton)

	local function toggleListButton()
		local shown = track_debuffs:GetChecked()
		ListButton:SetEnabled(shown)
	end

	track_debuffs:HookScript("OnClick", toggleListButton)
	ListButton:HookScript("OnShow", toggleListButton)

	local track_buffs = ns.CreateCheckBox(parent, "track_buffs", L_GUI_NAMEPLATE_SHOW_BUFFS)
	track_buffs:SetPoint("TOPLEFT", track_debuffs, "BOTTOMLEFT", 0, 0)

	local ListButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	ListButton:SetPoint("LEFT", track_buffs, "RIGHT", 400, 0)
	ListButton:SetSize(100, 23)
	ListButton:SetText(ADD)
	ListButton:SetWidth(ListButton.Text:GetWidth() + 15)
	ListButton:SetScript("OnClick", function()
		if not C.options["nameplate"] then
			C.options["nameplate"] = {}
		end
		if not C.options["nameplate"]["buffs_list"] then
			C.options["nameplate"]["buffs_list"] = {}
		end
		BuildSpellList(C.options["nameplate"]["buffs_list"])
	end)
	tinsert(ns.buttons, ListButton)

	local function toggleListButton()
		local shown = track_buffs:GetChecked()
		ListButton:SetEnabled(shown)
	end

	track_buffs:HookScript("OnClick", toggleListButton)
	ListButton:HookScript("OnShow", toggleListButton)

	local auras_size = ns.CreateNumberSlider(parent, "auras_size", nil, nil, 0, 35 / multScale, 1, true, L_GUI_NAMEPLATE_DEBUFFS_SIZE)
	auras_size:SetPoint("TOPLEFT", track_buffs, "BOTTOMLEFT", 0, -20)

	local healer_icon = ns.CreateCheckBox(parent, "healer_icon", L_GUI_NAMEPLATE_HEALER_ICON)
	healer_icon:SetPoint("TOPLEFT", auras_size, "BOTTOMLEFT", 0, -20)

	local totem_icons = ns.CreateCheckBox(parent, "totem_icons", L_GUI_NAMEPLATE_TOTEM_ICONS)
	totem_icons:SetPoint("TOPLEFT", healer_icon, "BOTTOMLEFT", 0, 0)
	
	local quest_icon = ns.CreateCheckBox(parent, "quest_icon", L_GUI_NAMEPLATE_QUEST_ICON)
	quest_icon:SetPoint("TOPLEFT", totem_icons, "BOTTOMLEFT", 0, 0)
	
	local target_glow = ns.CreateCheckBox(parent, "target_glow")
	target_glow:SetPoint("TOPLEFT", quest_icon, "BOTTOMLEFT", 0, 0)
	
	local npc_colors = ns.CreateCheckBox(parent, "npc_colors")
	npc_colors:SetPoint("TOPLEFT", target_glow, "BOTTOMLEFT", 0, 0)
	
	local target_arrow = ns.CreateCheckBox(parent, "target_arrow", "Show arrow for target (Rearanges castbar icons position")
	target_arrow:SetPoint("TOPLEFT", npc_colors, "BOTTOMLEFT", 0, 0)

	-- Panel 2
	local parent = ViksUIOptionsPanel.nameplate2

	local enhance_threat = ns.CreateCheckBox(parent, "enhance_threat", L_GUI_NAMEPLATE_THREAT)
	enhance_threat:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local good_color = ns.CreateColourPicker(parent, "good_color", true, L_GUI_NAMEPLATE_GOOD_COLOR)
	good_color:SetPoint("TOPLEFT", enhance_threat, "BOTTOMLEFT", 4, -10)

	local near_color = ns.CreateColourPicker(parent, "near_color", true, L_GUI_NAMEPLATE_NEAR_COLOR)
	near_color:SetPoint("TOPLEFT", good_color, "BOTTOMLEFT", 0, -10)

	local bad_color = ns.CreateColourPicker(parent, "bad_color", true, L_GUI_NAMEPLATE_BAD_COLOR)
	bad_color:SetPoint("TOPLEFT", near_color, "BOTTOMLEFT", 0, -10)

	local offtank_color = ns.CreateColourPicker(parent, "offtank_color", true, L_GUI_NAMEPLATE_OFFTANK_COLOR)
	offtank_color:SetPoint("TOPLEFT", bad_color, "BOTTOMLEFT", 0, -10)
	
	local subheader = ns.addSubCategory(parent, "Priority Markings colors")
	subheader:SetPoint("TOPLEFT", offtank_color, "BOTTOMLEFT", 0, -10)
	
	local priority_color = ns.CreateColourPicker(parent, "priority_color", true, L_GUI_NAMEPLATE_PRIORITY_COLOR)
	priority_color:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -10)
	
	local semipri_color = ns.CreateColourPicker(parent, "semipri_color", true, L_GUI_NAMEPLATE_SEMIPRI_COLOR)
	semipri_color:SetPoint("TOPLEFT", priority_color, "BOTTOMLEFT", 0, -10)
	
	local nuke_color = ns.CreateColourPicker(parent, "nuke_color", true, L_GUI_NAMEPLATE_NUKE_COLOR)
	nuke_color:SetPoint("TOPLEFT", semipri_color, "BOTTOMLEFT", 0, -10)
	
	local t3mobs_color = ns.CreateColourPicker(parent, "t3mobs_color", true, L_GUI_NAMEPLATE_T3MOBS_COLOR)
	t3mobs_color:SetPoint("TOPLEFT", nuke_color, "BOTTOMLEFT", 0, -10)
	
	local tides_color = ns.CreateColourPicker(parent, "tides_color", true, L_GUI_NAMEPLATE_TIDES_COLOR)
	tides_color:SetPoint("TOPLEFT", t3mobs_color, "BOTTOMLEFT", 0, -10)

	local pvpstuff_color = ns.CreateColourPicker(parent, "pvpstuff_color", true, L_GUI_NAMEPLATE_PVPSTUFF_COLOR)
	pvpstuff_color:SetPoint("TOPLEFT", tides_color, "BOTTOMLEFT", 0, -10)
	
	local explosive_color = ns.CreateColourPicker(parent, "explosive_color", true, L_GUI_NAMEPLATE_EXPLOSIVE_COLOR)
	explosive_color:SetPoint("TOPLEFT", pvpstuff_color, "BOTTOMLEFT", 0, -10)
	
	local subheader2 = ns.addSubCategory(parent, "Target Arrow and Glow colors")
	subheader2:SetPoint("TOPLEFT", explosive_color, "BOTTOMLEFT", 0, -10)
	
	local targetarrow_color = ns.CreateColourPicker(parent, "targetarrow_color", true, L_GUI_NAMEPLATE_TARGETARROW_COLOR)
	targetarrow_color:SetPoint("TOPLEFT", subheader2, "BOTTOMLEFT", 0, -10)
	
	local targetglow_color = ns.CreateColourPicker(parent, "targetglow_color", true, L_GUI_NAMEPLATE_TARGETGLOW_COLOR)
	targetglow_color:SetPoint("TOPLEFT", targetarrow_color, "BOTTOMLEFT", 0, -10)
end

-- ActionBar
do
	local parent = ViksUIOptionsPanel.actionbar

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_ACTIONBAR_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local hotkey = ns.CreateCheckBox(parent, "hotkey", L_GUI_ACTIONBAR_HOTKEY)
	hotkey:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)

	local macro = ns.CreateCheckBox(parent, "macro", L_GUI_ACTIONBAR_MACRO)
	macro:SetPoint("TOPLEFT", hotkey, "BOTTOMLEFT", 0, 0)

	local show_grid = ns.CreateCheckBox(parent, "show_grid", L_GUI_ACTIONBAR_GRID)
	show_grid:SetPoint("TOPLEFT", macro, "BOTTOMLEFT", 0, 0)

	local button_size = ns.CreateNumberSlider(parent, "button_size", nil, nil, 0, 40, 1, true, L_GUI_ACTIONBAR_BUTTON_SIZE)
	button_size:SetPoint("TOPLEFT", show_grid, "BOTTOMLEFT", 0, -20)

	local button_space = ns.CreateNumberSlider(parent, "button_space", nil, nil, 0, 10, 1, true, L_GUI_ACTIONBAR_BUTTON_SPACE)
	button_space:SetPoint("LEFT", button_size, "RIGHT", 120, 0)

	local split_bars = ns.CreateCheckBox(parent, "split_bars", L_GUI_ACTIONBAR_SPLIT_BARS)
	split_bars:SetPoint("TOPLEFT", button_size, "BOTTOMLEFT", 0, -10)

	local classcolor_border = ns.CreateCheckBox(parent, "classcolor_border", L_GUI_ACTIONBAR_CLASSCOLOR_BORDER)
	classcolor_border:SetPoint("TOPLEFT", split_bars, "BOTTOMLEFT", 0, 0)

	local hide_highlight = ns.CreateCheckBox(parent, "hide_highlight", L_GUI_ACTIONBAR_HIDE_HIGHLIGHT)
	hide_highlight:SetPoint("TOPLEFT", classcolor_border, "BOTTOMLEFT", 0, 0)

	local toggle_mode = ns.CreateCheckBox(parent, "toggle_mode")
	toggle_mode:SetPoint("TOPLEFT", hide_highlight, "BOTTOMLEFT", 0, 0)

	local bottombars = ns.CreateNumberSlider(parent, "bottombars", nil, nil, 1, 3, 1, true, L_GUI_ACTIONBAR_BOTTOMBARS)
	bottombars:SetPoint("TOPLEFT", toggle_mode, "BOTTOMLEFT", 0, -20)

	local rightbars = ns.CreateNumberSlider(parent, "rightbars", nil, nil, 0, 3, 1, true, L_GUI_ACTIONBAR_RIGHTBARS)
	rightbars:SetPoint("LEFT", bottombars, "RIGHT", 120, 0)

	local bottombars_mouseover = ns.CreateCheckBox(parent, "bottombars_mouseover")
	bottombars_mouseover:SetPoint("TOPLEFT", bottombars, "BOTTOMLEFT", 0, -10)

	local rightbars_mouseover = ns.CreateCheckBox(parent, "rightbars_mouseover", L_GUI_ACTIONBAR_RIGHTBARS_MOUSEOVER)
	rightbars_mouseover:SetPoint("TOPLEFT", bottombars_mouseover, "BOTTOMLEFT", 0, 0)

	local petbar_hide = ns.CreateCheckBox(parent, "petbar_hide", L_GUI_ACTIONBAR_PETBAR_HIDE)
	petbar_hide:SetPoint("TOPLEFT", rightbars_mouseover, "BOTTOMLEFT", 0, 0)

	local petbar_horizontal = ns.CreateCheckBox(parent, "petbar_horizontal", L_GUI_ACTIONBAR_PETBAR_HORIZONTAL)
	petbar_horizontal:SetPoint("TOPLEFT", petbar_hide, "BOTTOMLEFT", 0, 0)

	local petbar_mouseover = ns.CreateCheckBox(parent, "petbar_mouseover", L_GUI_ACTIONBAR_PETBAR_MOUSEOVER)
	petbar_mouseover:SetPoint("TOPLEFT", petbar_horizontal, "BOTTOMLEFT", 20, 0)

	-- petbar_horizontal.children = {petbar_mouseover}

	local stancebar_hide = ns.CreateCheckBox(parent, "stancebar_hide", L_GUI_ACTIONBAR_STANCEBAR_HIDE)
	stancebar_hide:SetPoint("TOPLEFT", petbar_mouseover, "BOTTOMLEFT", -20, 0)

	local stancebar_horizontal = ns.CreateCheckBox(parent, "stancebar_horizontal", L_GUI_ACTIONBAR_STANCEBAR_HORIZONTAL)
	stancebar_horizontal:SetPoint("TOPLEFT", stancebar_hide, "BOTTOMLEFT", 0, 0)

	local stancebar_mouseover = ns.CreateCheckBox(parent, "stancebar_mouseover", L_GUI_ACTIONBAR_STANCEBAR_MOUSEOVER)
	stancebar_mouseover:SetPoint("TOPLEFT", stancebar_horizontal, "BOTTOMLEFT", 20, 0)

	-- stancebar_horizontal.children = {stancebar_mouseover}

	local micromenu = ns.CreateCheckBox(parent, "micromenu", L_GUI_ACTIONBAR_MICROMENU)
	micromenu:SetPoint("TOPLEFT", stancebar_mouseover, "BOTTOMLEFT", -20, 0)

	local micromenu_mouseover = ns.CreateCheckBox(parent, "micromenu_mouseover", L_GUI_ACTIONBAR_MICROMENU_MOUSEOVER)
	micromenu_mouseover:SetPoint("TOPLEFT", micromenu, "BOTTOMLEFT", 20, 0)

	micromenu.children = {micromenu_mouseover}

	-- Panel 2
	local parent = ViksUIOptionsPanel.actionbar2

	local editor = ns.CreateCheckBox(parent, "editor")
	editor:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	-- Bar 1
	local subheader = ns.addSubCategory(editor, BINDING_HEADER_ACTIONBAR.." 1")
	subheader:SetPoint("TOPLEFT", editor, "BOTTOMLEFT", 0, -10)

	local bar1_num = ns.CreateNumberSlider(parent, "bar1_num", nil, nil, 0, 12, 1, true)
	bar1_num:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -30)

	local bar1_row = ns.CreateNumberSlider(parent, "bar1_row", nil, nil, 1, 12, 1, true)
	bar1_row:SetPoint("LEFT", bar1_num, "RIGHT", 120, 0)

	local bar1_size = ns.CreateNumberSlider(parent, "bar1_size", nil, nil, 0, 40, 1, true, L_GUI_ACTIONBAR_BUTTON_SIZE)
	bar1_size:SetPoint("TOPLEFT", bar1_num, "BOTTOMLEFT", 0, -20)

	local bar1_mouseover = ns.CreateCheckBox(parent, "bar1_mouseover")
	bar1_mouseover:SetPoint("LEFT", bar1_size, "RIGHT", 130, 0)

	-- Bar 2
	local subheader = ns.addSubCategory(editor, BINDING_HEADER_ACTIONBAR.." 2")
	subheader:SetPoint("TOPLEFT", bar1_size, "BOTTOMLEFT", 0, -10)

	local bar2_num = ns.CreateNumberSlider(parent, "bar2_num", nil, nil, 0, 12, 1, true, L.actionbar_bar1_num)
	bar2_num:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -30)

	local bar2_row = ns.CreateNumberSlider(parent, "bar2_row", nil, nil, 1, 12, 1, true, L.actionbar_bar1_row)
	bar2_row:SetPoint("LEFT", bar2_num, "RIGHT", 120, 0)

	local bar2_size = ns.CreateNumberSlider(parent, "bar2_size", nil, nil, 0, 40, 1, true, L_GUI_ACTIONBAR_BUTTON_SIZE)
	bar2_size:SetPoint("TOPLEFT", bar2_num, "BOTTOMLEFT", 0, -20)

	local bar2_mouseover = ns.CreateCheckBox(parent, "bar2_mouseover", L.actionbar_bar1_mouseover)
	bar2_mouseover:SetPoint("LEFT", bar2_size, "RIGHT", 130, 0)

	-- Bar 3
	local subheader = ns.addSubCategory(editor, BINDING_HEADER_ACTIONBAR.." 3")
	subheader:SetPoint("TOPLEFT", bar2_size, "BOTTOMLEFT", 0, -10)

	local bar3_num = ns.CreateNumberSlider(parent, "bar3_num", nil, nil, 0, 12, 1, true, L.actionbar_bar1_num)
	bar3_num:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -30)

	local bar3_row = ns.CreateNumberSlider(parent, "bar3_row", nil, nil, 1, 12, 1, true, L.actionbar_bar1_row)
	bar3_row:SetPoint("LEFT", bar3_num, "RIGHT", 120, 0)

	local bar3_size = ns.CreateNumberSlider(parent, "bar3_size", nil, nil, 0, 40, 1, true, L_GUI_ACTIONBAR_BUTTON_SIZE)
	bar3_size:SetPoint("TOPLEFT", bar3_num, "BOTTOMLEFT", 0, -20)

	local bar3_mouseover = ns.CreateCheckBox(parent, "bar3_mouseover", L.actionbar_bar1_mouseover)
	bar3_mouseover:SetPoint("LEFT", bar3_size, "RIGHT", 130, 0)

	-- Bar 4
	local subheader = ns.addSubCategory(editor, BINDING_HEADER_ACTIONBAR.." 4")
	subheader:SetPoint("TOPLEFT", bar3_size, "BOTTOMLEFT", 0, -10)

	local bar4_num = ns.CreateNumberSlider(parent, "bar4_num", nil, nil, 0, 12, 1, true, L.actionbar_bar1_num)
	bar4_num:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -30)

	local bar4_row = ns.CreateNumberSlider(parent, "bar4_row", nil, nil, 1, 12, 1, true, L.actionbar_bar1_row)
	bar4_row:SetPoint("LEFT", bar4_num, "RIGHT", 120, 0)

	local bar4_size = ns.CreateNumberSlider(parent, "bar4_size", nil, nil, 0, 40, 1, true, L_GUI_ACTIONBAR_BUTTON_SIZE)
	bar4_size:SetPoint("TOPLEFT", bar4_num, "BOTTOMLEFT", 0, -20)

	local bar4_mouseover = ns.CreateCheckBox(parent, "bar4_mouseover", L.actionbar_bar1_mouseover)
	bar4_mouseover:SetPoint("LEFT", bar4_size, "RIGHT", 130, 0)

	-- Bar 5
	local subheader = ns.addSubCategory(editor, BINDING_HEADER_ACTIONBAR.." 5")
	subheader:SetPoint("TOPLEFT", bar4_size, "BOTTOMLEFT", 0, -10)

	local bar5_num = ns.CreateNumberSlider(parent, "bar5_num", nil, nil, 0, 12, 1, true, L.actionbar_bar1_num)
	bar5_num:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -30)

	local bar5_row = ns.CreateNumberSlider(parent, "bar5_row", nil, nil, 1, 12, 1, true, L.actionbar_bar1_row)
	bar5_row:SetPoint("LEFT", bar5_num, "RIGHT", 120, 0)

	local bar5_size = ns.CreateNumberSlider(parent, "bar5_size", nil, nil, 0, 40, 1, true, L_GUI_ACTIONBAR_BUTTON_SIZE)
	bar5_size:SetPoint("TOPLEFT", bar5_num, "BOTTOMLEFT", 0, -20)

	local bar5_mouseover = ns.CreateCheckBox(parent, "bar5_mouseover", L.actionbar_bar1_mouseover)
	bar5_mouseover:SetPoint("LEFT", bar5_size, "RIGHT", 130, 0)
end

-- Auras/Buffs/Debuffs
do
	local parent = ViksUIOptionsPanel.aura

	local player_buff_size = ns.CreateNumberSlider(parent, "player_buff_size", nil, nil, 0, 40, 1, true, L_GUI_AURA_PLAYER_BUFF_SIZE, L_GUI_AURA_PLAYER_BUFF_SIZE_DESC)
	player_buff_size:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, -20)

	local show_spiral = ns.CreateCheckBox(parent, "show_spiral", L_GUI_AURA_SHOW_SPIRAL)
	show_spiral:SetPoint("TOPLEFT", player_buff_size, "BOTTOMLEFT", 0, -10)

	local show_timer = ns.CreateCheckBox(parent, "show_timer", L_GUI_AURA_SHOW_TIMER)
	show_timer:SetPoint("TOPLEFT", show_spiral, "BOTTOMLEFT", 0, 0)

	local player_auras = ns.CreateCheckBox(parent, "player_auras", L_GUI_AURA_PLAYER_AURAS)
	player_auras:SetPoint("TOPLEFT", show_timer, "BOTTOMLEFT", 0, 0)

	local target_auras = ns.CreateCheckBox(parent, "target_auras", L_GUI_AURA_TARGET_AURAS)
	target_auras:SetPoint("TOPLEFT", player_auras, "BOTTOMLEFT", 0, 0)

	local focus_debuffs = ns.CreateCheckBox(parent, "focus_debuffs", L_GUI_AURA_FOCUS_DEBUFFS)
	focus_debuffs:SetPoint("TOPLEFT", target_auras, "BOTTOMLEFT", 0, 0)

	local fot_debuffs = ns.CreateCheckBox(parent, "fot_debuffs", L_GUI_AURA_FOT_DEBUFFS)
	fot_debuffs:SetPoint("TOPLEFT", focus_debuffs, "BOTTOMLEFT", 0, 0)

	local pet_debuffs = ns.CreateCheckBox(parent, "pet_debuffs", L_GUI_AURA_PET_DEBUFFS)
	pet_debuffs:SetPoint("TOPLEFT", fot_debuffs, "BOTTOMLEFT", 0, 0)

	local tot_debuffs = ns.CreateCheckBox(parent, "tot_debuffs", L_GUI_AURA_TOT_DEBUFFS)
	tot_debuffs:SetPoint("TOPLEFT", pet_debuffs, "BOTTOMLEFT", 0, 0)

	local boss_buffs = ns.CreateCheckBox(parent, "boss_buffs", L_GUI_AURA_BOSS_BUFFS)
	boss_buffs:SetPoint("TOPLEFT", tot_debuffs, "BOTTOMLEFT", 0, 0)

	local player_aura_only = ns.CreateCheckBox(parent, "player_aura_only", L_GUI_AURA_PLAYER_AURA_ONLY)
	player_aura_only:SetPoint("TOPLEFT", boss_buffs, "BOTTOMLEFT", 0, 0)

	local debuff_color_type = ns.CreateCheckBox(parent, "debuff_color_type", L_GUI_AURA_DEBUFF_COLOR_TYPE)
	debuff_color_type:SetPoint("TOPLEFT", player_aura_only, "BOTTOMLEFT", 0, 0)

	local cast_by = ns.CreateCheckBox(parent, "cast_by", L_GUI_AURA_CAST_BY)
	cast_by:SetPoint("TOPLEFT", debuff_color_type, "BOTTOMLEFT", 0, 0)

	local classcolor_border = ns.CreateCheckBox(parent, "classcolor_border", L_GUI_AURA_CLASSCOLOR_BORDER)
	classcolor_border:SetPoint("TOPLEFT", cast_by, "BOTTOMLEFT", 0, 0)
end

-- Filger
do
	local parent = ViksUIOptionsPanel.filger

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_FILGER_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local show_tooltip = ns.CreateCheckBox(parent, "show_tooltip", L_GUI_FILGER_SHOW_TOOLTIP)
	show_tooltip:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)

	local expiration = ns.CreateCheckBox(parent, "expiration", L_GUI_FILGER_EXPIRATION)
	expiration:SetPoint("TOPLEFT", show_tooltip, "BOTTOMLEFT", 0, 0)

	-- Elements
	local subheader = ns.addSubCategory(parent, L.filger_subheader_elements)
	subheader:SetPoint("TOPLEFT", expiration, "BOTTOMLEFT", 0, -10)

	local show_buff = ns.CreateCheckBox(parent, "show_buff")
	show_buff:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -10)

	local show_proc = ns.CreateCheckBox(parent, "show_proc")
	show_proc:SetPoint("LEFT", show_buff, "RIGHT", 320, 0)

	local show_debuff = ns.CreateCheckBox(parent, "show_debuff")
	show_debuff:SetPoint("TOPLEFT", show_buff, "BOTTOMLEFT", 0, 0)

	local show_aura_bar = ns.CreateCheckBox(parent, "show_aura_bar")
	show_aura_bar:SetPoint("LEFT", show_debuff, "RIGHT", 320, 0)

	local show_pvp_player = ns.CreateCheckBox(parent, "show_pvp_player")
	show_pvp_player:SetPoint("TOPLEFT", show_debuff, "BOTTOMLEFT", 0, 0)

	local show_pvp_target = ns.CreateCheckBox(parent, "show_pvp_target")
	show_pvp_target:SetPoint("LEFT", show_pvp_player, "RIGHT", 320, 0)

	local show_special = ns.CreateCheckBox(parent, "show_special")
	show_special:SetPoint("TOPLEFT", show_pvp_player, "BOTTOMLEFT", 0, 0)

	local show_cd = ns.CreateCheckBox(parent, "show_cd")
	show_cd:SetPoint("LEFT", show_special, "RIGHT", 320, 0)

	-- Size
	local subheader = ns.addSubCategory(parent, L.filger_subheader_size)
	subheader:SetPoint("TOPLEFT", show_special, "BOTTOMLEFT", 0, -10)

	local buffs_size = ns.CreateNumberSlider(parent, "buffs_size", nil, nil, 0, 50, 1, true, L_GUI_FILGER_BUFFS_SIZE)
	buffs_size:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -30)

	local buffs_space = ns.CreateNumberSlider(parent, "buffs_space", nil, nil, 0, 10, 1, true)
	buffs_space:SetPoint("LEFT", buffs_size, "RIGHT", 120, 0)

	local pvp_size = ns.CreateNumberSlider(parent, "pvp_size", nil, nil, 0, 80, 1, true, L_GUI_FILGER_PVP_SIZE)
	pvp_size:SetPoint("TOPLEFT", buffs_size, "BOTTOMLEFT", 0, -20)

	local pvp_space = ns.CreateNumberSlider(parent, "pvp_space", nil, nil, 0, 10, 1, true)
	pvp_space:SetPoint("LEFT", pvp_size, "RIGHT", 120, 0)

	local cooldown_size = ns.CreateNumberSlider(parent, "cooldown_size", nil, nil, 0, 50, 1, true, L_GUI_FILGER_COOLDOWN_SIZE)
	cooldown_size:SetPoint("TOPLEFT", pvp_size, "BOTTOMLEFT", 0, -20)

	local cooldown_space = ns.CreateNumberSlider(parent, "cooldown_space", nil, nil, 0, 10, 1, true)
	cooldown_space:SetPoint("LEFT", cooldown_size, "RIGHT", 120, 0)

	-- Testing
	local subheader = ns.addSubCategory(parent, L.filger_subheader_test)
	subheader:SetPoint("TOPLEFT", cooldown_size, "BOTTOMLEFT", 0, -10)

	local test_mode = ns.CreateCheckBox(parent, "test_mode", L_GUI_FILGER_TEST_MODE)
	test_mode:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", 0, -10)

	local max_test_icon = ns.CreateNumberSlider(parent, "max_test_icon", nil, nil, 0, 10, 1, true, L_GUI_FILGER_MAX_TEST_ICON)
	max_test_icon:SetPoint("TOPLEFT", test_mode, "BOTTOMLEFT", 0, -20)

	-- Spell List
	local subheader = ns.addSubCategory(parent, L.filger_subheader_spells)
	subheader:SetPoint("TOPLEFT", max_test_icon, "BOTTOMLEFT", 0, -10)

	local category_list = ns.CreateDropDown(parent, "category_list", true, L.filger_category_list, FilgerTable)
	category_list:SetPoint("TOPLEFT", subheader, "BOTTOMLEFT", -16, -10)

	hooksecurefunc(category_list, "SetValue", function()
		if not C.options["filger"] then
			C.options["filger"] = {}
		end
		if not C.options["filger"][FilgerDropDownText[category_list.selectedValue]] then
			C.options["filger"][FilgerDropDownText[category_list.selectedValue]] = {}
		end
		BuildSpellList(C.options["filger"][FilgerDropDownText[category_list.selectedValue]], false, true)
	end)
end
--[[
-- Top Panel
do
	local parent = ViksUIOptionsPanel.toppanel

	local enable = ns.CreateCheckBox(parent, "enable", L_GUI_TOP_PANEL_ENABLE)
	enable:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local mouseover = ns.CreateCheckBox(parent, "mouseover", L_GUI_TOP_PANEL_MOUSE)
	mouseover:SetPoint("TOPLEFT", enable, "BOTTOMLEFT", 0, 0)

	local height = ns.CreateNumberSlider(parent, "height", nil, nil, 40, 150, 1, true, L_GUI_TOP_PANEL_HEIGHT)
	height:SetPoint("TOPLEFT", mouseover, "BOTTOMLEFT", 0, -20)

	local width = ns.CreateNumberSlider(parent, "width", nil, nil, 100, 500, 1, true, L_GUI_TOP_PANEL_WIDTH)
	width:SetPoint("TOPLEFT", height, "BOTTOMLEFT", 0, -20)
end

-- Stats
do
	local parent = ViksUIOptionsPanel.stats

	local clock = ns.CreateCheckBox(parent, "clock", L_GUI_STATS_CLOCK)
	clock:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local latency = ns.CreateCheckBox(parent, "latency", L_GUI_STATS_LATENCY)
	latency:SetPoint("TOPLEFT", clock, "BOTTOMLEFT", 0, 0)

	local memory = ns.CreateCheckBox(parent, "memory", L_GUI_STATS_MEMORY)
	memory:SetPoint("TOPLEFT", latency, "BOTTOMLEFT", 0, 0)

	local fps = ns.CreateCheckBox(parent, "fps", L_GUI_STATS_FPS)
	fps:SetPoint("TOPLEFT", memory, "BOTTOMLEFT", 0, 0)

	local friend = ns.CreateCheckBox(parent, "friend", FRIENDS)
	friend:SetPoint("TOPLEFT", fps, "BOTTOMLEFT", 0, 0)

	local guild = ns.CreateCheckBox(parent, "guild", GUILD)
	guild:SetPoint("TOPLEFT", friend, "BOTTOMLEFT", 0, 0)

	local durability = ns.CreateCheckBox(parent, "durability", DURABILITY)
	durability:SetPoint("TOPLEFT", guild, "BOTTOMLEFT", 0, 0)

	local experience = ns.CreateCheckBox(parent, "experience", L_GUI_STATS_EXPERIENCE)
	experience:SetPoint("TOPLEFT", durability, "BOTTOMLEFT", 0, 0)

	local talents = ns.CreateCheckBox(parent, "talents", SPECIALIZATION, L_GUI_STATS_TALENTS_DESC)
	talents:SetPoint("TOPLEFT", experience, "BOTTOMLEFT", 0, 0)

	local coords = ns.CreateCheckBox(parent, "coords", L_GUI_STATS_COORDS)
	coords:SetPoint("TOPLEFT", talents, "BOTTOMLEFT", 0, 0)

	local location = ns.CreateCheckBox(parent, "location", L_GUI_STATS_LOCATION)
	location:SetPoint("TOPLEFT", coords, "BOTTOMLEFT", 0, 0)

	local battleground = ns.CreateCheckBox(parent, "battleground", L_GUI_STATS_BG)
	battleground:SetPoint("TOPLEFT", location, "BOTTOMLEFT", 0, 0)

	-- Currency
	local currency = ns.addSubCategory(parent, L_GUI_STATS_SUBHEADER_CURRENCY)
	currency:SetPoint("TOPLEFT", battleground, "BOTTOMLEFT", 0, -16)

	local currency_archaeology = ns.CreateCheckBox(parent, "currency_archaeology", L_GUI_STATS_CURRENCY_ARCHAEOLOGY)
	currency_archaeology:SetPoint("TOPLEFT", currency, "BOTTOMLEFT", 0, -8)

	local currency_cooking = ns.CreateCheckBox(parent, "currency_cooking", L_GUI_STATS_CURRENCY_COOKING)
	currency_cooking:SetPoint("TOPLEFT", currency_archaeology, "BOTTOMLEFT", 0, 0)

	local currency_professions = ns.CreateCheckBox(parent, "currency_professions", L_GUI_STATS_CURRENCY_PROFESSIONS)
	currency_professions:SetPoint("TOPLEFT", currency_cooking, "BOTTOMLEFT", 0, 0)

	local currency_raid = ns.CreateCheckBox(parent, "currency_raid", L_GUI_STATS_CURRENCY_RAID)
	currency_raid:SetPoint("TOPLEFT", currency_professions, "BOTTOMLEFT", 0, 0)

	local currency_misc = ns.CreateCheckBox(parent, "currency_misc", L_GUI_STATS_CURRENCY_MISCELLANEOUS)
	currency_misc:SetPoint("TOPLEFT", currency_raid, "BOTTOMLEFT", 0, 0)
end
]]--

-- Trade
do
	local parent = ViksUIOptionsPanel.trade

	local profession_tabs = ns.CreateCheckBox(parent, "profession_tabs")
	profession_tabs:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local already_known = ns.CreateCheckBox(parent, "already_known")
	already_known:SetPoint("TOPLEFT", profession_tabs, "BOTTOMLEFT", 0, 0)

	local disenchanting = ns.CreateCheckBox(parent, "disenchanting")
	disenchanting:SetPoint("TOPLEFT", already_known, "BOTTOMLEFT", 0, 0)

	local enchantment_scroll = ns.CreateCheckBox(parent, "enchantment_scroll")
	enchantment_scroll:SetPoint("TOPLEFT", disenchanting, "BOTTOMLEFT", 0, 0)

	local sum_buyouts = ns.CreateCheckBox(parent, "sum_buyouts")
	sum_buyouts:SetPoint("TOPLEFT", enchantment_scroll, "BOTTOMLEFT", 0, 0)

	local archaeology = ns.CreateCheckBox(parent, "archaeology")
	archaeology:SetPoint("TOPLEFT", sum_buyouts, "BOTTOMLEFT", 0, 0)

	local merchant_itemlevel = ns.CreateCheckBox(parent, "merchant_itemlevel")
	merchant_itemlevel:SetPoint("TOPLEFT", archaeology, "BOTTOMLEFT", 0, 0)
end

-- Panels
do
	local parent = ViksUIOptionsPanel.panels
	
	local CPwidth = ns.CreateNumberSlider(parent, "CPwidth", nil, nil, 0, 500, 1, true, L.panels_CPwidth)
	CPwidth:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, -30)

	local CPLwidth = ns.CreateNumberSlider(parent, "CPLwidth", nil, nil, 0, 500, 1, true, L.panels_CPLwidth)
	CPLwidth:SetPoint("TOPLEFT", CPwidth, "BOTTOMLEFT", 0, -20)

	local CPTextheight = ns.CreateNumberSlider(parent, "CPTextheight", nil, nil, 0, 300, 1, true, L.panels_CPTextheight)
	CPTextheight:SetPoint("TOPLEFT", CPLwidth, "BOTTOMLEFT", 0, -20)
	
	local CPbarsheight = ns.CreateNumberSlider(parent, "CPbarsheight", nil, nil, 0, 50, 1, true, L.panels_CPbarsheight)
	CPbarsheight:SetPoint("TOPLEFT", CPTextheight, "BOTTOMLEFT", 0, -20)
	
	local CPXPBa_r = ns.CreateNumberSlider(parent, "CPXPBa_r", nil, nil, 0, 50, 1, true, L.panels_CPXPBa_r)
	CPXPBa_r:SetPoint("TOPLEFT", CPbarsheight, "BOTTOMLEFT", 0, -20)
	
	local xoffset = ns.CreateNumberSlider(parent, "xoffset", nil, nil, 0, 15, 0.5, true, L.panels_xoffset)
	xoffset:SetPoint("TOPLEFT", CPXPBa_r, "BOTTOMLEFT", 0, -20)
	
	local yoffset = ns.CreateNumberSlider(parent, "yoffset", nil, nil, 0, 15, 0.5, true, L.panels_yoffset)
	yoffset:SetPoint("TOPLEFT", xoffset, "BOTTOMLEFT", 0, -20)
	
	local CPSidesWidth = ns.CreateNumberSlider(parent, "CPSidesWidth", nil, nil, 0, 300, 1, true, L.panels_CPSidesWidth)
	CPSidesWidth:SetPoint("LEFT", CPwidth, "RIGHT", 150, 0)
	
	local CPMABwidth = ns.CreateNumberSlider(parent, "CPMABwidth", nil, nil, 0, 800, 1, true, L.panels_CPMABwidth)
	CPMABwidth:SetPoint("TOPLEFT", CPSidesWidth, "BOTTOMLEFT", 0, -20)
	
	local CPMABheight = ns.CreateNumberSlider(parent, "CPMABheight", nil, nil, 0, 100, 1, true, L.panels_CPMABheight)
	CPMABheight:SetPoint("TOPLEFT", CPMABwidth, "BOTTOMLEFT", 0, -20)
	
	local CPMAByoffset = ns.CreateNumberSlider(parent, "CPMAByoffset", nil, nil, 0, 100, 1, true, L.panels_CPMAByoffset)
	CPMAByoffset:SetPoint("TOPLEFT", CPMABheight, "BOTTOMLEFT", 0, -20)
	
	local CPABarSide = ns.CreateNumberSlider(parent, "CPABarSide", nil, nil, 0, 50, 1, true, L.panels_CPABarSide)
	CPABarSide:SetPoint("TOPLEFT", CPMAByoffset, "BOTTOMLEFT", 0, -20)

	local CPCooldheight = ns.CreateNumberSlider(parent, "CPCooldheight", nil, nil, 0, 100, 1, true, L.panels_CPCooldheight)
	CPCooldheight:SetPoint("TOPLEFT", CPABarSide, "BOTTOMLEFT", 0, -20)
	
	local CPTop = ns.CreateNumberSlider(parent, "CPTop", nil, nil, 0, 3000, 1, true, L.panels_CPTop)
	CPTop:SetPoint("TOPLEFT", CPCooldheight, "BOTTOMLEFT", 0, -20)
		
	local NoPanels = ns.CreateCheckBox(parent, "NoPanels", L.panels_NoPanels)
	NoPanels:SetPoint("TOPLEFT", yoffset, "BOTTOMLEFT", 0, -20)
	
	local HideABPanels = ns.CreateCheckBox(parent, "HideABPanels", L.panels_HideABPanels)
	HideABPanels:SetPoint("TOPLEFT", NoPanels, "BOTTOMLEFT", 0, -10)

end

-- Miscellaneous
do
	local parent = ViksUIOptionsPanel.misc

	local shift_marking = ns.CreateCheckBox(parent, "shift_marking")
	shift_marking:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local LFD_keyword = ns.CreateEditBox(parent, "LFD_keyword", true, "LFD Text Note")
	LFD_keyword:SetPoint("TOPLEFT", shift_marking, "BOTTOMLEFT", 6, -10)
	LFD_keyword:SetWidth(200)
	LFD_keyword:SetMaxLetters(40)
	
	local invite_keyword = ns.CreateEditBox(parent, "invite_keyword", true, L_GUI_MISC_INVKEYWORD)
	invite_keyword:SetPoint("TOPLEFT", LFD_keyword, "BOTTOMLEFT", 0, -10)

	local afk_spin_camera = ns.CreateCheckBox(parent, "afk_spin_camera")
	afk_spin_camera:SetPoint("TOPLEFT", invite_keyword, "BOTTOMLEFT", -6, -10)

	local vehicle_mouseover = ns.CreateCheckBox(parent, "vehicle_mouseover", L_GUI_MISC_VEHICLE_MOUSEOVER)
	vehicle_mouseover:SetPoint("TOPLEFT", afk_spin_camera, "BOTTOMLEFT", 0, 0)

	local quest_auto_button = ns.CreateCheckBox(parent, "quest_auto_button")
	quest_auto_button:SetPoint("TOPLEFT", vehicle_mouseover, "BOTTOMLEFT", 0, 0)

	local raid_tools = ns.CreateCheckBox(parent, "raid_tools")
	raid_tools:SetPoint("TOPLEFT", quest_auto_button, "BOTTOMLEFT", 0, 0)

	local item_level = ns.CreateCheckBox(parent, "item_level", L_GUI_MISC_ITEM_LEVEL)
	item_level:SetPoint("TOPLEFT", raid_tools, "BOTTOMLEFT", 0, 0)

	local click_cast = ns.CreateCheckBox(parent, "click_cast", L_GUI_MISC_CLICK_CAST)
	click_cast:SetPoint("TOPLEFT", item_level, "BOTTOMLEFT", 0, 0)

	local click_cast_filter = ns.CreateCheckBox(parent, "click_cast_filter", L_GUI_MISC_CLICK_CAST_FILTER)
	click_cast_filter:SetPoint("TOPLEFT", click_cast, "BOTTOMLEFT", 20, 0)

	click_cast.children = {click_cast_filter}

	local move_blizzard = ns.CreateCheckBox(parent, "move_blizzard", L_GUI_MISC_MOVE_BLIZZARD)
	move_blizzard:SetPoint("TOPLEFT", click_cast_filter, "BOTTOMLEFT", -20, 0)

	local color_picker = ns.CreateCheckBox(parent, "color_picker", L_GUI_MISC_COLOR_PICKER)
	color_picker:SetPoint("TOPLEFT", move_blizzard, "BOTTOMLEFT", 0, 0)

	local chars_currency = ns.CreateCheckBox(parent, "chars_currency", L_GUI_MISC_CHARS_CURRENCY)
	chars_currency:SetPoint("TOPLEFT", color_picker, "BOTTOMLEFT", 0, 0)

	local armory_link = ns.CreateCheckBox(parent, "armory_link")
	armory_link:SetPoint("TOPLEFT", chars_currency, "BOTTOMLEFT", 0, 0)

	-- Panel 2
	local parent = ViksUIOptionsPanel.misc2
	
	local markbar = ns.CreateCheckBox(parent, "markbar", L_GUI_MISC_MARKBAR)
	markbar:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, 0)

	local meters = ns.CreateCheckBox(parent, "meters", "Skada/Details Toggle & Chat Move for NoPanel")
	meters:SetPoint("TOPLEFT", markbar, "BOTTOMLEFT", 0, 0)
	
	local classtimer = ns.CreateCheckBox(parent, "classtimer", L_GUI_MISC_CLASSTIMER)
	classtimer:SetPoint("TOPLEFT", meters, "BOTTOMLEFT", 0, 0)
	
	local WatchFrame = ns.CreateCheckBox(parent, "WatchFrame", L_GUI_MISC_WATCHFRAME)
	WatchFrame:SetPoint("TOPLEFT", classtimer, "BOTTOMLEFT", 0, 0)
	
	local BT4Bars = ns.CreateCheckBox(parent, "BT4Bars", L_GUI_MISC_BT4BARS)
	BT4Bars:SetPoint("TOPLEFT", WatchFrame, "BOTTOMLEFT", 0, 0)
	
	local panelsh = ns.CreateCheckBox(parent, "panelsh", L_GUI_MISC_PANELSH)
	panelsh:SetPoint("TOPLEFT", BT4Bars, "BOTTOMLEFT", 0, 0)
	
	local Pscale = ns.CreateNumberSlider(parent, "Pscale", nil, nil, 0.4, 1.1, 0.01, true, L_GUI_MISC_PSCALE)
	Pscale:SetPoint("TOPLEFT", panelsh, "BOTTOMLEFT", 0, -20)
	
	local XPBar = ns.CreateCheckBox(parent, "XPBar", "Enable XP/REP/HONOR Bars above chat windows")
	XPBar:SetPoint("TOPLEFT", Pscale, "BOTTOMLEFT", 0, 0)
end

-- datatext
do
	local parent = ViksUIOptionsPanel.datatext

	local Arena = ns.CreateNumberSlider(parent, "Arena", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Arena)
	Arena:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 0, -5)

	local Armor = ns.CreateNumberSlider(parent, "Armor", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Armor)
	Armor:SetPoint("TOPLEFT", Arena, "BOTTOMLEFT", 0, -15)

	local RunSpeed = ns.CreateNumberSlider(parent, "RunSpeed", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_RunSpeed)
	RunSpeed:SetPoint("TOPLEFT", Armor, "BOTTOMLEFT", 0, -15)

	local Avd = ns.CreateNumberSlider(parent, "Avd", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Avd)
	Avd:SetPoint("TOPLEFT", RunSpeed, "BOTTOMLEFT", 0, -15)

	local Bags = ns.CreateNumberSlider(parent, "Bags", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Bags)
	Bags:SetPoint("TOPLEFT", Avd, "BOTTOMLEFT", 0, -15)

	local Crit = ns.CreateNumberSlider(parent, "Crit", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Crit)
	Crit:SetPoint("TOPLEFT", Bags, "BOTTOMLEFT", 0, -15)

	local Durability = ns.CreateNumberSlider(parent, "Durability", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Durability)
	Durability:SetPoint("TOPLEFT", Crit, "BOTTOMLEFT", 0, -15)

	local Friends = ns.CreateNumberSlider(parent, "Friends", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Friends)
	Friends:SetPoint("TOPLEFT", Durability, "BOTTOMLEFT", 0, -15)

	local Gold = ns.CreateNumberSlider(parent, "Gold", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Gold)
	Gold:SetPoint("TOPLEFT", Friends, "BOTTOMLEFT", 0, -15)

	local Guild = ns.CreateNumberSlider(parent, "Guild", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Guild)
	Guild:SetPoint("TOPLEFT", Gold, "BOTTOMLEFT", 0, -15)

	local Haste = ns.CreateNumberSlider(parent, "Haste", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Haste)
	Haste:SetPoint("TOPLEFT", Guild, "BOTTOMLEFT", 0, -15)

	local Versatility = ns.CreateNumberSlider(parent, "Versatility", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Versatility)
	Versatility:SetPoint("TOPLEFT", parent.subText, "BOTTOMLEFT", 280, -5)
	
	local location = ns.CreateNumberSlider(parent, "location", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_location)
	location:SetPoint("TOPLEFT", Versatility, "BOTTOMLEFT", 0, -15)
	
	local Mastery = ns.CreateNumberSlider(parent, "Mastery", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Mastery)
	Mastery:SetPoint("TOPLEFT", location, "BOTTOMLEFT", 0, -15)
	
	local Power = ns.CreateNumberSlider(parent, "Power", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Power)
	Power:SetPoint("TOPLEFT", Mastery, "BOTTOMLEFT", 0, -15)
	
	local Profession = ns.CreateNumberSlider(parent, "Profession", nil, nil, 0, 18, 1, true)
	Profession:SetPoint("TOPLEFT", Power, "BOTTOMLEFT", 0, -15)
	
	local Regen = ns.CreateNumberSlider(parent, "Regen", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Regen)
	Regen:SetPoint("TOPLEFT", Profession, "BOTTOMLEFT", 0, -15)
	
	local System = ns.CreateNumberSlider(parent, "System", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_System)
	System:SetPoint("TOPLEFT", Regen, "BOTTOMLEFT", 0, -15)
	
	local Talents = ns.CreateNumberSlider(parent, "Talents", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Talents)
	Talents:SetPoint("TOPLEFT", System, "BOTTOMLEFT", 0, -15)
	
	local togglemenu = ns.CreateNumberSlider(parent, "togglemenu", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_togglemenu)
	togglemenu:SetPoint("TOPLEFT", Talents, "BOTTOMLEFT", 0, -15)
	
	local Volume = ns.CreateNumberSlider(parent, "Volume", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Volume)
	Volume:SetPoint("TOPLEFT", togglemenu, "BOTTOMLEFT", 0, -15)
	
	local Quests = ns.CreateNumberSlider(parent, "Quests", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Quests)
	Quests:SetPoint("TOPLEFT", Volume, "BOTTOMLEFT", 0, -15)
	
	local Bfamissions = ns.CreateNumberSlider(parent, "Bfamissions", nil, nil, 0, 18, 1, true, L_GUI_DATATEXT_Bfamissions)
	Bfamissions:SetPoint("TOPLEFT", Quests, "BOTTOMLEFT", 0, -15)
	
	-- CheckBoxes
	local currency = ns.addSubCategory(parent, L_GUI_DATATEXT_SUBHEADER_CURRENCY)
	currency:SetPoint("TOPLEFT", Haste, "BOTTOMLEFT", 0, -27)

	local showcoords = ns.CreateCheckBox(parent, "showcoords", L_GUI_DATATEXT_showcoords)
	showcoords:SetPoint("TOPLEFT", currency, "BOTTOMLEFT", 0, -8)

	local Time24 = ns.CreateCheckBox(parent, "Time24", L_GUI_DATATEXT_Time24)
	Time24:SetPoint("TOPLEFT", showcoords, "BOTTOMLEFT", 0, 0)

	local Localtime = ns.CreateCheckBox(parent, "Localtime", L_GUI_DATATEXT_Localtime)
	Localtime:SetPoint("TOPLEFT", Time24, "BOTTOMLEFT", 0, 0)

	local classcolor = ns.CreateCheckBox(parent, "classcolor", L_GUI_DATATEXT_classcolor)
	classcolor:SetPoint("TOPLEFT", Localtime, "BOTTOMLEFT", 0, 0)
	
	local color = ns.CreateColourPicker(parent, "color", true, L_GUI_DATATEXT_color)
	color:SetPoint("TOPLEFT", classcolor, "BOTTOMLEFT", 25, -5)
	
	local CurrArchaeology = ns.CreateCheckBox(parent, "CurrArchaeology", L_GUI_DATATEXT_CurrArchaeology)
	CurrArchaeology:SetPoint("TOPLEFT", currency, "BOTTOMLEFT", 280, -8)
	
	local CurrCooking = ns.CreateCheckBox(parent, "CurrCooking", L_GUI_DATATEXT_CurrCooking)
	CurrCooking:SetPoint("TOPLEFT", CurrArchaeology, "BOTTOMLEFT", 0, 0)
	
	local CurrProfessions = ns.CreateCheckBox(parent, "CurrProfessions", L_GUI_DATATEXT_CurrProfessions)
	CurrProfessions:SetPoint("TOPLEFT", CurrCooking, "BOTTOMLEFT", 0, 0)
	
	local CurrMiscellaneous = ns.CreateCheckBox(parent, "CurrMiscellaneous", L_GUI_DATATEXT_CurrMiscellaneous)
	CurrMiscellaneous:SetPoint("TOPLEFT", CurrProfessions, "BOTTOMLEFT", 0, 0)
	
	local CurrPvP = ns.CreateCheckBox(parent, "CurrPvP", L_GUI_DATATEXT_CurrPvP)
	CurrPvP:SetPoint("TOPLEFT", CurrMiscellaneous, "BOTTOMLEFT", 0, 0)
	
	local CurrRaid = ns.CreateCheckBox(parent, "CurrRaid", L_GUI_DATATEXT_CurrRaid)
	CurrRaid:SetPoint("TOPLEFT", CurrPvP, "BOTTOMLEFT", 0, 0)
end

----------------------------------------------------------------------------------------
--	Skin extra frames
----------------------------------------------------------------------------------------
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
	if not ViksUI then return end
	T, C = unpack(ViksUI)

	SpellList:StripTextures()
	SpellList:CreateBackdrop("Transparent")
	SpellList.backdrop:SetPoint("TOPLEFT", -18, 0)
	SpellList.backdrop:SetPoint("BOTTOMRIGHT", 0, 9)

	SpellListScrollFrameSpellList:StripTextures()
	SpellListScrollFrameSpellList:CreateBackdrop("Overlay")
	SpellListScrollFrameSpellList.backdrop:SetPoint("TOPLEFT", 2, 3)
	SpellListScrollFrameSpellList.backdrop:SetPoint("BOTTOMRIGHT", 2, -3)
	T.SkinCloseButton(SpellListCloseButton)

	SpellListScrollFrameSpellListScrollBar:SetPoint("TOPLEFT", SpellListScrollFrameSpellList, "TOPRIGHT", 6, -13)
	SpellListScrollFrameSpellListScrollBar:SetPoint("BOTTOMLEFT", SpellListScrollFrameSpellList, "BOTTOMRIGHT", 6, 13)
	T.SkinScrollBar(SpellListScrollFrameSpellListScrollBar)

	T.SkinEditBox(SpellListTextInput)
	T.SkinEditBox(SpellListTextInput2)

	ViksUIProfileFrame:SetTemplate("Transparent")
	T.SkinScrollBar(ViksUIProfileFrameScrollScrollBar)
	ViksUIProfileFrameScroll:CreateBackdrop("Overlay")
	ViksUIProfileFrameScroll.backdrop:SetPoint("TOPLEFT", -4, 4)
	ViksUIProfileFrameScroll.backdrop:SetPoint("BOTTOMRIGHT", 4, -4)
end)

----------------------------------------------------------------------------------------
--	Information
----------------------------------------------------------------------------------------
do
	local frame = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)
	frame:Hide()

	frame.name = "ViksUI"
	frame:SetScript("OnShow", function(self)
		if self.show then return end
		local T = unpack(ViksUI)
		local title = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title:SetPoint("TOPLEFT", 16, -16)
		title:SetText("Info:")

		local subtitle = self:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		subtitle:SetWidth(580)
		subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
		subtitle:SetJustifyH("LEFT")
		subtitle:SetText("UI Site: |cff298F00https://discord.gg/ZnGcJmZ|r\nGitHub: |cff298F00https://github.com/Viks/ViksUI|r\nCurse: |cff298F00https://www.curseforge.com/wow/addons/viksui|r\nWoWInterface: |cff298F00https://www.wowinterface.com/downloads/info21462-ViksUI.html#info|r\nChange Log: |cff298F00https://github.com/ViksUI/ViksUI/commits/master|r")

		local title2 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title2:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -16)
		title2:SetText("Credits:")

		local subtitle2 = self:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		subtitle2:SetWidth(580)
		subtitle2:SetPoint("TOPLEFT", title2, "BOTTOMLEFT", 0, -8)
		subtitle2:SetJustifyH("LEFT")
		subtitle2:SetText(GetAddOnMetadata("ViksUI", "X-Credits"))

		local title3 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title3:SetPoint("TOPLEFT", subtitle2, "BOTTOMLEFT", 0, -16)
		title3:SetText("Translation:")

		local subtitle3 = self:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		subtitle3:SetWidth(580)
		subtitle3:SetPoint("TOPLEFT", title3, "BOTTOMLEFT", 0, -8)
		subtitle3:SetJustifyH("LEFT")
		subtitle3:SetText(GetAddOnMetadata("ViksUI", "X-Translation"))

		local title4 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title4:SetPoint("TOPLEFT", subtitle3, "BOTTOMLEFT", 0, -16)
		title4:SetText("Thanks:")

		local subtitle4 = self:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		subtitle4:SetWidth(580)
		subtitle4:SetPoint("TOPLEFT", title4, "BOTTOMLEFT", 0, -8)
		subtitle4:SetJustifyH("LEFT")
		subtitle4:SetText(GetAddOnMetadata("ViksUI", "X-Thanks"))

		local version = self:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		version:SetPoint("BOTTOMRIGHT", -16, 16)
		version:SetText("Version: "..T.version)

		self.show = true
	end)

	InterfaceOptions_AddCategory(frame)
end

----------------------------------------------------------------------------------------
--	Slash commands
----------------------------------------------------------------------------------------
do
	function SlashCmdList.CONFIG()
		if not options or not options:IsShown() then
			PlaySound(SOUNDKIT.IG_MAINMENU_OPTION)
			HideUIPanel(GameMenuFrame)
			options:Show()
		else
			PlaySound(SOUNDKIT.IG_MAINMENU_OPTION)
			options:Hide()
		end
	end
	SLASH_CONFIG1 = "/config"
	SLASH_CONFIG2 = "/cfg"
	SLASH_CONFIG3 = "/configui"

	function SlashCmdList.RESETCONFIG()
		if ViksUIOptionsGlobal[realm][name] == true then
			StaticPopup_Show("ViksUI_RESET_PERCHAR")
		else
			StaticPopup_Show("ViksUI_RESET")
		end
	end
	SLASH_RESETCONFIG1 = "/resetconfig"
end

----------------------------------------------------------------------------------------
--	Button in GameMenuButton frame
----------------------------------------------------------------------------------------
local menuButton = CreateFrame("Button", "GameMenuButtonSettingsUI", GameMenuFrame, "GameMenuButtonTemplate")
menuButton:SetText("ViksUI")
menuButton:SetPoint("TOP", GetLocale() ~= "koKR" and "GameMenuButtonAddons" or "GameMenuButtonRatings", "BOTTOM", 0, -1)

GameMenuFrame:HookScript("OnShow", function(self)
	self:SetHeight(self:GetHeight() + menuButton:GetHeight())
	GameMenuButtonLogout:SetPoint("TOP", menuButton, "BOTTOM", 0, -16)
end)

menuButton:SetScript("OnClick", function()
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION)
	HideUIPanel(GameMenuFrame)
	options:Show()
end)
