local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren())do if v.Name=="DH"or v.Name=="MH"then v:Destroy()end end

local lang="EN"
local T={EN={farm="FARM",set="SETTINGS",car="Looking for car...",sit="Sit in a car!",resp="Respawning...",des="Destroyed!"}}

-- ЯРКИЕ ЦВЕТА (ОПТИМИЗИРОВАННЫЕ)
local themes={
	{name="🔵 Neon Blue",bg=Color3.fromRGB(10,20,50),btn=Color3.fromRGB(0,150,255),txt=Color3.fromRGB(255,255,255)},
	{name="💜 Neon Purple",bg=Color3.fromRGB(40,10,60),btn=Color3.fromRGB(200,50,255),txt=Color3.fromRGB(255,255,255)},
	{name="💚 Neon Green",bg=Color3.fromRGB(10,50,20),btn=Color3.fromRGB(0,255,100),txt=Color3.fromRGB(0,0,0)},
	{name="❤️ Neon Red",bg=Color3.fromRGB(60,10,10),btn=Color3.fromRGB(255,0,80),txt=Color3.fromRGB(255,255,255)},
	{name="🌊 Neon Cyan",bg=Color3.fromRGB(10,50,50),btn=Color3.fromRGB(0,255,255),txt=Color3.fromRGB(0,0,0)},
	{name="🟡 Neon Yellow",bg=Color3.fromRGB(60,50,0),btn=Color3.fromRGB(255,255,0),txt=Color3.fromRGB(0,0,0)},
	{name="🟠 Neon Orange",bg=Color3.fromRGB(60,30,0),btn=Color3.fromRGB(255,150,0),txt=Color3.fromRGB(0,0,0)},
	{name="🔴 Neon Pink",bg=Color3.fromRGB(50,10,40),btn=Color3.fromRGB(255,50,150),txt=Color3.fromRGB(255,255,255)}
}

local currentTheme=1

-- СОХРАНЕНИЕ НАСТРОЕК
local settings={lang="EN",theme=1}
local function saveSettings()
	if writefile then pcall(function()
		writefile("DamirHub_Mobile.json",game:GetService("HttpService"):JSONEncode(settings))
	end)end
end
local function loadSettings()
	if readfile then pcall(function()
		settings=game:GetService("HttpService"):JSONDecode(readfile("DamirHub_Mobile.json"))or settings
		lang=settings.lang or "EN"
		currentTheme=settings.theme or 1
	end)end
end
loadSettings()

-- МОБИЛЬНЫЙ GUI
local sg=Instance.new("ScreenGui",g)
sg.Name="DH"
sg.ResetOnSpawn=false

-- ВЕРХНЯЯ ПАНЕЛЬ
local topBar=Instance.new("Frame",sg)
topBar.Size=UDim2.new(1,0,0,45)
topBar.Position=UDim2.new(0,0,0,0)
topBar.BackgroundColor3=themes[currentTheme].bg
topBar.BorderSizePixel=0

-- НАЗВАНИЕ ТЕМЫ
local themeLabel=Instance.new("TextLabel",topBar)
themeLabel.Size=UDim2.new(0.5,0,1,0)
themeLabel.BackgroundTransparency=1
themeLabel.TextColor3=themes[currentTheme].btn
themeLabel.Font=Enum.Font.GothamBold
themeLabel.TextSize=12
themeLabel.Text=themes[currentTheme].name
themeLabel.TextXAlignment=Enum.TextXAlignment.Left
themeLabel.Position=UDim2.new(0,10,0,0)

-- КНОПКА СМЕНЫ ТЕМЫ
local themeBtn=Instance.new("TextButton",topBar)
themeBtn.Size=UDim2.new(0,45,1,0)
themeBtn.Position=UDim2.new(1,-50,0,0)
themeBtn.BackgroundColor3=themes[currentTheme].btn
themeBtn.TextColor3=themes[currentTheme].txt
themeBtn.Font=Enum.Font.GothamBold
themeBtn.TextSize=14
themeBtn.Text="🎨"
themeBtn.BorderSizePixel=0
Instance.new("UICorner",themeBtn).CornerRadius=UDim.new(0,4)

-- КНОПКИ УПРАВЛЕНИЯ
local mainBtn=Instance.new("TextButton",sg)
mainBtn.Size=UDim2.new(0,100,0,50)
mainBtn.Position=UDim2.new(0,10,0,55)
mainBtn.BackgroundColor3=themes[currentTheme].btn
mainBtn.TextColor3=themes[currentTheme].txt
mainBtn.Font=Enum.Font.GothamBold
mainBtn.TextSize=13
mainBtn.Text="FARM"
mainBtn.BorderSizePixel=0
Instance.new("UICorner",mainBtn).CornerRadius=UDim.new(0,6)

local autoBtn=Instance.new("TextButton",sg)
autoBtn.Size=UDim2.new(0,100,0,50)
autoBtn.Position=UDim2.new(0,115,0,55)
autoBtn.BackgroundColor3=themes[currentTheme].btn
autoBtn.TextColor3=themes[currentTheme].txt
autoBtn.Font=Enum.Font.GothamBold
autoBtn.TextSize=13
autoBtn.Text="AUTO"
autoBtn.BorderSizePixel=0
Instance.new("UICorner",autoBtn).CornerRadius=UDim.new(0,6)

local closeBtn=Instance.new("TextButton",sg)
closeBtn.Size=UDim2.new(0,50,0,50)
closeBtn.Position=UDim2.new(1,-60,0,55)
closeBtn.BackgroundColor3=Color3.fromRGB(255,50,50)
closeBtn.TextColor3=Color3.fromRGB(255,255,255)
closeBtn.Font=Enum.Font.GothamBold
closeBtn.TextSize=16
closeBtn.Text="✕"
closeBtn.BorderSizePixel=0
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(0,6)

-- СТАТУС ПАНЕЛЬ
local statusLabel=Instance.new("TextLabel",sg)
statusLabel.Size=UDim2.new(1,-20,0,100)
statusLabel.Position=UDim2.new(0,10,0,110)
statusLabel.BackgroundColor3=themes[currentTheme].bg
statusLabel.TextColor3=themes[currentTheme].btn
statusLabel.Font=Enum.Font.Gotham
statusLabel.TextSize=11
statusLabel.TextWrapped=true
statusLabel.TextXAlignment=Enum.TextXAlignment.Left
statusLabel.TextYAlignment=Enum.TextYAlignment.Top
statusLabel.BorderSizePixel=0
Instance.new("UICorner",statusLabel).CornerRadius=UDim.new(0,6)
statusLabel.Text="Status: Ready\nHits: 0 | Broken: 0\nTheme: "..themes[currentTheme].name

-- ФУНКЦИЯ СМЕНЫ ТЕМЫ
local function applyTheme(themeIdx)
	currentTheme=themeIdx
	settings.theme=currentTheme
	saveSettings()
	
	local t=themes[currentTheme]
	
	topBar.BackgroundColor3=t.bg
	themeLabel.TextColor3=t.btn
	themeLabel.Text=t.name
	themeBtn.BackgroundColor3=t.btn
	themeBtn.TextColor3=t.txt
	
	mainBtn.BackgroundColor3=t.btn
	mainBtn.TextColor3=t.txt
	autoBtn.BackgroundColor3=t.btn
	autoBtn.TextColor3=t.txt
	
	statusLabel.BackgroundColor3=t.bg
	statusLabel.TextColor3=t.btn
	statusLabel.Text="Status: Ready\nHits: 0 | Broken: 0\nTheme: "..t.name
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
	
	if not c.Parent then 
		br=br+1 
		return true 
	end
	return false
end

-- ОБНОВЛЕНИЕ СТАТУСА
local function updateStatus()
	if tick()-lastUpdate>=updateInterval then
		statusLabel.Text="Status: "..(ho and "🔨 HAMMER ACTIVE" or ao and "⚡ AUTO FARM" or "✅ Ready").."\nHits: "..hh.." | Broken: "..br.."\nTheme: "..themes[currentTheme].name
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
					statusLabel.Text="Status: 🔄 Respawning...\nHits: "..hh.." | Broken: "..br.."\nTheme: "..themes[currentTheme].name
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

-- THEME SWITCH BUTTON
local themeIndex=currentTheme
themeBtn.MouseButton1Click:Connect(function()
	themeIndex=themeIndex%#themes+1
	applyTheme(themeIndex)
end)

-- CLOSE BUTTON
closeBtn.MouseButton1Click:Connect(function()sg:Destroy()end)

-- УВЕДОМЛЕНИЕ
game.StarterGui:SetCore("SendNotification",{Title="🎨 DAMIR HUB MOBILE",Text="✨ Яркий интерфейс загружен!",Duration=3})
