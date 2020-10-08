--Chef's better pocket
--Module of chefs-utilities
--Made by OverlordAkise

hook.Add("PostGamemodeLoaded","chef_noPocketDrop",function()
  if DarkRP then
    hook.Remove("PlayerDeath", "DropPocketItems")
  end
  if GAMEMODE.Config.PocketBlacklist ~= nil then
    GAMEMODE.Config.PocketBlacklist["sammyservers_textscreen"] = true
    GAMEMODE.Config.PocketBlacklist["keypad"] = true
    GAMEMODE.Config.PocketBlacklist["Fuel_station"] = true
    GAMEMODE.Config.PocketBlacklist["fuel_station"] = true
    GAMEMODE.Config.PocketBlacklist["vc_fuel_station_diesel"] = true
    GAMEMODE.Config.PocketBlacklist["vc_fuel_station_electricity"] = true
    GAMEMODE.Config.PocketBlacklist["vc_fuel_station_petrol"] = true
    GAMEMODE.Config.PocketBlacklist["vc_"] = true
    GAMEMODE.Config.PocketBlacklist["zfs_"] = true
    GAMEMODE.Config.PocketBlacklist["zlm_buyer_npc"] = true
    GAMEMODE.Config.PocketBlacklist["zlm_grasspress"] = true
    GAMEMODE.Config.PocketBlacklist["zlm_spawn"] = true
    GAMEMODE.Config.PocketBlacklist["zlm_tractor"] = true
    GAMEMODE.Config.PocketBlacklist["zlm_tractor_trailer"] = true
    GAMEMODE.Config.PocketBlacklist["zmlab_aluminium"] = true
    GAMEMODE.Config.PocketBlacklist["zmlab_combiner"] = true
    GAMEMODE.Config.PocketBlacklist["zmlab_filter"] = true
    GAMEMODE.Config.PocketBlacklist["zmlab_frezzer"] = true
    GAMEMODE.Config.PocketBlacklist["zmlab_methdropoff"] = true
    GAMEMODE.Config.PocketBlacklist["zmlab_methylamin"] = true
    GAMEMODE.Config.PocketBlacklist["zpiz_oven"] = true
    GAMEMODE.Config.PocketBlacklist["zrms_buyer"] = true
    GAMEMODE.Config.PocketBlacklist["zrms_melter"] = true
    GAMEMODE.Config.PocketBlacklist["zrms_mineentrance_base"] = true
    GAMEMODE.Config.PocketBlacklist["zrms_storagecrate"] = true
    GAMEMODE.Config.PocketBlacklist["zrush_drillpipe_holder"] = true
    GAMEMODE.Config.PocketBlacklist["zrush_fuelbuyer_npc"] = true
    GAMEMODE.Config.PocketBlacklist["zrush_machinecrate"] = true
    GAMEMODE.Config.PocketBlacklist["ztm_buyermachine"] = true
    GAMEMODE.Config.PocketBlacklist["ztm_leafpile"] = true
    GAMEMODE.Config.PocketBlacklist["ztm_manhole"] = true
    GAMEMODE.Config.PocketBlacklist["ztm_recycler"] = true
    GAMEMODE.Config.PocketBlacklist["ztm_trashburner"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_constructionkit_condenser"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_constructionkit_cooler"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_distillery"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_fermbarrel"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_fuel"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_motor"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_paperbag"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_sugar"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_water"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_yeast"] = true
    GAMEMODE.Config.PocketBlacklist["zyb_yeastgrinder"] = true
    GAMEMODE.Config.PocketBlacklist["vc_pickup_fuel_petrol"] = true
    GAMEMODE.Config.PocketBlacklist["vc_pickup_fuel_diesel"] = true
    GAMEMODE.Config.PocketBlacklist["zrms_mineentrance_base"] = true
  end
end)

