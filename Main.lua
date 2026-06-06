local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren())do if v.Name=="DH"or v.Name=="MH"then v:Destroy()end end

local lang="EN"
local T={EN={farm="FARM",set="SETTINGS",news="NEWS",h="START HAMMER",ho="HAMMER ACTIVE",a="AUTO FARM",ao="AUTO ACTIVE",car="Looking for car...",sit="Sit in a car!",resp="Respawning...",des="Destroyed!",th="Theme: ",lb="EN->RU"},RU={farm="ФАРМ",set="НАСТРОЙКИ",news="НОВОЕ",h="МОЛОТ",ho="МОЛОТ ON",a="АВТО-ФАРМ",ao="АВТО ON",car="Ищу машину...",sit="Сядьте!",resp="Респавн...",des="Убита!",th="Тема: ",lb="RU->EN"}}

local C={btn=Color3.fromRGB(45,45,45),w=Color3.new(1,1,1),gr=Color3.fromRGB(0,255,150),r=Color3.fromRGB(255,55,55),p=Color3.fromRGB(150,90,255),gold=Color3.fromRGB(255,215,0)}
local th={{n="Standard",m=Color3.fromRGB(20,20,20),s=Color3.fromRGB(28,28,28)},{n="Red",m=Color3.fromRGB(40,10,10),s=Color3.fromRGB(48,15,15)},{n="Orange",m=Color3.fromRGB(40,20,5),s=Color3.fromRGB(48,28,10)},{n="Gold",m=Color3.fromRGB(35,28,5),s=Color3.fromRGB(43,35,10)},{n="Lime",m=Color3.fromRGB(15,35,8),s=Color3.fromRGB(20,43,12)},{n="Green",m=Color3.fromRGB(8,35,12),s=Color3.fromRGB(12,43,18)},{n="Cyan",m=Color3.fromRGB(8,28,40),s=Color3.fromRGB(12,35,48)},{n="Blue",m=Color3.fromRGB(8,12,40),s=Color3.fromRGB(12,18,48)},{n="Violet",m=Color3.fromRGB(25,8,40),s=Color3.fromRGB(33,12,48)},{n="Pink",m=Color3.fromRGB(40,8,25),s=Color3.fromRGB(48,12,32)}}
local ti=1
local to={0,0.15,0.25,0.30,0.50,0.60,0.75,0.90}
local tn={"0%","15%","25%","30%","50%","60%","75%","90%"}
local ti2=3
local tv=to[ti2]

local sg=Instance.new("ScreenGui",g)sg.Name="DH"
local mini=Instance.new("Frame",sg)mini.Name="MH"mini.Size=UDim2.new(0,150,0,30)mini.Position=UDim2.new(0.02,0,0.1,0)mini.BackgroundColor3=th[ti].s mini.BackgroundTransparency=tv mini.BorderSizePixel=0 mini.Visible=false mini.Active=true mini.Draggable=true
Instance.new("UICorner",mini).CornerRadius=UDim.new(0,6)
local rBtn=Instance.new("TextButton",mini)rBtn.Size=UDim2.new(1,0,1,0)rBtn.BackgroundTransparency=1 rBtn.Text="DAMIR HUB"rBtn.TextColor3=C.w rBtn.Font=Enum.Font.GothamBold rBtn.TextSize=12

local m=Instance.new("Frame",sg)m.Size=UDim2.new(0,500,0,310)m.Position=UDim2.new(0.5,-250,0.5,-155)m.BackgroundColor3=th[ti].m m.BackgroundTransparency=tv m.BorderSizePixel=0 m.Active=true m.Draggable=true
Instance.new("UICorner",m).CornerRadius=UDim.new(0,8)
local hdr=Instance.new("Frame",m)hdr.Size=UDim2.new(1,0,0,30)hdr.BackgroundColor3=th[ti].s hdr.BackgroundTransparency=tv hdr.BorderSizePixel=0
Instance.new("UICorner",hdr).CornerRadius=UDim.new(0,8)
local ht=Instance.new("TextLabel",hdr)ht.Size=UDim2.new(1,-60,1,0)ht.Position=UDim2.new(0,12,0,0)ht.BackgroundTransparency=1 ht.Text="DAMIR HUB v9.9"ht.TextColor3=C.w ht.Font=Enum.Font.GothamBold ht.TextSize=13
local minB=Instance.new("TextButton",hdr)minB.Size=UDim2.new(0,22,0,22)minB.Position=UDim2.new(1,-50,0,4)minB.BackgroundColor3=C.p minB.Text="—"minB.TextColor3=C.w minB.Font=Enum.Font.GothamBold minB.TextSize=14 minB.BorderSizePixel=0
Instance.new("UICorner",minB).CornerRadius=UDim.new(0,11)
local clB=Instance.new("TextButton",hdr)clB.Size=UDim2.new(0,22,0,22)clB.Position=UDim2.new(1,-25,0,4)clB.BackgroundColor3=C.r clB.Text="✕"clB.TextColor3=C.w clB.Font=Enum.Font.GothamBold clB.TextSize=12 clB.BorderSizePixel=0
Instance.new("UICorner",clB).CornerRadius=UDim.new(0,11)
minB.MouseButton1Click:Connect(function()m.Visible=false mini.Visible=true end)
rBtn.MouseButton1Click:Connect(function()m.Visible=true mini.Visible=false end)
clB.MouseButton1Click:Connect(function()sg:Destroy()end)

local s=Instance.new("Frame",m)s.Size=UDim2.new(0,140,1,-30)s.Position=UDim2.new(0,0,0,30)s.BackgroundColor3=th[ti].s s.BackgroundTransparency=tv s.BorderSizePixel=0
local logo=Instance.new("TextLabel",s)logo.Size=UDim2.new(1,0,0,40)logo.BackgroundTransparency=1 logo.Text="DAMIR HUB"logo.TextColor3=C.w logo.Font=Enum.Font.GothamBold logo.TextSize=14

local cn=Instance.new("Frame",m)cn.Size=UDim2.new(1,-140,1,-30)cn.Position=UDim2.new(0,140,0,30)cn.BackgroundTransparency=1

local pgs={}
local bts={}
local function at(y)
 local bt=Instance.new("TextButton",s)bt.Size=UDim2.new(1,-20,0,36)bt.Position=UDim2.new(0,10,0,y)bt.BackgroundColor3=Color3.fromRGB(40,40,40)bt.Font=Enum.Font.GothamBold bt.TextSize=12 bt.BorderSizePixel=0
 Instance.new("UICorner",bt).CornerRadius=UDim.new(0,5)
 local pg=Instance.new("Frame",cn)pg.Size=UDim2.new(1,-20,1,-20)pg.Position=UDim2.new(0,10,0,10)pg.BackgroundTransparency=1 pg.Visible=false
 bt.MouseButton1Click:Connect(function()for _,b in pairs(bts)do b.BackgroundColor3=Color3.fromRGB(40,40,40)end for _,p in pairs(pgs)do p.Visible=false end bt.BackgroundColor3=Color3.fromRGB(70,70,90)pg.Visible=true end)
 table.insert(bts,bt)table.insert(pgs,pg)return bt,pg
end
local fbt,fpg=at(50)local sbt,spg=at(92)local lbt,lpg=at(134)
bts[1].BackgroundColor3=Color3.fromRGB(70,70,90)pgs[1].Visible=true

local function ul()
 local L=T[lang]
 fbt.Text=L.farm sbt.Text=L.set lbt.Text=L.news
 hb.Text=ho and L.ho or L.h ab.Text=ao and L.ao or L.a
 hi.Text=(lang=="EN")and"If broken - rejoin"or"Сломалось - перезайди"
 tt.Text=L.th..th[ti].name lb.Text=L.lb
end

-- SPAWN
local function fs()
 local pg=p:WaitForChild("PlayerGui")
 for _,g in pairs(pg:GetChildren())do if g:IsA("ScreenGui")then for _,o in pairs(g:GetDescendants())do if(o:IsA("TextButton")or o:IsA("ImageButton"))and o.Visible and o.Active then
  local t=o:IsA("TextButton")and o.Text or""
  if o.Name:lower():find("spawn")or t:lower():find("spawn")or t:lower():find("car")or t:lower():find("free")then if not t:lower():find("vip")then return o end end
 end end end end return nil
end
local function cs()
 local b=fs()if not b then return false end
 if firesignal and b.MouseButton1Click then pcall(function()firesignal(b.MouseButton1Click)end)end
 pcall(function()local v=game:GetService("VirtualInputManager")local pos=b.AbsolutePosition+b.AbsoluteSize/2 pos=Vector2.new(pos.X+45,pos.Y+40)v:SendMouseButtonEvent(pos.X,pos.Y,0,true,game,1)wait(0.05)v:SendMouseButtonEvent(pos.X,pos.Y,0,false,game,1)end)return true
end

-- FARM
local ft=Instance.new("TextLabel",fpg)ft.Size=UDim2.new(1,0,0,18)ft.BackgroundTransparency=1 ft.Text="MOLOT v9.9"ft.TextColor3=C.w ft.Font=Enum.Font.GothamBold ft.TextSize=12
local cb=Instance.new("Frame",fpg)cb.Size=UDim2.new(1,0,0,30)cb.Position=UDim2.new(0,0,0,22)cb.BackgroundColor3=Color3.fromRGB(35,35,35)Instance.new("UICorner",cb).CornerRadius=UDim.new(0,4)
local cl=Instance.new("TextLabel",cb)cl.Size=UDim2.new(1,-14,1,0)cl.Position=UDim2.new(0,7,0,0)cl.BackgroundTransparency=1 cl.Text=T[lang].car cl.TextColor3=C.w cl.Font=Enum.Font.GothamBold cl.TextSize=11
local sl=Instance.new("TextLabel",fpg)sl.Size=UDim2.new(1,0,0,16)sl.Position=UDim2.new(0,0,0,56)sl.BackgroundTransparency=1 sl.Text="Hits: 0 | Broken: 0 | Auto: 0"sl.TextColor3=C.w sl.Font=Enum.Font.Gotham sl.TextSize=10

local function gc()
 local c=p.Character if not c then return nil end
 local h=c:FindFirstChildOfClass("Humanoid")if not h or not h.SeatPart then return nil end
 local cur=h.SeatPart
 while cur do
  if cur:IsA("Model")then
   if cur.Parent and cur.Parent.Name=="Vehicles"then return cur end
   if cur.Name~="Body"and cur.Name~="Engine"then return cur end
  end
  cur=cur.Parent
 end
 return nil
end

local ho,ao,hh,br,cy=false,false,0,0,0
local function sm()
 local c=gc()if not c then return false end
 local r=c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart")if not r then return false end
 r.Velocity=Vector3.zero r.CFrame=CFrame.new(r.Position.X,200,r.Position.Z)wait(0.15)r.Velocity=Vector3.new(0,-1500,0)wait(1.0)
 if not c.Parent then br=br+1 return true end return false
end

local hb=Instance.new("TextButton",fpg)hb.Size=UDim2.new(1,0,0,36)hb.Position=UDim2.new(0,0,0,78)hb.BackgroundColor3=C.btn hb.Font=Enum.Font.GothamBold hb.TextSize=12 hb.BorderSizePixel=0 hb.Text=T[lang].h hb.TextColor3=C.r
Instance.new("UICorner",hb).CornerRadius=UDim.new(0,5)Instance.new("UIStroke",hb).Thickness=1.5 Instance.new("UIStroke",hb).Color=Color3.fromRGB(0,0,0)
local ab=Instance.new("TextButton",fpg)ab.Size=UDim2.new(1,0,0,36)ab.Position=UDim2.new(0,0,0,122)ab.BackgroundColor3=C.btn ab.Font=Enum.Font.GothamBold ab.TextSize=12 ab.BorderSizePixel=0 ab.Text=T[lang].a ab.TextColor3=C.w
Instance.new("UICorner",ab).CornerRadius=UDim.new(0,5)Instance.new("UIStroke",ab).Thickness=1.5 Instance.new("UIStroke",ab).Color=Color3.fromRGB(0,0,0)
local hi=Instance.new("TextLabel",fpg)hi.Size=UDim2.new(1,0,0,14)hi.Position=UDim2.new(0,0,0,162)hi.BackgroundTransparency=1 hi.Text=(lang=="EN")and"If broken - rejoin"or"Сломалось - перезайди"hi.TextColor3=C.w hi.Font=Enum.Font.Gotham hi.TextSize=9

hb.MouseButton1Click:Connect(function()
 ho=not ho
 if ho then if ao then ao=false ab.Text=T[lang].a ab.TextColor3=C.w ab.BackgroundColor3=C.btn end hb.Text=T[lang].ho hb.TextColor3=C.gr hb.BackgroundColor3=Color3.fromRGB(18,38,24)
  coroutine.wrap(function()while ho do sm()hh=hh+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy wait(0.3)end end)()
 else hb.Text=T[lang].h hb.TextColor3=C.r hb.BackgroundColor3=C.btn end
end)
ab.MouseButton1Click:Connect(function()
 ao=not ao
 if ao then if ho then ho=false hb.Text=T[lang].h hb.TextColor3=C.r hb.BackgroundColor3=C.btn end ab.Text=T[lang].ao ab.TextColor3=C.gr ab.BackgroundColor3=Color3.fromRGB(40,25,10)
  coroutine.wrap(function()while ao do local c=gc()
   if not c then cl.Text=T[lang].resp cs()wait(3)
   else local d=false for i=1,20 do if not ao then break end d=sm()hh=hh+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy if d then break end wait(0.2)end
    if d then cy=cy+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy cl.Text=T[lang].des wait(1)cl.Text=T[lang].resp cs()wait(3)end
   end
  end end)()
 else ab.Text=T[lang].a ab.TextColor3=C.w ab.BackgroundColor3=C.btn end
end)

-- SETTINGS
local lb=Instance.new("TextButton",spg)lb.Size=UDim2.new(1,0,0,26)lb.Position=UDim2.new(0,0,0,5)lb.BackgroundColor3=C.btn lb.Font=Enum.Font.GothamBold lb.TextSize=11 lb.BorderSizePixel=0 lb.Text=T[lang].lb lb.TextColor3=C.w
Instance.new("UICorner",lb).CornerRadius=UDim.new(0,4)Instance.new("UIStroke",lb).Thickness=1.5 Instance.new("UIStroke",lb).Color=Color3.fromRGB(0,0,0)
lb.MouseButton1Click:Connect(function()lang=(lang=="EN")and"RU"or"EN"ul()end)
local tt=Instance.new("TextLabel",spg)tt.Size=UDim2.new(1,0,0,16)tt.Position=UDim2.new(0,0,0,40)tt.BackgroundTransparency=1 tt.Text=T[lang].th..th[ti].name tt.TextColor3=C.w tt.Font=Enum.Font.GothamBold tt.TextSize=11
local tb=Instance.new("TextButton",spg)tb.Size=UDim2.new(1,0,0,26)tb.Position=UDim2.new(0,0,0,58)tb.BackgroundColor3=C.btn tb.Font=Enum.Font.GothamBold tb.TextSize=11 tb.BorderSizePixel=0 tb.Text="CHANGE"tb.TextColor3=C.w
Instance.new("UICorner",tb).CornerRadius=UDim.new(0,4)Instance.new("UIStroke",tb).Thickness=1.5 Instance.new("UIStroke",tb).Color=Color3.fromRGB(0,0,0)
tb.MouseButton1Click:Connect(function()ti=ti%#th+1 m.BackgroundColor3=th[ti].m s.BackgroundColor3=th[ti].s hdr.BackgroundColor3=th[ti].s mini.BackgroundColor3=th[ti].s tt.Text=T[lang].th..th[ti].name end)
local tl=Instance.new("TextLabel",spg)tl.Size=UDim2.new(1,0,0,16)tl.Position=UDim2.new(0,0,0,95)tl.BackgroundTransparency=1 tl.Text="Transparency: 25%"tl.TextColor3=C.w tl.Font=Enum.Font.GothamBold tl.TextSize=11
local trBtn=Instance.new("TextButton",spg)trBtn.Size=UDim2.new(1,0,0,26)trBtn.Position=UDim2.new(0,0,0,113)trBtn.BackgroundColor3=C.btn trBtn.Font=Enum.Font.GothamBold trBtn.TextSize=11 trBtn.BorderSizePixel=0 trBtn.Text="25%"trBtn.TextColor3=C.w
Instance.new("UICorner",trBtn).CornerRadius=UDim.new(0,4)Instance.new("UIStroke",trBtn).Thickness=1.5 Instance.new("UIStroke",trBtn).Color=Color3.fromRGB(0,0,0)
trBtn.MouseButton1Click:Connect(function()ti2=ti2%#to+1 tv=to[ti2]m.BackgroundTransparency=tv s.BackgroundTransparency=tv hdr.BackgroundTransparency=tv mini.BackgroundTransparency=tv trBtn.Text=tn[ti2]tl.Text="Transparency: "..tn[ti2]end)

-- NEWS
local lgt=Instance.new("TextLabel",lpg)lgt.Size=UDim2.new(1,0,0,18)lgt.BackgroundTransparency=1 lgt.Text="WHATS NEW"lgt.TextColor3=C.w lgt.Font=Enum.Font.GothamBold lgt.TextSize=12
local lgc=Instance.new("TextLabel",lpg)lgc.Size=UDim2.new(1,0,0,220)lgc.Position=UDim2.new(0,0,0,22)lgc.BackgroundColor3=Color3.fromRGB(35,35,35)lgc.TextColor3=C.w lgc.Font=Enum.Font.Gotham lgc.TextSize=10 lgc.TextXAlignment=Enum.TextXAlignment.Left lgc.TextYAlignment=Enum.TextYAlignment.Top Instance.new("UICorner",lgc).CornerRadius=UDim.new(0,5)
lgc.Text=[[v9.9 - Clean:
+ Removed secret button
+ 25% default transparency
+ Language switch works
+ 10 themes
+ Minimize & close
+ Molot 200/-1500
+ Auto farm + respawn]]

ul()
game.StarterGui:SetCore("SendNotification",{Title="DAMIR HUB",Text="v9.9 loaded!",Duration=3})
