--Chef's Anticheat
--Module of chefs-utilities
--Made by OverlordAkise

util.AddNetworkString("chef_change")
util.AddNetworkString("chef_bestrafe")


--Disable cheating by DarkRP

hook.Add("PostGamemodeLoaded","chef_changeSVLua",function()
  RunConsoleCommand("sv_allowcslua","0")
  GAMEMODE.Config.disallowClientsideScripts = true
  timer.Simple(30,function()
    RunConsoleCommand("sv_allowcslua","0")
    GAMEMODE.Config.disallowClientsideScripts = true
  end)
end)

--bantime length = minutes
function ChefAC_Punish( ply, length, pMessage)
  if not IsValid( ply ) then return end
  if ulx then
    ULib.ban( ply, length, pMessage )
  elseif xAdmin then
    xAdmin.RegisterNewBan( ply, "CONSOLE", pMessage, length )
    ply:Kick( pMessage )
  elseif SAM then
    SAM.AddBan( ply:SteamID(), nil, length * 60, pMessage )
  else
    ply:Ban( length, false )
    ply:Kick( pMessage )
  end
  PrintMessage(HUD_PRINTTALK,"[ChefAC] "..ply:Nick().." was banned for '"..pMessage.."'!")
end

net.Receive("chef_change",function(len,ply)
  local conname = net.ReadString()
  local convalue = net.ReadString()
  if convalue != GetConVar(conname):GetString() then
    print("[ChefAC] "..ply:Nick().." was banned for changing convars.")
    --PrintMessage(HUD_PRINTTALK, "BANNED!")
    ChefAC_Punish(ply,0,"[ChefAC] Banned for cheating.")
  end
end)

net.Receive("chef_bestrafe",function(len,ply)
  local reason = net.ReadString()
  print("[ChefAC] "..ply:Nick().." was banned for '"..reason.."'.")
  --PrintMessage(HUD_PRINTTALK, "BANNED!")
  ChefAC_Punish(ply,0,"[ChefAC] Banned for cheating.")
end)

--[[
--Anti Net Spam
local netIncoming = net.Incoming
function net.Incoming( len, ply )
  if ply.netBanned then return end
  if not ply.netCount then 
    ply.netCount = 0
    ply.netLast = CurTime()
  end
  if (ply.netLast + 5) <= CurTime() then
    ply.netCount = 0
    ply.netLast = CurTime()
    --PrintMessage(HUD_PRINTTALK, "Set to 0!")
  end
  ply.netCount = ply.netCount + 1
  if ply.netCount > 1000 then
    print("[ChefAC] "..ply:Nick().." was banned for net spam.")
    --PrintMessage(HUD_PRINTTALK, "BANNED!")
    ChefAC_Punish(ply,0,"[ChefAC] Banned for cheating.")
    ply.netBanned = true
  end
  netIncoming(len,ply)
end
--]]
print("[ChefAC] Serverside loaded!")