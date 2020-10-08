--Chef's Chat Commands
--Module of chefs-utilities
--Made by OverlordAkise

hook.Add("OnPlayerChat", "chef_ChatCommands", function(ply, text)
	if chef.chat.commands[string.lower(text)] ~= nil then
    gui.OpenURL(chef.chat.commands[string.lower(text)])
    if not chef.chat.showCommand then return true end
	end
end)