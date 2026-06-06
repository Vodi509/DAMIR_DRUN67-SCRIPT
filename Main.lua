local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren()) do if v.Name=="DH" then v:Destroy() end end

local C={btn=Color3.fromRGB(45,45,45),w=Color3.new(1,1,1),g=Color3.fromRGB(160,160,160),gr=Color3.fromRGB(0,255,150),r=Color3.fromRGB(255,55,55),b=Color3.fromRGB(0,200,255),p=Color3.fromRGB(150,90,255)}
local th={{n="Standard",m=Color3.fromRGB(20,20,20),s=Color3.fromRGB(28,28,28)},{n="Red",m=Color3.fromRGB(40,10,10),s=Color3.fromRGB(48,15,15)},{n="Orange",m=Color3.fromRGB(40,20,5),s=Color3.fromRGB(48,28,10)},{n="Gold",m=Color3.fromRGB(35,28,5),s=Color3.fromRGB(43,35,10)},{n="Lime",m=Color3.fromRGB(15,35,8),s=Color3.fromRGB(20,43,12)},{n="Green",m=Color3.fromRGB(8,35,12),s=Color3.fromRGB(12,43,18)},{n="Cyan",m=Color3.fromRGB(8,28,40),s=Color3.fromRGB(12,35,48)},{n="Blue",m=Color3.fromRGB(8,12,40),s=Color3.fromRGB(12,18,48)},{n="Violet",m=Color3.fromRGB(25,8,40),s=Color3.fromRGB(33,12,48)},{n="Pink",m=Color3.fromRGB(40,8,25),s=Color3.fromRGB(48,12,32)}}
local ti=1
local lang="EN"
local transVal=0

local L={
    EN={farm="🚀 FARM",settings="⚙️ SETTINGS",news="📋 NEWS",hammer="🔨 START HAMMER",hammerOn="🔨 HAMMER ACTIVE",auto="🤖 AUTO FARM",autoOn="🤖 AUTO ACTIVE",car="🚗 Looking for car...",sit="🚗 Sit in a car!",respawn="🚗 Respawning...",destroyed="💀 Destroyed!",theme="🎨 Theme: ",themeBtn="CHANGE THEME",trans="🔍 Transparency: ",langBtn="EN → RU",changelog="📋 WHAT'S NEW"},
    RU={farm="🚀 ФАРМ",settings="⚙️ НАСТРОЙКИ",news="📋 НОВОЕ",hammer="🔨 ВКЛЮЧИТЬ МОЛОТ",hammerOn="🔨 МОЛОТ АКТИВИРОВАН",auto="🤖 АВТО-ФАРМ",autoOn="🤖 АВТО АКТИВЕН",car="🚗 Ищу машину...",sit="🚗 Сядьте в машину!",respawn="🚗 Респавн...",destroyed="💀 Уничтожена!",theme="🎨 Тема: ",themeBtn="СМЕНИТЬ ТЕМУ",trans="🔍 Прозрачность: ",langBtn="RU → EN",changelog="📋 ЧТО НОВОГО"}
}

local changelogEN=[[v8.3 (Current):
+ Language switch EN↔RU
+ Fixed transparency slider
+ Scrollable changelog
+ 10 themes
+ Molot 200/-1500
+ Auto farm

v8.2:
+ Settings save system
+ Language saved
+ Theme saved
+ Transparency saved

v8.1:
+ New minimal GUI
+ Black button borders
+ Transparency slider

v8.0:
+ All-in-one file
+ 7 theme colors
+ Fun Zone removed

v7.0:
+ Modular system test
+ Multiple files

v6.x:
+ SpeedHub design
+ Molot & auto farm
+ Spawn click 45/40
+ Car name fix]]

local changelogRU=[[v8.3 (Текущая):
+ Смена языка EN↔RU
+ Починен ползунок прозрачности
+ Прокручиваемый ченджлог
+ 10 тем
+ Молот 200/-1500
+ Авто фарм

v8.2:
+ Сохранение настроек
+ Язык сохраняется
+ Тема сохраняется
+ Прозрачность сохраняется

v8.1:
+ Новый минимальный GUI
+ Чёрные обводки кнопок
+ Ползунок прозрачности

v8.0:
+ Всё в одном файле
+ 7 цветов темы
+ Fun Zone убран

v7.0:
+ Тест модульной системы
+ Несколько файлов

v6.x:
+ Дизайн SpeedHub
+ Молот и автофарм
+ Клик спавна 45/40
+ Фикс имени машины]]

local sg=Instance.new("ScreenGui",g) sg.Name="DH" sg.ResetOnSpawn=false
local m=Instance.new("Frame",sg) m.Size=UDim2.new(0,500,0,310) m.Position=UDim2.new(0.5,-250,0.5,-155) m.BackgroundColor3=th[1].m m.BorderSizePixel=0 m.Active=true m.Draggable=true
Instance.new("UICorner",m).CornerRadius=UDim.new(0,8)
local s=Instance.new("Frame",m) s.Size=UDim2.new(0,140,1,0) s.BackgroundColor3=th[1].s s.BorderSizePixel=0
Instance.new("UICorner",s).CornerRadius=UDim.new(0,8)
local t=Instance.new("TextLabel",s) t.Size=UDim2.new(1,0,0,50) t.BackgroundTransparency=1 t.Text="DAMIR HUB" t.TextColor3=C.w t.Font=Enum.Font.GothamBold t.TextSize=16
local cn=Instance.new("Frame",m) cn.Size=UDim2.new(1,-140,1,0) cn.Position=UDim2.new(0,140,0,0) cn.BackgroundTransparency=1

local pgs={}
local bts={}
local function at(y)
    local bt=Instance.new("TextButton",s) bt.Size=UDim2.new(1,-20,0,36) bt.Position=UDim2.new(0,10,0,y) bt.BackgroundColor3=Color3.fromRGB(40,40,40) bt.Font=Enum.Font.GothamBold bt.TextSize=12 bt.BorderSizePixel=0
    Instance.new("UICorner",bt).CornerRadius=UDim.new(0,5)
    local pg=Instance.new("Frame",cn) pg.Size=UDim2.new(1,-20,1,-20) pg.Position=UDim2.new(0,10,0,10) pg.BackgroundTransparency=1 pg.Visible=false
    bt.MouseButton1Click:Connect(function() for _,b in pairs(bts) do b.BackgroundColor3=Color3.fromRGB(40,40,40) end for _,p in pairs(pgs) do p.Visible=false end bt.BackgroundColor3=Color3.fromRGB(70,70,90) pg.Visible=true end)
    table.insert(bts,bt) table.insert(pgs,pg) return bt,pg
end
local fbt,fpg=at(55)
local sbt,spg=at(97)
local lbt,lpg=at(139)
bts[1].BackgroundColor3=Color3.fromRGB(70,70,90) pgs[1].Visible=true

local function ul()
    local Lc=L[lang]
    fbt.Text=Lc.farm sbt.Text=Lc.settings lbt.Text=Lc.news
    hb.Text=ho and Lc.hammerOn or Lc.hammer
    ab.Text=ao and Lc.autoOn or Lc.auto
    hi.Text=(lang=="EN") and "⚠️ If broken - rejoin" or "⚠️ Если сломался - перезайди"
    tt.Text=Lc.theme..th[ti].name tb.Text=Lc.themeBtn
    tl.Text=Lc.trans..transVal.."%"
    lgt.Text=Lc.changelog lgc.Text=(lang=="EN") and changelogEN or changelogRU
    lb.Text=Lc.langBtn
end

-- FARM
local ft=Instance.new("TextLabel",fpg) ft.Size=UDim2.new(1,0,0,18) ft.BackgroundTransparency=1 ft.Text="MOLOT v8.3" ft.TextColor3=C.w ft.Font=Enum.Font.GothamBold ft.TextSize=12 ft.TextXAlignment=Enum.TextXAlignment.Left
local cb=Instance.new("Frame",fpg) cb.Size=UDim2.new(1,0,0,30) cb.Position=UDim2.new(0,0,0,22) cb.BackgroundColor3=Color3.fromRGB(35,35,35) Instance.new("UICorner",cb).CornerRadius=UDim.new(0,4)
local cl=Instance.new("TextLabel",cb) cl.Size=UDim2.new(1,-14,1,0) cl.Position=UDim2.new(0,7,0,0) cl.BackgroundTransparency=1 cl.TextColor3=C.g cl.Font=Enum.Font.GothamBold cl.TextSize=11 cl.TextXAlignment=Enum.TextXAlignment.Left
local sl=Instance.new("TextLabel",fpg) sl.Size=UDim2.new(1,0,0,16) sl.Position=UDim2.new(0,0,0,56) sl.BackgroundTransparency=1 sl.TextColor3=C.g sl.Font=Enum.Font.Gotham sl.TextSize=10 sl.TextXAlignment=Enum.TextXAlignment.Left

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
Instance.new("UICorner",hb).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",hb).Thickness=1.5 Instance.new("UIStroke",hb).Color=Color3.fromRGB(0,0,0)
local ab=Instance.new("TextButton",fpg) ab.Size=UDim2.new(1,0,0,36) ab.Position=UDim2.new(0,0,0,122) ab.BackgroundColor3=C.btn ab.Font=Enum.Font.GothamBold ab.TextSize=12 ab.BorderSizePixel=0
Instance.new("UICorner",ab).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",ab).Thickness=1.5 Instance.new("UIStroke",ab).Color=Color3.fromRGB(0,0,0)
local hi=Instance.new("TextLabel",fpg) hi.Size=UDim2.new(1,0,0,14) hi.Position=UDim2.new(0,0,0,162) hi.BackgroundTransparency=1 hi.TextColor3=Color3.fromRGB(255,180,50) hi.Font=Enum.Font.Gotham hi.TextSize=9 hi.TextXAlignment=Enum.TextXAlignment.Center

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
Instance.new("UICorner",lb).CornerRadius=UDim.new(0,4) Instance.new("UIStroke",lb).Thickness=1.5 Instance.new("UIStroke",lb).Color=Color3.fromRGB(0,0,0)
lb.MouseButton1Click:Connect(function() lang=(lang=="EN") and "RU" or "EN" ul() end)

local tt=Instance.new("TextLabel",spg) tt.Size=UDim2.new(1,0,0,16) tt.Position=UDim2.new(0,0,0,40) tt.BackgroundTransparency=1 tt.TextColor3=C.w tt.Font=Enum.Font.GothamBold tt.TextSize=11 tt.TextXAlignment=Enum.TextXAlignment.Left
local tb=Instance.new("TextButton",spg) tb.Size=UDim2.new(1,0,0,26) tb.Position=UDim2.new(0,0,0,58) tb.BackgroundColor3=C.btn tb.Font=Enum.Font.GothamBold tb.TextSize=11 tb.BorderSizePixel=0
Instance.new("UICorner",tb).CornerRadius=UDim.new(0,4) Instance.new("UIStroke",tb).Thickness=1.5 Instance.new("UIStroke",tb).Color=Color3.fromRGB(0,0,0)
tb.MouseButton1Click:Connect(function() ti=ti%#th+1 m.BackgroundColor3=th[ti].m s.BackgroundColor3=th[ti].s tt.Text=L[lang].theme..th[ti].name end)

local tl=Instance.new("TextLabel",spg) tl.Size=UDim2.new(1,0,0,16) tl.Position=UDim2.new(0,0,0,95) tl.BackgroundTransparency=1 tl.TextColor3=C.w tl.Font=Enum.Font.GothamBold tl.TextSize=11 tl.TextXAlignment=Enum.TextXAlignment.Left
local tr=Instance.new("Frame",spg) tr.Size=UDim2.new(1,0,0,20) tr.Position=UDim2.new(0,0,0,113) tr.BackgroundColor3=Color3.fromRGB(35,35,35) tr.BorderSizePixel=0
Instance.new("UICorner",tr).CornerRadius=UDim.new(0,10) Instance.new("UIStroke",tr).Thickness=1.5 Instance.new("UIStroke",tr).Color=Color3.fromRGB(0,0,0)
local tf=Instance.new("Frame",tr) tf.Size=UDim2.new(0,0,1,0) tf.BackgroundColor3=C.p tf.BorderSizePixel=0 Instance.new("UICorner",tf).CornerRadius=UDim.new(0,10)
local tn=Instance.new("TextButton",tr) tn.Size=UDim2.new(0,24,1,0) tn.BackgroundColor3=C.w tn.Text="" tn.BorderSizePixel=0 Instance.new("UICorner",tn).CornerRadius=UDim.new(0,12) Instance.new("UIStroke",tn).Thickness=1.5 Instance.new("UIStroke",tn).Color=Color3.fromRGB(0,0,0)
local dr=false
tn.MouseButton1Down:Connect(function() dr=true end)
tr.MouseButton1Down:Connect(function(x) dr=true local bp=tr.AbsolutePosition.X local bs=tr.AbsoluteSize.X local pv=math.floor(math.clamp((x-bp)/bs*100,0,100)) transVal=pv m.BackgroundTransparency=pv/100 s.BackgroundTransparency=pv/100 tf.Size=UDim2.new(pv/100,0,1,0) tn.Position=UDim2.new(pv/100,-12,0,0) tl.Text=L[lang].trans..pv.."%" end)
game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dr=false end end)
game:GetService("UserInputService").InputChanged:Connect(function(i) if dr and i.UserInputType==Enum.UserInputType.MouseMovement then local bp=tr.AbsolutePosition.X local bs=tr.AbsoluteSize.X local pv=math.floor(math.clamp((i.Position.X-bp)/bs*100,0,100)) transVal=pv m.BackgroundTransparency=pv/100 s.BackgroundTransparency=pv/100 tf.Size=UDim2.new(pv/100,0,1,0) tn.Position=UDim2.new(pv/100,-12,0,0) tl.Text=L[lang].trans..pv.."%" end end)

-- CHANGELOG
local lgt=Instance.new("TextLabel",lpg) lgt.Size=UDim2.new(1,0,0,18) lgt.BackgroundTransparency=1 lgt.TextColor3=C.w lgt.Font=Enum.Font.GothamBold lgt.TextSize=12 lgt.TextXAlignment=Enum.TextXAlignment.Left
local lgf=Instance.new("ScrollingFrame",lpg) lgf.Size=UDim2.new(1,0,1,-22) lgf.Position=UDim2.new(0,0,0,22) lgf.BackgroundColor3=Color3.fromRGB(35,35,35) lgf.BorderSizePixel=0 lgf.ScrollBarThickness=4 lgf.CanvasSize=UDim2.new(0,0,0,500)
Instance.new("UICorner",lgf).CornerRadius=UDim.new(0,5)
local lgc=Instance.new("TextLabel",lgf) lgc.Size=UDim2.new(1,-10,0,500) lgc.Position=UDim2.new(0,5,0,5) lgc.BackgroundTransparency=1 lgc.TextColor3=C.g lgc.Font=Enum.Font.Gotham lgc.TextSize=10 lgc.TextXAlignment=Enum.TextXAlignment.Left lgc.TextYAlignment=Enum.TextYAlignment.Top

-- INIT
ul()
game.StarterGui:SetCore("SendNotification",{Title="DAMIR HUB",Text="v8.3 loaded!",Duration=3})
