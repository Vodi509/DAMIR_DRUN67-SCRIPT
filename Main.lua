local pg = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local sg = Instance.new("ScreenGui", pg)
sg.Name = "Test"

local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 200, 0, 200)
f.Position = UDim2.new(0.5, -100, 0.5, -100)
f.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

game.StarterGui:SetCore("SendNotification", {Title = "TEST", Text = "Working!", Duration = 3})
