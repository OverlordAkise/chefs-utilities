--Chef's restrictDrop
--Module of chefs-utilities
--Made by OverlordAkise

hook.Add("PostGamemodeLoaded","chef_dontDrop",function()
  if DarkRP then
    GAMEMODE.Config.DisallowDrop["arrest_stick"] = true
    GAMEMODE.Config.DisallowDrop["car_bomb"] = true
    GAMEMODE.Config.DisallowDrop["defibrillator"] = true
    GAMEMODE.Config.DisallowDrop["door_ram"] = true
    GAMEMODE.Config.DisallowDrop["dradio"] = true
    GAMEMODE.Config.DisallowDrop["ffphone"] = true
    GAMEMODE.Config.DisallowDrop["fine_list"] = true
    GAMEMODE.Config.DisallowDrop["fire_axe"] = true
    GAMEMODE.Config.DisallowDrop["fire_hose"] = true
    GAMEMODE.Config.DisallowDrop["gas_log_scanner"] = true
    GAMEMODE.Config.DisallowDrop["gas_weapon_hands"] = true
    GAMEMODE.Config.DisallowDrop["glorifiedbanking_card"] = true
    GAMEMODE.Config.DisallowDrop["gmod_camera"] = true
    GAMEMODE.Config.DisallowDrop["gmod_tool"] = true
    GAMEMODE.Config.DisallowDrop["gsmartwatch"] = true
    GAMEMODE.Config.DisallowDrop["inventory"] = true
    GAMEMODE.Config.DisallowDrop["keys"] = true
    GAMEMODE.Config.DisallowDrop["lockpick"] = true
    GAMEMODE.Config.DisallowDrop["med_kit"] = true
    GAMEMODE.Config.DisallowDrop["pass_dea"] = true
    GAMEMODE.Config.DisallowDrop["pass_detectiv"] = true
    GAMEMODE.Config.DisallowDrop["pass_england"] = true
    GAMEMODE.Config.DisallowDrop["pass_fbi"] = true
    GAMEMODE.Config.DisallowDrop["pass_marshel"] = true
    GAMEMODE.Config.DisallowDrop["pass_rus"] = true
    GAMEMODE.Config.DisallowDrop["pass_usa"] = true
    GAMEMODE.Config.DisallowDrop["pickpocket"] = true
    GAMEMODE.Config.DisallowDrop["pocket"] = true
    GAMEMODE.Config.DisallowDrop["revival_medkit"] = true
    GAMEMODE.Config.DisallowDrop["sf_tool"] = true
    GAMEMODE.Config.DisallowDrop["sh_accessory_changer"] = true
    GAMEMODE.Config.DisallowDrop["speed_gun"] = true
    GAMEMODE.Config.DisallowDrop["sphone"] = true
    GAMEMODE.Config.DisallowDrop["stunstick"] = true
    GAMEMODE.Config.DisallowDrop["swep_drone_controller"] = true
    GAMEMODE.Config.DisallowDrop["tbfy_manager"] = true
    GAMEMODE.Config.DisallowDrop["unarrest_stick"] = true
    GAMEMODE.Config.DisallowDrop["vc_spikestrip_wep"] = true
    GAMEMODE.Config.DisallowDrop["vc_wrench"] = true
    GAMEMODE.Config.DisallowDrop["wcd_admin"] = true
    GAMEMODE.Config.DisallowDrop["wcd_speedchecker"] = true
    GAMEMODE.Config.DisallowDrop["weapon_adv_keys"] = true
    GAMEMODE.Config.DisallowDrop["weapon_bugbait"] = true
    GAMEMODE.Config.DisallowDrop["weaponchecker"] = true
    GAMEMODE.Config.DisallowDrop["weapon_fists"] = true
    GAMEMODE.Config.DisallowDrop["weapon_keypadchecker"] = true
    GAMEMODE.Config.DisallowDrop["weapon_medkit"] = true
    GAMEMODE.Config.DisallowDrop["weapon_physcannon"] = true
    GAMEMODE.Config.DisallowDrop["weapon_physgun"] = true
    GAMEMODE.Config.DisallowDrop["weapon_r_handcuffs"] = true
    GAMEMODE.Config.DisallowDrop["weapon_rpt_cuffed"] = true
    GAMEMODE.Config.DisallowDrop["weapon_rpt_finebook"] = true
    GAMEMODE.Config.DisallowDrop["weapon_rpt_handcuff"] = true
    GAMEMODE.Config.DisallowDrop["weapon_rpt_stungun"] = true
    GAMEMODE.Config.DisallowDrop["weapon_rpt_wrench"] = true
    GAMEMODE.Config.DisallowDrop["weapon_vape_american"] = true
    GAMEMODE.Config.DisallowDrop["weapon_vape_butterfly"] = true
    GAMEMODE.Config.DisallowDrop["weapon_vape_golden"] = true
    GAMEMODE.Config.DisallowDrop["weapon_vape_hallucinogenic"] = true
    GAMEMODE.Config.DisallowDrop["weapon_vape_juicy"] = true
    GAMEMODE.Config.DisallowDrop["weapon_vape"] = true
    GAMEMODE.Config.DisallowDrop["zfs_knife"] = true
    GAMEMODE.Config.DisallowDrop["zld_constructor"] = true
    GAMEMODE.Config.DisallowDrop["zmlab_extractor"] = true
    GAMEMODE.Config.DisallowDrop["zpc_pyrolinker"] = true
    GAMEMODE.Config.DisallowDrop["zpf_constructor"] = true
    GAMEMODE.Config.DisallowDrop["zrms_builder"] = true
    GAMEMODE.Config.DisallowDrop["zrms_pickaxe"] = true
    GAMEMODE.Config.DisallowDrop["ztm_trashcollector"] = true
    GAMEMODE.Config.DisallowDrop["zwf_cable"] = true
    GAMEMODE.Config.DisallowDrop["zwf_shoptablet"] = true
    GAMEMODE.Config.DisallowDrop["zwf_sniffer"] = true
    GAMEMODE.Config.DisallowDrop["zwf_wateringcan"] = true
  end
end)