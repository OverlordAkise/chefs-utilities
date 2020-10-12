--Chef's Medic NPC
--Module of chefs-utilities
--Made by OverlordAkise

AddCSLuaFile()

ENT.Base = "base_ai"
ENT.Type = "ai"

ENT.PrintName= "Medic NPC"
ENT.Author= "OverlordAkise"
ENT.Contact= ""
ENT.Purpose= ""
ENT.Instructions= ""
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "DarkRP (NPCs)"

--Prices for healing
chef_medic_25 = 2500
chef_medic_50 = 5000
chef_medic_100 = 10000


if SERVER then
  util.AddNetworkString("chef_medic")
  net.Receive("chef_medic",function(len,ply)
    --local mednpc = net.ReadEntity()
    --if mednpc:GetPos():DistToSqr(ply:GetPos()) >= 500*500 then return end
    if ply:Health() >= ply:GetMaxHealth() then
      DarkRP.notify(ply,1,4,"You already have full HP!")
      return
    end
    local option = net.ReadInt(3)
    local hp_cost = 0
    local addHP = 0
    if option == 1 then
      hp_cost = chef_medic_25
      addHP = 25
    elseif option == 2 then
      hp_cost = chef_medic_50
      addHP = 50
    elseif option == 3 then
      hp_cost = chef_medic_100
      addHP = 100
    else
      print("ERROR: Player '"..ply:Nick().."' sent an invalid number via Chef's Medic NPC! Could be cheating!")
      return
    end
    if not ply:canAfford(hp_cost) then
      DarkRP.notify(ply,1,4,"You can't afford this!")
      return
    end
    ply:addMoney(-hp_cost)
    ply:SetHealth(math.min(ply:Health()+addHP,100))
  end)
end

function ENT:Initialize()
	if CLIENT then return end
  
	self:SetModel("models/Humans/Group03m/Female_02.mdl")
	--self:PhysicsInit(SOLID_VPHYSICS)     
	--self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetBloodColor(BLOOD_COLOR_RED)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
  
  local p = self:GetPos()
  self:SetPos(p)
  
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:Use( activator, caller )
	if ( activator:IsPlayer() ) then
		net.Start("chef_medic")
    net.Send(activator)
	end
end

if ( SERVER ) then return end

surface.CreateFont("ChefsFancyFont", {font = "Tahoma", size = 35, weight = 1000, blursize = 0, scanlines = 0})

function ENT:Draw()
  self:DrawModel()
  local p = self:GetPos()
  local dist = p:DistToSqr(LocalPlayer():GetPos())

  if (dist > 500*500) then return end
  p.z = p.z + 90
  local ang = self:GetAngles()
  ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
  ang:RotateAroundAxis(self:GetAngles():Up(), 90)
  --ang:RotateAroundAxis(LocalPlayer():GetAngles():Right(),90)
  
  cam.Start3D2D(p, Angle(0, LocalPlayer():EyeAngles().y - 90, 90), 0.4)
    local text = "Medic"
    surface.SetFont( "ChefsFancyFont" )
		local tW, tH = surface.GetTextSize( text )
    --surface.DrawRect( -tW / 2 - 5, -5, tW + 5 * 2, tH + 5 * 2 )
    draw.DrawText(text, "ChefsFancyFont", -tW/2, 0, Color( 255, 0, 0, 255 ),TEXT_ALIGN_LEFT)
  cam.End3D2D()
end

surface.CreateFont("Font", {font = "Arial",extended = false,size = 30,})

net.Receive("chef_medic",function()
  if IsValid(FoodPanel) then return end
  local faded_black = Color(0, 0, 0, 200)
  FoodPanel = vgui.Create("DFrame")
  FoodPanel:SetSize(500, 310)
  FoodPanel:Center()
  FoodPanel:SetTitle("")
  FoodPanel:SetDraggable(false)
  FoodPanel:ShowCloseButton(false)
  FoodPanel:MakePopup()
  FoodPanel.Paint = function(self, w, h)
    draw.RoundedBox(2, 0, 0, w, h, faded_black)
    draw.RoundedBox(0, 0, 0, w, 30, Color(0,0,0,240))
    draw.SimpleText("Medic - Buy Health", "Font", w/2, 15, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
  end
  
  local parent_x, parent_y = FoodPanel:GetSize()
  
  local CloseButton = vgui.Create( "DButton", FoodPanel )
  CloseButton:SetText( "X" )
  CloseButton:SetPos( parent_x-30, 0 )
  CloseButton:SetSize( 30, 30 )
  CloseButton.DoClick = function()
    FoodPanel:Close()
  end
  CloseButton.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(255,10,10,255))
  end
  
  local Buy25 = vgui.Create("DButton", FoodPanel)
  Buy25:SetText("")
  Buy25:SetPos(10,40)
  Buy25:SetSize(480,80)
  Buy25.DoClick = function()
    net.Start("chef_medic")
      net.WriteInt(1,3)
    net.SendToServer()
    FoodPanel:Close()
  end
  Buy25.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(255,255,255,230))
    draw.SimpleText("Buy 25 Health", "Font", 5, 0+h/2-13, Color(0,0,0,255), TEXT_ALIGN_LEFT)
    draw.SimpleText("$2500", "Font", w-5, 0+h/2-13, Color(0,0,0,255), TEXT_ALIGN_RIGHT)
  end
  
  local Buy50 = vgui.Create("DButton", FoodPanel)
  Buy50:SetText("")
  Buy50:SetPos(10,130)
  Buy50:SetSize(480,80)
  Buy50.DoClick = function()
    net.Start("chef_medic")
      net.WriteInt(2,3)
    net.SendToServer()
    FoodPanel:Close()
  end
  Buy50.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(255,255,255,230))
    
    draw.SimpleText("Buy 50 Health", "Font", 5, 0+h/2-13, Color(0,0,0,255), TEXT_ALIGN_LEFT)
    draw.SimpleText("$5000", "Font", w-5, 0+h/2-13, Color(0,0,0,255), TEXT_ALIGN_RIGHT)
  end
  
  local Buy100 = vgui.Create("DButton", FoodPanel)
  Buy100:SetText("")
  Buy100:SetPos(10,220)
  Buy100:SetSize(480,80)
  Buy100.DoClick = function()
    net.Start("chef_medic")
      net.WriteInt(3,3)
    net.SendToServer()
    FoodPanel:Close()
  end
  Buy100.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(255,255,255,230))
    draw.SimpleText("Buy 100 Health", "Font", 5, 0+h/2-13, Color(0,0,0,255), TEXT_ALIGN_LEFT)
    draw.SimpleText("$10000", "Font", w-5, 0+h/2-13, Color(0,0,0,255), TEXT_ALIGN_RIGHT)
  end
end)
