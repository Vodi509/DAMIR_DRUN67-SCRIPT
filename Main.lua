local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren())do if v.Name=="DH"or v.Name=="MH"then v:Destroy()end end

local lang="EN"
local T={EN={farm="FARM",set="SETTINGS",car="Looking for car...",sit="Sit in a car!",resp="Respawning...",des="Destroyed!"}}

-- МИНИМАЛИСТИЧНЫЕ ЦВЕТА
local C={
	primary=Color3.fromRGB(15,15,20),
	secondary=Color3.fromRGB(25,25,35),
	accent=Color3.fromRGB(100,200,255),
	text=Color3.fromRGB(240,240,245),
	textMuted=Color3.fromRGB(150,150,160)
}

-- СОХРАНЕНИЕ НАСТРОЕК
local settings={lang="EN"}
local function saveSettings()
	if writefile then pcall(function()
		writefile("DamirHub_Mobile.json",game:GetService("HttpService"):JSONEncode(settings))
	end)end
end
local function loadSettings()
	if readfile then pcall(function()
		settings=game:GetService("HttpService"):JSONDecode(readfile("DamirHub_Mobile.json"))or settings
		lang=settings.lang or "EN"
	end)end
end
loadSettings()

-- МОБИЛЬНЫЙ GUI (упрощенный)
local sg=Instance.new("ScreenGui",g)
sg.Name="DH"
sg.ResetOnSpawn=false

-- КНОПКИ УПРАВЛЕНИЯ (касание)
local mainBtn=Instance.new("TextButton",sg)
mainBtn.Size=UDim2.new(0,90,0,40)
mainBtn.Position=UDim2.new(0,10,0,50)
mainBtn.BackgroundColor3=C.accent
mainBtn.TextColor3=C.primary
mainBtn.Font=Enum.Font.GothamBold
mainBtn.TextSize=11
mainBtn.Text="FARM"
mainBtn.BorderSizePixel=0
Instance.new("UICorner",mainBtn).CornerRadius=UDim.new(0,6)

local autoBtn=Instance.new("TextButton",sg)
autoBtn.Size=UDim2.new(0,90,0,40)
autoBtn.Position=UDim2.new(0,105,0,50)
autoBtn.BackgroundColor3=C.secondary
autoBtn.TextColor3=C.accent
autoBtn.Font=Enum.Font.GothamBold
autoBtn.TextSize=11
autoBtn.Text="AUTO"
autoBtn.BorderSizePixel=0
Instance.new("UICorner",autoBtn).CornerRadius=UDim.new(0,6)

local statusLabel=Instance.new("TextLabel",sg)
statusLabel.Size=UDim2.new(0,300,0,80)
statusLabel.Position=UDim2.new(0,10,0,95)
statusLabel.BackgroundColor3=C.secondary
statusLabel.TextColor3=C.accent
statusLabel.Font=Enum.Font.Gotham
statusLabel.TextSize=10
statusLabel.TextWrapped=true
statusLabel.TextXAlignment=Enum.TextXAlignment.Left
statusLabel.Text="Status: Ready\nHits: 0 | Broken: 0"
statusLabel.BorderSizePixel=0
Instance.new("UICorner",statusLabel).CornerRadius=UDim.new(0,6)

-- ОПТИМИЗИРОВАННЫЕ ПЕРЕМЕННЫЕ
local ho,ao,hh,br=false,false,0,0
local lastUpdate=tick()
local updateInterval=0.5

-- ОПТИМИЗИРОВАННАЯ ФУНКЦИЯ ПОИСКА МАШИНЫ
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

-- ОПТИМИЗИРОВАННЫЙ СМЕШ ФУНКЦИЯ
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

-- ОБНОВЛЕНИЕ СТАТУСА (оптимизировано)
local function updateStatus()
	if tick()-lastUpdate>=updateInterval then
		statusLabel.Text="Status: "..(ho and "HAMMER ACTIVE" or ao and "AUTO FARM" or "Ready").."\nHits: "..hh.." | Broken: "..br
		lastUpdate=tick()
	end
end

-- HAMMER
mainBtn.MouseButton1Click:Connect(function()
	ho=not ho
	if ho then
		if ao then ao=false autoBtn.Text="AUTO" autoBtn.BackgroundColor3=C.secondary end
		mainBtn.Text="STOP"
		mainBtn.BackgroundColor3=C.accent
		
		coroutine.wrap(function()
			while ho do
				if sm() then hh=hh+1 end
				updateStatus()
				wait(0.25)
			end
		end)()
	else
		mainBtn.Text="FARM"
		mainBtn.BackgroundColor3=C.accent
	end
end)

-- AUTO FARM
autoBtn.MouseButton1Click:Connect(function()
	ao=not ao
	if ao then
		if ho then ho=false mainBtn.Text="FARM" mainBtn.BackgroundColor3=C.accent end
		autoBtn.Text="STOP"
		autoBtn.BackgroundColor3=C.accent
		
		coroutine.wrap(function()
			while ao do
				local c=gc()
				if not c then
					statusLabel.Text="Status: Respawning..."
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
		autoBtn.BackgroundColor3=C.secondary
	end
end)

-- ЗАКРЫТИЕ СКРИПТА
local closeBtn=Instance.new("TextButton",sg)
closeBtn.Size=UDim2.new(0,40,0,40)
closeBtn.Position=UDim2.new(0,295,0,50)
closeBtn.BackgroundColor3=Color3.fromRGB(255,100,100)
closeBtn.TextColor3=C.text
closeBtn.Font=Enum.Font.GothamBold
closeBtn.TextSize=16
closeBtn.Text="X"
closeBtn.BorderSizePixel=0
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(0,6)

closeBtn.MouseButton1Click:Connect(function()sg:Destroy()end)

-- УВЕДОМЛЕНИЕ
game.StarterGui:SetCore("SendNotification",{Title="DAMIR HUB MOBILE",Text="✨ Script Loaded!",Duration=3})
