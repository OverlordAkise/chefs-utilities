--Chef's a n t i c h e a t
--Module of chefs-utilities
--Made by OverlordAkise
local netstart = netstart or net.Start
local writestring = writestring or net.WriteString
local netsendserver = netsendserver or net.SendToServer
local cvarstring = cvarstring or GetConVarString
local loop = loop or pairs
local oldMsgC = oldMsgC or MsgC
local oldMsg = oldMsg or Msg
local oldvguiCreate = oldvguiCreate or vgui.Create
local hookadd = hookadd or hook.Add
local timercreate = timercreate or timer.Create
local stringchar = stringchar or string.char
local mathrandom = mathrandom or math.random
local jitattach = jitattach or jit.attach
local funcinfo = funcinfo or jit.util.funcinfo
local stringsub = stringsub or string.sub
local netreceive = netreceive or net.Receive
local concommandadd = concommandadd or concommand.Add

--Troll
_G.CAC = true
_G.GAC = true



MsgC = function(...)
  local args = { ... }
  for k,v in pairs(args) do
    checkThat(v, "MsgC")
  end
  oldMsgC(...)
end

vgui.Create = function(...)
  local cPanel = oldvguiCreate(...)
  if not IsValid(cPanel) then return end
  timer.Simple(0,function()
    if not IsValid(cPanel) then return end
    local o=isfunction(cPanel.GetTitle) and cPanel:GetTitle() or ""
    checkThat(o,"vguiCreate")
    if cPanel.ExploitCount then 
      checkThat("ExploitCount","vguiCreate")
    end 
  end)
  return cPanel
end

function hook.Add(event,name,func)
  checkThat(name,"hookAdd")
  hookadd(event,name,func)
end

function concommand.Add(name,callback,autoComplete,helpText,flags)
  checkThat(name,"concommandAdd")
  concommandadd(name,callback,autoComplete,helpText,flags)
end

function checkThat(name,src)
  --print("Source: "..src)
  
  if type(name) != "string" then
    return
  end
  --print("Name: "..name)
  name = string.lower(name)
  if string.find(name,"aimbot") then
    bestrafe(src.." / "..name)
  end
  if src == "hookAdd" then
    if string.find(name,"esp") then
      bestrafe(src.." / "..name)
    end
  end
  if src == "hookAdd" or src == "concommandAdd" then
    if string.find(name,"cham") then
      bestrafe(src.." / "..name)
    end
  end
  if string.find(name,"wallhack") then
    bestrafe(src.." / "..name)
  end
  if string.find(name,"exploit") then
    bestrafe(src.." / "..name)
  end
  if string.find(name,"loki") then
    bestrafe(src.." / "..name)
  end
  if string.find(name,"bhop") then
    bestrafe(src.." / "..name)
  end
  if string.find(name,"spiritwalk") then
    bestrafe(src.." / "..name)
  end
  if string.find(name,"lowkey") then
    bestrafe(src.." / "..name)
  end

end

function bestrafe(text)
  net.Start("chef_bestrafe")
  net.WriteString(text)
  net.SendToServer()
end



local callbacks = {}
local callbackv = {}
local function ConVarCallback( name, func )
  callbacks[name] = func
end

local function DetectConVarChange()
  for k, v in loop(callbacks) do
    local s = cvarstring(k)
    if not callbackv[k] then
      callbackv[k] = s
      continue
    else
      local ov = callbackv[k]
      if ov != s then
        v( k, ov, s )
        callbackv[k] = s
      end
    end
  end
end
timer.Create(""..math.random().."",0.1,0,DetectConVarChange)

local function VerifyInfo(name, val)
  if not name or not val then return end
  netstart("chef_change")
  writestring(name)
  writestring(val)
  netsendserver()
end
  
ConVarCallback("sv_cheats", function(convar_name, value_old, value_new) VerifyInfo(convar_name,value_new) end)
ConVarCallback("sv_allowcslua", function(convar_name, value_old, value_new) VerifyInfo(convar_name,value_new) end)
ConVarCallback("vcollide_wireframe", function(convar_name, value_old, value_new) VerifyInfo(convar_name,value_new) end)