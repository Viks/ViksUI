local T, Viks, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--  Take screenshots of defined events (Sinaris)
----------------------------------------------------------------------------------------

if( Viks['automation']['screenshot'] ~= true ) then
    return
end

local function OnEvent( self, event, ... )
    C_Timer.After( 1, function() Screenshot() end )
end

local EventFrame = CreateFrame( 'Frame' )
EventFrame:RegisterEvent( 'ACHIEVEMENT_EARNED' )
EventFrame:SetScript( 'OnEvent', OnEvent )
