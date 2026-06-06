local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
for _,v in pairs(g:GetChildren()) do if v.Name=="DH" then v:Destroy() end end

local C={btn=Color3.fromRGB(45,45,45),w=Color3.new(1,1,1),g=Color3.fromRGB(160,160,160),gr=Color3.fromRGB(0,255,150),r=Color3.fromRGB(255,55,55),b=Color3.fromRGB(0,200,255),p=Color3.fromRGB(150,90,255)}
local th={{n="Standard",m=Color3.fromRGB(20,20,20),s=Color3.fromRGB(28,28,28)},{n="Red",m=Color3.fromRGB(40,10,10),s=Color3.fromRGB(48,15,15)},{n="Orange",m=Color3.fromRGB(40,20,5),s=Color3.fromRGB(48,28,10)},{n="Gold",m=Color3.fromRGB(35,28,5),s=Color3.fromRGB(43,35,10)},{n="Lime",m=Color3.fromRGB(15,35,8),s=Color3.fromRGB(20,43,12)},{n="Green",m=Color3.fromRGB(8,35,12),s=Color3.fromRGB(12,43,18)},{n="Cyan",m=Color3.fromRGB(8,28,40),s=Color3.fromRGB(12,35,48)},{n="Blue",m=Color3.fromRGB(8,12,40),s=Color3.fromRGB(12,18,48)},{n="Violet",m=Color3.fromRGB(25,8,40),s=Color3.fromRGB(33,12,48)},{n="Pink",m=Color3.fromRGB(40,8,25),s=Color3.fromRGB(48,12,32)}}
local ti=1

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
fbt.Text="🚀 FARM" sbt.Text="⚙️ SETTINGS" lbt.Text="📋 NEWS"

-- FARM
local ft=Instance.new("TextLabel",fpg) ft.Size=UDim2.new(1,0,0,18) ft.BackgroundTransparency=1 ft.Text="MOLOT v8.3" ft.TextColor3=C.w ft.Font=Enum.Font.GothamBold ft.TextSize=12 ft.TextXAlignment=Enum.TextXAlignment.Left
local cb=Instance.new("Frame",fpg) cb.Size=UDim2.new(1,0,0,30) cb.Position=UDim2.new(0,0,0,22) cb.BackgroundColor3=Color3.fromRGB(35,35,35) Instance.new("UICorner",cb).CornerRadius=UDim.new(0,4)
local cl=Instance.new("TextLabel",cb) cl.Size=UDim2.new(1,-14,1,0) cl.Position=UDim2.new(0,7,0,0) cl.BackgroundTransparency=1 cl.Text="🚗 Looking for car..." cl.TextColor3=C.g cl.Font=Enum.Font.GothamBold cl.TextSize=11 cl.TextXAlignment=Enum.TextXAlignment.Left
local sl=Instance.new("TextLabel",fpg) sl.Size=UDim2.new(1,0,0,16) sl.Position=UDim2.new(0,0,0,56) sl.BackgroundTransparency=1 sl.Text="Hits: 0 | Broken: 0 | Auto: 0" sl.TextColor3=C.g sl.Font=Enum.Font.Gotham sl.TextSize=10 sl.TextXAlignment=Enum.TextXAlignment.Left

local function gc()
    local c=p.Character if not c then return nil end local h=c:FindFirstChildOfClass("Humanoid") if not h or not h.SeatPart then return nil end local cur=h.SeatPart
    while cur do if cur:IsA("Model") and cur.Parent and cur.Parent.Name=="Vehicles" then return cur end if cur:IsA("Model") and cur.Name~="Body" and cur.Name~="Engine" and cur.Name~="Wheels" and cur~=c then return cur end cur=cur.Parent end return nil
end
spawn(function() while wait(0.3) do pcall(function() local c=gc() if c then cl.Text="🚗 "..c.Name cl.TextColor3=C.b else cl.Text="🚗 Sit in a car!" cl.TextColor3=C.r end end) end end)

local ho,ao,hh,br,cy=false,false,0,0,0
local function sm()
    local c=gc() if not c then return false end local r=c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart") if not r then return false end
    r.Velocity=Vector3.zero r.CFrame=CFrame.new(r.Position.X,200,r.Position.Z) wait(0.15) r.Velocity=Vector3.new(0,-1500,0) wait(1.0)
    if not c.Parent then br=br+1 return true end return false
end

local hb=Instance.new("TextButton",fpg) hb.Size=UDim2.new(1,0,0,36) hb.Position=UDim2.new(0,0,0,78) hb.BackgroundColor3=C.btn hb.Text="🔨 START HAMMER" hb.TextColor3=C.r hb.Font=Enum.Font.GothamBold hb.TextSize=12 hb.BorderSizePixel=0
Instance.new("UICorner",hb).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",hb).Thickness=1.5 Instance.new("UIStroke",hb).Color=Color3.fromRGB(0,0,0)
local ab=Instance.new("TextButton",fpg) ab.Size=UDim2.new(1,0,0,36) ab.Position=UDim2.new(0,0,0,122) ab.BackgroundColor3=C.btn ab.Text="🤖 AUTO FARM" ab.TextColor3=C.g ab.Font=Enum.Font.GothamBold ab.TextSize=12 ab.BorderSizePixel=0
Instance.new("UICorner",ab).CornerRadius=UDim.new(0,5) Instance.new("UIStroke",ab).Thickness=1.5 Instance.new("UIStroke",ab).Color=Color3.fromRGB(0,0,0)
local hi=Instance.new("TextLabel",fpg) hi.Size=UDim2.new(1,0,0,14) hi.Position=UDim2.new(0,0,0,162) hi.BackgroundTransparency=1 hi.Text="⚠️ If broken - rejoin" hi.TextColor3=Color3.fromRGB(255,180,50) hi.Font=Enum.Font.Gotham hi.TextSize=9 hi.TextXAlignment=Enum.TextXAlignment.Center

hb.MouseButton1Click:Connect(function()
    ho=not ho
    if ho then if ao then ao=false ab.Text="🤖 AUTO FARM" ab.TextColor3=C.g ab.BackgroundColor3=C.btn end hb.Text="🔨 HAMMER ACTIVE" hb.TextColor3=C.gr hb.BackgroundColor3=Color3.fromRGB(18,38,24)
        coroutine.wrap(function() while ho do sm() hh=hh+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy wait(0.3) end end)()
    else hb.Text="🔨 START HAMMER" hb.TextColor3=C.r hb.BackgroundColor3=C.btn end
end)
ab.MouseButton1Click:Connect(function()
    ao=not ao
    if ao then if ho then ho=false hb.Text="🔨 START HAMMER" hb.TextColor3=C.r hb.BackgroundColor3=C.btn end ab.Text="🤖 AUTO ACTIVE" ab.TextColor3=C.gr ab.BackgroundColor3=Color3.fromRGB(40,25,10)
        coroutine.wrap(function()
            while ao do local c=gc() if not c then cl.Text="🚗 Respawning..." wait(3)
                else local d=false for i=1,20 do if not ao then break end d=sm() hh=hh+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy if d then break end wait(0.2) end
                if d then cy=cy+1 sl.Text="Hits: "..hh.." | Broken: "..br.." | Auto: "..cy cl.Text="💀 Destroyed!" wait(1) cl.Text="🚗 Respawning..." wait(3) end end
            end
        end)()
    else ab.Text="🤖 AUTO FARM" ab.TextColor3=C.g ab.BackgroundColor3=C.btn end
end)

-- SETTINGS
local lt=Instance.new("TextLabel",spg) lt.Size=UDim2.new(1,0,0,16) lt.BackgroundTransparency=1 lt.Text="🎨 Theme: Standard" lt.TextColor3=C.w lt.Font=Enum.Font.GothamBold lt.TextSize=11 lt.TextXAlignment=Enum.TextXAlignment.Left
local tb=Instance.new("TextButton",spg) tb.Size=UDim2.new(1,0,0,26) tb.Position=UDim2.new(0,0,0,18) tb.BackgroundColor3=C.btn tb.Text="CHANGE THEME" tb.TextColor3=C.g tb.Font=Enum.Font.GothamBold tb.TextSize=11 tb.BorderSizePixel=0
Instance.new("UICorner",tb).CornerRadius=UDim.new(0,4) Instance.new("UIStroke",tb).Thickness=1.5 Instance.new("UIStroke",tb).Color=Color3.fromRGB(0,0,0)
tb.MouseButton1Click:Connect(function() ti=ti%#th+1 m.BackgroundColor3=th[ti].m s.BackgroundColor3=th[ti].s lt.Text="🎨 Theme: "..th[ti].name end)

local tl=Instance.new("TextLabel",spg) tl.Size=UDim2.new(1,0,0,16) tl.Position=UDim2.new(0,0,0,52) tl.BackgroundTransparency=1 tl.Text="🔍 Transparency: 0%" tl.TextColor3=C.w tl.Font=Enum.Font.GothamBold tl.TextSize=11 tl.TextXAlignment=Enum.TextXAlignment.Left
local tr=Instance.new("Frame",spg) tr.Size=UDim2.new(1,0,0,20) tr.Position=UDim2.new(0,0,0,70) tr.BackgroundColor3=Color3.fromRGB(35,35,35) tr.BorderSizePixel=0
Instance.new("UICorner",tr).CornerRadius=UDim.new(0,10) Instance.new("UIStroke",tr).Thickness=1.5 Instance.new("UIStroke",tr).Color=Color3.fromRGB(0,0,0)
local tf=Instance.new("Frame",tr) tf.Size=UDim2.new(0,0,1,0) tf.BackgroundColor3=C.p tf.BorderSizePixel=0 Instance.new("UICorner",tf).CornerRadius=UDim.new(0,10)
local tn=Instance.new("TextButton",tr) tn.Size=UDim2.new(0,24,1,0) tn.BackgroundColor3=C.w tn.Text="" tn.BorderSizePixel=0 Instance.new("UICorner",tn).CornerRadius=UDim.new(0,12) Instance.new("UIStroke",tn).Thickness=1.5 Instance.new("UIStroke",tn).Color=Color3.fromRGB(0,0,0)
local dr=false
tn.MouseButton1Down:Connect(function() dr=true end)
tr.MouseButton1Down:Connect(function(x) dr=true local bp=tr.AbsolutePosition.X local bs=tr.AbsoluteSize.X local pv=math.floor(math.clamp((x-bp)/bs*100,0,100)) m.BackgroundTransparency=pv/100 s.BackgroundTransparency=pv/100 tf.Size=UDim2.new(pv/100,0,1,0) tn.Position=UDim2.new(pv/100,-12,0,0) tl.Text="🔍 Transparency: "..pv.."%" end)
game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dr=false end end)
game:GetService("UserInputService").InputChanged:Connect(function(i) if dr and i.UserInputType==Enum.UserInputType.MouseMovement then local bp=tr.AbsolutePosition.X local bs=tr.AbsoluteSize.X local pv=math.floor(math.clamp((i.Position.X-bp)/bs*100,0,100)) m.BackgroundTransparency=pv/100 s.BackgroundTransparency=pv/100 tf.Size=UDim2.new(pv/100,0,1,0) tn.Position=UDim2.new(pv/100,-12,0,0) tl.Text="🔍 Transparency: "..pv.."%" end end)

-- CHANGELOG
local lgt=Instance.new("TextLabel",lpg) lgt.Size=UDim2.new(1,0,0,18) lgt.BackgroundTransparency=1 lgt.Text="📋 WHAT'S NEW" lgt.TextColor3=C.w lgt.Font=Enum.Font.GothamBold lgt.TextSize=12 lgt.TextXAlignment=Enum.TextXAlignment.Left
local lgc=Instance.new("TextLabel",lpg) lgc.Size=UDim2.new(1,0,0,240) lgc.Position=UDim2.new(0,0,0,22) lgc.BackgroundColor3=Color3.fromRGB(35,35,35)
lgc.Text=[[v8.3:
- Lightweight version
- Faster loading
- 10 themes
- Transparency slider
- Molot 200/-1500
- Auto farm]]
lgc.TextColor3=C.g lgc.Font=Enum.Font.Gotham lgc.TextSize=10 lgc.TextXAlignment=Enum.TextXAlignment.Left lgc.TextYAlignment=Enum.TextYAlignment.Top Instance.new("UICorner",lgc).CornerRadius=UDim.new(0,5)

game.StarterGui:SetCore("SendNotification",{Title="DAMIR HUB",Text="v8.3 loaded!",Duration=3})
