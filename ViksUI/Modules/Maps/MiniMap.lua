local T, C, L, _ = unpack(select(2, ...))
if C.minimap.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Minimap border
----------------------------------------------------------------------------------------
local MinimapAnchor = CreateFrame("Frame", "MinimapAnchor", UIParent)

if C.panels.NoPanels == true then
MinimapAnchor:CreatePanel("Transparent", C.minimap.size, C.minimap.size, unpack(C.position.minimapline))
else
MinimapAnchor:CreatePanel("Transparent", C.minimap.size, C.minimap.size, unpack(C.position.minimap))
end

--Note: Use "Invisible" to hide
----------------------------------------------------------------------------------------
--	Shape, location and scale
----------------------------------------------------------------------------------------
-- Disable Minimap Cluster
MinimapCluster:EnableMouse(false)

-- Parent Minimap into our frame
Minimap:SetParent(MinimapAnchor)
Minimap:ClearAllPoints()
Minimap:SetPoint("TOPLEFT", MinimapAnchor, "TOPLEFT", 2, -2)
Minimap:SetPoint("BOTTOMRIGHT", MinimapAnchor, "BOTTOMRIGHT", -2, 2)
Minimap:SetSize(MinimapAnchor:GetWidth(), MinimapAnchor:GetWidth())

MinimapBackdrop:ClearAllPoints()
MinimapBackdrop:SetPoint("TOPLEFT", MinimapAnchor, "TOPLEFT", 2, -2)
MinimapBackdrop:SetPoint("BOTTOMRIGHT", MinimapAnchor, "BOTTOMRIGHT", -2, 2)
MinimapBackdrop:SetSize(MinimapAnchor:GetWidth(), MinimapAnchor:GetWidth())

-- Adjusting for patch 9.0.1 Minimap.xml
Minimap:SetFrameStrata("LOW")
Minimap:SetFrameLevel(2)

-- Hide Border
MinimapBorder:Hide()
MinimapBorderTop:Hide()

-- Hide Zoom Buttons
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()

-- Hide Blob Ring
Minimap:SetArchBlobRingScalar(0)
Minimap:SetQuestBlobRingScalar(0)

-- Hide North texture at top
MinimapNorthTag:SetTexture(nil)

-- Hide Zone Frame
MinimapZoneTextButton:Hide()

-- Hide Game Time
GameTimeFrame:Hide()

-- Hide Mail Button
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint("TOPRIGHT", Minimap, 0, 0)
MiniMapMailBorder:Hide()
MiniMapMailIcon:SetTexture("Interface\\AddOns\\ViksUI\\Media\\Other\\mail.tga")
MiniMapMailIcon:SetSize(16, 16)

-- Move QueueStatus icon
QueueStatusFrame:SetClampedToScreen(true)
QueueStatusFrame:SetFrameStrata("TOOLTIP")
QueueStatusMinimapButton:ClearAllPoints()
QueueStatusMinimapButton:SetParent(Minimap)
QueueStatusMinimapButton:SetPoint("BOTTOMRIGHT", 0, 0)
QueueStatusMinimapButton:SetHighlightTexture(nil)
QueueStatusMinimapButtonBorder:Hide()

-- Hide world map button
MiniMapWorldMapButton:Hide()

-- Garrison icon
if C.minimap.garrison_icon == true then
	GarrisonLandingPageMinimapButton:SetScale(0.75)
	hooksecurefunc("GarrisonLandingPageMinimapButton_UpdateIcon", function(self)
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 2)
	end)
else
	GarrisonLandingPageMinimapButton:SetScale(0.0001)
	GarrisonLandingPageMinimapButton:SetAlpha(0)
end

-- Instance Difficulty icon
MiniMapInstanceDifficulty:SetParent(Minimap)
MiniMapInstanceDifficulty:ClearAllPoints()
MiniMapInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 3, 2)
MiniMapInstanceDifficulty:SetScale(0.75)

-- Guild Instance Difficulty icon
GuildInstanceDifficulty:SetParent(Minimap)
GuildInstanceDifficulty:ClearAllPoints()
GuildInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -2, 2)
GuildInstanceDifficulty:SetScale(0.75)

-- Challenge Mode icon
MiniMapChallengeMode:SetParent(Minimap)
MiniMapChallengeMode:ClearAllPoints()
MiniMapChallengeMode:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -2, -2)
MiniMapChallengeMode:SetScale(0.75)

-- Invites icon
GameTimeCalendarInvitesTexture:ClearAllPoints()
GameTimeCalendarInvitesTexture:SetParent(Minimap)
GameTimeCalendarInvitesTexture:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 0, 0)

-- Default LFG icon
LFG_EYE_TEXTURES.raid = LFG_EYE_TEXTURES.default
LFG_EYE_TEXTURES.unknown = LFG_EYE_TEXTURES.default

-- Feedback icon
if FeedbackUIButton then
	FeedbackUIButton:ClearAllPoints()
	FeedbackUIButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 0)
	FeedbackUIButton:SetScale(0.8)
end

-- Streaming icon
if StreamingIcon then
	StreamingIcon:ClearAllPoints()
	StreamingIcon:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -10)
	StreamingIcon:SetScale(0.8)
	StreamingIcon:SetFrameStrata("BACKGROUND")
end

-- GhostFrame
GhostFrame:StripTextures()
GhostFrame:SetTemplate("Overlay")
GhostFrame:StyleButton()
GhostFrame:ClearAllPoints()
GhostFrame:SetPoint(unpack(C.position.ghost))
GhostFrameContentsFrameIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
GhostFrameContentsFrameIcon:SetSize(34, 34)
GhostFrameContentsFrame:SetFrameLevel(GhostFrameContentsFrame:GetFrameLevel() + 2)
GhostFrameContentsFrame:CreateBackdrop("Overlay")
GhostFrameContentsFrame.backdrop:SetPoint("TOPLEFT", GhostFrameContentsFrameIcon, -2, 2)
GhostFrameContentsFrame.backdrop:SetPoint("BOTTOMRIGHT", GhostFrameContentsFrameIcon, 2, -2)

-- Enable mouse scrolling
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(_, d)
	if d > 0 then
		_G.MinimapZoomIn:Click()
	elseif d < 0 then
		_G.MinimapZoomOut:Click()
	end
end)

-- Hide Game Time
MinimapAnchor:RegisterEvent("PLAYER_LOGIN")
MinimapAnchor:RegisterEvent("ADDON_LOADED")
MinimapAnchor:SetScript("OnEvent", function(_, _, addon)
	if addon == "Blizzard_TimeManager" then
		TimeManagerClockButton:Kill()
	elseif addon == "Blizzard_HybridMinimap" then
		HybridMinimap:SetFrameStrata("BACKGROUND")
		HybridMinimap:SetFrameLevel(100)
		HybridMinimap.MapCanvas:SetUseMaskTexture(false)
		HybridMinimap.CircleMask:SetTexture("Interface\\BUTTONS\\WHITE8X8")
		HybridMinimap.MapCanvas:SetUseMaskTexture(true)
	end
end)

----------------------------------------------------------------------------------------
--	Right click menu
----------------------------------------------------------------------------------------
local menuFrame = CreateFrame("Frame", "MinimapRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local guildText = IsInGuild() and ACHIEVEMENTS_GUILD_TAB or LOOKINGFORGUILD
local journalText = T.client == "ruRU" and ENCOUNTER_JOURNAL or ADVENTURE_JOURNAL
local micromenu = {
	{text = CHARACTER_BUTTON, notCheckable = 1, func = function()
		ToggleCharacter("PaperDollFrame")
	end},
	{text = SPELLBOOK_ABILITIES_BUTTON, notCheckable = 1, func = function()
		if InCombatLockdown() then
			print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return
		end
		ToggleFrame(SpellBookFrame)
	end},
	{text = TALENTS_BUTTON, notCheckable = 1, func = function()
		if not PlayerTalentFrame then
			TalentFrame_LoadUI()
		end
		if T.level >= 10 then
			ShowUIPanel(PlayerTalentFrame)
		else
			if C.general.error_filter ~= "WHITELIST" then
				UIErrorsFrame:AddMessage(format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10), 1, 0.1, 0.1)
			else
				print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10).."|r")
			end
		end
	end},
	{text = ACHIEVEMENT_BUTTON, notCheckable = 1, func = function()
		ToggleAchievementFrame()
	end},
	{text = QUESTLOG_BUTTON, notCheckable = 1, func = function()
		ToggleQuestLog()
	end},
	{text = guildText, notCheckable = 1, func = function()
		ToggleGuildFrame()
	end},
	{text = SOCIAL_BUTTON, notCheckable = 1, func = function()
		ToggleFriendsFrame()
	end},
	{text = CHAT_CHANNELS, notCheckable = 1, func = function()
		ToggleChannelFrame()
	end},
	{text = PLAYER_V_PLAYER, notCheckable = 1, func = function()
		if T.level >= 10 then
			TogglePVPUI()
		else
			if C.general.error_filter ~= "WHITELIST" then
				UIErrorsFrame:AddMessage(format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10), 1, 0.1, 0.1)
			else
				print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10).."|r")
			end
		end
	end},
	{text = GROUP_FINDER, notCheckable = 1, func = function()
		if T.level >= 10 then
			PVEFrame_ToggleFrame("GroupFinderFrame", nil)
		else
			if C.general.error_filter ~= "WHITELIST" then
				UIErrorsFrame:AddMessage(format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10), 1, 0.1, 0.1)
			else
				print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10).."|r")
			end
		end
	end},
	{text = journalText, notCheckable = 1, func = function()
		if C_AdventureJournal.CanBeShown() then
			ToggleEncounterJournal()
		else
			if C.general.error_filter ~= "WHITELIST" then
				UIErrorsFrame:AddMessage(FEATURE_NOT_YET_AVAILABLE, 1, 0.1, 0.1)
			else
				print("|cffffff00"..FEATURE_NOT_YET_AVAILABLE.."|r")
			end
		end
	end},
	{text = COLLECTIONS, notCheckable = 1, func = function()
		if InCombatLockdown() then
			print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return
		end
		ToggleCollectionsJournal()
	end},
	{text = HELP_BUTTON, notCheckable = 1, func = function()
		ToggleHelpFrame()
	end},
	{text = L_MINIMAP_CALENDAR, notCheckable = 1, func = function()
		ToggleCalendar()
	end},
	{text = BATTLEFIELD_MINIMAP, notCheckable = 1, func = function()
		ToggleBattlefieldMap()
	end},
}

if not IsTrialAccount() and not C_StorePublic.IsDisabledByParentalControls() then
	tinsert(micromenu, {text = BLIZZARD_STORE, notCheckable = 1, func = function() StoreMicroButton:Click() end})
end

if T.level == MAX_PLAYER_LEVEL then
	tinsert(micromenu, {text = RATED_PVP_WEEKLY_VAULT, notCheckable = 1, func = function()
		if not WeeklyRewardsFrame then
			WeeklyRewards_LoadUI()
		end
		ToggleFrame(WeeklyRewardsFrame)
	end})
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("GARRISON_SHOW_LANDING_PAGE")
frame:SetScript("OnEvent", function()
	local textTitle
	local garrisonType = C_Garrison.GetLandingPageGarrisonType()
	if garrisonType == Enum.GarrisonType.Type_6_0 then
		textTitle = GARRISON_LANDING_PAGE_TITLE
	elseif garrisonType == Enum.GarrisonType.Type_7_0 then
		textTitle = ORDER_HALL_LANDING_PAGE_TITLE
	elseif garrisonType == Enum.GarrisonType.Type_8_0 then
		textTitle = GARRISON_TYPE_8_0_LANDING_PAGE_TITLE
	elseif garrisonType == Enum.GarrisonType.Type_9_0 then
		textTitle = GARRISON_TYPE_9_0_LANDING_PAGE_TITLE
	end

	if textTitle then
		tinsert(micromenu, {text = textTitle, notCheckable = 1, func = function() GarrisonLandingPage_Toggle() end})
	end
	frame:UnregisterAllEvents()
end)

Minimap:SetScript("OnMouseUp", function(self, button)
	local position = MinimapAnchor:GetPoint()
	if button == "RightButton" then
		if position:match("LEFT") then
			EasyMenu(micromenu, menuFrame, "cursor", 0, 0, "MENU")
		else
			EasyMenu(micromenu, menuFrame, "cursor", -160, 0, "MENU")
		end
	elseif button == "MiddleButton" then
		if position:match("LEFT") then
			ToggleDropDownMenu(nil, nil, MiniMapTrackingDropDown, "cursor", 0, 0, "MENU", 2)
		else
			ToggleDropDownMenu(nil, nil, MiniMapTrackingDropDown, "cursor", -160, 0, "MENU", 2)
		end
	elseif button == "LeftButton" then
		Minimap_OnClick(self)
	end
end)

-- Set Square Map Mask
Minimap:SetMaskTexture(C.media.blank)
Minimap:SetArchBlobRingAlpha(0)
Minimap:SetQuestBlobRingAlpha(0)

-- For others mods with a minimap button, set minimap buttons position in square mode
function GetMinimapShape() return "SQUARE" end

----------------------------------------------------------------------------------------
--	Hide minimap in combat
----------------------------------------------------------------------------------------
if C.minimap.hide_combat == true then
	MinimapAnchor:RegisterEvent("PLAYER_REGEN_ENABLED")
	MinimapAnchor:RegisterEvent("PLAYER_REGEN_DISABLED")
	MinimapAnchor:HookScript("OnEvent", function(self, event)
		if event == "PLAYER_REGEN_ENABLED" then
			self:Show()
		elseif event == "PLAYER_REGEN_DISABLED" then
			if not T.FarmMode then
				self:Hide()
			end
		end
	end)
end

----------------------------------------------------------------------------------------
--	Tracking icon
----------------------------------------------------------------------------------------
if C.minimap.tracking_icon then
	MiniMapTrackingBackground:Hide()
	MiniMapTracking:ClearAllPoints()
	MiniMapTracking:SetPoint("BOTTOMLEFT", MinimapAnchor, "BOTTOMLEFT", 0, -5)
	MiniMapTrackingButton:SetHighlightTexture(nil)
	MiniMapTrackingButtonBorder:Hide()
	MiniMapTrackingIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	MiniMapTrackingIcon:SetSize(16, 16)
	MiniMapTrackingIcon.SetPoint = T.dummy

	MiniMapTracking:CreateBackdrop("Transparent")
	MiniMapTracking.backdrop:SetPoint("TOPLEFT", MiniMapTrackingIcon, -2, 2)
	MiniMapTracking.backdrop:SetPoint("BOTTOMRIGHT", MiniMapTrackingIcon, 2, -2)
else
	MiniMapTracking:Hide()
end

------------------------------------------------------------------------------------------	
-- COMPASS
------------------------------------------------------------------------------------------
if C.minimap.compass then
function compass()

		frameC = CreateFrame("Frame", "Compass", Minimap)
		frameC:SetAllPoints()
		local north = frameC:CreateFontString(frameC:GetName())
		north:SetPoint("TOP", Minimap, "TOP", 0, -2)
		north:SetFont("Interface\\Addons\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",12,"OUTLINE")
		north:SetTextColor(1,1,0,1) 
		north:SetText("N")

		local east = frameC:CreateFontString(frameC:GetName())
		east:SetPoint("RIGHT", Minimap, "RIGHT", -2, 0)
		east:SetFont("Interface\\Addons\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",10,"OUTLINE")
		east:SetTextColor(1,1,.251,1) 
		east:SetText("E")

		local south = frameC:CreateFontString(frameC:GetName())
		south:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 2)
		south:SetFont("Interface\\Addons\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",10,"OUTLINE")
		south:SetTextColor(1,1,.251,1) 
		south:SetText("S")

		local west = frameC:CreateFontString(frameC:GetName())
		west:SetPoint("LEFT", Minimap, "LEFT", 4, 0)
		west:SetFont("Interface\\Addons\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",10,"OUTLINE")
		west:SetTextColor(1,1,.251,1) 
		west:SetText("W")
end
compass()
end