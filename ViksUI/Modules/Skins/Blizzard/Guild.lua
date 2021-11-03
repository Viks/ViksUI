local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	GuildUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	GuildFrame:StripTextures(true)
	GuildFrame:SetTemplate("Transparent")

	T.SkinCloseButton(GuildMemberDetailCloseButton)
	T.SkinCloseButton(GuildFrameCloseButton)

	local striptextures = {
		"GuildFrameInset",
		"GuildFrameBottomInset",
		"GuildAllPerksFrame",
		"GuildMemberDetailFrame",
		"GuildMemberNoteBackground",
		"GuildInfoFrameInfo",
		"GuildLogContainer",
		"GuildLogFrame",
		"GuildRewardsFrame",
		"GuildMemberOfficerNoteBackground",
		"GuildTextEditFrame",
		"GuildNewsBossModel",
		"GuildNewsBossModelTextFrame"
	}

	GuildRewardsFrameVisitText:ClearAllPoints()
	GuildRewardsFrameVisitText:SetPoint("TOP", GuildRewardsFrame, "TOP", 0, 30)

	for _, frame in pairs(striptextures) do
		_G[frame]:StripTextures()
	end

	GuildNewsBossModel:CreateBackdrop("Transparent")
	GuildNewsBossModelTextFrame:CreateBackdrop("Overlay")
	GuildNewsBossModelTextFrame.backdrop:SetPoint("TOPLEFT", GuildNewsBossModel.backdrop, "BOTTOMLEFT", 0, -1)
	GuildNewsBossModel:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 5, -2)

	local buttons = {
		"GuildMemberRemoveButton",
		"GuildMemberGroupInviteButton",
		"GuildAddMemberButton",
		"GuildViewLogButton",
		"GuildControlButton",
		"GuildTextEditFrameAcceptButton",
	}

	for i, button in pairs(buttons) do
		if i == 1 then
			_G[button]:StripTextures(true)
			_G[button]:SkinButton()
		else
			_G[button]:SkinButton(true)
		end
	end

	for i = 1, 5 do
		T.SkinTab(_G["GuildFrameTab"..i])
	end

	T.SkinScrollBar(GuildPerksContainerScrollBar)

	GuildFactionBar:StripTextures()
	GuildFactionBar.progress:SetTexture(C.media.texture)
	GuildFactionBar:CreateBackdrop("Overlay")
	GuildFactionBar.backdrop:SetPoint("TOPLEFT", GuildFactionBar.progress, "TOPLEFT", -2, 2)
	GuildFactionBar.backdrop:SetPoint("BOTTOMRIGHT", GuildFactionBar, "BOTTOMRIGHT", 2, 0)

	-- Guild Perk buttons list
	for i = 1, 8 do
		local button = _G["GuildPerksContainerButton"..i]

		button:StripTextures()

		if button.icon then
			button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			button.icon:ClearAllPoints()
			button.icon:SetPoint("TOPLEFT", 2, -2)
			button:CreateBackdrop("Default")
			button.backdrop:SetPoint("TOPLEFT", button.icon, "TOPLEFT", -2, 2)
			button.backdrop:SetPoint("BOTTOMRIGHT", button.icon, "BOTTOMRIGHT", 2, -2)
			button.icon:SetParent(button.backdrop)
		end
	end

	-- Roster
	T.SkinScrollBar(GuildRosterContainerScrollBar)
	T.SkinCheckBox(GuildRosterShowOfflineButton)

	for i = 1, 4 do
		_G["GuildRosterColumnButton"..i]:StripTextures(true)
	end

	T.SkinDropDownBox(GuildRosterViewDropdown, 200)

	for i = 1, 14 do
		--_G["GuildRosterContainerButton"..i.."HeaderButton"]:SkinButton(true)
		local button = _G['GuildRosterContainerButton'..i]
		local header = button and button.header
		if header then
			header:SkinButton(true)
		end
	end

	-- Detail Frame
	GuildMemberDetailFrame:SetTemplate("Transparent")
	GuildMemberDetailFrame:ClearAllPoints()
	GuildMemberDetailFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, 0)
	GuildMemberNoteBackground:SetTemplate("Overlay")
	GuildMemberOfficerNoteBackground:SetTemplate("Overlay")
	GuildMemberRankDropdown:SetFrameLevel(GuildMemberRankDropdown:GetFrameLevel() + 5)
	T.SkinDropDownBox(GuildMemberRankDropdown, 160)

	GuildMemberRemoveButton:ClearAllPoints()
	GuildMemberRemoveButton:SetPoint("BOTTOMLEFT", GuildMemberDetailFrame, "BOTTOMLEFT", 9, 4)

	-- News
	GuildNewsFrame:StripTextures()
	for i = 1, 17 do
		local button = _G['GuildNewsContainerButton'..i]
		if button and button.header then
			button.header:Kill()
		end
	end

	GuildNewsFiltersFrame:StripTextures()
	GuildNewsFiltersFrame:SetTemplate("Transparent")
	T.SkinCloseButton(GuildNewsFiltersFrameCloseButton)

	for i = 1, #GuildNewsFiltersFrame.GuildNewsFilterButtons do
		local checkbox = GuildNewsFiltersFrame.GuildNewsFilterButtons[i]
		T.SkinCheckBox(checkbox)
	end

	GuildNewsFiltersFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, 0)
	T.SkinScrollBar(GuildNewsContainerScrollBar)

	-- Info Frame
	T.SkinScrollBar(GuildInfoDetailsFrameScrollBar)
	T.SkinScrollBar(_G.GuildInfoFrameInfoMOTDScrollFrameScrollBar)

	for i = 1, 3 do
		T.SkinTab(_G["GuildInfoFrameTab"..i], true)
	end

	local backdrop1 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop1:SetTemplate("Overlay")
	backdrop1:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)
	backdrop1:SetPoint("TOPLEFT", GuildInfoFrameInfo, "TOPLEFT", 2, -22)
	backdrop1:SetPoint("BOTTOMRIGHT", GuildInfoFrameInfo, "BOTTOMRIGHT", 0, 200)

	local backdrop2 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop2:SetTemplate("Overlay")
	backdrop2:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)
	backdrop2:SetPoint("TOPLEFT", GuildInfoFrameInfo, "TOPLEFT", 2, -158)
	backdrop2:SetPoint("BOTTOMRIGHT", GuildInfoFrameInfo, "BOTTOMRIGHT", 0, 118)

	local backdrop3 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop3:SetTemplate("Overlay")
	backdrop3:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)
	backdrop3:SetPoint("TOPLEFT", GuildInfoFrameInfo, "TOPLEFT", 2, -233)
	backdrop3:SetPoint("BOTTOMRIGHT", GuildInfoFrameInfo, "BOTTOMRIGHT", 0, 3)


	-- Text Edit Frame
	GuildTextEditFrame:SetTemplate("Transparent")
	_G.GuildLogContainer.NineSlice:SetTemplate('Transparent')
	_G.GuildTextEditContainer.NineSlice:SetTemplate('Transparent')
	T.SkinScrollBar(GuildTextEditScrollFrameScrollBar)
	T.SkinCloseButton(GuildTextEditFrameCloseButton, GuildTextEditFrame)
	for i = 1, GuildTextEditFrame:GetNumChildren() do
		local child = select(i, GuildTextEditFrame:GetChildren())
		if child:GetName() == "GuildTextEditFrameCloseButton" and child:GetWidth() > 50 then
			child:SkinButton(true)
		end
	end

	-- Guild Log
	T.SkinScrollBar(GuildLogScrollFrameScrollBar)
	GuildLogFrame:CreateBackdrop("Transparent")
	GuildLogFrame.backdrop:SetPoint("TOPLEFT", 0, 0)
	GuildLogFrame.backdrop:SetPoint("BOTTOMRIGHT", -15, 0)
	GuildLogFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, 0)
	T.SkinCloseButton(GuildLogFrameCloseButton, GuildLogFrame.backdrop)

	for i = 1, GuildLogFrame:GetNumChildren() do
		local child = select(i, GuildLogFrame:GetChildren())
		if child:GetName() == "GuildLogFrameCloseButton" and child:GetWidth() > 50 then
			child:SkinButton(true)
		end
	end

	-- Rewards
	T.SkinScrollBar(GuildRewardsContainerScrollBar)

	for i = 1, 8 do
		local button = _G["GuildRewardsContainerButton"..i]
		button:StripTextures()

		if button.icon then
			button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			button.icon:ClearAllPoints()
			button.icon:SetPoint("TOPLEFT", 2, -2)
			button:CreateBackdrop("Default")
			button.backdrop:SetPoint("TOPLEFT", button.icon, "TOPLEFT", -2, 2)
			button.backdrop:SetPoint("BOTTOMRIGHT", button.icon, "BOTTOMRIGHT", 2, -2)
			button.icon:SetParent(button.backdrop)
			button.lock:SetTexture("Interface\\GuildFrame\\GuildFrame")
			button.lock:SetParent(button.backdrop)
		end
	end
end

T.SkinFuncs["Blizzard_GuildUI"] = LoadSkin