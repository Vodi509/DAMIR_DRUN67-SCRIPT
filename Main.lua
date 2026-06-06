local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren())do if v.Name=="DH"or v.Name=="MH"then v:Destroy()end end

local lang="EN"
local T={EN={farm="FARM",set="SETTINGS",news="NEWS",h="START HAMMER",ho="HAMMER ACTIVE",a="AUTO FARM",ao="AUTO ACTIVE",car="Looking for car...",sit="Sit in a car!",resp="Respawning...",des="Destroyed!"}}

-- ЯРКИЕ ЦВЕТА (ОПТИМИЗИРОВАННЫЕ)
local themes={
	{n="🔵 Neon Blue",primary=Color3.fromRGB(10,20,50),secondary=Color3.fromRGB(15,30,60),accent=Color3.fromRGB(0,150,255)},
	{n="💜 Neon Purple",primary=Color3.fromRGB(40,10,60),secondary=Color3.fromRGB(50,15,70),accent=Color3.fromRGB(200,50,255)},
	{n="💚 Neon Green",primary=Color3.fromRGB(10,50,20),secondary=Color3.fromRGB(15,60,25),accent=Color3.fromRGB(0,255,100)},
	{n="❤️ Neon Red",primary=Color3.fromRGB(60,10,10),secondary=Color3.fromRGB(70,15,15),accent=Color3.fromRGB(255,0,80)},
	{n="🌊 Neon Cyan",primary=Color3.fromRGB(10,50,50),secondary=Color3.fromRGB(15,60,60),accent=Color3.fromRGB(0,255,255)},
	{n="🟡 Neon Yellow",primary=Color3.fromRGB(60,50,0),secondary=Color3.fromRGB(70,60,0),accent=Color3.fromRGB(255,255,0)},
	{n="🟠 Neon Orange",primary=Color3.fromRGB(60,30,0),secondary=Color3.fromRGB(70,40,0),accent=Color3.fromRGB(255,150,0)},
	{n="🔴 Neon Pink",primary=Color3.fromRGB(50,10,40),secondary=Color3.fromRGB(60,15,50),accent=Color3.fromRGB(255,50,150)}
}

local ti=1
local to={0,0.05,0.10,0.15,0.20,0.25,0.30}
local tn={"0%","5%","10%","15%","20%","25%","30%"}
local ti2=3
local tv=to[ti2]

-- СОХРАНЕНИЕ НАСТРОЕК
local settings={lang="EN",theme=1,transparency=3}
local function loadSettings()
	if writefile and readfile then
		pcall(function()
			local success,data=pcall(function()
				return game:GetService("HttpService"):JSONDecode(readfile("DamirHub_Settings.json"))
			end)
			if success and data then
				settings.lang=data.lang or "EN"
				settings.theme=data.theme or 1
				settings.transparency=data.transparency or 3
				lang=settings.lang
				ti=settings.theme
				ti2=settings.transparency
				tv=to[ti2]
			end
		end)
	end
end
local function saveSettings()
	if writefile then
		pcall(function()
			local data=game:GetService("HttpService"):JSONEncode(settings)
			writefile("DamirHub_Settings.json",data)
		end)
	end
end
loadSettings()

-- МОБИЛЬНЫЙ GUI (ОПТИМИЗИРОВАННЫЙ)
local sg=Instance.new("ScreenGui",g)
sg.Name="DH"
sg.ResetOnSpawn=false

-- ВЕРХНЯЯ ПАНЕЛЬ
local topBar=Instance.new("Frame",sg)
topBar.Size=UDim2.new(1,0,0,45)
topBar.Position=UDim2.new(0,0,0,0)
topBar.BackgroundColor3=themes[ti].primary
topBar.BackgroundTransparency=tv
topBar.BorderSizePixel=0
Instance.new("UICorner",topBar).CornerRadius=UDim.new(0,8)

local title=Instance.new("TextLabel",topBar)
title.Size=UDim2.new(0.6,0,1,0)
title.BackgroundTransparency=1
title.TextColor3=themes[ti].accent
title.Font=Enum.Font.GothamBold
title.TextSize=12
title.Text="💎 DAMIR HUB v11"
title.TextXAlignment=Enum.TextXAlignment.Left
title.Position=UDim2.new(0,10,0,0)

-- КНОПКА СМЕНЫ ТЕМЫ
local themeBtn=Instance.new("TextButton",topBar)
themeBtn.Size=UDim2.new(0,40,1,0)
themeBtn.Position=UDim2.new(1,-90,0,0)
themeBtn.BackgroundColor3=themes[ti].accent
themeBtn.BackgroundTransparency=tv
themeBtn.TextColor3=themes[ti].primary
themeBtn.Font=Enum.Font.GothamBold
themeBtn.TextSize=13
themeBtn.Text="🎨"
themeBtn.BorderSizePixel=0
Instance.new("UICorner",themeBtn).CornerRadius=UDim.new(0,6)

-- КНОПКА ПРОЗРАЧНОСТИ
local opacityBtn=Instance.new("TextButton",topBar)
opacityBtn.Size=UDim2.new(0,40,1,0)
opacityBtn.Position=UDim2.new(1,-45,0,0)
opacityBtn.BackgroundColor3=themes[ti].accent
opacityBtn.BackgroundTransparency=tv
opacityBtn.TextColor3=themes[ti].primary
opacityBtn.Font=Enum.Font.GothamBold
opacityBtn.TextSize=13
opacityBtn.Text="🔦"
opacityBtn.BorderSizePixel=0
Instance.new("UICorner",opacityBtn).CornerRadius=UDim.new(0,6)

-- КНОПКИ УПРАВЛЕНИЯ
local mainBtn=Instance.new("TextButton",sg)
mainBtn.Size=UDim2.new(0,95,0,50)
mainBtn.Position=UDim2.new(0,10,0,55)
mainBtn.BackgroundColor3=themes[ti].accent
mainBtn.BackgroundTransparency=tv
mainBtn.TextColor3=themes[ti].primary
mainBtn.Font=Enum.Font.GothamBold
mainBtn.TextSize=12
mainBtn.Text="FARM"
mainBtn.BorderSizePixel=0
Instance.new("UICorner",mainBtn).CornerRadius=UDim.new(0,6)

local autoBtn=Instance.new("TextButton",sg)
autoBtn.Size=UDim2.new(0,95,0,50)
autoBtn.Position=UDim2.new(0,110,0,55)
autoBtn.BackgroundColor3=themes[ti].accent
autoBtn.BackgroundTransparency=tv
autoBtn.TextColor3=themes[ti].primary
autoBtn.Font=Enum.Font.GothamBold
autoBtn.TextSize=12
autoBtn.Text="AUTO"
autoBtn.BorderSizePixel=0
Instance.new("UICorner",autoBtn).CornerRadius=UDim.new(0,6)

local langBtn=Instance.new("TextButton",sg)
langBtn.Size=UDim2.new(0,50,0,50)
langBtn.Position=UDim2.new(1,-65,0,55)
langBtn.BackgroundColor3=themes[ti].accent
langBtn.BackgroundTransparency=tv
langBtn.TextColor3=themes[ti].primary
langBtn.Font=Enum.Font.GothamBold
langBtn.TextSize=12
langBtn.Text="🌐"
langBtn.BorderSizePixel=0
Instance.new("UICorner",langBtn).CornerRadius=UDim.new(0,6)

local closeBtn=Instance.new("TextButton",sg)
closeBtn.Size=UDim2.new(0,50,0,50)
closeBtn.Position=UDim2.new(1,-10,0,55)
closeBtn.BackgroundColor3=Color3.fromRGB(255,50,50)
closeBtn.BackgroundTransparency=tv
closeBtn.TextColor3=Color3.fromRGB(255,255,255)
closeBtn.Font=Enum.Font.GothamBold
closeBtn.TextSize=16
closeBtn.Text="✕"
closeBtn.BorderSizePixel=0
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(0,6)

-- СТАТУС ПАНЕЛЬ
local statusLabel=Instance.new("TextLabel",sg)
statusLabel.Size=UDim2.new(1,-20,0,120)
statusLabel.Position=UDim2.new(0,10,0,110)
statusLabel.BackgroundColor3=themes[ti].secondary
statusLabel.BackgroundTransparency=tv
statusLabel.TextColor3=themes[ti].accent
statusLabel.Font=Enum.Font.Gotham
statusLabel.TextSize=10
statusLabel.TextWrapped=true
statusLabel.TextXAlignment=Enum.TextXAlignment.Left
statusLabel.TextYAlignment=Enum.TextYAlignment.Top
statusLabel.BorderSizePixel=0
Instance.new("UICorner",statusLabel).CornerRadius=UDim.new(0,6)
statusLabel.Text="Status: ✅ Ready\nHits: 0 | Broken: 0\nTheme: "..themes[ti].n

-- NEWS ПАНЕЛЬ
local newsLabel=Instance.new("TextLabel",sg)
newsLabel.Size=UDim2.new(1,-20,0,180)
newsLabel.Position=UDim2.new(0,10,0,235)
newsLabel.BackgroundColor3=themes[ti].secondary
newsLabel.BackgroundTransparency=tv
newsLabel.TextColor3=Color3.fromRGB(240,240,245)
newsLabel.Font=Enum.Font.Gotham
newsLabel.TextSize=9
newsLabel.TextWrapped=true
newsLabel.TextXAlignment=Enum.TextXAlignment.Left
newsLabel.TextYAlignment=Enum.TextYAlignment.Top
newsLabel.BorderSizePixel=0
Instance.new("UICorner",newsLabel).CornerRadius=UDim.new(0,6)
newsLabel.Text=[[📰 v11.0 - МОБИЛЬНАЯ ОПТИМИЗАЦИЯ ✨

✅ НОВОЕ:
• 8 Яркие неоновые темы
• Смена тем в 1 клик
• Регулировка прозрачности
• Языки: EN/RU
• Авто-сохранение настроек

🎨 ТЕМЫ: Neon Blue • Purple • Green • Red • Cyan • Yellow • Orange • Pink

⚡ ОПТИМИЗАЦИЯ:
• Идеально для мобильных
• Минимальная нагрузка
• Быстрая работа на Delta
• Все функции сохранены]]

-- ФУНКЦИЯ ОБНОВЛЕНИЯ ТЕМЫ
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
	newsLabel.BackgroundColor3=t.secondary
	newsLabel.BackgroundTransparency=tv
	statusLabel.Text="Status: ✅ Ready\nHits: 0 | Broken: 0\nTheme: "..t.n.."\nOpacity: "..tn[ti2]
end

-- ОПТИМИЗИРОВАННЫЕ ПЕРЕМЕННЫЕ
local ho,ao,hh,br=false,false,0,0
local lastUpdate=tick()
local updateInterval=0.5

-- ФУНКЦИЯ ПОИСКА МАШИНЫ
local function gc()
	local c=p.Character
	if not c then return nil end
	local h=c:FindFirstChildOfClass("Humanoid")
	if not h or not h.SeatPart then return nil end
	local cur=h.SeatPart
	for i=1,10 do
		if not cur then break end
		if cur:IsA("Model") then
			if cur.Parent and cur.Parent.Name=="Vehicles" then return cur end
		end
		cur=cur.Parent
	end
	return nil
end

-- СМЕШ ФУНКЦИЯ
local function sm()
	local c=gc()
	if not c then return false end
	local r=c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart")
	if not r then return false end
	r.Velocity=Vector3.zero
	r.CFrame=CFrame.new(r.Position.X,150,r.Position.Z)
	wait(0.1)
	r.Velocity=Vector3.new(0,-1200,0)
	wait(0.8)
	if not c.Parent then br=br+1 return true end
	return false
end

-- ОБНОВЛЕНИЕ СТАТУСА
local function updateStatus()
	if tick()-lastUpdate>=updateInterval then
		statusLabel.Text="Status: "..(ho and "🔨 HAMMER" or ao and "⚡ AUTO" or "✅ Ready").."\nHits: "..hh.." | Broken: "..br.."\nTheme: "..themes[ti].n.."\nOpacity: "..tn[ti2]
		lastUpdate=tick()
	end
end

-- HAMMER BUTTON
mainBtn.MouseButton1Click:Connect(function()
	ho=not ho
	if ho then
		if ao then ao=false autoBtn.Text="AUTO" end
		mainBtn.Text="STOP"
		coroutine.wrap(function()
			while ho do
				if sm() then hh=hh+1 end
				updateStatus()
				wait(0.25)
			end
		end)()
	else
		mainBtn.Text="FARM"
		updateStatus()
	end
end)

-- AUTO FARM BUTTON
autoBtn.MouseButton1Click:Connect(function()
	ao=not ao
	if ao then
		if ho then ho=false mainBtn.Text="FARM" end
		autoBtn.Text="STOP"
		coroutine.wrap(function()
			while ao do
				local c=gc()
				if not c then
					statusLabel.Text="Status: 🔄 Respawn...\nHits: "..hh.." | Broken: "..br
					wait(2)
				else
					for i=1,15 do
						if not ao then break end
						if sm() then hh=hh+1 end
						updateStatus()
						wait(0.15)
					end
				end
			end
		end)()
	else
		autoBtn.Text="AUTO"
		updateStatus()
	end
end)

-- THEME SWITCH
themeBtn.MouseButton1Click:Connect(function()
	ti=ti%#themes+1
	applyTheme(ti)
end)

-- OPACITY SWITCH
opacityBtn.MouseButton1Click:Connect(function()
	ti2=ti2%#to+1
	applyTheme(ti)
end)

-- LANGUAGE SWITCH
langBtn.MouseButton1Click:Connect(function()
	lang=(lang=="EN")and"RU"or"EN"
	settings.lang=lang
	saveSettings()
	langBtn.Text=(lang=="EN")and"🌐EN"or"🌐RU"
end)

-- CLOSE BUTTON
closeBtn.MouseButton1Click:Connect(function()sg:Destroy()end)

-- УВЕДОМЛЕНИЕ
game.StarterGui:SetCore("SendNotification",{Title="💎 DAMIR HUB v11",Text="✨ Мобильная версия загружена!",Duration=3})
