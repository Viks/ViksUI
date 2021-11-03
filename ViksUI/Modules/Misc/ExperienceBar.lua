local T, C, L, _ = unpack(select(2, ...))
if C.misc.XPBar ~= true then return end

local ExperienceEnable = true
local Experience = CreateFrame("Frame", nil, UIParent)
local Menu = CreateFrame("Frame", "ViksUIExperienceMenu", UIParent, "UIDropDownMenuTemplate")
local HideTooltip = GameTooltip_Hide
local Panels = CreateFrame("Frame")
local BarSelected
local Bars = 20
local barTex = C.media.texture

Experience.NumBars = 2
Experience.RestedColor = {75 / 255, 175 / 255, 76 / 255}
Experience.XPColor = {0 / 255, 144 / 255, 255 / 255}
Experience.PetXPColor = {255 / 255, 255 / 255, 105 / 255}
Experience.AZColor = {229 / 255, 204 / 255, 127 / 255}
Experience.HNColor = {222 / 255, 22 / 255, 22 / 255}
Experience.AnimaColor = {153 / 255, 204 / 255, 255 / 255}														 
Experience.Menu = {
	{
		text = XP,
		func = function()
			BarSelected.BarType = "XP"
			
			Experience:Update()
			
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true
	},
	{
		text = HONOR,
		func = function()
			BarSelected.BarType = "HONOR"
			
			Experience:Update()
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true
	},
	{
		text = "Azerite",
		func = function()
			BarSelected.BarType = "AZERITE"
			
			Experience:Update()
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true,
		disabled = true,
	},
	{
		text = PET.." "..XP,
		func = function()
			BarSelected.BarType = "PETXP"
			
			Experience:Update()
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true,
		disabled = true,
	},
	{
		text = REPUTATION,
		func = function()
			BarSelected.BarType = "REP"
			
			Experience:Update()

			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true,
		disabled = true,
	},
	{
		text = ANIMA_DIVERSION_CURRENCY_TOOLTIP_TITLE,
		func = function()
			BarSelected.BarType = "ANIMA"
			
			Experience:Update()

			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true,
		disabled = true,
	},
}

function Experience:SetTooltip()
	local BarType = self.BarType
	local Current, Max, Pts

	if (self == Experience.XPBar1) then
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", -1, 5)
	else
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", 1, 5)
	end

	if BarType == "XP" then
		local Rested = GetXPExhaustion()
		local IsRested = GetRestState()

		Current, Max = Experience:GetExperience()

		if Max == 0 then
			return
		end

		GameTooltip:AddLine("|cff0090FF"..XP..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")

		if (IsRested == 1 and Rested) then
			GameTooltip:AddLine("|cff4BAF4C"..TUTORIAL_TITLE26..": +" .. Rested .." (" .. floor(Rested / Max * 100) .. "%)|r")
		end
	elseif BarType == "ANIMA" then
		Current, Max = Experience:GetAnima()
		
		if Max == 0 then
			return
		end
		
		local Level = C_CovenantSanctumUI.GetRenownLevel()
		
		GameTooltip:AddLine("|cffFF3333"..COVENANT_SANCTUM_TAB_RENOWN.." "..LEVEL..": " .. Level)
		GameTooltip:AddLine("|cff99CCFF"..ANIMA_DIVERSION_CURRENCY_TOOLTIP_TITLE..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "%)")
	elseif BarType == "PETXP" then
		Current, Max = GetPetExperience()

		if Max == 0 then
			return
		end

		GameTooltip:AddLine("|cffFFFF66Pet XP: " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")
	elseif BarType == "AZERITE" then
		Current, Max, Level, Items = Experience:GetAzerite()

		if Max == 0 then
			return
		end

		local RemainingXP = Max - Current
		local AzeriteItem = Item:CreateFromItemLocation(Items)
		local ItemName = AzeriteItem:GetItemName()

		GameTooltip:AddDoubleLine(ItemName..' ('..Level..')', format(ISLANDS_QUEUE_WEEKLY_QUEST_PROGRESS, Current, Max), 0.90, 0.80, 0.50)
		GameTooltip:AddLine(' ')
		GameTooltip:AddLine(AZERITE_POWER_TOOLTIP_BODY:format(ItemName))

		GameTooltip:Show()
	elseif BarType == "REP" then
		local Current, Max = Experience:GetReputation()
		local Name, ID = GetWatchedFactionInfo()
		local Colors = FACTION_BAR_COLORS
		local Hex = T.RGBToHex(Colors[ID].r, Colors[ID].g, Colors[ID].b)
		
		GameTooltip:AddLine(Hex..Name..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")
	else
		local Level = UnitHonorLevel("player")

		Current, Max = Experience:GetHonor()

		if Max == 0 then
			GameTooltip:AddLine(PVP_HONOR_PRESTIGE_AVAILABLE)
			GameTooltip:AddLine(PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE)
		else
			GameTooltip:AddLine("|cffee2222"..HONOR..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")
			GameTooltip:AddLine("|cffcccccc"..RANK..": " .. Level .. "|r")
		end
	end

	GameTooltip:Show()
end

function Experience:GetExperience()
	return UnitXP("player"), UnitXPMax("player")
end

function Experience:GetAzerite()
	local AzeriteItems = C_AzeriteItem.FindActiveAzeriteItem()
	local XP, TotalXP = C_AzeriteItem.GetAzeriteItemXPInfo(AzeriteItems)
	local Level = C_AzeriteItem.GetPowerLevel(AzeriteItems)

	return XP, TotalXP, Level, AzeriteItems
end

function Experience:GetHonor()
	return UnitHonor("player"), UnitHonorMax("player")
end

function Experience:GetReputation()
	local Name, ID, Min, Max, Value = GetWatchedFactionInfo()
	
	return Value, Max
end

function Experience:GetAnima()
	local CurrencyID, MaxDisplayableValue = C_CovenantSanctumUI.GetAnimaInfo()
	local CurrencyInfo = C_CurrencyInfo.GetCurrencyInfo(CurrencyID)
	local Current = CurrencyInfo.quantity 
	local Max = CurrencyInfo.maxQuantity
	
	return Current, Max
end

function Experience:VerifyMenu()
	local AzeriteItem = C_AzeriteItem.FindActiveAzeriteItem()
	local HavePetXP = select(2, HasPetUI())
	local WatchedFaction = GetWatchedFactionInfo()
	local AnimaCurrency = C_CovenantSanctumUI.GetAnimaInfo()
	local AnimaCurrencyInfo = C_CurrencyInfo.GetCurrencyInfo(AnimaCurrency)
	
	if AzeriteItem then
		Experience.Menu[3].disabled = false
	else
		Experience.Menu[3].disabled = true
	end

	if HavePetXP then
		Experience.Menu[4].disabled = false
	else
		Experience.Menu[4].disabled = true
	end

	if WatchedFaction then
		Experience.Menu[5].disabled = false
	else
		Experience.Menu[5].disabled = true
	end
	
	if AnimaCurrency and AnimaCurrencyInfo.quantity ~= 0 and AnimaCurrencyInfo.maxQuantity ~= 0 then
		Experience.Menu[6].disabled = false
	else
		Experience.Menu[6].disabled = true
	end
end

function Experience:Update()
	local Current, Max
	local Rested = GetXPExhaustion()
	local IsRested = GetRestState()
	local AnimaCurrency = C_CovenantSanctumUI.GetAnimaInfo()
	local AnimaCurrencyInfo = C_CurrencyInfo.GetCurrencyInfo(AnimaCurrency)
	local AzeriteItem = C_AzeriteItem.FindActiveAzeriteItem()
	local HavePetXP = select(2, HasPetUI())
	local WatchedFaction = GetWatchedFactionInfo()

	for i = 1, self.NumBars do
		local Bar = self["XPBar"..i]
		local RestedBar = self["RestedBar"..i]
		local R, G, B
		
		if (Bar.BarType == "AZERITE" and not AzeriteItem) or (Bar.BarType == "PETXP" and not HavePetXP) or (Bar.BarType == "REP" and not WatchedFaction) or (Bar.BarType == "ANIMA" and AnimaCurrencyInfo.quantity == 0 and AnimaCurrencyInfo.maxQuantity == 0) then
			local MoreText = ""
			
			if Bar.BarType == "REP" then
				MoreText = " Please select a reputation to track in your character panel!"
			end
			
			print("[|CFFFFFF00" .. POWER_TYPE_EXPERIENCE .. "|r] You cannot track |CFFFF0000".. Bar.BarType .."|r at the moment, switching to |CFF00FF00XP|r"..MoreText)
			
			Bar.BarType = "XP"
		end

		if Bar.BarType == "HONOR" then
			Current, Max = self:GetHonor()
			
			R, G, B = unpack(self.HNColor)
		elseif Bar.BarType == "ANIMA" then
			Current, Max = Experience:GetAnima()
			
			R, G, B = unpack(self.AnimaColor)
		elseif Bar.BarType == "PETXP" then
			Current, Max = GetPetExperience()
			
			R, G, B = unpack(self.PetXPColor)
		elseif Bar.BarType == "AZERITE" then
			Current, Max = self:GetAzerite()
			
			R, G, B = unpack(self.AZColor)
		elseif Bar.BarType == "REP" then
			Current, Max = self:GetReputation()
			
			local Colors = FACTION_BAR_COLORS
			local ID = select(2, GetWatchedFactionInfo())
			
			R, G, B = Colors[ID].r, Colors[ID].g, Colors[ID].b
		else
			Current, Max = self:GetExperience()
			
			R, G, B = unpack(self.XPColor)
		end

		Bar:SetMinMaxValues(0, Max)
		Bar:SetValue(Current)

		if (Bar.BarType == "XP" and IsRested == 1 and Rested) then
			RestedBar:Show()
			RestedBar:SetMinMaxValues(0, Max)
			RestedBar:SetValue(Rested + Current)
		else
			RestedBar:Hide()
		end

		Bar:SetStatusBarColor(R, G, B)
	end
end

function Experience:DisplayMenu()
	BarSelected = self
	
	Experience:VerifyMenu()
	
	EasyMenu(Experience.Menu, Menu, "cursor", 0, 0, "MENU")

end

function Experience:Create()
	for i = 1, self.NumBars do
		local XPBar = CreateFrame("StatusBar", "ViksUIExperienceBar" .. i, UIParent)
		local RestedBar = CreateFrame("StatusBar", nil, XPBar)
		local Data = ViksUISettingsPerChar
		XPBar:SetStatusBarTexture(barTex)
		XPBar:EnableMouse()
		XPBar:SetFrameStrata("MEDIUM")
		XPBar:SetFrameLevel(2)
		XPBar:CreateBackdrop()
		XPBar:SetScript("OnEnter", Experience.SetTooltip)
		XPBar:SetScript("OnLeave", HideTooltip)
		XPBar:SetScript("OnMouseUp", Experience.DisplayMenu)

		RestedBar:SetStatusBarTexture(barTex)
		RestedBar:SetFrameStrata("MEDIUM")
		RestedBar:SetStatusBarColor(unpack(self.RestedColor))
		RestedBar:SetAllPoints(XPBar)
		RestedBar:SetOrientation("HORIZONTAL")
		RestedBar:SetFrameLevel(XPBar:GetFrameLevel() - 1)
		RestedBar:SetAlpha(.5)
		RestedBar:SetReverseFill(i == 2 and true)
		if C.panels.NoPanels == true then
			XPBar:SetSize(i == 1 and (LEFTChatline:GetWidth()-4) or (RIGHTChatline:GetWidth()-4), 6)
			XPBar:Point("BOTTOMLEFT", i == 1 and LEFTChatline or RIGHTChatline, "TOPLEFT", 2, 6)
		else
			XPBar:SetSize(i == 1 and (LChat:GetWidth()-4) or (RChat:GetWidth()-4), 6)
			XPBar:Point("BOTTOMLEFT", i == 1 and LChatTab or RChatTab, "TOPLEFT", 2, 4)
		end
		XPBar.backdrop:SetFrameLevel(XPBar:GetFrameLevel() - 2)
		XPBar.backdrop:SetOutside()
		XPBar:SetReverseFill(i == 2 and true)
		-- Default settings
		if ViksUISettingsPerChar.experiencebar["ViksUIExperienceBar" .. i] ~= nil then
			if i == 1 then
				XPBar.BarType = ViksUISettingsPerChar.experiencebar["ViksUIExperienceBar1"]
			else
				XPBar.BarType = ViksUISettingsPerChar.experiencebar["ViksUIExperienceBar2"]
			end
		else
			if i == 1 then
				XPBar.BarType = "XP"
			else
				XPBar.BarType = "HONOR"
			end
		end

		self["XPBar"..i] = XPBar
		self["RestedBar"..i] = RestedBar
	end
	
	self:RegisterEvent("ADDON_LOADED")	
	self:RegisterEvent("PLAYER_XP_UPDATE")
	self:RegisterEvent("UPDATE_FACTION")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("UPDATE_EXHAUSTION")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_UPDATE_RESTING")
	self:RegisterEvent("HONOR_XP_UPDATE")
	self:RegisterEvent("HONOR_LEVEL_UPDATE")
	self:RegisterEvent("AZERITE_ITEM_EXPERIENCE_CHANGED")
	self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
	self:RegisterEvent("PLAYER_MONEY")
	self:RegisterEvent("UNIT_PET")
	self:RegisterEvent("UNIT_PET_EXPERIENCE")
	self:RegisterEvent("CURRENCY_DISPLAY_UPDATE")	
	self:RegisterEvent("ADDON_LOADED")	

	self:SetScript("OnEvent", self.Update)
end

function Experience:Enable()
	if not ExperienceEnable then
		return
	end

	if not self.XPBar1 then
		self:Create()
	end

	for i = 1, self.NumBars do
		if not self["XPBar"..i]:IsShown() then
			self["XPBar"..i]:Show()
		end

		if not self["RestedBar"..i]:IsShown() then
			self["RestedBar"..i]:Show()
		end
	end
end

function Experience:Disable()
	for i = 1, self.NumBars do
		if self["XPBar"..i]:IsShown() then
			self["XPBar"..i]:Hide()
		end

		if self["RestedBar"..i]:IsShown() then
			self["RestedBar"..i]:Hide()
		end
	end
end

-- Force update after login
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
	Experience:Enable()
	Experience:Update()
end)

C.Experience = Experience
