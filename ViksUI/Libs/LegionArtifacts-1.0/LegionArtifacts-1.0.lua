local major = "LegionArtifacts-1.0"
local minor = tonumber(string.match("$Revision: 1000 $", "(%d+)") or 1)

assert(LibStub, string.format("%s requires LibStub.", major))

local LA = LibStub:NewLibrary(major, minor)
if( not LA ) then return end

-- internal artifact
local artifact = {}

local function RefreshPowers()
   if C_ArtifactUI.GetPowers() then
      local itemID, altID, name, _ = C_ArtifactUI:GetArtifactInfo()
      
      if not artifact[itemID] then artifact[itemID] = {} end
      
      for i,p in ipairs(C_ArtifactUI.GetPowers()) do
         local spellID, upgradeCost, curRank, maxRank, bonusRank, xpos, ypos, prereqsMet, isStart, isGoldMedal, isFinal = C_ArtifactUI.GetPowerInfo(p)
         --artifact[itemID][spellID] = {curRank, maxRank, bonusRank}
         artifact[itemID][spellID] = {spellID, upgradeCost, curRank, maxRank, bonusRank, xpos, ypos, prereqsMet, isStart, isGoldMedal, isFinal}
      end
   else
      --print('err')
   end
end

local function RefreshEquipped()
   if not (ArtifactFrame and ArtifactFrame:IsShown()) then
      UIParent:UnregisterEvent("ARTIFACT_UPDATE")
      SocketInventoryItem(16)
   end

   RefreshPowers()
   
   if not (ArtifactFrame and ArtifactFrame:IsShown()) then
      C_ArtifactUI.Clear();
      UIParent:RegisterEvent("ARTIFACT_UPDATE")
   end
end

local function RefreshBags()
   if not (ArtifactFrame and ArtifactFrame:IsShown()) then
      UIParent:UnregisterEvent("ARTIFACT_UPDATE")
   end

   for bag=0,4,1 do 
      for slot=1,GetContainerNumSlots(bag),1 do 
         local texture, count, locked, quality, readable, lootable, link, isFiltered = GetContainerItemInfo(bag, slot)
         if quality == 6 then
            -- quality 6 = artifacts
            SocketContainerItem(bag,slot)
            RefreshPowers()
            C_ArtifactUI.Clear();
         end
      end
   end
   
   if not (ArtifactFrame and ArtifactFrame:IsShown()) then
      UIParent:RegisterEvent("ARTIFACT_UPDATE")
   end
end

function LA:GetArtifacts()
   local set = {}
   for i,v in pairs(artifact) do
      tinsert(set,i)
   end
   return set
end

function LA:GetPowers(artifactID)
   local powers
   if not artifactID then
      if HasArtifactEquipped() then
         local itemID = GetInventoryItemID("player", 16)
         powers = artifact[itemID]
      end
   elseif artifact[artifactID] then
      powers = artifact[artifactID]
   end
   
   local set = {}
   for i,v in pairs(powers) do
      tinsert(set,i)
   end
   
   return set or false
end

function LA:GetPowerInfo(powerID,artifactID)
   if not powerID then return false end
   local powerInfo
   
   if not artifactID then
      if HasArtifactEquipped() then
         local itemID = GetInventoryItemID("player", 16)
         if artifact[itemID][powerID] then
            powerInfo = artifact[itemID][powerID]
         end
      end
   elseif artifact[artifactID] then
      if artifact[artifactID][powerID] then
         powerInfo = artifact[artifactID][powerID]
      end
   end

   return powerInfo or false
end

-- data updates
local f = CreateFrame('frame')
f:SetScript('OnEvent', function(self, event, ...)
   --print(event,...)
   if event == 'PLAYER_ENTERING_WORLD' then
      RefreshEquipped()
      RefreshBags()
   elseif event == 'ARTIFACT_UPDATE' then
      RefreshPowers()
   end
end)
f:RegisterEvent('PLAYER_ENTERING_WORLD')
f:RegisterEvent('ARTIFACT_UPDATE')
