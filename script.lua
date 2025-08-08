-- Freeze Trade UI Script by @thebestexploiterr
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "FreezeTradeUI"
gui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 250, 0, 180)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -90)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "Viral Hub Scripts"
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(100, 150, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = mainFrame

local username = Instance.new("TextLabel")
username.Name = "Username"
username.Text = "howlesgoe"
username.Size = UDim2.new(1, 0, 0, 30)
username.Position = UDim2.new(0, 0, 0, 40)
username.BackgroundTransparency = 1
username.TextColor3 = Color3.fromRGB(200, 200, 255)
username.Font = Enum.Font.Gotham
username.TextSize = 14
username.Parent = mainFrame

-- Toggles container
local togglesFrame = Instance.new("Frame")
togglesFrame.Name = "TogglesFrame"
togglesFrame.Size = UDim2.new(1, -20, 0, 60)
togglesFrame.Position = UDim2.new(0, 10, 0, 80)
togglesFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
togglesFrame.BorderSizePixel = 0
togglesFrame.Parent = mainFrame

local togglesCorner = Instance.new("UICorner")
togglesCorner.CornerRadius = UDim.new(0, 8)
togglesCorner.Parent = togglesFrame

-- Freeze Trade toggle
local freezeToggle = Instance.new("TextButton")
freezeToggle.Name = "FreezeToggle"
freezeToggle.Text = "Freeze Trade"
freezeToggle.Size = UDim2.new(1, -20, 0, 25)
freezeToggle.Position = UDim2.new(0, 10, 0, 5)
freezeToggle.BackgroundTransparency = 1
freezeToggle.TextColor3 = Color3.fromRGB(200, 200, 255)
freezeToggle.Font = Enum.Font.Gotham
freezeToggle.TextSize = 12
freezeToggle.TextXAlignment = Enum.TextXAlignment.Left
freezeToggle.Parent = togglesFrame

local freezeSwitch = Instance.new("Frame")
freezeSwitch.Name = "Switch"
freezeSwitch.Size = UDim2.new(0, 40, 0, 20)
freezeSwitch.Position = UDim2.new(1, -40, 0.5, -10)
freezeSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
freezeSwitch.BorderSizePixel = 0
freezeSwitch.Parent = freezeToggle

local freezeSwitchCorner = Instance.new("UICorner")
freezeSwitchCorner.CornerRadius = UDim.new(1, 0)
freezeSwitchCorner.Parent = freezeSwitch

local freezeSwitchCircle = Instance.new("Frame")
freezeSwitchCircle.Name = "Circle"
freezeSwitchCircle.Size = UDim2.new(0, 16, 0, 16)
freezeSwitchCircle.Position = UDim2.new(0, 2, 0, 2)
freezeSwitchCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
freezeSwitchCircle.BorderSizePixel = 0
freezeSwitchCircle.Parent = freezeSwitch

local freezeSwitchCircleCorner = Instance.new("UICorner")
freezeSwitchCircleCorner.CornerRadius = UDim.new(1, 0)
freezeSwitchCircleCorner.Parent = freezeSwitchCircle

-- Force Accept toggle
local acceptToggle = Instance.new("TextButton")
acceptToggle.Name = "AcceptToggle"
acceptToggle.Text = "Force Accept"
acceptToggle.Size = UDim2.new(1, -20, 0, 25)
acceptToggle.Position = UDim2.new(0, 10, 0, 30)
acceptToggle.BackgroundTransparency = 1
acceptToggle.TextColor3 = Color3.fromRGB(200, 200, 255)
acceptToggle.Font = Enum.Font.Gotham
acceptToggle.TextSize = 12
acceptToggle.TextXAlignment = Enum.TextXAlignment.Left
acceptToggle.Parent = togglesFrame

local acceptSwitch = Instance.new("Frame")
acceptSwitch.Name = "Switch"
acceptSwitch.Size = UDim2.new(0, 40, 0, 20)
acceptSwitch.Position = UDim2.new(1, -40, 0.5, -10)
acceptSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
acceptSwitch.BorderSizePixel = 0
acceptSwitch.Parent = acceptToggle

local acceptSwitchCorner = Instance.new("UICorner")
acceptSwitchCorner.CornerRadius = UDim.new(1, 0)
acceptSwitchCorner.Parent = acceptSwitch

local acceptSwitchCircle = Instance.new("Frame")
acceptSwitchCircle.Name = "Circle"
acceptSwitchCircle.Size = UDim2.new(0, 16, 0, 16)
acceptSwitchCircle.Position = UDim2.new(0, 2, 0, 2)
acceptSwitchCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
acceptSwitchCircle.BorderSizePixel = 0
acceptSwitchCircle.Parent = acceptSwitch

local acceptSwitchCircleCorner = Instance.new("UICorner")
acceptSwitchCircleCorner.CornerRadius = UDim.new(1, 0)
acceptSwitchCircleCorner.Parent = acceptSwitchCircle

-- Status message
local status = Instance.new("TextLabel")
status.Name = "Status"
status.Text = "Successfully frozen trade for howlesgoe"
status.Size = UDim2.new(1, -20, 0, 20)
status.Position = UDim2.new(0, 10, 0, 150)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(100, 255, 100)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.Parent = mainFrame

-- Footer
local footer = Instance.new("TextLabel")
footer.Name = "Footer"
footer.Text = "Freeze Trade By @thebestexploiterr"
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 1, -20)
footer.BackgroundTransparency = 1
footer.TextColor3 = Color3.fromRGB(150, 150, 150)
footer.Font = Enum.Font.Gotham
footer.TextSize = 10
footer.Parent = mainFrame

-- Toggle functionality
local function toggleSwitch(switch, circle)
    local currentPos = circle.Position
    if currentPos.X.Offset == 2 then
        -- Turn on
        circle:TweenPosition(UDim2.new(0, 22, 0, 2), "Out", "Quad", 0.2, true
        switch.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
    else
        -- Turn off
        circle:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.2, true)
        switch.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end

freezeToggle.MouseButton1Click:Connect(function()
    toggleSwitch(freezeSwitch, freezeSwitchCircle)
end)

acceptToggle.MouseButton1Click:Connect(function()
    toggleSwitch(acceptSwitch, acceptSwitchCircle)
end)
