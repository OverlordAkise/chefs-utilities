--Chef's Medic NPC
--Module of chefs-utilities
--Made by OverlordAkise

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Food Cabinet"
ENT.Author= "OverlordAkise"
ENT.Contact= ""
ENT.Purpose= ""
ENT.Instructions= ""
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "DarkRP (NPCs)"

chef_food_cost = 1000
chef_rotate_text = "Food"
chef_title = "Buy food"
chef_top_text = "Do you want to spend"
chef_bot_text = "to fill your hunger?"
chef_buy_text = "Buy"


if SERVER then
  util.AddNetworkString("chef_food")
  net.Receive("chef_food",function(len,ply)
    if not ply:canAfford(chef_food_cost) then
      DarkRP.notify(ply,1,4,"You can't afford this!")
      return
    end
    ply:addMoney(-chef_food_cost)
    ply:setSelfDarkRPVar("Energy", 100)
  end)
end

function ENT:Initialize()
	if CLIENT then return end
  
	self:SetModel( "models/props_interiors/VendingMachineSoda01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )     
	self:SetMoveType( MOVETYPE_VPHYSICS )  
	self:SetSolid( SOLID_VPHYSICS )
  
  local p = self:GetPos()
  p.z = p.z + 55
  self:SetPos(p)
  
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:Use( activator, caller )

	if ( activator:IsPlayer() ) then

		net.Start("chef_food")
    net.Send(activator)

	end

end

if ( SERVER ) then return end

function ENT:Draw()
  self:DrawModel()
  local p = self:GetPos()
  p.z = p.z + 75
  p.x = p.x - 10
  local ang = self:GetAngles()
  ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
  ang:RotateAroundAxis(self:GetAngles():Up(), 90)
  ang.y = ang.y + math.cos( CurTime())*100--(CurTime()*50) % 365
  --p = p  + Vector( 0, 0, math.cos( CurTime() / 2 ) + 20 )
  cam.Start3D2D(p, ang, 0.4)
    local text = chef_rotate_text
    surface.SetFont( "DermaLarge" )
    surface.SetDrawColor( 0, 0, 0 )
		local tW, tH = surface.GetTextSize( text )
    surface.DrawRect( -tW / 2 - 5, -5, tW + 5 * 2, tH + 5 * 2 )
    draw.DrawText(text, "DermaLarge", -tW/2, 0, Color( 255, 0, 0, 255 ),TEXT_ALIGN_LEFT)
  cam.End3D2D()
end

surface.CreateFont("Font", {font = "Arial",extended = false,size = 30,})

net.Receive("chef_food",function()
  if IsValid(FoodPanel) then return end
  local faded_black = Color(0, 0, 0, 200)
  FoodPanel = vgui.Create("DFrame")
  FoodPanel:SetSize(500, 300)
  FoodPanel:Center()
  FoodPanel:SetTitle("")
  FoodPanel:SetDraggable(false)
  FoodPanel:ShowCloseButton(false)
  FoodPanel:MakePopup()
  FoodPanel.Paint = function(self, w, h)
    draw.RoundedBox(2, 0, 0, w, h, faded_black)
    draw.RoundedBox(0, 0, 0, w, 30, Color(0,0,0,150))
    draw.SimpleText(chef_title, "Font", w/2, 15, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText(chef_top_text, "Font", w/2, h/2 - 90, color_white, TEXT_ALIGN_CENTER)
    draw.SimpleText(chef_food_cost, "Font", w/2, h/2 - 60, color_white, TEXT_ALIGN_CENTER)
    draw.SimpleText(chef_bot_text, "Font", w/2, h/2 - 30, color_white, TEXT_ALIGN_CENTER)
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
  
  local BuyButton = vgui.Create("DButton", FoodPanel)
  BuyButton:SetText("")
  BuyButton:SetPos(parent_x/2-30,parent_y/2 + 50)
  BuyButton:SetSize(60,25)
  BuyButton.DoClick = function()
    net.Start("chef_food")
    net.SendToServer()
    FoodPanel:Close()
  end
  BuyButton.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(255,255,255,255))
    draw.SimpleText(chef_buy_text, "DefaultLarge", 0+w/2, 0+h/2-9, Color(0,0,0,255), TEXT_ALIGN_CENTER)
  end
end)
