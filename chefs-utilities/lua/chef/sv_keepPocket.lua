--Chef's keep Pocket
--Module of chefs-utilities
--Made by OverlordAkise

hook.Add("PostGamemodeLoaded","chef_keepPocket",function()
	sql.Query("CREATE TABLE IF NOT EXISTS chef_pocket(steamid TEXT, allPocketJson TEXT)")
end)

hook.Add("onPocketItemAdded","chef_keepPocket",function(ply, ent, serialized)
	timer.Simple(0.1,function()
    if not IsValid(ply) then return end
    local plyPocket = util.TableToJSON(ply.darkRPPocket)
    local res = sql.Query("UPDATE chef_pocket SET allPocketJson = '"..plyPocket.."' WHERE steamid = '"..ply:SteamID().."'")
    if res == false then
      PrintMessage(HUD_PRINTTALK, "ERROR: "..ply:Nick().."'s Pocket wasn't updated, shit's about to get fucked!")
      PrintMessage(HUD_PRINTTALK, "Please disable the 'keepPocket' module in the config or disable pocket for that entity!")
      PrintMessage(HUD_PRINTTALK, sql.LastError())
    end
  end)
end)

hook.Add("onPocketItemDropped","chef_keepPocket",function(ply, ent, item, id)
  timer.Simple(0.1,function()
    if not IsValid(ply) then return end
    local plyPocket = util.TableToJSON(ply.darkRPPocket)
    local res = sql.Query("UPDATE chef_pocket SET allPocketJson = '"..plyPocket.."' WHERE steamid = '"..ply:SteamID().."'")
    if res == false then
      PrintMessage(HUD_PRINTTALK, "ERROR: "..ply:Nick().."'s Pocket wasn't updated, shit's about to get fucked!")
      PrintMessage(HUD_PRINTTALK, "Please disable the 'keepPocket' module in the config or disable pocket for that entity!")
      PrintMessage(HUD_PRINTTALK, sql.LastError())
    end
  end)
end)



hook.Add("PlayerInitialSpawn","chef_keepPocket",function(ply)
  timer.Simple(5, function()
    if not IsValid(ply) then return end
		local plyPocket = {}
		local res = sql.Query("SELECT * FROM chef_pocket WHERE steamid = '"..ply:SteamID().."'")
		if res == nil then
      local rres = sql.Query("INSERT INTO chef_pocket (steamid, allPocketJson) VALUES('"..ply:SteamID().."', '[]')")
    else
      if res then
        plyPocket = util.JSONToTable(res[1].allPocketJson)
      end
		end
    ply.darkRPPocket = plyPocket
		net.Start("DarkRP_Pocket")
			net.WriteTable(ply:getPocketItems())
		net.Send(ply)
		ply:PrintMessage(HUD_PRINTTALK, "Pocket Items synchronized!")
	end)
end)