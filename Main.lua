local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren()) do if v.Name=="DH" or v.Name=="MiniHub" then v:Destroy() end end

local C={btn=Color3.fromRGB(45,45,45),w=Color3.new(1,1,1),g=Color3.fromRGB(160,160,160),gr=Color3.fromRGB(0,255,150),r=Color3.fromRGB(255,55,55),b=Color3.fromRGB(0,200,255),p=Color3.fromRGB(150,90,255)}
local th={{n="Standard",m=Color3.fromRGB(20,20,20),s=Color3.fromRGB(28,28,28)},{n="Red",m=Color3.fromRGB(40,10,10),s=Color3.fromRGB(48,15,15)},{n="Orange",m=Color3.fromRGB(40,20,5),s=Color3.fromRGB(48,28,10)},{n="Gold",m=Color3.fromRGB(35,28,5),s=Color3.fromRGB(43,35,10)},{n="Lime",m=Color3.fromRGB(15,35,8),s=Color3.fromRGB(20,43,12)},{n="Green",m=Color3.fromRGB(8,35,12),s=Color3.fromRGB(12,43,18)},{n="Cyan",m=Color3.fromRGB(8,28,40),s=Color3.fromRGB(12,35,48)},{n="Blue",m=Color3.fromRGB(8,12,40),s=Color3.fromRGB(12,18,48)},{n="Violet",m=Color3.fromRGB(25,8,40),s=Color3.fromRGB(33,12,48)},{n="Pink",m=Color3.fromRGB(40,8,25),s=Color3.fromRGB(48,12,32)}}
local ti=1
local lang="EN"

local L={
    EN={farm="🚀 FARM",settings="⚙️ SETTINGS",news="📋 NEWS",hammer="🔨 START HAMMER",hammerOn="🔨 HAMMER ACTIVE",auto="🤖 AUTO FARM",autoOn="🤖 AUTO ACTIVE",car="🚗 Looking for car...",sit="🚗 Sit in a car!",respawn="🚗 Respawning...",destroyed="💀 Destroyed!",theme="🎨 Theme: ",themeBtn="CHANGE THEME",langBtn="EN → RU",changelog="📋 WHAT'S NEW"},
    RU={farm="🚀 ФАРМ",settings="⚙️ НАСТРОЙКИ",news="📋 НОВОЕ",hammer="🔨 ВКЛЮЧИТЬ МОЛОТ",hammerOn="🔨 МОЛОТ АКТИВИРОВАН",auto="🤖 АВТО-ФАРМ",autoOn="🤖 АВТО АКТИВЕН",car="🚗 Ищу машину...",sit="🚗 Сядьте в машину!",respawn="🚗 Респавн...",destroyed="💀 Уничтожена!",theme="🎨 Тема: ",themeBtn="СМЕНИТЬ ТЕМУ",langBtn="RU → EN",changelog="📋 ЧТО НОВОГО"}
}

local clogEN=[[v8.4:
+ Final GUI design
+ 10 themes
+ EN↔RU language
+ Minimize & close
+ Molot 200/-1500
+ Auto farm]]

local clogRU=[[v8.4:
+ Финальный дизайн
+ 10 тем
+ EN↔RU язык
+ Свернуть и закрыть
+ Молот 200/-1500
+ Авто фарм]]

local sg=Instance.new("ScreenGui",g) sg.Name="DH" sg.ResetOnSpawn=false

local mini=Instance.new("Frame",sg) mini.Name="MiniHub"
mini.Size=UDim2.new(0,130,0,28) mini.Position=UDim2.new(0.02,0,0.1,0)
mini.BackgroundColor3=th[1].s mini.BorderSizePixel=0 mini.Visible=false mini.Active=true mini.Draggable=true mini.ZIndex=99
Instance.new("UICorner",mini).CornerRadius=UDim.new(0,6)
Instance.new("UIStroke",mini).Thickness=1 Instance.new("UIStroke",mini).Color=C.p
local rBtn=Instance.new("TextButton",mini) rBtn.Size=UDim2.new(1,0,1,0) rBtn.BackgroundTransparency=1
rBtn.Text="⚡ DAMIR HUB" rBtn.TextColor3=C.r rBtn.Font=Enum.Font.GothamBold rBtn.TextSize=12

local m=Instance.new("Frame",sg) m.Size=UDim2.new(0,500,0,310) m.Position=UDim2.new(0.5,-250,0.5,-155)
m.BackgroundColor3=th[1].m m.BorderSizePixel=0 m.Active=true m.Draggable=true m.ZIndex=100
Instance.new("UICorner",m).CornerRadius=UDim.new(0,8)

local hdr=Instance.new("Frame",m) hdr.Size=UDim2.new(1,0,0,30) hdr.BackgroundColor3=th[1].s hdr.BorderSizePixel=0
Instance.new("UICorner",hdr).CornerRadius=UDim.new(0,8)
local hdrTitle=Instance.new("TextLabel",hdr) hdrTitle.Size=UDim2.new(1,-60,1,0) hdrTitle.Position=UDim2.new(0,12,0,0)
hdrTitle.BackgroundTransparency=1 hdrTitle.Text="DAMIR HUB v8.4" hdrTitle.TextColor3=C.w hdrTitle.Font=Enum.Font.GothamBold hdrTitle.TextSize=13 hdrTitle.TextXAlignment=Enum.TextXAlignment.Left
local minBtn=Instance.new("TextButton",hdr) minBtn.Size=UDim2.new(0,22,0,22) minBtn.Position=UDim2.new(1,-50,0,4)
minBtn.BackgroundColor3=C.p minBtn.Text="—" minBtn.TextColor3=C.w minBtn.Font=Enum.Font.GothamBold minBtn.TextSize=14 minBtn.BorderSizePixel=0
Instance.new("UICorner",minBtn).CornerRadius=UDim.new(0,11)
local closeBtn=Instance.new("TextButton",hdr) closeBtn.Size=UDim2.new(0,22,0,22) closeBtn.Position=UDim2.new(1,-25,0,4)
closeBtn.BackgroundColor3=C.r closeBtn.Text="✕" closeBtn.TextColor3=C.w closeBtn.Font=Enum.Font.GothamBold closeBtn.TextSize=12 closeBtn.BorderSizePixel=0
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(0,11)
minBtn.MouseButton1Click:Connect(function() m.Visible=false mini.Visible=true end)
rBtn.MouseButton1Click:Connect(function() m.Visible=true mini.Visible=false end)
closeBtn.MouseButton1Click:Connect(function() sg:Destroy() end)

local s=Instance.new("Frame",m) s.Size=UDim2.new(0,140,1,-30) s.Position=UDim2.new(0,0,0,30) s.BackgroundColor3=th[1].s s.BorderSizePixel=0
local t=Instance.new("TextLabel",s) t.Size=UDim2.new(1,0,0,40) t.BackgroundTransparency=1 t.Text="DAMIR HUB" t.TextColor3=C.r t.Font=Enum.Font.GothamBold t.TextSize=14
local cn=Instance.new("Frame",m) cn.Size=UDim2.new(1,-140,1,-30) cn.Position=UDim2.new(0,140,0,30) cn.BackgroundTransparency=1

local pgs={}
local bts={}
local function at(y)
    local bt=Instance.new("TextButton",s) bt.Size=UDim2.new(1,-20,0,36) bt.Position=UDim2.new(0,10,0,y) bt.BackgroundColor3=Color3.fromRGB(40,40,40) bt.Font=Enum.Font.GothamBold bt.TextSize=12 bt.BorderSizePixel=0
    Instance.new("UICorner",bt).CornerRadius=UDim.new(0,5)
    local pg=Instance.new("Frame",cn) pg.Size=UDim2.new(1,-20,1,-20) pg.Position=UDim2.new(0,10,0,10) pg.BackgroundTransparency=1 pg.Visible=false
    bt.MouseButton1Click:Connect(function() for _,b in pairs(bts) do b.BackgroundColor3=Color3.fromRGB(40,40,40) end for _,p in pairs(pgs) do p.Visible=false end bt.BackgroundColor3=Color3.fromRGB(70,70,90) pg.Visible=true end)
    table.insert(bts,bt) table.insert(pgs,pg) return bt,pg
end
local fbt,fpg=at(50)
local sbt,spg=at(92)
local lbt,lpg=at(134)
bts[1].BackgroundColor3=Color3.fromRGB(70,70,90) pgs[1].Visible=true

local function ul()
    local Lc=L[lang]
    fbt.Text=Lc.farm sbt.Text=Lc.settings lbt.Text=Lc.news
    hb.Text=ho and Lc.hammerOn or Lc.hammer
    ab.Text=ao and Lc.autoOn or Lc.auto
    hi.Text=(lang=="EN") and "⚠️ If broken - rejoin" or "⚠️ Если сломался - перезайди"
    tt.Text=Lc.theme..th[ti].name tb.Text=Lc.themeBtn
    lgt.Text=Lc.changelog lgc.Text=(lang=="EN") and clogEN or clogRU
    lb.Text=Lc.langBtn
end

-- FARM
local ft=Instance.new("TextLabel",fpg) ft.Size=UDim2.new(1,0,0,18) ft.BackgroundTransparency=1 ft.Text="MOLOT v8.4" ft.TextColor3=C.w ft.Font=Enum.Font.GothamBold ft.TextSize=12 ft.TextXAlignment=Enum.TextXAlignment.Left
local cb=Instance.new("Frame",fpg) cb.Size=UDim2.new(1,0,0,30) cb.Position=UDim2.new(0,0,0,22) cb.BackgroundColor3=Color3.fromRGB(35,35,35) Instance.new("UICorner",cb).CornerRadius=UDim.new(0,4)
local cl=Instance.new("TextLabel",cb) cl.Size=UDim2.new(1,-14,1,0) cl.Position=UDim2.new(0,7,0,0) cl.BackgroundTransparency=1 cl.Text="🚗 Looking for car..." cl.TextColor3=C.g cl.Font=Enum.Font.GothamBold cl.TextSize=11 cl.TextXAlignment=Enum.TextXAlignment.Left
local sl=Instance.new("TextLabel",fpg) sl.Size=UDim2.new(1,0,0,16) sl.Position=UDim2.new(0,0,0,56) sl.BackgroundTransparency=1 sl.Text="Hits: 0 | Broken: 0 | Auto: 0" sl.TextColor3=C.g sl.Font=Enum.Font.Gotham sl.TextSize=10 sl.TextXAlignment=Enum.TextXAlignment.Left

local function gc()
    local c=p.Character if not c then return nil end local h=c:FindFirstChildOfClass("Humanoid") if not h or not h.SeatPart then return nil end local cur=h.SeatPart
    while cur do if cur:IsA("Model") and cur.Parent and cur.Parent.Name=="Vehicles" then return cur end if cur:IsA("Model") and cur.Name~="Body" and cur.Name~="Engine" and cur.Name~="Wheels" and cur~=c then return cur end cur=cur.Parent end return nil
end
spawn(function() while wait(0.3) do pcall(function() local c=gc() if c then cl.Text="🚗 "..c.Name cl.TextColor3=C.b else cl.Text=L[lang].sit cl.TextColor3=C.r end end) end end)

local ho,ao,hh,br,cy=false,false,0,0,0
local function sm()
    local c=gc() if not c then return false end local r=c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart") if not r then return false end
    r.Velocity=Vector3.zero r.CFrame=CFrame.new(r.Position.X,200,r.Position.Z) wait(0.15) r.Velocity=Vector3.new(0,-1500,0) wait(1.0)
    if not c.Parent then br=br+1 return true end return false
end

local hb=Instance.new("TextButton",fpg) hb.Size=UDim2.new(1,0,0,36) hb.Position=UDim2.new(0,0,0,78) hb.BackgroundColor3=C.btn hb.Font=Enum.Font.GothamBold hb.TextSize=12 hb.BorderSizePixel=0
hb.Text="🔨 START HAMMER" hb.TextColor3=C.r
Instance.new("UICorner",hb).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",hb).Thickness=1.5 Instance.new("UIStroke",hb).Color=Color3.fromRGB(0,0,0)
local ab=Instance.new("TextButton",fpg) ab.Size=UDim2.new(1,0,0,36) ab.Position=UDim2.new(0,0,0,122) ab.BackgroundColor3=C.btn ab.Font=Enum.Font.GothamBold ab.TextSize=12 ab.BorderSizePixel=0
ab.Text="🤖 AUTO FARM" ab.TextColor3=C.g
Instance.new("UICorner",ab).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",ab).Thickness=1.5 Instance.new("UIStroke",ab).Color=Color3.fromRGB(0,0,0)
local hi=Instance.new("TextLabel",fpg) hi.Size=UDim2.new(1,0,0,14) hi.Position=UDim2.new(0,0,0,162) hi.BackgroundTransparency=1 hi.Text="⚠️ If broken - rejoin" hi.TextColor3=Color3.fromRGB(255,180,50) hi.Font=Enum.Font.Gotham hi.TextSize=9 hi.TextXAlignment=Enum.TextXAlignment.Center

hb.MouseButton1Click:Connect(function()
    ho=not ho
    if ho then if ao then ao=false ab.Text=L[lang].auto ab.TextColor3=C.g ab.BackgroundColor3=C.btn end hb.Text=L[lang].hammerOn hb.TextColor3=C.gr hb.BackgroundColor3=Color3.fromRGB(18,38,24)
        coroutine.wrap(function() while ho do sm() hh=hh+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy wait(0.3) end end)()
    else hb.Text=L[lang].hammer hb.TextColor3=C.r hb.BackgroundColor3=C.btn end
end)
ab.MouseButton1Click:Connect(function()
    ao=not ao
    if ao then if ho then ho=false hb.Text=L[lang].hammer hb.TextColor3=C.r hb.BackgroundColor3=C.btn end ab.Text=L[lang].autoOn ab.TextColor3=C.gr ab.BackgroundColor3=Color3.fromRGB(40,25,10)
        coroutine.wrap(function()
            while ao do local c=gc() if not c then cl.Text=L[lang].respawn wait(3)
                else local d=false for i=1,20 do if not ao then break end d=sm() hh=hh+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy if d then break end wait(0.2) end
                if d then cy=cy+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy cl.Text=L[lang].destroyed wait(1) cl.Text=L[lang].respawn wait(3) end end
            end
        end)()
    else ab.Text=L[lang].auto ab.TextColor3=C.g ab.BackgroundColor3=C.btn end
end)

-- SETTINGS
local lb=Instance.new("TextButton",spg) lb.Size=UDim2.new(1,0,0,26) lb.Position=UDim2.new(0,0,0,5) lb.BackgroundColor3=C.btn lb.Font=Enum.Font.GothamBold lb.TextSize=11 lb.BorderSizePixel=0
lb.Text="EN → RU" lb.TextColor3=C.g
Instance.new("UICorner",lb).CornerRadius=UDim.new(0,4) Instance.new("UIStroke",lb).Thickness=1.5 Instance.new("UIStroke",lb).Color=Color3.fromRGB(0,0,0)
lb.MouseButton1Click:Connect(function() lang=(lang=="EN") and "RU" or "EN" ul() end)

local tt=Instance.new("TextLabel",spg) tt.Size=UDim2.new(1,0,0,16) tt.Position=UDim2.new(0,0,0,40) tt.BackgroundTransparency=1 tt.Text="🎨 Theme: Standard" tt.TextColor3=C.w tt.Font=Enum.Font.GothamBold tt.TextSize=11 tt.TextXAlignment=Enum.TextXAlignment.Left
local tb=Instance.new("TextButton",spg) tb.Size=UDim2.new(1,0,0,26) tb.Position=UDim2.new(0,0,0,58) tb.BackgroundColor3=C.btn tb.Font=Enum.Font.GothamBold tb.TextSize=11 tb.BorderSizePixel=0
tb.Text="CHANGE THEME" tb.TextColor3=C.g
Instance.new("UICorner",tb).CornerRadius=UDim.new(0,4) Instance.new("UIStroke",tb).Thickness=1.5 Instance.new("UIStroke",tb).Color=Color3.fromRGB(0,0,0)
tb.MouseButton1Click:Connect(function() ti=ti%#th+1 m.BackgroundColor3=th[ti].m s.BackgroundColor3=th[ti].s hdr.BackgroundColor3=th[ti].s mini.BackgroundColor3=th[ti].s tt.Text=L[lang].theme..th[ti].name end)

-- CHANGELOG
local lgt=Instance.new("TextLabel",lpg) lgt.Size=UDim2.new(1,0,0,18) lgt.BackgroundTransparency=1 lgt.Text="📋 WHAT'S NEW" lgt.TextColor3=C.w lgt.Font=Enum.Font.GothamBold lgt.TextSize=12 lgt.TextXAlignment=Enum.TextXAlignment.Left
local lgc=Instance.new("TextLabel",lpg) lgc.Size=UDim2.new(1,0,0,220) lgc.Position=UDim2.new(0,0,0,22) lgc.BackgroundColor3=Color3.fromRGB(35,35,35) lgc.TextColor3=C.g lgc.Font=Enum.Font.Gotham lgc.TextSize=10 lgc.TextXAlignment=Enum.TextXAlignment.Left lgc.TextYAlignment=Enum.TextYAlignment.Top
Instance.new("UICorner",lgc).CornerRadius=UDim.new(0,5) lgc.Text=clogEN

ul()
game.StarterGui:SetCore("SendNotification",{Title="DAMIR HUB",Text="v8.4 loaded!",Duration=3})
