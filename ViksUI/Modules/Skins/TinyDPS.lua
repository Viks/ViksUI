﻿local T, Viks, L, _ = unpack(select(2, ...))
if Viks.skins.tiny_dps ~= true then return end

----------------------------------------------------------------------------------------
--	TinyDPS skin
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
	if not IsAddOnLoaded("TinyDPS") then return end

	tdps.width = 221
	tdps.barHeight = 12
	tdps.spacing = 3
	tdps.border = {0, 0, 0, 0}
	tdps.backdrop = {0, 0, 0, 0}
	tdps.barbackdrop = {0, 0, 0, 0}
	tdps.swapColor = true
	tdps.showMinimapButton = false
	tdps.layout = 11
	tdpsVisibleBars = 7
	tdpsFont.name = Viks.font.stylization_font
	tdpsFont.size = Viks.font.stylization_font_size
	tdpsFont.outline = Viks.font.stylization_font_style
	tdpsFont.shadow = Viks.font.stylization_font_shadow and 1 or 0
	tdpsTextOffset = 0

	tdpsFrame:SetTemplate("Default")
	noData:SetTextColor(1, 1, 1, 1)

	if tdpsStatusBar then
		tdpsStatusBar:SetStatusBarTexture(Viks.media.texture)
	end
end)