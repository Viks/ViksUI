local T, C, L, _ = unpack(select(2, ...))
----------------------------------------------------------------------------------------
--	EncounterJournal skin
---------------------------------------------------------------------------------------
local LoadTootlipSkin = CreateFrame("Frame")
LoadTootlipSkin:RegisterEvent("ADDON_LOADED")
LoadTootlipSkin:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") or not C.tooltip.enable then
		self:UnregisterEvent("ADDON_LOADED")
		return
	end

	if addon == "Blizzard_EncounterJournal" then
		local tooltip = EncounterJournalTooltip
		local item1 = tooltip.Item1
		local item2 = tooltip.Item2
		tooltip:SetTemplate("Transparent")

		local b = CreateFrame("Frame", "$parentBackdrop", item1)
		b:SetPoint("TOPLEFT", item1.icon, -2, 2)
		b:SetPoint("BOTTOMRIGHT", item1.icon, 2, -2)
		b:SetFrameLevel(1)
		b:SetTemplate("Default")

		local c = CreateFrame("Frame", "$parentBackdrop", item2)
		c:SetPoint("TOPLEFT", item2.icon, -2, 2)
		c:SetPoint("BOTTOMRIGHT", item2.icon, 2, -2)
		c:SetFrameLevel(1)
		c:SetTemplate("Default")

		item1.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		item2.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		item1.IconBorder:SetTexture(nil)
		item2.IconBorder:SetTexture(nil)
	end
end)

if C.skins.blizzard_frames ~= true then return end
local function LoadSkin()	EncounterJournal:StripTextures(true)
	EncounterJournal:SetTemplate("Transparent")
	EncounterJournal:CreateBackdrop("Transparent")
	EncounterJournal.backdrop:SetPoint("TOPLEFT", -3, 0)
	EncounterJournal.backdrop:SetPoint("BOTTOMRIGHT", 0, -2)

	EncounterJournalNavBar:StripTextures(true)
	EncounterJournalNavBarOverlay:StripTextures(true)

	EncounterJournalNavBar:CreateBackdrop("Transparent")
	EncounterJournalNavBar.backdrop:SetPoint("TOPLEFT", -3, 1)
	EncounterJournalNavBar.backdrop:SetPoint("BOTTOMRIGHT", 0, -1)
	EncounterJournalNavBarHomeButton:SkinButton(true)

	T.SkinEditBox(EncounterJournalSearchBox)
	T.SkinCloseButton(EncounterJournalCloseButton)
	T.SkinDropDownBox(EncounterJournalInstanceSelectTierDropDown)

	EncounterJournalInset:StripTextures(true)
	EncounterJournal:HookScript("OnShow", function()
		if not EncounterJournalInstanceSelect.backdrop then
			EncounterJournalInstanceSelect:CreateBackdrop("Default")
		end

		if not EncounterJournalEncounterFrameInfo.backdrop then
			EncounterJournalEncounterFrameInfo:CreateBackdrop("Default")
		end
	end)

	local tabs = {
		EncounterJournalEncounterFrameInfoOverviewTab,
		EncounterJournalEncounterFrameInfoLootTab,
		EncounterJournalEncounterFrameInfoBossTab,
		EncounterJournalInstanceSelectLootJournalTab,
		EncounterJournalEncounterFrameInfoModelTab,
		EncounterJournalInstanceSelectSuggestTab
	}
	for _, tab in pairs(tabs) do
		tab:CreateBackdrop("Overlay")
		tab.backdrop:SetPoint('TOPLEFT', 3, -3)
		tab.backdrop:SetPoint('BOTTOMRIGHT', 0, 2)
		tab:SetNormalTexture("")
		tab:SetPushedTexture("")
		tab:SetDisabledTexture("")
		tab:SetHighlightTexture("")
	end

	EncounterJournalEncounterFrameInfoOverviewTab:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfo, "TOPRIGHT", 8, -40)
	EncounterJournalEncounterFrameInfoOverviewTab.SetPoint = T.dummy

	T.SkinScrollBar(EncounterJournalInstanceSelectScrollFrameScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInfoLootScrollFrameScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInfoBossesScrollFrameScrollBar)

	for i = 1, AJ_MAX_NUM_SUGGESTIONS do
		local suggestion = EncounterJournal.suggestFrame["Suggestion"..i];
		if i == 1 then
			suggestion.button:SkinButton()
			T.SkinNextPrevButton(suggestion.prevButton)
			T.SkinNextPrevButton(suggestion.nextButton)
		else
			suggestion.centerDisplay.button:SkinButton()
		end
	end
	
	local function SkinDungeons()
		local b1 = EncounterJournalInstanceSelectScrollFrameScrollChildInstanceButton1
		if b1 and not b1.isSkinned then 
			b1:CreateBackdrop()
			b1.backdrop:SetBackdropColor(0, 0, 0, 0)
			b1:StyleButton()
			b1.isSkinned = true
			b1.bgImage:SetTexCoord(.08, .6, .08, .6)
			b1.bgImage:SetDrawLayer("OVERLAY")
		end

		for i = 1, 100 do
			local b = _G["EncounterJournalInstanceSelectScrollFrameinstance"..i]
			if b and not b.isSkinned then
				b:CreateBackdrop()
				b.backdrop:SetBackdropColor(0, 0, 0, 0)
				b:StyleButton()
				b.isSkinned = true
				b.bgImage:SetTexCoord(.08, .6, .08, .6)
				b.bgImage:SetDrawLayer("OVERLAY")
			end
		end
	end
	SkinDungeons()
	hooksecurefunc("EncounterJournal_ListInstances", SkinDungeons)
	
	EncounterJournal.LootJournal:StripTextures()
	T.SkinDropDownBox(LootJournalViewDropDown)
	EncounterJournal.LootJournal.LegendariesFrame.ClassButton:StripTextures()
	EncounterJournal.LootJournal.LegendariesFrame.ClassButton:SkinButton()
	EncounterJournal.LootJournal.LegendariesFrame.SlotButton:StripTextures()
	EncounterJournal.LootJournal.LegendariesFrame.SlotButton:SkinButton()
	EncounterJournal.LootJournal.ItemSetsFrame.ClassButton:StripTextures()
	EncounterJournal.LootJournal.ItemSetsFrame.ClassButton:SkinButton()
end

T.SkinFuncs["Blizzard_EncounterJournal"] = LoadSkin