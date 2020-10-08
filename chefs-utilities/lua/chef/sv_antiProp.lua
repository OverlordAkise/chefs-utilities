--Chef's Prop-Protect
--Module of chefs-utilities
--Made by OverlordAkise and BoxolEcho

hook.Add("OnPhysgunPickup", "AP_Pickup", function(ply, ent)
  if (ent:GetClass() != "prop_physics") then return end
  local owner = ent:CPPIGetOwner() or ent.FPPOwner
  if ply ~= owner then return end
  --Keypads have collision, so no physgun for them
  if (ent:GetClass() == "keypad") then return false end
  ent.oldColor = ent:GetColor()
  ent.oldMat = ent:GetMaterial()
  ent:SetColor(Color(ent.oldColor.r, ent.oldColor.g, ent.oldColor.b, 100))
  ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
  ent:DrawShadow(false)
  --if IsValid(ent:GetPhysicsObject()) then ent:PhysicsDestroy() end
end)

local function AP_PropRestore(ent)
  ent:SetColor(Color(ent.oldColor.r, ent.oldColor.g, ent.oldColor.b, 255))
  ent:SetMaterial(ent.oldMat)
  ent:SetCollisionGroup(COLLISION_GROUP_NONE)
end

hook.Add("PhysgunDrop", "AP_Drop", function(ply, ent)
  ent:DrawShadow(false)
  timer.Simple(0,function()
    local pObj = ent:GetPhysicsObject()
    if IsValid(pObj) then
      pObj:EnableMotion(false)
      pObj:EnableGravity(false)
    end
  end)
end)

hook.Add("OnPhysgunReload","AP_Reload",function(physgun,ply) return false end)
hook.Add("OnPhysgunFreeze", "AP_Freeze", function(weap, physobj, ent ,ply)
  if (ent:GetClass() != "prop_physics") then return end
  local min = ent:LocalToWorld(ent:OBBMins())
  local max = ent:LocalToWorld(ent:OBBMaxs())
  local foundEnts = ents.FindInBox(min, max)
  ent:DrawShadow(false)
  physobj:EnableMotion(false)
  physobj:EnableGravity(false)
  --PrintTable(foundEnts)
  for k,v in pairs(foundEnts) do 
    if v:IsPlayer() or v:IsVehicle() or v:GetClass() == "predicted_viewmodel" then
      if engine.ActiveGamemode() == "darkrp" then
        DarkRP.notify(ply, NOTIFY_GENERIC, 5, "Can't freeze inside another object!")
      else
        ply:PrintMessage(HUD_PRINTTALK,"Can't freeze inside another object!")
      end
      ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
      return
    end
  end
  AP_PropRestore(ent)
end)

hook.Add("OnEntityCreated", "AP_PropSpawn", function(ent)
  if (ent:GetClass() != "prop_physics") then return end
  ent.oldColor = ent.oldColor or ent:GetColor()
  ent.oldMat = ent.oldMat or ent:GetMaterial()
  ent:SetColor(Color(ent.oldColor.r, ent.oldColor.b, ent.oldColor.b, 100))
  ent:SetMaterial(ent.oldMat)
  ent:DrawShadow(false)

  timer.Simple(0,function()
  local phys = ent:GetPhysicsObject()
    if IsValid(phys) then
      phys:EnableMotion(false)
      phys:EnableGravity(false)
      phys:Sleep()
    end
  end)
  ent:SetRenderMode(RENDERMODE_TRANSALPHA)
  ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
end)

--You can wake physic on props with the precision toolgun
--So we have to have this workaround for that
hook.Add("CanTool","AP_Precision",function(ply, tr, tool)
  if tool == "precision" then
    if tr.Entity ~= nil then
      --PrintMessage(HUD_PRINTTALK, "SLEEP!")
      timer.Simple(0,function()
        local phys = tr.Entity:GetPhysicsObject()
        if IsValid(phys) then
          phys:EnableMotion(false)
          phys:EnableGravity(false)
          phys:Sleep()
          tr.Entity:DrawShadow(false)
        end
      end)
    end
  end
end)

--Disables Prop Damage
hook.Add("EntityTakeDamage","AP_AntiPropDamage",function(ent, dmginfo)
  if ent:IsPlayer() then
    if (dmginfo:GetInflictor():GetClass() == "prop_physics" or dmginfo:GetDamageType() == DMG_CRUSH) then
      dmginfo:ScaleDamage(0)
    end
  end
  return dmginfo
end)