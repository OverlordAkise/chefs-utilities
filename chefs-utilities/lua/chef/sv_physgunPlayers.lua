--Chef's PhysgunPlayers
--Module of chefs-utilities
--Made by OverlordAkise

hook.Add("PhysgunPickup", "chef_PickUpPlayers", function(ply, ent)
  if IsValid(ent) and ent:IsPlayer() then
    if chef.groups[ply:GetUserGroup()] ~= nil then
      if ulx then
        if ent.frozen then
          ulx.freeze(ply,{ent},true)
        end
      end
      ent:SetMoveType(MOVETYPE_NONE)
      ent:Freeze(true)
      return true
    end
  end
end)

hook.Add("PhysgunDrop", "chef_PickUpPlayers", function(ply, ent)
  if IsValid(ent) and ent:IsPlayer() then
      ent:SetMoveType(MOVETYPE_WALK)
      ent:Freeze(false)
  end
  if ulx then
    if ply:KeyDown(IN_ATTACK2) and IsValid(ent) and ent:IsPlayer() and chef.groups[ply:GetUserGroup()] ~= nil then
      ulx.freeze(ply,{ent},false)
    end
  end
end)