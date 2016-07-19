local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end
----------------------------------------------------------------------------------------
--	TradeSkillUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local function OnEnter_Button(self)
		self:SkinButton()
	end
	TradeSkillFrame:StripTextures(true)
	TradeSkillFrame.RecipeList:StripTextures()
	TradeSkillFrame.DetailsFrame:StripTextures()
	TradeSkillFrame.DetailsInset:StripTextures()
	TradeSkillFrame.DetailsFrame.CreateAllButton:StripTextures()
	TradeSkillFrame.RecipeInset:StripTextures()
	TradeSkillFrame.RecipeList.LearnedTab:StripTextures()
	TradeSkillFrame.RecipeList.UnlearnedTab:StripTextures()
	TradeSkillFrame.DetailsFrame.CreateButton:StripTextures()
	TradeSkillFrame.DetailsFrame.ExitButton:StripTextures()
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:StripTextures()

	TradeSkillFrame:SetTemplate("Transparent")

	--TradeSkillFrame.FilterButton:StripTextures(true)
	TradeSkillFrame.FilterButton:SkinButton(true)
	TradeSkillFrame.FilterButton:SetScript("OnEnter", OnEnter_Button)
	TradeSkillFrame.FilterButton:SetScript("OnLeave", OnEnter_Button)
	TradeSkillFrame.DetailsFrame.CreateButton:SkinButton(true)
	--BetaTradeSkillFrame.DetailsFrame.CancelButton:SkinButton(true)
	TradeSkillFrame.DetailsFrame.CreateAllButton:SkinButton(true)
	TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton:SkinButton(true)
	TradeSkillFrame.DetailsFrame.ExitButton:SkinButton(true)
	TradeSkillFrame.DetailsFrame.Background:Hide()
	
	TradeSkillFrame.RankFrame:StripTextures()
	TradeSkillFrame.RankFrame:SetStatusBarTexture(C.media.texture)
	TradeSkillFrame.RankFrame:CreateBackdrop()
	
	TradeSkillFrame.LinkToButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
	TradeSkillFrame.LinkToButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
	TradeSkillFrame.LinkToButton:GetHighlightTexture():Kill()
	TradeSkillFrame.LinkToButton:CreateBackdrop("Overlay")
	TradeSkillFrame.LinkToButton:SetSize(17, 14)
	--Beta TradeSkillFrame.LinkToButton:SetPoint("LEFT", TradeSkillLinkFrame, "LEFT", 5, -1)

	T.SkinEditBox(TradeSkillFrame.SearchBox, TradeSkillFrame.SearchBox:GetWidth() + 5, TradeSkillFrame.SearchBox:GetHeight() - 2)
	TradeSkillFrame.SearchBox:ClearAllPoints()
	TradeSkillFrame.SearchBox:SetHeight(15)
	TradeSkillFrame.SearchBox:SetPoint("TOPRIGHT", TradeSkillFrame.RankFrame, "BOTTOMRIGHT", 0, -7)

	T.SkinEditBox(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, nil, TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:GetHeight() - 2)

	T.SkinNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton, true)
	T.SkinNextPrevButton(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:ClearAllPoints()
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:SetPoint("LEFT", TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, "RIGHT", 4, 0)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:SetSize(22, 22)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton:SetSize(22, 22)

	T.SkinCloseButton(TradeSkillFrameCloseButton)

	--T.SkinScrollBar(TradeSkillFrame.RecipeList.scrollBar)
	--T.SkinScrollBar(TradeSkillFrame.DetailsFrame.scrollBar)
end

T.SkinFuncs["Blizzard_TradeSkillUI"] = LoadSkin