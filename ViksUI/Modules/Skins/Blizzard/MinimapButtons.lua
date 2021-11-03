﻿local T, C, L, _ = unpack(select(2, ...))
if C.skins.minimap_buttons ~= true or C.minimap.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Skin addons icons on minimap
----------------------------------------------------------------------------------------
local blackList = {
	"QueueStatusMinimapButton",
	"MiniMapTrackingButton",
	"MiniMapMailFrame",
	"HelpOpenTicketButton",
	"GatherMatePin",
	"HandyNotesPin"
}

local function SkinButton(f)
	for _, buttons in pairs(blackList) do
		if f:GetName() ~= nil then
			if f:GetName():match(buttons) then return end
		end
	end

	f:SetPushedTexture(nil)
	f:SetHighlightTexture(nil)
	f:SetDisabledTexture(nil)
	f:SetSize(16, 16)

	for i = 1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:IsVisible() and region:GetObjectType() == "Texture" then
			local tex = tostring(region:GetTexture())

			if tex and (tex:find("Border") or tex:find("Background") or tex:find("AlphaMask")) then
				region:SetTexture(nil)
			else
				region:ClearAllPoints()
				region:SetPoint("TOPLEFT", f, "TOPLEFT", 2, -2)
				region:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
				region:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				region:SetDrawLayer("ARTWORK")
				if f:GetName() == "PS_MinimapButton" then
					region.SetPoint = T.dummy
				end
			end
		end
	end

	f:SetTemplate("Transparent")
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetScript("OnEvent", function(_, event)
	if event == "PLAYER_LOGIN" then
		for _, child in ipairs({Minimap:GetChildren()}) do
			if child:GetObjectType() == "Button" and child:GetNumRegions() >= 3 and child:IsShown() then
				SkinButton(child)
			end
		end
	end

	if WIM3MinimapButton and WIM3MinimapButton:GetNumRegions() < 9 then
		SkinButton(WIM3MinimapButton)
		SkinButton(WIM3MinimapButton)
	end
end)
