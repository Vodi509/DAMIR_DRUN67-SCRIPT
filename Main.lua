local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren())do if v.Name=="DH"or v.Name=="MH"then v:Destroy()end end

local lang="EN"
local T={EN={farm="FARM",car="Looking for car...",resp="Respawning...",des="Destroyed!"}}

-- ЯРКИЕ ЦВЕТА (МИНИМАЛЬНАЯ НАГРУЗКА)
local themes={
	{n="🔵 Blue",primary=Color3.fromRGB(10,20,50),secondary=Color3.fromRGB(15,30,60),accent=Color3.fromRGB(0,150,255)},
	{n="💜 Purple",primary=Color3.fromRGB(40,10,60),secondary=Color3.fromRGB(50,15,70),accent=Color3.fromRGB(200,50,255)},
	{n="💚 Green",primary=Color3.fromRGB(10,50,20),secondary=Color3.fromRGB(15,60,25),accent=Color3.fromRGB(0,255,100)},
	{n="❤️ Red",primary=Color3.fromRGB(60,10,10),secondary=Color3.fromRGB(70,15,15),accent=Color3.fromRGB(255,0,80)},
	{n="🌊 Cyan",primary=Color3.fromRGB(10,50,50),secondary=Color3.fromRGB(15,60,60),accent=Color3.fromRGB(0,255,255)},
	{n="🟡 Yellow",primary=Color3.fromRGB(60,50,0),secondary=Color3.fromRGB(70,60,0),accent=Color3.fromRGB(255,255,0)},
	{n="🟠 Orange",primary=Color3.fromRGB(60,30,0),secondary=Color3.fromRGB(70,40,0),accent=Color3.fromRGB(255,150,0)},
	{n="🔴 Pink",primary=Color3.fromRGB(50,10,40),secondary=Color3.fromRGB(60,15,50),accent=Color3.fromRGB(255,50,150)}
}

local ti=1
local to={0,0.05,0.10,0.15,0.20,0.25,0.30}
local tn={"0%","5%","10%","15%","20%","25%","30%"}
local ti2=3
local tv=to[ti2]

-- СОХРАНЕНИЕ НАСТРОЕК + AURA
local settings={lang="EN",theme=1,transparency=3,auraClicks=0,auraLevel=1,auraDmg=1,auraSpeed=1}
local function loadSettings()
	if writefile and readfile then
		pcall(function()
			local success,data=pcall(function()
				return game:GetService("HttpService"):JSONDecode(readfile("DamirHub_Delta.json"))
			end)
			if success and data then
				settings=data
				lang=settings.lang or "EN"
				ti=settings.theme or 1
				ti2=settings.transparency or 3
				tv=to[ti2]
			end
		end)
	end
end
local function saveSettings()
	if writefile then
		pcall(function()
			writefile("DamirHub_Delta.json",game:GetService("HttpService"):JSONEncode(settings))
		end)
	end
end
loadSettings()

-- МОБИЛЬНЫЙ GUI (ОПТИМИЗИРОВАН ДЛЯ MOBILE)
local sg=Instance.new("ScreenGui",g)
sg.Name="DH"
sg.ResetOnSpawn=false
sg.DisplayOrder=999

-- ВЕРХНЯЯ ПАНЕЛЬ (КОМПАКТНАЯ)
local topBar=Instance.new("Frame",sg)
topBar.Size=UDim2.new(1,0,0,35)
topBar.Position=UDim2.new(0,0,0,0)
topBar.BackgroundColor3=themes[ti].primary
topBar.BackgroundTransparency=tv
topBar.BorderSizePixel=0

local title=Instance.new("TextLabel",topBar)
title.Size=UDim2.new(0.5,0,1,0)
title.BackgroundTransparency=1
title.TextColor3=themes[ti].accent
title.Font=Enum.Font.GothamBold
title.TextSize=10
title.Text="💎 DAMIR v13"
title.TextXAlignment=Enum.TextXAlignment.Left
title.Position=UDim2.new(0,5,0,0)

-- СЕКРЕТНАЯ НЕВИДИМАЯ КНОПКА AURA
local secretBtn=Instance.new("TextButton",topBar)
secretBtn.Size=UDim2.new(0,2,1,0)
secretBtn.Position=UDim2.new(1,-2,0,0)
secretBtn.BackgroundColor3=Color3.fromRGB(255,255,0)
secretBtn.BackgroundTransparency=1
secretBtn.Text=""
secretBtn.BorderSizePixel=0

-- КНОПКИ СВЕРХУ (КОМПАКТНЫЕ)
local themeBtn=Instance.new("TextButton",topBar)
themeBtn.Size=UDim2.new(0,33,1,0)
themeBtn.Position=UDim2.new(1,-89,0,0)
themeBtn.BackgroundColor3=themes[ti].accent
themeBtn.BackgroundTransparency=tv
themeBtn.TextColor3=themes[ti].primary
themeBtn.Font=Enum.Font.GothamBold
themeBtn.TextSize=10
themeBtn.Text="🎨"
themeBtn.BorderSizePixel=0

local opacityBtn=Instance.new("TextButton",topBar)
opacityBtn.Size=UDim2.new(0,33,1,0)
opacityBtn.Position=UDim2.new(1,-46,0,0)
opacityBtn.BackgroundColor3=themes[ti].accent
opacityBtn.BackgroundTransparency=tv
opacityBtn.TextColor3=themes[ti].primary
opacityBtn.Font=Enum.Font.GothamBold
opacityBtn.TextSize=10
opacityBtn.Text="🔦"
opacityBtn.BorderSizePixel=0

-- ОСНОВНЫЕ КНОПКИ (МОБИЛЬНЫЕ РАЗМЕРЫ)
local mainBtn=Instance.new("TextButton",sg)
mainBtn.Size=UDim2.new(0.45,0,0,40)
mainBtn.Position=UDim2.new(0.05,0,0,40)
mainBtn.BackgroundColor3=themes[ti].accent
mainBtn.BackgroundTransparency=tv
mainBtn.TextColor3=themes[ti].primary
mainBtn.Font=Enum.Font.GothamBold
mainBtn.TextSize=10
mainBtn.Text="FARM"
mainBtn.BorderSizePixel=0

local autoBtn=Instance.new("TextButton",sg)
autoBtn.Size=UDim2.new(0.45,0,0,40)
autoBtn.Position=UDim2.new(0.5,0,0,40)
autoBtn.BackgroundColor3=themes[ti].accent
autoBtn.BackgroundTransparency=tv
autoBtn.TextColor3=themes[ti].primary
autoBtn.Font=Enum.Font.GothamBold
autoBtn.TextSize=10
autoBtn.Text="AUTO"
autoBtn.BorderSizePixel=0

local langBtn=Instance.new("TextButton",sg)
langBtn.Size=UDim2.new(0.45,0,0,40)
langBtn.Position=UDim2.new(0.05,0,0,85)
langBtn.BackgroundColor3=themes[ti].accent
langBtn.BackgroundTransparency=tv
langBtn.TextColor3=themes[ti].primary
langBtn.Font=Enum.Font.GothamBold
langBtn.TextSize=10
langBtn.Text="🌐"
langBtn.BorderSizePixel=0

local closeBtn=Instance.new("TextButton",sg)
closeBtn.Size=UDim2.new(0.45,0,0,40)
closeBtn.Position=UDim2.new(0.5,0,0,85)
closeBtn.BackgroundColor3=Color3.fromRGB(255,50,50)
closeBtn.BackgroundTransparency=tv
closeBtn.TextColor3=Color3.fromRGB(255,255,255)
closeBtn.Font=Enum.Font.GothamBold
closeBtn.TextSize=11
closeBtn.Text="✕"
closeBtn.BorderSizePixel=0

-- СТАТУС ПАНЕЛЬ
local statusLabel=Instance.new("TextLabel",sg)
statusLabel.Size=UDim2.new(0.9,-5,0,80)
statusLabel.Position=UDim2.new(0.05,0,0,130)
statusLabel.BackgroundColor3=themes[ti].secondary
statusLabel.BackgroundTransparency=tv
statusLabel.TextColor3=themes[ti].accent
statusLabel.Font=Enum.Font.Gotham
statusLabel.TextSize=8
statusLabel.TextWrapped=true
statusLabel.Text="Status: ✅ Ready\nHits: 0 | Broken: 0"
statusLabel.TextXAlignment=Enum.TextXAlignment.Left
statusLabel.TextYAlignment=Enum.TextYAlignment.Top
statusLabel.BorderSizePixel=0
statusLabel.Padding=UDim.new(0,5)

-- СКРЫТАЯ AURA ПАНЕЛЬ (ОПТИМИЗИРОВАНА)
local auraPanel=Instance.new("Frame",sg)
auraPanel.Size=UDim2.new(0.95,-5,0,280)
auraPanel.Position=UDim2.new(0.025,0,0,130)
auraPanel.BackgroundColor3=Color3.fromRGB(30,30,30)
auraPanel.BackgroundTransparency=0.1
auraPanel.BorderSizePixel=0
auraPanel.Visible=false

local auraTitle=Instance.new("TextLabel",auraPanel)
auraTitle.Size=UDim2.new(1,0,0,18)
auraTitle.BackgroundTransparency=1
auraTitle.TextColor3=Color3.fromRGB(255,255,0)
auraTitle.Font=Enum.Font.GothamBold
auraTitle.TextSize=11
auraTitle.Text="✨ AURA CLICKER ✨"

local auraClickBtn=Instance.new("TextButton",auraPanel)
auraClickBtn.Size=UDim2.new(1,0,0,50)
auraClickBtn.Position=UDim2.new(0,0,0,22)
auraClickBtn.BackgroundColor3=Color3.fromRGB(255,255,0)
auraClickBtn.TextColor3=Color3.fromRGB(0,0,0)
auraClickBtn.Font=Enum.Font.GothamBold
auraClickBtn.TextSize=12
auraClickBtn.Text="⭐ CLICK ⭐\n+1"
auraClickBtn.BorderSizePixel=0

local auraStatsLabel=Instance.new("TextLabel",auraPanel)
auraStatsLabel.Size=UDim2.new(1,0,0,50)
auraStatsLabel.Position=UDim2.new(0,0,0,77)
auraStatsLabel.BackgroundColor3=Color3.fromRGB(50,50,50)
auraStatsLabel.TextColor3=Color3.fromRGB(255,255,0)
auraStatsLabel.Font=Enum.Font.Gotham
auraStatsLabel.TextSize=7
auraStatsLabel.TextWrapped=true
auraStatsLabel.TextXAlignment=Enum.TextXAlignment.Left
auraStatsLabel.BorderSizePixel=0
auraStatsLabel.Padding=UDim.new(0,3)
auraStatsLabel.Text="💎 C: 0 | ⚡ L: 1 | 🔥 D: 1 | ⏱️ S: 1x"

local upgrade1Btn=Instance.new("TextButton",auraPanel)
upgrade1Btn.Size=UDim2.new(0.48,0,0,30)
upgrade1Btn.Position=UDim2.new(0,0,0,132)
upgrade1Btn.BackgroundColor3=Color3.fromRGB(255,100,0)
upgrade1Btn.TextColor3=Color3.fromRGB(255,255,255)
upgrade1Btn.Font=Enum.Font.GothamBold
upgrade1Btn.TextSize=8
upgrade1Btn.Text="🔥+DMG"
upgrade1Btn.BorderSizePixel=0

local upgrade2Btn=Instance.new("TextButton",auraPanel)
upgrade2Btn.Size=UDim2.new(0.48,0,0,30)
upgrade2Btn.Position=UDim2.new(0.52,0,0,132)
upgrade2Btn.BackgroundColor3=Color3.fromRGB(0,200,255)
upgrade2Btn.TextColor3=Color3.fromRGB(255,255,255)
upgrade2Btn.Font=Enum.Font.GothamBold
upgrade2Btn.TextSize=8
upgrade2Btn.Text="⏱️+SPD"
upgrade2Btn.BorderSizePixel=0

local upgrade3Btn=Instance.new("TextButton",auraPanel)
upgrade3Btn.Size=UDim2.new(1,0,0,30)
upgrade3Btn.Position=UDim2.new(0,0,0,167)
upgrade3Btn.BackgroundColor3=Color3.fromRGB(200,0,255)
upgrade3Btn.TextColor3=Color3.fromRGB(255,255,255)
upgrade3Btn.Font=Enum.Font.GothamBold
upgrade3Btn.TextSize=8
upgrade3Btn.Text="💎 LVL UP"
upgrade3Btn.BorderSizePixel=0

local auraAutoBtn=Instance.new("TextButton",auraPanel)
auraAutoBtn.Size=UDim2.new(1,0,0,30)
auraAutoBtn.Position=UDim2.new(0,0,0,202)
auraAutoBtn.BackgroundColor3=Color3.fromRGB(100,255,100)
auraAutoBtn.TextColor3=Color3.fromRGB(0,0,0)
auraAutoBtn.Font=Enum.Font.GothamBold
auraAutoBtn.TextSize=9
auraAutoBtn.Text="🤖 AUTO (Off)"
auraAutoBtn.BorderSizePixel=0

local auraCloseBtn=Instance.new("TextButton",auraPanel)
auraCloseBtn.Size=UDim2.new(1,0,0,25)
auraCloseBtn.Position=UDim2.new(0,0,0,237)
auraCloseBtn.BackgroundColor3=Color3.fromRGB(255,100,100)
auraCloseBtn.TextColor3=Color3.fromRGB(255,255,255)
auraCloseBtn.Font=Enum.Font.GothamBold
auraCloseBtn.TextSize=8
auraCloseBtn.Text="Close"
auraCloseBtn.BorderSizePixel=0

-- AURA ПЕРЕМЕННЫЕ
local auraClicks=settings.auraClicks
local auraLevel=settings.auraLevel
local auraDmg=settings.auraDmg
local auraSpeed=settings.auraSpeed
local auraAutoActive=false

local function updateAuraUI()
	auraClickBtn.Text="⭐ CLICK ⭐\n+"..auraDmg
	local spdDisplay=math.floor(auraSpeed*10)/10
	auraStatsLabel.Text="💎 "..auraClicks.." | ⚡ "..auraLevel.." | 🔥 "..auraDmg.." | ⏱️ "..spdDisplay.."x"
	settings.auraClicks=auraClicks
	settings.auraLevel=auraLevel
	settings.auraDmg=auraDmg
	settings.auraSpeed=auraSpeed
	saveSettings()
end

-- ФУНКЦИЯ ОБНОВЛЕНИЯ ТЕМЫ (ОПТИМИЗИРОВАНА)
local function applyTheme(themeIdx)
	ti=themeIdx
	settings.theme=ti
	tv=to[ti2]
	settings.transparency=ti2
	saveSettings()
	
	local t=themes[ti]
	topBar.BackgroundColor3=t.primary
	topBar.BackgroundTransparency=tv
	title.TextColor3=t.accent
	themeBtn.BackgroundColor3=t.accent
	themeBtn.BackgroundTransparency=tv
	themeBtn.TextColor3=t.primary
	opacityBtn.BackgroundColor3=t.accent
	opacityBtn.BackgroundTransparency=tv
	opacityBtn.TextColor3=t.primary
	mainBtn.BackgroundColor3=t.accent
	mainBtn.BackgroundTransparency=tv
	mainBtn.TextColor3=t.primary
	autoBtn.BackgroundColor3=t.accent
	autoBtn.BackgroundTransparency=tv
	autoBtn.TextColor3=t.primary
	langBtn.BackgroundColor3=t.accent
	langBtn.BackgroundTransparency=tv
	langBtn.TextColor3=t.primary
	closeBtn.BackgroundTransparency=tv
	statusLabel.BackgroundColor3=t.secondary
	statusLabel.BackgroundTransparency=tv
	statusLabel.TextColor3=t.accent
end

-- МОЛОТ ПЕРЕМЕННЫЕ
local ho,ao,hh,br=false,false,0,0
local lastUpdate=tick()
local smashCooldown=0

-- ФУНКЦИЯ ПОИСКА МАШИНЫ (ОПТИМИЗИРОВАНА)
local function gc()
	local c=p.Character
	if not c then return nil end
	local h=c:FindFirstChildOfClass("Humanoid")
	if not h or not h.SeatPart then return nil end
	local cur=h.SeatPart
	for i=1,6 do
		if not cur then break end
		if cur:IsA("Model") then
			if cur.Parent and cur.Parent.Name=="Vehicles" then return cur end
		end
		cur=cur.Parent
	end
	return nil
end

-- ОПТИМИЗИРОВАННЫЙ СМЕШ (УЛУЧШЕННЫЙ)
local function sm()
	local c=gc()
	if not c then return false end
	local r=c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart")
	if not r then return false end
	
	-- Оптимизация: используем меньше физических расчётов
	r.Velocity=Vector3.zero
	r.CFrame=CFrame.new(r.Position.X,115,r.Position.Z)
	wait(0.05)
	r.Velocity=Vector3.new(0,-800,0)
	wait(0.6)
	
	if not c.Parent then br=br+1 return true end
	return false
end

-- ОБНОВЛЕНИЕ СТАТУСА (ОПТИМИЗИРАНО)
local function updateStatus()
	if tick()-lastUpdate>=0.8 then
		statusLabel.Text="Status: "..(ho and "🔨 HAMMER" or ao and "⚡ AUTO" or "✅ Ready").."\nHits: "..hh.." | Broken: "..br
		lastUpdate=tick()
	end
end

-- СЕКРЕТНАЯ КНОПКА
secretBtn.MouseButton1Click:Connect(function()
	auraPanel.Visible=not auraPanel.Visible
	statusLabel.Visible=not statusLabel.Visible
end)

-- AURA CLICK
auraClickBtn.MouseButton1Click:Connect(function()
	auraClicks=auraClicks+auraDmg
	updateAuraUI()
end)

-- UPGRADE 1
upgrade1Btn.MouseButton1Click:Connect(function()
	if auraClicks>=100 then
		auraClicks=auraClicks-100
		auraDmg=auraDmg+1
		updateAuraUI()
	end
end)

-- UPGRADE 2
upgrade2Btn.MouseButton1Click:Connect(function()
	if auraClicks>=150 then
		auraClicks=auraClicks-150
		auraSpeed=auraSpeed+0.5
		updateAuraUI()
	end
end)

-- UPGRADE 3
upgrade3Btn.MouseButton1Click:Connect(function()
	if auraClicks>=250 then
		auraClicks=auraClicks-250
		auraLevel=auraLevel+1
		auraDmg=auraDmg+auraLevel
		updateAuraUI()
	end
end)

-- AUTO AURA
auraAutoBtn.MouseButton1Click:Connect(function()
	auraAutoActive=not auraAutoActive
	auraAutoBtn.Text=(auraAutoActive and "🤖 AUTO (On)" or "🤖 AUTO (Off)")
	auraAutoBtn.BackgroundColor3=(auraAutoActive and Color3.fromRGB(255,100,100) or Color3.fromRGB(100,255,100))
	if auraAutoActive then
		coroutine.wrap(function()
			while auraAutoActive do
				auraClicks=auraClicks+auraDmg
				updateAuraUI()
				wait(0.35/auraSpeed)
			end
		end)()
	end
end)

-- CLOSE AURA
auraCloseBtn.MouseButton1Click:Connect(function()
	auraPanel.Visible=false
	statusLabel.Visible=true
end)

-- HAMMER (ОПТИМИЗИРОВАН)
mainBtn.MouseButton1Click:Connect(function()
	ho=not ho
	if ho then
		if ao then ao=false autoBtn.Text="AUTO" end
		mainBtn.Text="STOP"
		coroutine.wrap(function()
			while ho do
				if sm() then hh=hh+1 end
				updateStatus()
				wait(0.15)
			end
		end)()
	else
		mainBtn.Text="FARM"
		updateStatus()
	end
end)

-- AUTO FARM (ОПТИМИЗИРОВАН)
autoBtn.MouseButton1Click:Connect(function()
	ao=not ao
	if ao then
		if ho then ho=false mainBtn.Text="FARM" end
		autoBtn.Text="STOP"
		coroutine.wrap(function()
			while ao do
				local c=gc()
				if not c then wait(1.2)
				else
					for i=1,10 do
						if not ao then break end
						if sm() then hh=hh+1 end
						updateStatus()
						wait(0.1)
					end
				end
			end
		end)()
	else
		autoBtn.Text="AUTO"
		updateStatus()
	end
end)

-- THEME
themeBtn.MouseButton1Click:Connect(function()
	ti=ti%#themes+1
	applyTheme(ti)
end)

-- OPACITY
opacityBtn.MouseButton1Click:Connect(function()
	ti2=ti2%#to+1
	applyTheme(ti)
end)

-- LANGUAGE
langBtn.MouseButton1Click:Connect(function()
	lang=(lang=="EN")and"RU"or"EN"
	settings.lang=lang
	saveSettings()
	langBtn.Text=(lang=="EN")and"EN"or"RU"
end)

-- CLOSE
closeBtn.MouseButton1Click:Connect(function()sg:Destroy()end)

game.StarterGui:SetCore("SendNotification",{Title="💎 DAMIR HUB v13 MOBILE",Text="✨ Оптимизирован для мобильных устройств!",Duration=2})
