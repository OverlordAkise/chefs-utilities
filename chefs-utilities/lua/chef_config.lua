--_______
--| | | |
--| | | |
--|     |
--|-----|
--|_____|

--Chef's Utilities
--Made by OverlordAkise

--A collection of DarkRP Utilities
--that helps servers quickly get up and running
--without spending any money (It's free!)
--Source: https://github.com/OverlordAkise/chefs-utilities

------------
-- CONFIG --
------------
chef = chef or {}
chef.load = {}

--Allowed Groups that can bypass most restrictions
--Please add all your teammember groups here
chef.groups = {}
chef.groups["superadmin"] = true
chef.groups["admin"] = true
chef.groups["operator"] = true
chef.groups["moderator"] = true


--Anticheat with Anti-Net-Spam
--Catches exploit-menus, aimbot, etc.
chef.load.cac = true

--A new black chatbox which has more features
chef.load.chatBox = true
chef.chatTags = {
  ["superadmin"] = "[Superadmin]",
  ["admin"] = "[Admin]",
}
chef.chatColors = {
  ["superadmin"] = Color(255,0,0,255),
  ["admin"] = Color(220,20,60,255),
}


--Very minimalistic anti-prop-griefing
chef.load.antiProp = true

--make /afk not abuseable with a 5s timer
--Please also enable the afk module in disabledDefaults.lua
chef.load.betterAFK = false

--Pocket Blacklist extended, don't drop pocket contents on death
chef.load.betterPocket = true
--Save Pocket if you disconnect, acts like an inventory
--(Can be buggy with specific entities)
chef.load.keepPocket = true

--Announcement for connect,disconnect,joining players
chef.load.announce = true

--Should we load the Advert chat feature
chef.load.advert = true
chef.advertTag = "(AD)"

--Slow people down if they bhop too fast
chef.load.bhopSlow = true
chef.bhoplimit = 300
chef.bhopslow = 100

--A hand-picked prop blacklist with 1000+ Props!
chef.load.restrictPropList = true

--Should you be able to drop job weapons like the weed tablet
chef.load.restrictDrop = true

--Disable the Context Menu (when you hold C)
chef.load.contextMenu = true

--Automatically disable spawning of ragdolls, dynamite, etc.
chef.load.maxSettings = true

--Load FPS boost config (no window, is enabled automatically)
chef.load.fpsBoost = true

--Disable bad toolguns like Zero's Orespawner and Dynamite
chef.load.restrictToolgun = true

--Only show Proplist on SpawnMenu
chef.load.restrictSpawnMenu = true

--On first join upons a menu that forces you to change your name
chef.load.forceNameChange = true

--Disable car pickup by users
chef.load.restrictCarPickup = true

--Can teammembers lift up players
--Also enables team to freeze players with physgun
chef.load.physgunPlayers = true

--Should teammembers (in chef.groups) be allowed to spawn weapons
chef.load.moderatorWeapons = true

--Stop players from commiting suicide via console 'kill'
chef.load.stopSuicide = true

--Load custom chat commands
chef.load.chatCommands = true
--Should the command (ex. !forum) be shown in chat?
chef.chat = {}
chef.chat.showCommand = false
--Chat Commands here
chef.chat.commands = {
  ["!workshop"] = "https://steamcommunity.com/sharedfiles/filedetails/?id=1738522917",
  ["!forum"] = "https://www.mistforums.com/",
}

