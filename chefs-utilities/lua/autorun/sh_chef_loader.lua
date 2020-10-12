--Chef's Module Loader
--Loader of chefs-utilities
--Made by OverlordAkise

chef = {}

if SERVER then
	AddCSLuaFile("chef_config.lua")
end

if CLIENT then
  surface.CreateFont("ChefsFancyFont", {font = "Tahoma", size = 35, weight = 1000, blursize = 0, scanlines = 0})
end

include("chef_config.lua")

print("[chef] Loading utilities...")

if (chef.load.chatBox) then
  if SERVER then AddCSLuaFile("chef/cl_chat.lua") end
  if CLIENT then include("chef/cl_chat.lua") end
  print("[chef] Chef's Chat loaded!")
end

if (chef.load.antiProp) then
  if SERVER then include("chef/sv_antiProp.lua") end
  print("[chef] Chef's Anti-Prop loaded!")
end

if (chef.load.announce) then
  if SERVER then include("chef/sv_announcements.lua") end
  print("[chef] Chef's Announcements loaded!")
end

if (chef.load.advert) then
  if SERVER then
    AddCSLuaFile("chef/sh_advert.lua")
    include("chef/sh_advert.lua")
  end
  if CLIENT then
    include("chef/sh_advert.lua")
  end
  print("[chef] Chef's Advert loaded!")
end

if (chef.load.bhopSlow) then
  if SERVER then include("chef/sv_antiBhop.lua") end
  print("[chef] Chef's SlowHop loaded!")
end

if (chef.load.contextMenu) then
  if SERVER then 
    AddCSLuaFile("chef/sh_noContextmenu.lua")
    include("chef/sh_noContextmenu.lua")
  end
  if CLIENT then 
    include("chef/sh_noContextmenu.lua") 
  end
  print("[chef] Chef's NoContextMenu loaded!")
end

if (chef.load.maxSettings) then
  if SERVER then include("chef/sv_maxSettings.lua") end
  print("[chef] Chef's Auto-Max-Settings loaded!")
end

if (chef.load.fpsBoost) then
  if SERVER then AddCSLuaFile("chef/cl_fpsboost.lua") end
  if CLIENT then include("chef/cl_fpsboost.lua") end
  print("[chef] Chef's FPS Boost loaded!")
end

if (chef.load.chatCommands) then
  if SERVER then AddCSLuaFile("chef/cl_chatCommands.lua") end
  if CLIENT then include("chef/cl_chatCommands.lua") end
  print("[chef] Chef's ChatCommands loaded!")
end

if (chef.load.restrictToolgun) then
  if SERVER then include("chef/sv_restrictToolgun.lua") end
  print("[chef] Chef's Toolgun Restrictions loaded!")
end

if (chef.load.restrictSpawnMenu) then
  if SERVER then AddCSLuaFile("chef/cl_restrictSpawnmenu.lua") end
  if CLIENT then include("chef/cl_restrictSpawnmenu.lua") end
  print("[chef] Chef's Spawnmenu Restrictions loaded!")
end

if (chef.load.forceNameChange) then
  if SERVER then 
    AddCSLuaFile("chef/nameChange_cl.lua")
    include("chef/nameChange_sv.lua")
  end
  if CLIENT then 
    include("chef/nameChange_cl.lua") 
  end
  print("[chef] Chef's NameChange loaded!")
end

if (chef.load.restrictCarPickup) then
  if SERVER then
    hook.Add("PhysgunPickup","chef_anticar",function(ply, ent) 
      if (ent:IsVehicle() and chef.groups[ply:GetUserGroup()] == nil) then 
        return false 
      end
    end)
  end
  print("[chef] Chef's Anti-Car-Pickup loaded!")
end

if (chef.load.physgunPlayers) then
  if SERVER then include("chef/sv_physgunPlayers.lua") end
    print("[chef] Chef's PhysgunPlayers loaded!")
end

if (chef.load.restrictPropList) then
  if SERVER then include("chef/sv_propList.lua") end
  print("[chef] Chef's Restricted PropList loaded!")
end

if (chef.load.restrictDrop) then
  if SERVER then include("chef/sv_restrictDrop.lua") end
  print("[chef] Chef's Restricted Droplist loaded!")
end

if (chef.load.moderatorWeapons) then
  if SERVER then include("chef/sv_modWeaponSpawn.lua") end
  print("[chef] Chef's Moderator-Can-Spawn-Weapon loaded!")
end

if (chef.load.stopSuicide) then
  if SERVER then
    hook.Add( "CanPlayerSuicide", "chef_stopsuicide", function( ply )
      return false
    end)
  end
  print("[chef] Chef's StopKillingYourself loaded!")
end

if (chef.load.betterPocket) then
  if SERVER then include("chef/sv_betterPocket.lua") end
  print("[chef] Chef's better pocket loaded!")
end

if (chef.load.keepPocket) then
  if SERVER then include("chef/sv_keepPocket.lua") end
  print("[chef] Chef's keep pocket loaded!")
end

if (chef.load.betterAFK) then
  if SERVER then include("chef/sv_betterAFK.lua") end
  print("[chef] Chef's better afk loaded!")
end

if (chef.load.hideDeaths) then
  if CLIENT then
    function GAMEMODE:DrawDeathNotice(x, y)
      return false
    end
  end
  print("[chef] Chef's Hide Deaths loaded!")
end

if (chef.load.cac) then
  if SERVER then
    AddCSLuaFile("chef/cl_cac.lua")
    include("chef/sv_cac.lua") 
  end
  if CLIENT then
    include("chef/cl_cac.lua")
  end
  print("[chef] Chef's Anti Cheat loaded!")
end

print("[chef] Everything loaded!")