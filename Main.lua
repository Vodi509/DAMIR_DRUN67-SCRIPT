local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren())do if v.Name=="DH"or v.Name=="MH"then v:Destroy()end end

local lang="EN"
local T={EN={farm="FARM",set="SETTINGS",news="NEWS",h="START HAMMER",ho="HAMMER ACTIVE",a="AUTO FARM",ao="AUTO ACTIVE",car="Looking for car...",sit="Sit in a car!",resp="Respawning...",des="Destroyed![...]

-- СОВРЕМЕННЫЕ ЦВЕТА
local C={
	primary=Color3.fromRGB(15,15,20),
	secondary=Color3.fromRGB(25,25,35),
	accent=Color3.fromRGB(100,200,255),
	accentHover=Color3.fromRGB(120,220,255),
	danger=Color3.fromRGB(255,100,100),
	success=Color3.fromRGB(100,255,150),
	warning=Color3.fromRGB(255,180,80),
	text=Color3.fromRGB(240,240,245),
	textMuted=Color3.fromRGB(150,150,160),
	border=Color3.fromRGB(50,50,70)
}

-- СОВРЕМЕННЫЕ ТЕМЫ
local th={
	{n="Dark Blue",primary=Color3.fromRGB(15,15,20),secondary=Color3.fromRGB(25,25,35),accent=Color3.fromRGB(100,200,255)},
	{n="Neon Purple",primary=Color3.fromRGB(20,10,30),secondary=Color3.fromRGB(30,15,45),accent=Color3.fromRGB(200,100,255)},
	{n="Cyber Green",primary=Color3.fromRGB(10,25,15),secondary=Color3.fromRGB(15,40,25),accent=Color3.fromRGB(100,255,150)},
	{n="Dark Red",primary=Color3.fromRGB(30,10,10),secondary=Color3.fromRGB(45,15,15),accent=Color3.fromRGB(255,100,100)},
	{n="Ocean",primary=Color3.fromRGB(10,20,35),secondary=Color3.fromRGB(15,30,50),accent=Color3.fromRGB(100,180,255)},
	{n="Midnight",primary=Color3.fromRGB(5,5,15),secondary=Color3.fromRGB(15,15,30),accent=Color3.fromRGB(150,150,255)},
	{n="Forest",primary=Color3.fromRGB(12,22,15),secondary=Color3.fromRGB(20,35,25),accent=Color3.fromRGB(120,255,180)},
	{n="Sunset",primary=Color3.fromRGB(40,20,10),secondary=Color3.fromRGB(60,30,15),accent=Color3.fromRGB(255,150,80)}
}

local ti=1
local to={0,0.05,0.10,0.15,0.20,0.25,0.30}
local tn={"0%","5%","10%","15%","20%","25%","30%"}
local ti2=3
local tv=to[ti2]

-- СОХРАНЕНИЕ НАСТРОЕК
local settings = {
	lang = "EN",
	theme = 1,
	transparency = 3
}

local function loadSettings()
	if writefile and readfile then
		pcall(function()
			local success, data = pcall(function()
				return game:GetService("HttpService"):JSONDecode(readfile("DamirHub_Settings.json"))
			end)
			if success and data then
				settings.lang = data.lang or "EN"
				settings.theme = data.theme or 1
				settings.transparency = data.transparency or 3
				lang = settings.lang
				ti = settings.theme
				ti2 = settings.transparency
				tv = to[ti2]
			end
		end)
	end
end

local function saveSettings()
	if writefile then
		pcall(function()
			local data = game:GetService("HttpService"):JSONEncode(settings)
			writefile("DamirHub_Settings.json", data)
		end)
	end
end

loadSettings()

-- СОВРЕМЕННЫЙ GUI
local sg=Instance.new("ScreenGui",g)
sg.Name="DH"
sg.ResetOnSpawn=false

-- МИНИМИЗИРОВАННАЯ КНОПКА
local mini=Instance.new("Frame",sg)
mini.Name="MH"
mini.Size=UDim2.new(0,180,0,45)
mini.Position=UDim2.new(0.02,0,0.1,0)
mini.BackgroundColor3=th[ti].secondary
mini.BackgroundTransparency=tv
mini.BorderSizePixel=0
Instance.new("UICorner",mini).CornerRadius=UDim.new(0,12)
Instance.new("UIStroke",mini).Color=th[ti].accent
Instance.new("UIStroke",mini).Thickness=2

local rBtn=Instance.new("TextButton",mini)
rBtn.Size=UDim2.new(1,0,1,0)
rBtn.BackgroundTransparency=1
rBtn.Text="💎 DAMIR HUB"
rBtn.TextColor3=C.text
rBtn.Font=Enum.Font.GothamBold
rBtn.TextSize=13

-- ГЛАВНОЕ ОКНО
local m=Instance.new("Frame",sg)
m.Size=UDim2.new(0,600,0,500)
m.Position=UDim2.new(0.5,-300,0.5,-250)
m.BackgroundColor3=th[ti].primary
m.BackgroundTransparency=tv
m.BorderSizePixel=0
m.Active=true
m.Draggable=true
Instance.new("UICorner",m).CornerRadius=UDim.new(0,16)
Instance.new("UIStroke",m).Color=th[ti].accent
Instance.new("UIStroke",m).Thickness=2

-- ЗАГОЛОВОК
local hdr=Instance.new("Frame",m)
hdr.Size=UDim2.new(1,0,0,50)
hdr.BackgroundColor3=th[ti].secondary
hdr.BackgroundTransparency=tv
hdr.BorderSizePixel=0
Instance.new("UICorner",hdr).CornerRadius=UDim.new(0,16)
Instance.new("UIGradient",hdr).Color=ColorSequence.new({
	ColorSequenceKeypoint.new(0,th[ti].accent),
	ColorSequenceKeypoint.new(1,th[ti].secondary)
})

local ht=Instance.new("TextLabel",hdr)
ht.Size=UDim2.new(1,-70,1,0)
ht.Position=UDim2.new(0,15,0,0)
ht.BackgroundTransparency=1
ht.Text="💎 DAMIR HUB v10"
ht.TextColor3=C.text
ht.Font=Enum.Font.GothamBold
ht.TextSize=16

-- КНОПКА МИНИМИЗИРОВАТЬ
local minB=Instance.new("TextButton",hdr)
minB.Size=UDim2.new(0,35,0,35)
minB.Position=UDim2.new(1,-85,0,7.5)
minB.BackgroundColor3=th[ti].accent
minB.Text="−"
minB.TextColor3=C.primary
minB.Font=Enum.Font.GothamBold
minB.TextSize=20
minB.BorderSizePixel=0
Instance.new("UICorner",minB).CornerRadius=UDim.new(0,8)

-- КНОПКА ЗАКРЫТЬ
local clB=Instance.new("TextButton",hdr)
clB.Size=UDim2.new(0,35,0,35)
clB.Position=UDim2.new(1,-40,0,7.5)
clB.BackgroundColor3=C.danger
clB.Text="✕"
clB.TextColor3=C.text
clB.Font=Enum.Font.GothamBold
clB.TextSize=16
clB.BorderSizePixel=0
Instance.new("UICorner",clB).CornerRadius=UDim.new(0,8)

minB.MouseButton1Click:Connect(function()m.Visible=false mini.Visible=true end)
rBtn.MouseButton1Click:Connect(function()m.Visible=true mini.Visible=false end)
clB.MouseButton1Click:Connect(function()sg:Destroy()end)

-- БОКОВАЯ ПАНЕЛЬ
local s=Instance.new("Frame",m)
s.Size=UDim2.new(0,150,1,-50)
s.Position=UDim2.new(0,0,0,50)
s.BackgroundColor3=th[ti].secondary
s.BackgroundTransparency=tv
s.BorderSizePixel=0

-- ОСНОВНОЙ КОНТЕНТ
local cn=Instance.new("Frame",m)
cn.Size=UDim2.new(1,-150,1,-50)
cn.Position=UDim2.new(0,150,0,50)
cn.BackgroundColor3=th[ti].primary
cn.BackgroundTransparency=1
cn.BorderSizePixel=0

local pgs={}
local bts={}

local function at(y,txt)
	local bt=Instance.new("TextButton",s)
	bt.Size=UDim2.new(1,-10,0,40)
	bt.Position=UDim2.new(0,5,0,y)
	bt.BackgroundColor3=th[ti].secondary
	bt.Font=Enum.Font.GothamBold
	bt.TextSize=12
	bt.BorderSizePixel=0
	bt.Text=txt
	bt.TextColor3=C.textMuted
	Instance.new("UICorner",bt).CornerRadius=UDim.new(0,8)
	Instance.new("UIStroke",bt).Color=th[ti].accent
	Instance.new("UIStroke",bt).Thickness=1.5
	
	local pg=Instance.new("Frame",cn)
	pg.Size=UDim2.new(1,-20,1,-20)
	pg.Position=UDim2.new(0,10,0,10)
	pg.BackgroundTransparency=1
	pg.Visible=false
	
	bt.MouseButton1Click:Connect(function()
		for _,b in pairs(bts)do 
			b.BackgroundColor3=th[ti].secondary
			b.TextColor3=C.textMuted
		end 
		for _,p in pairs(pgs)do p.Visible=false end 
		bt.BackgroundColor3=th[ti].accent
		bt.TextColor3=C.primary
		pg.Visible=true
	end)
	
	table.insert(bts,bt)
	table.insert(pgs,pg)
	return bt,pg
end

local fbt,fpg=at(10,"🔨 FARM")
local sbt,spg=at(55,"⚙️ SETTINGS")
local lbt,lpg=at(100,"📰 NEWS")

bts[1].BackgroundColor3=th[ti].accent
bts[1].TextColor3=C.primary
pgs[1].Visible=true

-- ===== FARM PAGE =====
local ft=Instance.new("TextLabel",fpg)
ft.Size=UDim2.new(1,0,0,20)
ft.BackgroundTransparency=1
ft.Text="🔨 MOLOT v10"
ft.TextColor3=th[ti].accent
ft.Font=Enum.Font.GothamBold
ft.TextSize=14

local cb=Instance.new("Frame",fpg)
cb.Size=UDim2.new(1,0,0,35)
cb.Position=UDim2.new(0,0,0,25)
cb.BackgroundColor3=th[ti].secondary
Instance.new("UICorner",cb).CornerRadius=UDim.new(0,8)
Instance.new("UIStroke",cb).Color=th[ti].accent
Instance.new("UIStroke",cb).Thickness=1

local cl=Instance.new("TextLabel",cb)
cl.Size=UDim2.new(1,-14,1,0)
cl.Position=UDim2.new(0,7,0,0)
cl.BackgroundTransparency=1
cl.Text=T[lang].car
cl.TextColor3=C.text
cl.Font=Enum.Font.Gotham
cl.TextSize=11

local sl=Instance.new("TextLabel",fpg)
sl.Size=UDim2.new(1,0,0,16)
sl.Position=UDim2.new(0,0,0,65)
sl.BackgroundTransparency=1
sl.Text="Hits: 0 | Broken: 0 | Auto: 0"
sl.TextColor3=th[ti].accent
sl.Font=Enum.Font.Gotham
sl.TextSize=10

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

local hb=Instance.new("TextButton",fpg)
hb.Size=UDim2.new(1,0,0,40)
hb.Position=UDim2.new(0,0,0,85)
hb.BackgroundColor3=C.success
hb.Font=Enum.Font.GothamBold
hb.TextSize=12
hb.BorderSizePixel=0
hb.Text="▶ START HAMMER"
hb.TextColor3=C.primary
Instance.new("UICorner",hb).CornerRadius=UDim.new(0,8)

local ab=Instance.new("TextButton",fpg)
ab.Size=UDim2.new(1,0,0,40)
ab.Position=UDim2.new(0,0,0,130)
ab.BackgroundColor3=th[ti].accent
ab.Font=Enum.Font.GothamBold
ab.TextSize=12
ab.BorderSizePixel=0
ab.Text="⚡ AUTO FARM"
ab.TextColor3=C.primary
Instance.new("UICorner",ab).CornerRadius=UDim.new(0,8)

local hi=Instance.new("TextLabel",fpg)
hi.Size=UDim2.new(1,0,0,14)
hi.Position=UDim2.new(0,0,0,175)
hi.BackgroundTransparency=1
hi.Text=(lang=="EN")and"💡 If broken - rejoin"or"💡 Сломалось - перезайди"
hi.TextColor3=C.textMuted
hi.Font=Enum.Font.Gotham
hi.TextSize=9

hb.MouseButton1Click:Connect(function()
	ho=not ho
	if ho then 
		if ao then ao=false ab.Text="⚡ AUTO FARM" ab.TextColor3=C.primary ab.BackgroundColor3=th[ti].accent end 
		hb.Text="■ HAMMER ACTIVE" 
		hb.TextColor3=C.text
		hb.BackgroundColor3=C.success
		coroutine.wrap(function()while ho do sm()hh=hh+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy wait(0.3)end end)()
	else 
		hb.Text="▶ START HAMMER" 
		hb.TextColor3=C.primary
		hb.BackgroundColor3=C.success
	end
end)

ab.MouseButton1Click:Connect(function()
	ao=not ao
	if ao then 
		if ho then ho=false hb.Text="▶ START HAMMER" hb.TextColor3=C.primary hb.BackgroundColor3=C.success end 
		ab.Text="⚡ AUTO ACTIVE" 
		ab.TextColor3=C.text
		ab.BackgroundColor3=th[ti].accent
		coroutine.wrap(function()while ao do local c=gc()
			if not c then cl.Text=T[lang].resp wait(3)
			else local d=false for i=1,20 do if not ao then break end d=sm()hh=hh+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy if d then break end wait(0.2)end
				if d then cy=cy+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy cl.Text=T[lang].des wait(1)cl.Text=T[lang].resp wait(3)end
			end
		end end)()
	else 
		ab.Text="⚡ AUTO FARM" 
		ab.TextColor3=C.primary
		ab.BackgroundColor3=th[ti].accent
	end
end)

-- ===== SETTINGS PAGE =====
local function createButton(parent, y, text, callback)
	local btn=Instance.new("TextButton",parent)
	btn.Size=UDim2.new(1,0,0,35)
	btn.Position=UDim2.new(0,0,0,y)
	btn.BackgroundColor3=th[ti].secondary
	btn.Font=Enum.Font.GothamBold
	btn.TextSize=11
	btn.BorderSizePixel=0
	btn.Text=text
	btn.TextColor3=C.text
	Instance.new("UICorner",btn).CornerRadius=UDim.new(0,8)
	Instance.new("UIStroke",btn).Color=th[ti].accent
	Instance.new("UIStroke",btn).Thickness=1.5
	btn.MouseButton1Click:Connect(callback)
	return btn
end

local lb=createButton(spg,5,"🌐 Language: EN",function()
	lang=(lang=="EN")and"RU"or"EN"
	settings.lang=lang
	saveSettings()
	lb.Text="🌐 Language: "..lang
end)

local tt=Instance.new("TextLabel",spg)
tt.Size=UDim2.new(1,0,0,16)
tt.Position=UDim2.new(0,0,0,45)
tt.BackgroundTransparency=1
tt.Text="🎨 Theme: "..th[ti].name
tt.TextColor3=th[ti].accent
tt.Font=Enum.Font.GothamBold
tt.TextSize=10

local tb=createButton(spg,63,"🎨 NEXT THEME",function()
	ti=ti%#th+1
	settings.theme=ti
	m.BackgroundColor3=th[ti].primary
	s.BackgroundColor3=th[ti].secondary
	hdr.BackgroundColor3=th[ti].secondary
	mini.BackgroundColor3=th[ti].secondary
	tt.Text="🎨 Theme: "..th[ti].name
	-- Update all UI elements
	for _,b in pairs(bts) do
		b.BackgroundColor3=th[ti].secondary
	end
	saveSettings()
end)

local tl=Instance.new("TextLabel",spg)
tl.Size=UDim2.new(1,0,0,16)
tl.Position=UDim2.new(0,0,0,103)
tl.BackgroundTransparency=1
tl.Text="🔦 Transparency: "..tn[ti2]
tl.TextColor3=th[ti].accent
tl.Font=Enum.Font.GothamBold
tl.TextSize=10

local trBtn=createButton(spg,121,"🔦 CHANGE OPACITY",function()
	ti2=ti2%#to+1
	tv=to[ti2]
	settings.transparency=ti2
	m.BackgroundTransparency=tv
	s.BackgroundTransparency=tv
	hdr.BackgroundTransparency=tv
	mini.BackgroundTransparency=tv
	tl.Text="🔦 Transparency: "..tn[ti2]
	saveSettings()
end)

-- ===== NEWS PAGE =====
local lgt=Instance.new("TextLabel",lpg)
lgt.Size=UDim2.new(1,0,0,20)
lgt.BackgroundTransparency=1
lgt.Text="📰 WHATS NEW"
lgt.TextColor3=th[ti].accent
lgt.Font=Enum.Font.GothamBold
lgt.TextSize=14

local lgc=Instance.new("TextLabel",lpg)
lgc.Size=UDim2.new(1,0,0,420)
lgc.Position=UDim2.new(0,0,0,25)
lgc.BackgroundColor3=th[ti].secondary
lgc.TextColor3=C.text
lgc.Font=Enum.Font.Gotham
lgc.TextSize=11
lgc.TextWrapped=true
lgc.TextXAlignment=Enum.TextXAlignment.Left
lgc.TextYAlignment=Enum.TextYAlignment.Top
Instance.new("UICorner",lgc).CornerRadius=UDim.new(0,8)
Instance.new("UIStroke",lgc).Color=th[ti].accent
Instance.new("UIStroke",lgc).Thickness=1
lgc.Padding=UDim.new(0,10)

lgc.Text=[[v10.0 - MODERN UPDATE ✨

✅ NEW FEATURES:
• Modern Dark UI Design
• 8 Beautiful Color Themes
• Smooth Gradient Header
• Enhanced Animations
• Settings Auto-Save ⭐

🎨 THEMES:
🔵 Dark Blue | 💜 Neon Purple
💚 Cyber Green | ❤️ Dark Red
🌊 Ocean | 💙 Midnight
🌲 Forest | 🌅 Sunset

🚀 IMPROVEMENTS:
• Better Button Styling
• Improved Transparency
• Smooth Transitions
• Modern Gradients
• Auto-Save Settings

💡 TIP: Your settings are automatically 
saved and restored on reload!]]

local function ul()
	local L=T[lang]
	fbt.Text="🔨 FARM"
	sbt.Text="⚙️ SETTINGS"
	lbt.Text="📰 NEWS"
	hi.Text=(lang=="EN")and"💡 If broken - rejoin"or"💡 Сломалось - перезайди"
	lb.Text="🌐 Language: "..lang
end

ul()
game.StarterGui:SetCore("SendNotification",{Title="💎 DAMIR HUB v10",Text="✨ Modern UI Loaded!",Duration=5})
