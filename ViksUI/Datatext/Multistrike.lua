local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
-- player Multistrike
--------------------------------------------------------------------

if C.datatext.Multi and C.datatext.Multi > 0 then
	local Stat = CreateFrame("Frame")
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = LBottom:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	PP(C.datatext.Multi, Text)

	local int = 1

	local function Update(self, t)
		multistrike = GetMultistrike()
		int = int - t
		if int < 0 then
			Text:SetText(qColor..format("%.2f", multistrike) .."%".. qColor2.."Multi")
			int = 1
		end     
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end