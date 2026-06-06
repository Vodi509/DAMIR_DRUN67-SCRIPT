-- [[ DAMIR HUB v8.2 - OPTIMIZED FOR DELTA ]] --
local plr = game.Players.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")
for _, v in pairs(pg:GetChildren()) do if v.Name == "DamirHub" then v:Destroy() end end

local function loadSettings()
    local ok, data = pcall(function() return plr:WaitForChild("DamirSettings") end)
    if ok and data then return {lang = data:FindFirstChild("Lang") and data.Lang.Value or "EN", theme = data:FindFirstChild("Theme") and data.Theme.Value or 1, trans = data:FindFirstChild("Trans") and data.Trans.Value or 0} end
    return {lang = "EN", theme = 1, trans = 0}
end

local function saveSettings(lang, theme, trans)
    pcall(function()
        local f = plr:FindFirstChild("DamirSettings") or Instance.new("Folder", plr)
        f.Name = "DamirSettings"
        local l = f:FindFirstChild("Lang") or Instance.new("StringValue", f); l.Name = "Lang"; l.Value = lang
        local t = f:FindFirstChild("Theme") or Instance.new("NumberValue", f); t.Name = "Theme"; t.Value = theme
        local r = f:FindFirstChild("Trans") or Instance.new("NumberValue", f); r.Name = "Trans"; r.Value = trans
    end)
end

local saved = loadSettings()

local T = {
    EN = {farm="🚀 FARM",settings="⚙️ SETTINGS",log="📋 NEWS",hammer="🔨 START HAMMER",hammerOn="🔨 HAMMER ACTIVE",auto="🤖 AUTO FARM",autoOn="🤖 AUTO FARM ACTIVE",car="🚗 Looking for car...",sit="🚗 Sit in a car!",respawn="🚗 Respawning...",destroyed="💀 Destroyed!",stats="Hits: %d | Broken: %d | Auto: %d",hint="⚠️ If broken - rejoin",theme="🎨 Theme: ",themeBtn="CHANGE THEME",trans="🔍 Transparency: ",logTitle="📋 WHAT'S NEW",lang="🌐 Language: English",langBtn="EN → RU",title="MOLOT v8.2",loaded="v8.2 loaded!"},
    RU = {farm="🚀 ФАРМ",settings="⚙️ НАСТРОЙКИ",log="📋 НОВОЕ",hammer="🔨 ВКЛЮЧИТЬ МОЛОТ",hammerOn="🔨 МОЛОТ АКТИВИРОВАН",auto="🤖 АВТО-ФАРМ",autoOn="🤖 АВТО-ФАРМ АКТИВИРОВАН",car="🚗 Ищу машину...",sit="🚗 Сядьте в машину!",respawn="🚗 Респавн...",destroyed="💀 Уничтожена!",stats="Ударов: %d | Сломано: %d | Авто: %d",hint="⚠️ Если сломался - перезайди",theme="🎨 Тема: ",themeBtn="СМЕНИТЬ ТЕМУ",trans="🔍 Прозрачность: ",logTitle="📋 ЧТО НОВОГО",lang="🌐 Язык: Русский",langBtn="RU → EN",title="МОЛОТ v8.2",loaded="v8.2 загружен!"}
}

local lang = saved.lang
local L = T[lang]

local C = {btn=Color3.fromRGB(45,45,45),white=Color3.new(1,1,1),grey=Color3.fromRGB(160,160,160),green=Color3.fromRGB(0,255,150),red=Color3.fromRGB(255,55,55),blue=Color3.fromRGB(0,200,255),purple=Color3.fromRGB(150,90,255)}

local themes = {
    {name="Standard",main=Color3.fromRGB(20,20,20),side=Color3.fromRGB(28,28,28)},
    {name="Red",main=Color3.fromRGB(40,10,10),side=Color3.fromRGB(48,15,15)},
    {name="Orange",main=Color3.fromRGB(40,20,5),side=Color3.fromRGB(48,28,10)},
    {name="Gold",main=Color3.fromRGB(35,28,5),side=Color3.fromRGB(43,35,10)},
    {name="Lime",main=Color3.fromRGB(15,35,8),side=Color3.fromRGB(20,43,12)},
    {name="Green",main=Color3.fromRGB(8,35,12),side=Color3.fromRGB(12,43,18)},
    {name="Cyan",main=Color3.fromRGB(8,28,40),side=Color3.fromRGB(12,35,48)},
    {name="Blue",main=Color3.fromRGB(8,12,40),side=Color3.fromRGB(12,18,48)},
    {name="Violet",main=Color3.fromRGB(25,8,40),side=Color3.fromRGB(33,12,48)},
    {name="Pink",main=Color3.fromRGB(40,8,25),side=Color3.fromRGB(48,12,32)}
}
local ti = saved.theme
local transVal = saved.trans

-- GUI
local sg = Instance.new("ScreenGui", pg) sg.Name = "DamirHub" sg.ResetOnSpawn = false
local main = Instance.new("Frame", sg) main.Size=UDim2.new(0,500,0,310) main.Position=UDim2.new(0.5,-250,0.5,-155) main.BackgroundColor3=themes[ti].main main.BorderSizePixel=0 main.Active=true main.Draggable=true
Instance.new("UICorner",main).CornerRadius=UDim.new(0,8)
local sidebar = Instance.new("Frame",main) sidebar.Size=UDim2.new(0,140,1,0) sidebar.BackgroundColor3=themes[ti].side sidebar.BorderSizePixel=0
Instance.new("UICorner",sidebar).CornerRadius=UDim.new(0,8)
local title = Instance.new("TextLabel",sidebar) title.Size=UDim2.new(1,0,0,50) title.BackgroundTransparency=1 title.Text="DAMIR HUB" title.TextColor3=Color3.fromRGB(255,255,255) title.Font=Enum.Font.GothamBold title.TextSize=16
local container = Instance.new("Frame",main) container.Size=UDim2.new(1,-140,1,0) container.Position=UDim2.new(0,140,0,0) container.BackgroundTransparency=1

local pages={}
local buttons={}
local function addTab(y)
    local btn=Instance.new("TextButton",sidebar) btn.Size=UDim2.new(1,-20,0,36) btn.Position=UDim2.new(0,10,0,y) btn.BackgroundColor3=Color3.fromRGB(40,40,40) btn.Font=Enum.Font.GothamBold btn.TextSize=12 btn.BorderSizePixel=0
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,5)
    local page=Instance.new("Frame",container) page.Size=UDim2.new(1,-20,1,-20) page.Position=UDim2.new(0,10,0,10) page.BackgroundTransparency=1 page.Visible=false
    btn.MouseButton1Click:Connect(function() for _,b in pairs(buttons) do b.BackgroundColor3=Color3.fromRGB(40,40,40) end for _,p in pairs(pages) do p.Visible=false end btn.BackgroundColor3=Color3.fromRGB(70,70,90) page.Visible=true end)
    table.insert(buttons,btn) table.insert(pages,page) return btn,page
end
local farmBtn,farmPg=addTab(55)
local setBtn,setPg=addTab(97)
local logBtn,logPg=addTab(139)
buttons[1].BackgroundColor3=Color3.fromRGB(70,70,90) pages[1].Visible=true

local function updateLang()
    L=T[lang] farmBtn.Text=L.farm setBtn.Text=L.settings logBtn.Text=L.log fTitle.Text=L.title
    hb.Text=ho and L.hammerOn or L.hammer ab.Text=ao and L.autoOn or L.auto hint.Text=L.hint
    tt.Text=L.theme..themes[ti].name tb.Text=L.themeBtn transLabel.Text=L.trans..transVal.."%" logTitle.Text=L.logTitle lt.Text=L.lang lb.Text=L.langBtn
end
local function applyTheme() main.BackgroundColor3=themes[ti].main sidebar.BackgroundColor3=themes[ti].side tt.Text=L.theme..themes[ti].name end
local function applyTransparency() main.BackgroundTransparency=transVal/100 sidebar.BackgroundTransparency=transVal/100 transFill.Size=UDim2.new(transVal/100,0,1,0) transBtn.Position=UDim2.new(transVal/100,-12,0,0) transLabel.Text=L.trans..transVal.."%" end

-- FARM
local fTitle=Instance.new("TextLabel",farmPg) fTitle.Size=UDim2.new(1,0,0,18) fTitle.BackgroundTransparency=1 fTitle.TextColor3=C.white fTitle.Font=Enum.Font.GothamBold fTitle.TextSize=12 fTitle.TextXAlignment=Enum.TextXAlignment.Left
local carBg=Instance.new("Frame",farmPg) carBg.Size=UDim2.new(1,0,0,30) carBg.Position=UDim2.new(0,0,0,22) carBg.BackgroundColor3=Color3.fromRGB(35,35,35) Instance.new("UICorner",carBg).CornerRadius=UDim.new(0,4)
local carLbl=Instance.new("TextLabel",carBg) carLbl.Size=UDim2.new(1,-14,1,0) carLbl.Position=UDim2.new(0,7,0,0) carLbl.BackgroundTransparency=1 carLbl.TextColor3=C.grey carLbl.Font=Enum.Font.GothamBold carLbl.TextSize=11 carLbl.TextXAlignment=Enum.TextXAlignment.Left
local statLbl=Instance.new("TextLabel",farmPg) statLbl.Size=UDim2.new(1,0,0,16) statLbl.Position=UDim2.new(0,0,0,56) statLbl.BackgroundTransparency=1 statLbl.TextColor3=C.grey statLbl.Font=Enum.Font.Gotham statLbl.TextSize=10 statLbl.TextXAlignment=Enum.TextXAlignment.Left

local function getCar()
    local c=plr.Character if not c then return nil end local h=c:FindFirstChildOfClass("Humanoid") if not h or not h.SeatPart then return nil end local cur=h.SeatPart
    while cur do if cur:IsA("Model") and cur.Parent and cur.Parent.Name=="Vehicles" then return cur end if cur:IsA("Model") and cur.Name~="Body" and cur.Name~="Engine" and cur.Name~="Wheels" and cur~=c then return cur end cur=cur.Parent end return nil
end
spawn(function() while wait(0.3) do pcall(function() local c=getCar() if c then carLbl.Text="🚗 "..c.Name carLbl.TextColor3=C.blue else carLbl.Text=L.sit carLbl.TextColor3=C.red end end) end end)

local ho,ao,hits,bro,cyc=false,false,0,0,0
local function smash()
    local c=getCar() if not c then return false end local r=c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart") if not r then return false end
    r.Velocity=Vector3.zero r.CFrame=CFrame.new(r.Position.X,200,r.Position.Z) wait(0.15) r.Velocity=Vector3.new(0,-1500,0) wait(1.0)
    if not c.Parent then bro=bro+1 return true end return false
end

local hb=Instance.new("TextButton",farmPg) hb.Size=UDim2.new(1,0,0,36) hb.Position=UDim2.new(0,0,0,78) hb.BackgroundColor3=C.btn hb.Font=Enum.Font.GothamBold hb.TextSize=12 hb.BorderSizePixel=0
Instance.new("UICorner",hb).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",hb).Thickness=1.5 Instance.new("UIStroke",hb).Color=Color3.fromRGB(0,0,0)
local ab=Instance.new("TextButton",farmPg) ab.Size=UDim2.new(1,0,0,36) ab.Position=UDim2.new(0,0,0,122) ab.BackgroundColor3=C.btn ab.Font=Enum.Font.GothamBold ab.TextSize=12 ab.BorderSizePixel=0
Instance.new("UICorner",ab).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",ab).Thickness=1.5 Instance.new("UIStroke",ab).Color=Color3.fromRGB(0,0,0)
local hint=Instance.new("TextLabel",farmPg) hint.Size=UDim2.new(1,0,0,14) hint.Position=UDim2.new(0,0,0,162) hint.BackgroundTransparency=1 hint.TextColor3=Color3.fromRGB(255,180,50) hint.Font=Enum.Font.Gotham hint.TextSize=9 hint.TextXAlignment=Enum.TextXAlignment.Center

hb.MouseButton1Click:Connect(function()
    ho=not ho
    if ho then if ao then ao=false ab.Text=L.auto ab.TextColor3=C.grey ab.BackgroundColor3=C.btn end hb.Text=L.hammerOn hb.TextColor3=C.green hb.BackgroundColor3=Color3.fromRGB(18,38,24)
        coroutine.wrap(function() while ho do smash() hits=hits+1 statLbl.Text=string.format(L.stats,hits,bro,cyc) wait(0.3) end end)()
    else hb.Text=L.hammer hb.TextColor3=C.red hb.BackgroundColor3=C.btn end
end)
ab.MouseButton1Click:Connect(function()
    ao=not ao
    if ao then if ho then ho=false hb.Text=L.hammer hb.TextColor3=C.red hb.BackgroundColor3=C.btn end ab.Text=L.autoOn ab.TextColor3=C.green ab.BackgroundColor3=Color3.fromRGB(40,25,10)
        coroutine.wrap(function()
            while ao do local c=getCar() if not c then carLbl.Text=L.respawn wait(3)
                else local d=false for i=1,20 do if not ao then break end d=smash() hits=hits+1 statLbl.Text=string.format(L.stats,hits,bro,cyc) if d then break end wait(0.2) end
                if d then cyc=cyc+1 statLbl.Text=string.format(L.stats,hits,bro,cyc) carLbl.Text=L.destroyed wait(1) carLbl.Text=L.respawn wait(3) end end
            end
        end)()
    else ab.Text=L.auto ab.TextColor3=C.grey ab.BackgroundColor3=C.btn end
end)

-- SETTINGS
local lt=Instance.new("TextLabel",setPg) lt.Size=UDim2.new(1,0,0,16) lt.BackgroundTransparency=1 lt.TextColor3=C.white lt.Font=Enum.Font.GothamBold lt.TextSize=11 lt.TextXAlignment=Enum.TextXAlignment.Left
local lb=Instance.new("TextButton",setPg) lb.Size=UDim2.new(1,0,0,26) lb.Position=UDim2.new(0,0,0,18) lb.BackgroundColor3=C.btn lb.TextColor3=C.grey lb.Font=Enum.Font.GothamBold lb.TextSize=11 lb.BorderSizePixel=0
Instance.new("UICorner",lb).CornerRadius=UDim.new(0,4) Instance.new("UIStroke",lb).Thickness=1.5 Instance.new("UIStroke",lb).Color=Color3.fromRGB(0,0,0)
lb.MouseButton1Click:Connect(function() lang=(lang=="EN") and "RU" or "EN" saveSettings(lang,ti,transVal) updateLang() end)

local tt=Instance.new("TextLabel",setPg) tt.Size=UDim2.new(1,0,0,16) tt.Position=UDim2.new(0,0,0,52) tt.BackgroundTransparency=1 tt.TextColor3=C.white tt.Font=Enum.Font.GothamBold tt.TextSize=11 tt.TextXAlignment=Enum.TextXAlignment.Left
local tb=Instance.new("TextButton",setPg) tb.Size=UDim2.new(1,0,0,26) tb.Position=UDim2.new(0,0,0,70) tb.BackgroundColor3=C.btn tb.TextColor3=C.grey tb.Font=Enum.Font.GothamBold tb.TextSize=11 tb.BorderSizePixel=0
Instance.new("UICorner",tb).CornerRadius=UDim.new(0,4) Instance.new("UIStroke",tb).Thickness=1.5 Instance.new("UIStroke",tb).Color=Color3.fromRGB(0,0,0)
tb.MouseButton1Click:Connect(function() ti=ti%#themes+1 saveSettings(lang,ti,transVal) applyTheme() end)

local transLabel=Instance.new("TextLabel",setPg) transLabel.Size=UDim2.new(1,0,0,16) transLabel.Position=UDim2.new(0,0,0,104) transLabel.BackgroundTransparency=1 transLabel.TextColor3=C.white transLabel.Font=Enum.Font.GothamBold transLabel.TextSize=11 transLabel.TextXAlignment=Enum.TextXAlignment.Left
local transBar=Instance.new("Frame",setPg) transBar.Size=UDim2.new(1,0,0,20) transBar.Position=UDim2.new(0,0,0,122) transBar.BackgroundColor3=Color3.fromRGB(35,35,35) transBar.BorderSizePixel=0
Instance.new("UICorner",transBar).CornerRadius=UDim.new(0,10) Instance.new("UIStroke",transBar).Thickness=1.5 Instance.new("UIStroke",transBar).Color=Color3.fromRGB(0,0,0)
local transFill=Instance.new("Frame",transBar) transFill.Size=UDim2.new(0,0,1,0) transFill.BackgroundColor3=C.purple transFill.BorderSizePixel=0 Instance.new("UICorner",transFill).CornerRadius=UDim.new(0,10)
local transBtn=Instance.new("TextButton",transBar) transBtn.Size=UDim2.new(0,24,1,0) transBtn.BackgroundColor3=C.white transBtn.Text="" transBtn.BorderSizePixel=0 Instance.new("UICorner",transBtn).CornerRadius=UDim.new(0,12) Instance.new("UIStroke",transBtn).Thickness=1.5 Instance.new("UIStroke",transBtn).Color=Color3.fromRGB(0,0,0)

local function updateTransparency(p) transVal=p saveSettings(lang,ti,transVal) applyTransparency() end
local dragging=false
transBtn.MouseButton1Down:Connect(function() dragging=true end)
transBar.MouseButton1Down:Connect(function(x) dragging=true local bp=transBar.AbsolutePosition.X local bs=transBar.AbsoluteSize.X updateTransparency(math.floor(math.clamp((x-bp)/bs*100,0,100))) end)
game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
game:GetService("UserInputService").InputChanged:Connect(function(i) if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then local bp=transBar.AbsolutePosition.X local bs=transBar.AbsoluteSize.X updateTransparency(math.floor(math.clamp((i.Position.X-bp)/bs*100,0,100))) end end)

-- CHANGELOG
local logTitle=Instance.new("TextLabel",logPg) logTitle.Size=UDim2.new(1,0,0,18) logTitle.BackgroundTransparency=1 logTitle.TextColor3=C.white logTitle.Font=Enum.Font.GothamBold logTitle.TextSize=12 logTitle.TextXAlignment=Enum.TextXAlignment.Left
local logText=Instance.new("TextLabel",logPg) logText.Size=UDim2.new(1,0,0,240) logText.Position=UDim2.new(0,0,0,22) logText.BackgroundColor3=Color3.fromRGB(35,35,35)
logText.Text=[[v8.2:
- Settings are saved!
- Language saved
- Theme saved
- Transparency saved
- EN/RU switch
- 10 themes
- Transparency slider
- All in one file
- Optimized for Delta]]
logText.TextColor3=C.grey logText.Font=Enum.Font.Gotham logText.TextSize=10 logText.TextXAlignment=Enum.TextXAlignment.Left logText.TextYAlignment=Enum.TextYAlignment.Top Instance.new("UICorner",logText).CornerRadius=UDim.new(0,5)

-- INIT
applyTheme() applyTransparency() updateLang()
main.BackgroundTransparency=transVal/100 sidebar.BackgroundTransparency=transVal/100
game.StarterGui:SetCore("SendNotification",{Title="DAMIR HUB",Text=L.loaded,Duration=3})
