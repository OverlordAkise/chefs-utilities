--Chef's contextmenu
--made by OverlordAkise

if CLIENT then
--[[
  hook.Add("ContextMenuOpen","chef_nocontextmenu",function()
    if chef.groups[LocalPlayer():GetUserGroup()] ~= nil then 
      return true 
    else
      return false
    end
  end)
--]]
else

  hook.Add("PostGamemodeLoaded","chef_nocontextmenu",function()
    if DarkRP then
      if GAMEMODE == nil then return end
      if GAMEMODE.Config == nil then return end
      if GAMEMODE.Config.allowedProperties ~= nil then
        GAMEMODE.Config.allowedProperties["remover"] = true
        GAMEMODE.Config.allowedProperties["ignite"] = false
        GAMEMODE.Config.allowedProperties["extinguish"] = false
        GAMEMODE.Config.allowedProperties["keepupright"] = false
        GAMEMODE.Config.allowedProperties["gravity"] = false
        GAMEMODE.Config.allowedProperties["collision"] = false
        GAMEMODE.Config.allowedProperties["skin"] = false
        GAMEMODE.Config.allowedProperties["bodygroups"] = false
      end
    end
  end)
  
end