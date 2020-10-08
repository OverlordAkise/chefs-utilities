--Chef's Mod-Weapon-Spawn
--Module of chefs-utilities
--Made by OverlordAkise

hook.Add("PostGamemodeLoaded","chef_modsSpawnWeapons",function()
  GAMEMODE.Config.adminweapons = 4

  local function chefCanSpawnWeapon(ply)
    if (GAMEMODE.Config.adminweapons == 0 and ply:IsAdmin()) or
    (GAMEMODE.Config.adminweapons == 1 and ply:IsSuperAdmin()) or
    (GAMEMODE.Config.adminweapons == 3) or
    (GAMEMODE.Config.adminweapons == 4 and chef.groups[ply:GetUserGroup()] ~= nil) then
        return true
    end
    DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cant_spawn_weapons"))

    return false
  end

  function GAMEMODE:PlayerSpawnSWEP(ply, class, info)
    return chefCanSpawnWeapon(ply) and self.Sandbox.PlayerSpawnSWEP(self, ply, class, info) and not ply:isArrested()
  end

  function GAMEMODE:PlayerGiveSWEP(ply, class, info)
    return chefCanSpawnWeapon(ply) and self.Sandbox.PlayerGiveSWEP(self, ply, class, info) and not ply:isArrested()
  end
end)