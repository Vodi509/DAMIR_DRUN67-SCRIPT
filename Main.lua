local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren())do if v.Name=="DH"or v.Name=="MH"then v:Destroy()end end

local lang="EN"
local T={EN={farm="FARM",car="Looking for car...",resp="Respawning...",des="Destroyed!"}}

-- СОВРЕМЕННЫЕ ТЕМЫ С ГРАДИЕНТАМИ
local themes={
	{n="🔵 Blue",primary=Color3.fromRGB(20,25,60),secondary=Color3.fromRGB(30,40,90),accent=Color3.fromRGB(100,200,255),glow=Color3.fromRGB(0,150,255)},
	{n="💜 Purple",primary=Color3.fromRGB(50,20,70),secondary=Color3.fromRGB(70,30,100),accent=Color3.fromRGB(220,100,255),glow=Color3.fromRGB(200,50,255)},
	{n="💚 Green",primary=Color3.fromRGB(15,55,25),secondary=Color3.fromRGB(25,75,35),accent=Color3.fromRGB(100,255,150),glow=Color3.fromRGB(0,255,100)},
	{n="❤️ Red",primary=Color3.fromRGB(70,15,20),secondary=Color3.fromRGB(100,20,30),accent=Color3.fromRGB(255,100,120),glow=Color3.fromRGB(255,0,80)},
	{n="🌊 Cyan",primary=Color3.fromRGB(15,55,60),secondary=Color3.fromRGB(25,80,90),accent=Color3.fromRGB(100,255,255),glow=Color3.fromRGB(0,255,255)},
	{n="🟡 Yellow",primary=Color3.fromRGB(70,60,10),secondary=Color3.fromRGB(100,85,15),accent=Color3.fromRGB(255,255,100),glow=Color3.fromRGB(255,255,0)},
	{n="🟠 Orange",primary=Color3.fromRGB(70,35,10),secondary=Color3.fromRGB(100,50,15),accent=Color3.fromRGB(255,180,100),glow=Color3.fromRGB(255,150,0)},
	{n="🔴 Pink",primary=Color3.fromRGB(60,15,50),secondary=Color3.fromRGB(85,20,70),accent=Color3.fromRGB(255,100,180),glow=Color3.fromRGB(255,50,150)}
}

local ti=1
local to={0,0.05,0.10,0.15,0.20,0.25,0.30}
local tn={"0%","5%","10%","15%","20%","25%","30%"}
local ti2=3
local tv=to[ti2]

-- СОХРАНЕНИЕ НАСТРОЕК
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

-- КРАСИВЫЙ ГЛАВНЫЙ GUI
local sg=Instance.new("ScreenGui",g)
sg.Name="DH"
sg.ResetOnSpawn=false
sg.DisplayOrder=999

-- ФОНОВЫЙ ЭФФЕКТ (МЯГКИЙ ГРАДИЕНТ)
local bgFrame=Instance.new("Frame",sg)
bgFrame.Size=UDim2.new(0.3,0,0.5,0)
bgFrame.Position=UDim2.new(0.05,0,0.08,0)
bgFrame.BackgroundColor3=themes[ti].primary
bgFrame.BackgroundTransparency=tv+0.05
bgFrame.BorderSizePixel=0
bgFrame.CornerRadius=UDim.new(0,12)

-- ВЕРХНЯЯ ПАНЕЛЬ С ИКОНКОЙ
local topBar=Instance.new("Frame",bgFrame)
topBar.Size=UDim2.new(1,0,0,50)
topBar.Position=UDim2.new(0,0,0,0)
topBar.BackgroundColor3=themes[ti].accent
topBar.BackgroundTransparency=0.1
topBar.BorderSizePixel=0
topBar.CornerRadius=UDim.new(0,12)

local titleText=Instance.new("TextLabel",topBar)
titleText.Size=UDim2.new(0.7,0,1,0)
titleText.BackgroundTransparency=1
titleText.TextColor3=Color3.fromRGB(255,255,255)
titleText.Font=Enum.Font.GothamBold
titleText.TextSize=14
titleText.Text="💎 DAMIR HUB v13"
titleText.TextXAlignment=Enum.TextXAlignment.Left
titleText.Position=UDim2.new(0,10,0,0)

local versionLabel=Instance.new("TextLabel",topBar)
versionLabel.Size=UDim2.new(0.3,0,1,0)
versionLabel.BackgroundTransparency=1
versionLabel.TextColor3=Color3.fromRGB(200,200,200)
versionLabel.Font=Enum.Font.Gotham
versionLabel.TextSize=9
versionLabel.Text="MOBILE"
versionLabel.TextXAlignment=Enum.TextXAlignment.Right
versionLabel.Position=UDim2.new(0.7,0,0,0)

-- СТАТУС ПАНЕЛЬ (КРАСИВАЯ)
local statusLabel=Instance.new("TextLabel",bgFrame)
statusLabel.Size=UDim2.new(1,-10,0,50)
statusLabel.Position=UDim2.new(0,5,0,55)
statusLabel.BackgroundColor3=themes[ti].secondary
statusLabel.BackgroundTransparency=0.3
statusLabel.TextColor3=themes[ti].accent
statusLabel.Font=Enum.Font.Gotham
statusLabel.TextSize=9
statusLabel.TextWrapped=true
statusLabel.Text="⚡ Status: Ready\n✅ Hits: 0 | 💔 Broken: 0"
statusLabel.TextXAlignment=Enum.TextXAlignment.Left
statusLabel.TextYAlignment=Enum.TextYAlignment.Center
statusLabel.BorderSizePixel=0
statusLabel.Padding=UDim.new(0,8)
statusLabel.CornerRadius=UDim.new(0,8)

-- КНОПКИ В ДВА РЯДА (УЛУЧШЕННЫЕ)
local function createButton(parent, name, pos, color)
	local btn=Instance.new("TextButton",parent)
	btn.Size=UDim2.new(0.45,0,0,38)
	btn.Position=pos
	btn.BackgroundColor3=color
	btn.BackgroundTransparency=0.15
	btn.TextColor3=Color3.fromRGB(255,255,255)
	btn.Font=Enum.Font.GothamBold
	btn.TextSize=11
	btn.Text=name
	btn.BorderSizePixel=0
	btn.CornerRadius=UDim.new(0,8)
	
	-- ЭФФЕКТ НАВЕДЕНИЯ
	btn.MouseEnter:Connect(function()
		btn.BackgroundTransparency=0
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundTransparency=0.15
	end)
	
	return btn
end

-- ПЕРВЫЙ РЯД КНОПОК
local mainBtn=createButton(bgFrame,"🔨 FARM",UDim2.new(0,5,0,110),themes[ti].accent)
local autoBtn=createButton(bgFrame,"⚡ AUTO",UDim2.new(0.5,5,0,110),themes[ti].glow)

-- ВТОРОЙ РЯД КНОПОК
local themeBtn=createButton(bgFrame,"🎨 THEME",UDim2.new(0,5,0,153),themes[ti].accent)
local opacityBtn=createButton(bgFrame,"🔦 OPACITY",UDim2.new(0.5,5,0,153),themes[ti].glow)

-- ТРЕТИЙ РЯД КНОПОК
local langBtn=createButton(bgFrame,"🌐 "..(lang=="EN" and "EN" or "RU"),UDim2.new(0,5,0,196),Color3.fromRGB(100,200,100))
local closeBtn=createButton(bgFrame,"✕ CLOSE",UDim2.new(0.5,5,0,196),Color3.fromRGB(255,80,80))

-- СЕКРЕТНАЯ КНОПКА ДЛЯ AURA
local secretBtn=Instance.new("TextButton",topBar)
secretBtn.Size=UDim2.new(0,15,1,0)
secretBtn.Position=UDim2.new(1,-15,0,0)
secretBtn.BackgroundTransparency=1
secretBtn.Text=""
secretBtn.BorderSizePixel=0

-- КРАСИВАЯ AURA ПАНЕЛЬ
local auraPanel=Instance.new("Frame",sg)
auraPanel.Size=UDim2.new(0.35,0,0,400)
auraPanel.Position=UDim2.new(0.4,0,0.1,0)
auraPanel.BackgroundColor3=Color3.fromRGB(25,25,40)
auraPanel.BackgroundTransparency=0.05
auraPanel.BorderSizePixel=0
auraPanel.CornerRadius=UDim.new(0,12)
auraPanel.Visible=false

-- AURA TITLE
local auraTitleBg=Instance.new("Frame",auraPanel)
auraTitleBg.Size=UDim2.new(1,0,0,45)
auraTitleBg.BackgroundColor3=Color3.fromRGB(255,200,0)
auraTitleBg.BackgroundTransparency=0.2
auraTitleBg.BorderSizePixel=0
auraTitleBg.CornerRadius=UDim.new(0,12)

local auraTitle=Instance.new("TextLabel",auraTitleBg)
auraTitle.Size=UDim2.new(1,0,1,0)
auraTitle.BackgroundTransparency=1
auraTitle.TextColor3=Color3.fromRGB(255,255,255)
auraTitle.Font=Enum.Font.GothamBold
auraTitle.TextSize=13
auraTitle.Text="✨ AURA CLICKER ✨"

-- AURA STATS
local auraStatsLabel=Instance.new("TextLabel",auraPanel)
auraStatsLabel.Size=UDim2.new(1,-10,0,45)
auraStatsLabel.Position=UDim2.new(0,5,0,52)
auraStatsLabel.BackgroundColor3=Color3.fromRGB(50,50,75)
auraStatsLabel.BackgroundTransparency=0.2
auraStatsLabel.TextColor3=Color3.fromRGB(255,255,100)
auraStatsLabel.Font=Enum.Font.Gotham
auraStatsLabel.TextSize=9
auraStatsLabel.TextWrapped=true
auraStatsLabel.TextXAlignment=Enum.TextXAlignment.Left
auraStatsLabel.BorderSizePixel=0
auraStatsLabel.Padding=UDim.new(0,5)
auraStatsLabel.CornerRadius=UDim.new(0,6)
auraStatsLabel.Text="💎 Clicks: 0 | ⚡ Level: 1\n🔥 Damage: 1 | ⏱️ Speed: 1x"

-- AURA CLICK BUTTON (БОЛЬШАЯ КРАСИВАЯ КНОПКА)
local auraClickBtn=Instance.new("TextButton",auraPanel)
auraClickBtn.Size=UDim2.new(1,-10,0,55)
auraClickBtn.Position=UDim2.new(0,5,0,105)
auraClickBtn.BackgroundColor3=Color3.fromRGB(255,220,0)
auraClickBtn.BackgroundTransparency=0.1
auraClickBtn.TextColor3=Color3.fromRGB(0,0,0)
auraClickBtn.Font=Enum.Font.GothamBold
auraClickBtn.TextSize=13
auraClickBtn.Text="⭐ TAP TO CLICK ⭐\n+1"
auraClickBtn.BorderSizePixel=0
auraClickBtn.CornerRadius=UDim.new(0,10)

auraClickBtn.MouseEnter:Connect(function()
	auraClickBtn.BackgroundTransparency=0
end)
auraClickBtn.MouseLeave:Connect(function()
	auraClickBtn.BackgroundTransparency=0.1
end)

-- UPGRADE BUTTONS
local upgrade1Btn=createButton(auraPanel,"🔥 +DMG\n(100)",UDim2.new(0,5,0,170),Color3.fromRGB(255,100,50))
local upgrade2Btn=createButton(auraPanel,"⏱️ +SPD\n(150)",UDim2.new(0.5,5,0,170),Color3.fromRGB(50,150,255))

local upgrade3Btn=Instance.new("TextButton",auraPanel)
upgrade3Btn.Size=UDim2.new(1,-10,0,38)
upgrade3Btn.Position=UDim2.new(0,5,0,215)
upgrade3Btn.BackgroundColor3=Color3.fromRGB(200,50,255)
upgrade3Btn.BackgroundTransparency=0.15
upgrade3Btn.TextColor3=Color3.fromRGB(255,255,255)
upgrade3Btn.Font=Enum.Font.GothamBold
upgrade3Btn.TextSize=10
upgrade3Btn.Text="💎 LEVEL UP (250)"
upgrade3Btn.BorderSizePixel=0
upgrade3Btn.CornerRadius=UDim.new(0,8)

-- AUTO BUTTON
local auraAutoBtn=Instance.new("TextButton",auraPanel)
auraAutoBtn.Size=UDim2.new(1,-10,0,38)
auraAutoBtn.Position=UDim2.new(0,5,0,260)
auraAutoBtn.BackgroundColor3=Color3.fromRGB(100,255,100)
auraAutoBtn.BackgroundTransparency=0.15
auraAutoBtn.TextColor3=Color3.fromRGB(0,0,0)
auraAutoBtn.Font=Enum.Font.GothamBold
auraAutoBtn.TextSize=11
auraAutoBtn.Text="🤖 AUTO (Off)"
auraAutoBtn.BorderSizePixel=0
auraAutoBtn.CornerRadius=UDim.new(0,8)

-- CLOSE AURA
local auraCloseBtn=Instance.new("TextButton",auraPanel)
auraCloseBtn.Size=UDim2.new(1,-10,0,35)
auraCloseBtn.Position=UDim2.new(0,5,0,305)
auraCloseBtn.BackgroundColor3=Color3.fromRGB(255,100,100)
auraCloseBtn.BackgroundTransparency=0.15
auraCloseBtn.TextColor3=Color3.fromRGB(255,255,255)
auraCloseBtn.Font=Enum.Font.GothamBold
auraCloseBtn.TextSize=10
auraCloseBtn.Text="✕ Close Panel"
auraCloseBtn.BorderSizePixel=0
auraCloseBtn.CornerRadius=UDim.new(0,8)

-- AURA ПЕРЕМЕННЫЕ
local auraClicks=settings.auraClicks
local auraLevel=settings.auraLevel
local auraDmg=settings.auraDmg
local auraSpeed=settings.auraSpeed
local auraAutoActive=false

local function updateAuraUI()
	auraClickBtn.Text="⭐ TAP TO CLICK ⭐\n+"..auraDmg
	local spdDisplay=math.floor(auraSpeed*10)/10
	auraStatsLabel.Text="💎 Clicks: "..auraClicks.." | ⚡ Level: "..auraLevel.."\n🔥 Damage: "..auraDmg.." | ⏱️ Speed: "..spdDisplay.."x"
	settings.auraClicks=auraClicks
	settings.auraLevel=auraLevel
	settings.auraDmg=auraDmg
	settings.auraSpeed=auraSpeed
	saveSettings()
end

-- ФУНКЦИЯ ОБНОВЛЕНИЯ ТЕМЫ
local function applyTheme(themeIdx)
	ti=themeIdx
	settings.theme=ti
	tv=to[ti2]
	settings.transparency=ti2
	saveSettings()
	
	local t=themes[ti]
	bgFrame.BackgroundColor3=t.primary
	bgFrame.BackgroundTransparency=tv+0.05
	topBar.BackgroundColor3=t.accent
	titleText.TextColor3=Color3.fromRGB(255,255,255)
	mainBtn.BackgroundColor3=t.accent
	autoBtn.BackgroundColor3=t.glow
	themeBtn.BackgroundColor3=t.accent
	opacityBtn.BackgroundColor3=t.glow
	langBtn.BackgroundColor3=Color3.fromRGB(100,200,100)
	closeBtn.BackgroundColor3=Color3.fromRGB(255,80,80)
	statusLabel.BackgroundColor3=t.secondary
	statusLabel.BackgroundTransparency=0.3
	statusLabel.TextColor3=t.accent
end

-- МОЛОТ ПЕРЕМЕННЫЕ
local ho,ao,hh,br=false,false,0,0
local lastUpdate=tick()
local smashCooldown=0

-- ФУНКЦИЯ ПОИСКА МАШИНЫ
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

-- ОПТИМИЗИРОВАННЫЙ СМЕШ
local function sm()
	local c=gc()
	if not c then return false end
	local r=c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart")
	if not r then return false end
	
	r.Velocity=Vector3.zero
	r.CFrame=CFrame.new(r.Position.X,115,r.Position.Z)
	wait(0.05)
	r.Velocity=Vector3.new(0,-800,0)
	wait(0.6)
	
	if not c.Parent then br=br+1 return true end
	return false
end

-- ОБНОВЛЕНИЕ СТАТУСА
local function updateStatus()
	if tick()-lastUpdate>=0.8 then
		statusLabel.Text="⚡ Status: "..(ho and "🔨 FARMING" or ao and "⚡ AUTO-MODE" or "✅ Ready").."\n✅ Hits: "..hh.." | 💔 Broken: "..br
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

-- HAMMER
mainBtn.MouseButton1Click:Connect(function()
	ho=not ho
	if ho then
		if ao then ao=false autoBtn.Text="⚡ AUTO" end
		mainBtn.Text="⏸ STOP"
		coroutine.wrap(function()
			while ho do
				if sm() then hh=hh+1 end
				updateStatus()
				wait(0.15)
			end
		end)()
	else
		mainBtn.Text="🔨 FARM"
		updateStatus()
	end
end)

-- AUTO FARM
autoBtn.MouseButton1Click:Connect(function()
	ao=not ao
	if ao then
		if ho then ho=false mainBtn.Text="🔨 FARM" end
		autoBtn.Text="⏸ STOP"
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
		autoBtn.Text="⚡ AUTO"
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
	langBtn.Text="🌐 "..(lang=="EN" and "EN" or "RU")
end)

-- CLOSE
closeBtn.MouseButton1Click:Connect(function()sg:Destroy()end)

game.StarterGui:SetCore("SendNotification",{Title="💎 DAMIR HUB v13",Text="✨ Красивый новый GUI загружен!",Duration=2})
