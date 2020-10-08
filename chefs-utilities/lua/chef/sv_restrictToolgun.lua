--Chef's Toolgun Restrictions
--Module of chefs-utilities
--Made by OverlordAkise

chef.badTools = {}
chef.badTools["axis"] = true
chef.badTools["ballsocket"] = true
chef.badTools["elastic"] = true
chef.badTools["hydraulic"] = true
chef.badTools["motor"] = true
chef.badTools["muscle"] = true
chef.badTools["pulley"] = true
chef.badTools["rope"] = true
chef.badTools["slider"] = true
chef.badTools["weld"] = true
--chef.badTools["duplicator"] = true
chef.badTools["winch"] = true
chef.badTools["balloon"] = true
chef.badTools["dynamite"] = true
chef.badTools["emitter"] = true
chef.badTools["hoverball"] = true
chef.badTools["lamp"] = true
chef.badTools["nocollide"] = true
chef.badTools["physprop"] = true
chef.badTools["thruster"] = true
chef.badTools["wheel"] = true
chef.badTools["eyeposer"] = true
chef.badTools["faceposer"] = true
chef.badTools["finger"] = true
chef.badTools["inflator"] = true
chef.badTools["trails"] = true
chef.badTools["permaprops"] = true
chef.badTools["bricks_server_territory_placer"] = true
chef.badTools["ch_server_teleporters"] = true
chef.badTools["enhanced_homes"] = true
chef.badTools["pcasino_creator"] = true
chef.badTools["realistic_police_camera_tool"] = true
chef.badTools["realistic_police_handcuff_tool"] = true
chef.badTools["realistic_police_plate_tool"] = true
chef.badTools["radar"] = true
chef.badTools["zlm_grassspawner"] = true
chef.badTools["zrush_oilspot_generator"] = true
chef.badTools["zrmine_orespawner"] = true
chef.badTools["ztm_trashspawner"] = true
chef.badTools["blacklistandremove"] = true
chef.badTools["bricks_server_entityplacer"] = true
chef.badTools["bricks_server_npcs"] = true


hook.Add("CanTool","chef_cantool",function( ply, tr, tool )
  if chef.badTools[tool] ~= nil then
    if chef.groups[ply:GetUserGroup()] ~= nil then return true end
    DarkRP.notify(ply,1,5,"[chef] You can't use this toolgun!")
    return false
  end
end)

