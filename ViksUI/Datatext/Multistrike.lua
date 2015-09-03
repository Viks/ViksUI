local T, Viks, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
-- player Multistrike
--------------------------------------------------------------------

if Viks.datatext.Multi and Viks.datatext.Multi > 0 then
	local Stat = CreateFrame("Frame")
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = LBottom:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(Viks.media.pxcolor1))
	Text:SetFont(Viks.media.pxfont, Viks.media.pxfontsize, Viks.media.pxfontFlag)
	PP(Viks.datatext.Multi, Text)

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