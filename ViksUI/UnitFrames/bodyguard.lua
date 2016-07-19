local T, C, L, _ = unpack(select(2, ...))
--local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
--local UF = E:GetModule('UnitFrames');
--local BG = LibStub("LibBodyguard-1.0");
--local LSM = LibStub("LibSharedMedia-3.0");
--local _, ns = ...
--local ElvUF = ns.oUF
--assert(ElvUF, "ElvUI was unable to locate oUF.")

local addon, ns = ...
local UF = ns.oUF or oUF
local BG = LibStub("LibBodyguard-1.0");
local LSM = LibStub("LibSharedMedia-3.0");
local _, ns = ...
local oUF = ns.oUF or oUF

--Cache global variables
local unpack = unpack
--WoW API / Variables
local CreateFrame = CreateFrame
local SetMapToCurrentZone = SetMapToCurrentZone
local GetCurrentMapContinent = GetCurrentMapContinent
local GetCurrentMapAreaID = GetCurrentMapAreaID
local InCombatLockdown = InCombatLockdown
local UnitExists = UnitExists
local UnitName = UnitName

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: ElvUF_Player

local CONTINENT_DRAENOR = 7
local BODYGUARD_BANNED_ZONES = {
	[978] = true,  -- Ashran
	[1009] = true, -- Stormshield
	[1011] = true  -- Warspear
}

function BG:IsValidZone()
	SetMapToCurrentZone()
	local currentContinent = GetCurrentMapContinent()
	local currentMapAreaID = GetCurrentMapAreaID()
	local valid = currentContinent == CONTINENT_DRAENOR and not BODYGUARD_BANNED_ZONES[currentMapAreaID]
	BG.db.IsInValidZone = valid

	return valid
end

function BG:IsShowing()
	if(self.frame:IsShown() or self.combatEvent == self.showFrame) then
		return true
	else
		return false
	end
end

function BG:HideFrame()
	if(InCombatLockdown()) then
		self.frame:RegisterEvent("COMBAT_REGEN_ENABLED")
		self.combatEvent = self.HideFrame
		return
	elseif(self.frame:IsEventRegistered("COMBAT_REGEN_ENABLED")) then
		self.frame:UnregisterEvent("COMBAT_REGEN_ENABLED")
	end

	self.frame:Hide()
end

function BG:ShowFrame()
	if(InCombatLockdown()) then
		self.frame:RegisterEvent("COMBAT_REGEN_ENABLED")
		self.combatEvent = self.ShowFrame
		return
	elseif(self.frame:IsEventRegistered("COMBAT_REGEN_ENABLED")) then
		self.frame:UnregisterEvent("COMBAT_REGEN_ENABLED")
	end

	self.frame:Show()
end

local function OnEvent(self, event)
	if(event == "PLAYER_REGEN_ENABLED") then
		self.combatEvent(BG, event)
	elseif(event == "PLAYER_TARGET_CHANGED") then
		if(UnitExists("target") and UnitName("target") == BG:GetName()) then
			self.targetGlow:Show()
		else
			self.targetGlow:Hide()
		end
	end
end

local isCreated = false
function BG:CreateFrame()
	if(isCreated) then return end
	local frame = CreateFrame("Button", "oUF_BodyGuard", UIParent, "SecureActionButtonTemplate")
	frame:SetScript("OnEvent", OnEvent)
	frame:RegisterEvent("PLAYER_TARGET_CHANGED")

	frame:CreateShadow()
	frame.targetGlow = frame.shadow
	frame.shadow = nil
	frame.targetGlow:SetBackdropBorderColor(0.33, 0.59, 0.33)
	frame.targetGlow:Hide()

	BG.frame = frame
	local name = self:GetName()
	frame:SetAttribute("type1", "macro")
	if name then
		frame:SetAttribute("macrotext1", "/targetexact " .. name)
	end

	self:HideFrame()

	frame:SetTemplate("Default", nil, true)
	frame:Point("CENTER", UIParent, "CENTER")
	frame:Width(196)
	frame:Height(18)

	frame.healthBar = CreateFrame("StatusBar", nil, frame)
	frame.healthBar:SetInside(frame)
	frame.healthBar:SetMinMaxValues(0, 1)
	frame.healthBar:SetValue(1)
	--frame.healthBar:SetStatusBarTexture(LSM:Fetch("statusbar", UF.db.statusbar))
	--UF.statusbars[frame.healthBar] = true

	frame.healthBar.name = frame.healthBar:CreateFontString(nil, 'OVERLAY')
	--UF:Configure_FontString(frame.healthBar.name)
	frame.healthBar.name:Point("CENTER", frame, "CENTER")

	frame.healthBar.name:SetTextColor(0.33, 0.59, 0.33)

	--E:CreateMover(frame, frame:GetName()..'Mover', L["BodyGuard Frame"], nil, nil, nil, 'ALL,SOLO')

	isCreated = true
end

function BG:UpdateSettings()
	self.frame:SetParent(UIParent)
	self:HealthUpdate()
	self.frame:Width(196)
	self.frame:Height(18)
end


function BG:GUIDUpdate(GUID)

end

function BG:StatusUpdate(status)
	if status == self.Status.Active then
		self:NameUpdate(self:GetName())
		self:HealthUpdate(self.db.Health, self.db.MaxHealth)
		self:ShowFrame()
	elseif status == self.Status.Inactive then
		self:HideFrame()
	end

	self.db.Active = status ~= self.Status.Inactive
end

function BG:NameUpdate(name)
	if(not InCombatLockdown() and name) then
		self.frame:SetAttribute("macrotext1", "/targetexact " .. name)
	end

	self.frame.healthBar.name:SetText(name)
end

function BG:LevelUpdate(...)

end

function BG:HealthUpdate(health, maxHealth)
	self.frame.healthBar:SetMinMaxValues(0, maxHealth)
	self.frame.healthBar:SetValue(health)

	local r, g, b = .2,.2,.2


	self.frame.healthBar:SetStatusBarColor(r, g, b)

	self.frame.backdropTexture:SetVertexColor(r * 0.35, g * 0.35, b * 0.35)

	self.db.Health = health
	self.db.MaxHealth = maxHealth
end

function BG:GossipOpened(...)

end

function BG:GossipClosed(...)

end