--Chef's Max-Safety-Settings
--Module of chefs-utilities
--Made by OverlordAkise

-- Set max. emitters, dynamite, etc.
RunConsoleCommand("sbox_maxballoons","0")
RunConsoleCommand("sbox_maxcameras","0")
RunConsoleCommand("sbox_maxdynamite","0")
RunConsoleCommand("sbox_maxeffects","0")
RunConsoleCommand("sbox_maxemitters","0")
RunConsoleCommand("sbox_maxhoverballs","0")
RunConsoleCommand("sbox_maxlamps","0")
RunConsoleCommand("sbox_maxnpcs","0")
RunConsoleCommand("sbox_maxragdolls","0")
RunConsoleCommand("sbox_maxsents","0")
RunConsoleCommand("sbox_maxthrusters","0")
RunConsoleCommand("sbox_maxvehicles","0")
RunConsoleCommand("sbox_maxwheels","0")
--For safety, if another addon overrides the previous change
timer.Simple(30,function()
  RunConsoleCommand("sbox_maxballoons","0")
  RunConsoleCommand("sbox_maxcameras","0")
  RunConsoleCommand("sbox_maxdynamite","0")
  RunConsoleCommand("sbox_maxeffects","0")
  RunConsoleCommand("sbox_maxemitters","0")
  RunConsoleCommand("sbox_maxhoverballs","0")
  RunConsoleCommand("sbox_maxlamps","0")
  RunConsoleCommand("sbox_maxnpcs","0")
  RunConsoleCommand("sbox_maxragdolls","0")
  RunConsoleCommand("sbox_maxsents","0")
  RunConsoleCommand("sbox_maxthrusters","0")
  RunConsoleCommand("sbox_maxvehicles","0")
  RunConsoleCommand("sbox_maxwheels","0")
end)