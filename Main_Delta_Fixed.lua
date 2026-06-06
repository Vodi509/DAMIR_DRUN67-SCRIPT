-- DAMIR HUB v12 DELTA - ОПТИМИЗИРОВАННАЯ ВЕРСИЯ
-- Исправлено для работы в Delta exploit

-- ✅ ИНИЦИАЛИЗАЦИЯ БЕЗОПАСНАЯ
local success, p = pcall(function() return game.Players.LocalPlayer end)
if not success or not p then
    game.StarterGui:SetCore("SendNotification", {Title="❌ ОШИБКА", Text="Скрипт должен быть загружен в Delta!", Duration=3})
    return
end

local g = p:WaitForChild("PlayerGui", 10)
if not g then
    game.StarterGui:SetCore("SendNotification", {Title="❌ ОШИБКА", Text="PlayerGui не найден!", Duration=3})
    return
end

-- ОЧИСТКА СТАРОГО GUI
for _, v in pairs(g:GetChildren()) do
    if v.Name == "DH" or v.Name == "MH" then 
        pcall(function() v:Destroy() end)
    end 
end

-- ЯЗЫК И НАСТРОЙКИ
local lang = "EN"
local T = {
    EN = {farm = "FARM", car = "Looking for car...", resp = "Respawning...", des = "Destroyed!"},
    RU = {farm = "ФЕРМА", car = "Поиск машины...", resp = "Возрождение...", des = "Уничтожено!"}
}

-- ТЕМЫ С ОПТИМИЗАЦИЕЙ
local themes = {
    {n="🔵 Blue", primary=Color3.fromRGB(10,20,50), secondary=Color3.fromRGB(15,30,60), accent=Color3.fromRGB(0,150,255)},
    {n="💜 Purple", primary=Color3.fromRGB(40,10,60), secondary=Color3.fromRGB(50,15,70), accent=Color3.fromRGB(200,50,255)},
    {n="💚 Green", primary=Color3.fromRGB(10,50,20), secondary=Color3.fromRGB(15,60,25), accent=Color3.fromRGB(0,255,100)},
    {n="❤️ Red", primary=Color3.fromRGB(60,10,10), secondary=Color3.fromRGB(70,15,15), accent=Color3.fromRGB(255,0,80)},
    {n="🌊 Cyan", primary=Color3.fromRGB(10,50,50), secondary=Color3.fromRGB(15,60,60), accent=Color3.fromRGB(0,255,255)},
    {n="🟡 Yellow", primary=Color3.fromRGB(60,50,0), secondary=Color3.fromRGB(70,60,0), accent=Color3.fromRGB(255,255,0)},
    {n="🟠 Orange", primary=Color3.fromRGB(60,30,0), secondary=Color3.fromRGB(70,40,0), accent=Color3.fromRGB(255,150,0)},
    {n="🔴 Pink", primary=Color3.fromRGB(50,10,40), secondary=Color3.fromRGB(60,15,50), accent=Color3.fromRGB(255,50,150)}
}

local ti = 1
local to = {0, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30}
local tn = {"0%", "5%", "10%", "15%", "20%", "25%", "30%"}
local ti2 = 3
local tv = to[ti2]

-- ✅ БЕЗОПАСНАЯ ЗАГРУЗКА НАСТРОЕК (БЕЗ FILE SYSTEM)
local settings = {lang = "EN", theme = 1, transparency = 3, auraClicks = 0, auraLevel = 1, auraDmg = 1, auraSpeed = 1}

-- ИСПОЛЬЗУЕМ MEMORY ВМЕСТО FILES ДЛЯ DELTA
_G.DamirSettings = _G.DamirSettings or settings

local function loadSettings()
    settings = _G.DamirSettings or settings
    lang = settings.lang or "EN"
    ti = settings.theme or 1
    ti2 = settings.transparency or 3
    tv = to[ti2]
end

local function saveSettings()
    _G.DamirSettings = settings
    -- Попытка сохранить в файл (если Delta позволяет)
    if _G.writefile then
        pcall(function()
            _G.writefile("DamirHub_Delta.json", game:GetService("HttpService"):JSONEncode(settings))
        end)
    end
end

loadSettings()

-- ✅ СОЗДАНИЕ GUI (ОПТИМИЗИРОВАНО ДЛЯ DELTA)
local sg = Instance.new("ScreenGui", g)
sg.Name = "DH"
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ВЕРХНЯЯ ПАНЕЛЬ
local topBar = Instance.new("Frame", sg)
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = themes[ti].primary
topBar.BackgroundTransparency = tv
topBar.BorderSizePixel = 0
topBar.Name = "TopBar"

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(0.5, 0, 1, 0)
title.BackgroundTransparency = 1
title.TextColor3 = themes[ti].accent
title.Font = Enum.Font.GothamBold
title.TextSize = 11
title.Text = "💎 DAMIR v12 DELTA"
title.TextXAlignment = Enum.TextXAlignment.Left
title.Position = UDim2.new(0, 8, 0, 0)

-- СЕКРЕТНАЯ КНОПКА AURA (МИКРОСКОПИЧЕСКИЙ РАЗМЕР)
local secretBtn = Instance.new("TextButton", topBar)
secretBtn.Size = UDim2.new(0, 2, 1, 0)
secretBtn.Position = UDim2.new(1, -2, 0, 0)
secretBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
secretBtn.BackgroundTransparency = 1
secretBtn.Text = ""
secretBtn.BorderSizePixel = 0

-- КНОПКИ СВЕРХУ
local themeBtn = Instance.new("TextButton", topBar)
themeBtn.Size = UDim2.new(0, 38, 1, 0)
themeBtn.Position = UDim2.new(1, -95, 0, 0)
themeBtn.BackgroundColor3 = themes[ti].accent
themeBtn.BackgroundTransparency = tv
themeBtn.TextColor3 = themes[ti].primary
themeBtn.Font = Enum.Font.GothamBold
themeBtn.TextSize = 11
themeBtn.Text = "🎨"
themeBtn.BorderSizePixel = 0

local opacityBtn = Instance.new("TextButton", topBar)
opacityBtn.Size = UDim2.new(0, 38, 1, 0)
opacityBtn.Position = UDim2.new(1, -52, 0, 0)
opacityBtn.BackgroundColor3 = themes[ti].accent
opacityBtn.BackgroundTransparency = tv
opacityBtn.TextColor3 = themes[ti].primary
opacityBtn.Font = Enum.Font.GothamBold
opacityBtn.TextSize = 11
opacityBtn.Text = "🔦"
opacityBtn.BorderSizePixel = 0

-- ОСНОВНЫЕ КНОПКИ
local mainBtn = Instance.new("TextButton", sg)
mainBtn.Size = UDim2.new(0, 90, 0, 45)
mainBtn.Position = UDim2.new(0, 8, 0, 45)
mainBtn.BackgroundColor3 = themes[ti].accent
mainBtn.BackgroundTransparency = tv
mainBtn.TextColor3 = themes[ti].primary
mainBtn.Font = Enum.Font.GothamBold
mainBtn.TextSize = 11
mainBtn.Text = "FARM"
mainBtn.BorderSizePixel = 0

local autoBtn = Instance.new("TextButton", sg)
autoBtn.Size = UDim2.new(0, 90, 0, 45)
autoBtn.Position = UDim2.new(0, 103, 0, 45)
autoBtn.BackgroundColor3 = themes[ti].accent
autoBtn.BackgroundTransparency = tv
autoBtn.TextColor3 = themes[ti].primary
autoBtn.Font = Enum.Font.GothamBold
autoBtn.TextSize = 11
autoBtn.Text = "AUTO"
autoBtn.BorderSizePixel = 0

local langBtn = Instance.new("TextButton", sg)
langBtn.Size = UDim2.new(0, 45, 0, 45)
langBtn.Position = UDim2.new(1, -100, 0, 45)
langBtn.BackgroundColor3 = themes[ti].accent
langBtn.BackgroundTransparency = tv
langBtn.TextColor3 = themes[ti].primary
langBtn.Font = Enum.Font.GothamBold
langBtn.TextSize = 11
langBtn.Text = "🌐"
langBtn.BorderSizePixel = 0

local closeBtn = Instance.new("TextButton", sg)
closeBtn.Size = UDim2.new(0, 45, 0, 45)
closeBtn.Position = UDim2.new(1, -50, 0, 45)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.BackgroundTransparency = tv
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 12
closeBtn.Text = "✕"
closeBtn.BorderSizePixel = 0

-- СТАТУС ПАНЕЛЬ
local statusLabel = Instance.new("TextLabel", sg)
statusLabel.Size = UDim2.new(1, -16, 0, 100)
statusLabel.Position = UDim2.new(0, 8, 0, 95)
statusLabel.BackgroundColor3 = themes[ti].secondary
statusLabel.BackgroundTransparency = tv
statusLabel.TextColor3 = themes[ti].accent
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 9
statusLabel.TextWrapped = true
statusLabel.Text = "Status: ✅ Ready\nHits: 0 | Broken: 0"
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.TextYAlignment = Enum.TextYAlignment.Top
statusLabel.BorderSizePixel = 0

-- ✅ СКРЫТАЯ AURA ПАНЕЛЬ
local auraPanel = Instance.new("Frame", sg)
auraPanel.Size = UDim2.new(1, -16, 0, 320)
auraPanel.Position = UDim2.new(0, 8, 0, 95)
auraPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
auraPanel.BackgroundTransparency = 0.1
auraPanel.BorderSizePixel = 0
auraPanel.Visible = false

local auraTitle = Instance.new("TextLabel", auraPanel)
auraTitle.Size = UDim2.new(1, 0, 0, 20)
auraTitle.BackgroundTransparency = 1
auraTitle.TextColor3 = Color3.fromRGB(255, 255, 0)
auraTitle.Font = Enum.Font.GothamBold
auraTitle.TextSize = 12
auraTitle.Text = "✨ AURA CLICKER ✨"

local auraClickBtn = Instance.new("TextButton", auraPanel)
auraClickBtn.Size = UDim2.new(1, 0, 0, 55)
auraClickBtn.Position = UDim2.new(0, 0, 0, 25)
auraClickBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
auraClickBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
auraClickBtn.Font = Enum.Font.GothamBold
auraClickBtn.TextSize = 14
auraClickBtn.Text = "⭐ CLICK ⭐\n+1"
auraClickBtn.BorderSizePixel = 0

local auraStatsLabel = Instance.new("TextLabel", auraPanel)
auraStatsLabel.Size = UDim2.new(1, 0, 0, 60)
auraStatsLabel.Position = UDim2.new(0, 0, 0, 85)
auraStatsLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
auraStatsLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
auraStatsLabel.Font = Enum.Font.Gotham
auraStatsLabel.TextSize = 8
auraStatsLabel.TextWrapped = true
auraStatsLabel.TextXAlignment = Enum.TextXAlignment.Left
auraStatsLabel.BorderSizePixel = 0
auraStatsLabel.Text = "💎 Clicks: 0 | ⚡ Lvl: 1 | 🔥 DMG: 1 | ⏱️ SPD: 1x"

local upgrade1Btn = Instance.new("TextButton", auraPanel)
upgrade1Btn.Size = UDim2.new(0.48, 0, 0, 35)
upgrade1Btn.Position = UDim2.new(0, 0, 0, 150)
upgrade1Btn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
upgrade1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
upgrade1Btn.Font = Enum.Font.GothamBold
upgrade1Btn.TextSize = 9
upgrade1Btn.Text = "🔥 +DMG"
upgrade1Btn.BorderSizePixel = 0

local upgrade2Btn = Instance.new("TextButton", auraPanel)
upgrade2Btn.Size = UDim2.new(0.48, 0, 0, 35)
upgrade2Btn.Position = UDim2.new(0.52, 0, 0, 150)
upgrade2Btn.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
upgrade2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
upgrade2Btn.Font = Enum.Font.GothamBold
upgrade2Btn.TextSize = 9
upgrade2Btn.Text = "⏱️ +SPEED"
upgrade2Btn.BorderSizePixel = 0

local upgrade3Btn = Instance.new("TextButton", auraPanel)
upgrade3Btn.Size = UDim2.new(1, 0, 0, 35)
upgrade3Btn.Position = UDim2.new(0, 0, 0, 190)
upgrade3Btn.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
upgrade3Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
upgrade3Btn.Font = Enum.Font.GothamBold
upgrade3Btn.TextSize = 9
upgrade3Btn.Text = "💎 LVL UP"
upgrade3Btn.BorderSizePixel = 0

local auraAutoBtn = Instance.new("TextButton", auraPanel)
auraAutoBtn.Size = UDim2.new(1, 0, 0, 35)
auraAutoBtn.Position = UDim2.new(0, 0, 0, 230)
auraAutoBtn.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
auraAutoBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
auraAutoBtn.Font = Enum.Font.GothamBold
auraAutoBtn.TextSize = 10
auraAutoBtn.Text = "🤖 AUTO (Off)"
auraAutoBtn.BorderSizePixel = 0

local auraCloseBtn = Instance.new("TextButton", auraPanel)
auraCloseBtn.Size = UDim2.new(1, 0, 0, 30)
auraCloseBtn.Position = UDim2.new(0, 0, 0, 270)
auraCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
auraCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
auraCloseBtn.Font = Enum.Font.GothamBold
auraCloseBtn.TextSize = 9
auraCloseBtn.Text = "Close"
auraCloseBtn.BorderSizePixel = 0

-- AURA ПЕРЕМЕННЫЕ
local auraClicks = settings.auraClicks
local auraLevel = settings.auraLevel
local auraDmg = settings.auraDmg
local auraSpeed = settings.auraSpeed
local auraAutoActive = false

local function updateAuraUI()
    auraClickBtn.Text = "⭐ CLICK ⭐\n+" .. auraDmg
    auraStatsLabel.Text = "💎 " .. auraClicks .. " | ⚡ " .. auraLevel .. " | 🔥 " .. auraDmg .. " | ⏱️ " .. math.floor(auraSpeed * 10) / 10 .. "x"
    settings.auraClicks = auraClicks
    settings.auraLevel = auraLevel
    settings.auraDmg = auraDmg
    settings.auraSpeed = auraSpeed
    saveSettings()
end

-- ✅ ОБНОВЛЕНИЕ ТЕМЫ
local function applyTheme(themeIdx)
    ti = themeIdx
    settings.theme = ti
    tv = to[ti2]
    settings.transparency = ti2
    saveSettings()
    
    local t = themes[ti]
    topBar.BackgroundColor3 = t.primary
    topBar.BackgroundTransparency = tv
    title.TextColor3 = t.accent
    themeBtn.BackgroundColor3 = t.accent
    themeBtn.BackgroundTransparency = tv
    themeBtn.TextColor3 = t.primary
    opacityBtn.BackgroundColor3 = t.accent
    opacityBtn.BackgroundTransparency = tv
    opacityBtn.TextColor3 = t.primary
    mainBtn.BackgroundColor3 = t.accent
    mainBtn.BackgroundTransparency = tv
    mainBtn.TextColor3 = t.primary
    autoBtn.BackgroundColor3 = t.accent
    autoBtn.BackgroundTransparency = tv
    autoBtn.TextColor3 = t.primary
    langBtn.BackgroundColor3 = t.accent
    langBtn.BackgroundTransparency = tv
    langBtn.TextColor3 = t.primary
    closeBtn.BackgroundTransparency = tv
    statusLabel.BackgroundColor3 = t.secondary
    statusLabel.BackgroundTransparency = tv
    statusLabel.TextColor3 = t.accent
end

-- ✅ МОЛОТ ПЕРЕМЕННЫЕ
local ho, ao, hh, br = false, false, 0, 0
local lastUpdate = tick()

-- ✅ ФУНКЦИЯ ПОИСКА МАШИНЫ
local function gc()
    local c = p.Character
    if not c then return nil end
    
    local h = c:FindFirstChildOfClass("Humanoid")
    if not h or not h.SeatPart then return nil end
    
    local cur = h.SeatPart
    for i = 1, 8 do
        if not cur then break end
        if cur:IsA("Model") then
            if cur.Parent and cur.Parent.Name == "Vehicles" then 
                return cur 
            end
        end
        cur = cur.Parent
    end
    return nil
end

-- ✅ СМЕШ (ОПТИМИЗИРОВАНО)
local function sm()
    local c = gc()
    if not c then return false end
    
    local r = c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart")
    if not r then return false end
    
    pcall(function()
        r.Velocity = Vector3.zero
        r.CFrame = CFrame.new(r.Position.X, 120, r.Position.Z)
    end)
    
    wait(0.08)
    
    pcall(function()
        r.Velocity = Vector3.new(0, -1000, 0)
    end)
    
    wait(0.7)
    
    if not c.Parent then 
        br = br + 1 
        return true 
    end
    return false
end

-- ✅ ОБНОВЛЕНИЕ СТАТУСА
local function updateStatus()
    if tick() - lastUpdate >= 0.6 then
        statusLabel.Text = "Status: " .. (ho and "🔨 HAMMER" or ao and "⚡ AUTO" or "✅ Ready") .. "\nHits: " .. hh .. " | Broken: " .. br
        lastUpdate = tick()
    end
end

-- ✅ СОБЫТИЯ

-- СЕКРЕТНАЯ КНОПКА
secretBtn.MouseButton1Click:Connect(function()
    auraPanel.Visible = not auraPanel.Visible
    statusLabel.Visible = not statusLabel.Visible
end)

-- AURA CLICK
auraClickBtn.MouseButton1Click:Connect(function()
    auraClicks = auraClicks + auraDmg
    updateAuraUI()
end)

-- UPGRADE 1
upgrade1Btn.MouseButton1Click:Connect(function()
    if auraClicks >= 100 then
        auraClicks = auraClicks - 100
        auraDmg = auraDmg + 1
        updateAuraUI()
    end
end)

-- UPGRADE 2
upgrade2Btn.MouseButton1Click:Connect(function()
    if auraClicks >= 150 then
        auraClicks = auraClicks - 150
        auraSpeed = auraSpeed + 0.5
        updateAuraUI()
    end
end)

-- UPGRADE 3
upgrade3Btn.MouseButton1Click:Connect(function()
    if auraClicks >= 250 then
        auraClicks = auraClicks - 250
        auraLevel = auraLevel + 1
        auraDmg = auraDmg + auraLevel
        updateAuraUI()
    end
end)

-- AUTO AURA
auraAutoBtn.MouseButton1Click:Connect(function()
    auraAutoActive = not auraAutoActive
    auraAutoBtn.Text = (auraAutoActive and "🤖 AUTO (On)" or "🤖 AUTO (Off)")
    auraAutoBtn.BackgroundColor3 = (auraAutoActive and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(100, 255, 100))
    
    if auraAutoActive then
        coroutine.wrap(function()
            while auraAutoActive do
                auraClicks = auraClicks + auraDmg
                updateAuraUI()
                wait(0.4 / auraSpeed)
            end
        end)()
    end
end)

-- CLOSE AURA
auraCloseBtn.MouseButton1Click:Connect(function()
    auraPanel.Visible = false
    statusLabel.Visible = true
end)

-- HAMMER
mainBtn.MouseButton1Click:Connect(function()
    ho = not ho
    if ho then
        if ao then 
            ao = false 
            autoBtn.Text = "AUTO" 
        end
        mainBtn.Text = "STOP"
        coroutine.wrap(function()
            while ho do
                if sm() then 
                    hh = hh + 1 
                end
                updateStatus()
                wait(0.2)
            end
        end)()
    else
        mainBtn.Text = "FARM"
        updateStatus()
    end
end)

-- AUTO FARM
autoBtn.MouseButton1Click:Connect(function()
    ao = not ao
    if ao then
        if ho then 
            ho = false 
            mainBtn.Text = "FARM" 
        end
        autoBtn.Text = "STOP"
        coroutine.wrap(function()
            while ao do
                local c = gc()
                if not c then 
                    wait(1.5)
                else
                    for i = 1, 12 do
                        if not ao then break end
                        if sm() then 
                            hh = hh + 1 
                        end
                        updateStatus()
                        wait(0.12)
                    end
                end
            end
        end)()
    else
        autoBtn.Text = "AUTO"
        updateStatus()
    end
end)

-- THEME
themeBtn.MouseButton1Click:Connect(function()
    ti = ti % #themes + 1
    applyTheme(ti)
end)

-- OPACITY
opacityBtn.MouseButton1Click:Connect(function()
    ti2 = ti2 % #to + 1
    applyTheme(ti)
end)

-- LANGUAGE
langBtn.MouseButton1Click:Connect(function()
    lang = (lang == "EN") and "RU" or "EN"
    settings.lang = lang
    saveSettings()
    langBtn.Text = (lang == "EN") and "EN" or "RU"
end)

-- CLOSE
closeBtn.MouseButton1Click:Connect(function()
    pcall(function() sg:Destroy() end)
end)

-- ✅ УВЕДОМЛЕНИЕ
game.StarterGui:SetCore("SendNotification", {
    Title = "💎 DAMIR HUB v12 DELTA",
    Text = "✨ Запущено! Нажми на стрелку (←) для AURA!",
    Duration = 3
})
