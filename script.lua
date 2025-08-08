-- Freeze Trade UI Script by @thebestexploiterr
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "FreezeTradeUI"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 250, 0, 200)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -100)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "VIRAL HUB SCRIPTS"
title.Size = UDim2.new(1, -20, 0, 30)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(100, 150, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

-- Username
local username = Instance.new("TextLabel")
username.Name = "Username"
username.Text = "howlesgoe"
username.Size = UDim2.new(1, -20, 0, 20)
username.Position = UDim2.new(0, 10, 0, 40)
username.BackgroundTransparency = 1
username.TextColor3 = Color3.fromRGB(200, 200, 255)
username.Font = Enum.Font.Gotham
username.TextSize = 14
username.TextXAlignment = Enum.TextXAlignment.Left
username.Parent = mainFrame

-- Toggles Container
local togglesFrame = Instance.new("Frame")
togglesFrame.Name = "TogglesFrame"
togglesFrame.Size = UDim2.new(1, -20, 0, 80)
togglesFrame.Position = UDim2.new(0, 10, 0, 70)
togglesFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
togglesFrame.BorderSizePixel = 0
togglesFrame.Parent = mainFrame

local togglesCorner = Instance.new("UICorner")
togglesCorner.CornerRadius = UDim.new(0, 8)
togglesCorner.Parent = togglesFrame

-- Freeze Trade Toggle
local freezeFrame = Instance.new("Frame")
freezeFrame.Name = "FreezeFrame"
freezeFrame.Size = UDim2.new(1, 0, 0, 40)
freezeFrame.BackgroundTransparency = 1
freezeFrame.Parent = togglesFrame

local freezeLabel = Instance.new("TextLabel")
freezeLabel.Name = "FreezeLabel"
freezeLabel.Text = "FREEZE TRADE"
freezeLabel.Size = UDim2.new(0.7, 0, 1, 0)
freezeLabel.BackgroundTransparency = 1
freezeLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
freezeLabel.Font = Enum.Font.Gotham
freezeLabel.TextSize = 12
freezeLabel.TextXAlignment = Enum.TextXAlignment.Left
freezeLabel.Parent = freezeFrame

local freezeToggle = Instance.new("TextButton")
freezeToggle.Name = "FreezeToggle"
freezeToggle.Size = UDim2.new(0, 40, 0, 20)
freezeToggle.Position = UDim2.new(1, -40, 0.5, -10)
freezeToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
freezeToggle.AutoButtonColor = false
freezeToggle.Parent = freezeFrame

local freezeCorner = Instance.new("UICorner")
freezeCorner.CornerRadius = UDim.new(1, 0)
freezeCorner.Parent = freezeToggle

local freezeCircle = Instance.new("Frame")
freezeCircle.Name = "Circle"
freezeCircle.Size = UDim2.new(0, 16, 0, 16)
freezeCircle.Position = UDim2.new(0, 2, 0, 2)
freezeCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
freezeCircle.BorderSizePixel = 0
freezeCircle.Parent = freezeToggle

local freezeCircleCorner = Instance.new("UICorner")
freezeCircleCorner.CornerRadius = UDim.new(1, 0)
freezeCircleCorner.Parent = freezeCircle

-- Force Accept Toggle
local acceptFrame = Instance.new("Frame")
acceptFrame.Name = "AcceptFrame"
acceptFrame.Size = UDim2.new(1, 0, 0, 40)
acceptFrame.Position = UDim2.new(0, 0, 0, 40)
acceptFrame.BackgroundTransparency = 1
acceptFrame.Parent = togglesFrame

local acceptLabel = Instance.new("TextLabel")
acceptLabel.Name = "AcceptLabel"
acceptLabel.Text = "FORCE ACCEPT"
acceptLabel.Size = UDim2.new(0.7, 0, 1, 0)
acceptLabel.BackgroundTransparency = 1
acceptLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
acceptLabel.Font = Enum.Font.Gotham
acceptLabel.TextSize = 12
acceptLabel.TextXAlignment = Enum.TextXAlignment.Left
acceptLabel.Parent = acceptFrame

local acceptToggle = Instance.new("TextButton")
acceptToggle.Name = "AcceptToggle"
acceptToggle.Size = UDim2.new(0, 40, 0, 20)
acceptToggle.Position = UDim2.new(1, -40, 0.5, -10)
acceptToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
acceptToggle.AutoButtonColor = false
acceptToggle.Parent = acceptFrame

local acceptCorner = Instance.new("UICorner")
acceptCorner.CornerRadius = UDim.new(1, 0)
acceptCorner.Parent = acceptToggle

local acceptCircle = Instance.new("Frame")
acceptCircle.Name = "Circle"
acceptCircle.Size = UDim2.new(0, 16, 0, 16)
acceptCircle.Position = UDim2.new(0, 2, 0, 2)
acceptCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
acceptCircle.BorderSizePixel = 0
acceptCircle.Parent = acceptToggle

local acceptCircleCorner = Instance.new("UICorner")
acceptCircleCorner.CornerRadius = UDim.new(1, 0)
acceptCircleCorner.Parent = acceptCircle

-- Status Message
local status = Instance.new("TextLabel")
status.Name = "Status"
status.Text = ""
status.Size = UDim2.new(1, -20, 0, 20)
status.Position = UDim2.new(0, 10, 0, 160)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(100, 255, 100)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.Parent = mainFrame

-- Footer
local footer = Instance.new("TextLabel")
footer.Name = "Footer"
footer.Text = "Freeze Trade By @thebestexploiterr"
footer.Size = UDim2.new(1, -20, 0, 20)
footer.Position = UDim2.new(0, 10, 1, -25)
footer.BackgroundTransparency = 1
footer.TextColor3 = Color3.fromRGB(150, 150, 150)
footer.Font = Enum.Font.Gotham
footer.TextSize = 10
footer.Parent = mainFrame

-- Toggle Animation Function
local function toggleSwitch(button, circle, isOn)
    local newPosition = isOn and UDim2.new(0, 22, 0, 2) or UDim2.new(0, 2, 0, 2)
    local newColor = isOn and Color3.fromRGB(0, 122, 255) or Color3.fromRGB(60, 60, 80)
    
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local circleTween = TweenService:Create(circle, tweenInfo, {Position = newPosition})
    local bgTween = TweenService:Create(button, tweenInfo, {BackgroundColor3 = newColor})
    
    circleTween:Play()
    bgTween:Play()
end

-- Toggle Functionality
local freezeEnabled = false
freezeToggle.MouseButton1Click:Connect(function()
    freezeEnabled = not freezeEnabled
    toggleSwitch(freezeToggle, freezeCircle, freezeEnabled)
    
    if freezeEnabled then
        status.Text = "Successfully frozen trade for " .. username.Text
    else
        status.Text = "Trade unfrozen for " .. username.Text
    end
end)

local acceptEnabled = false
acceptToggle.MouseButton1Click:Connect(function()
    acceptEnabled = not acceptEnabled
    toggleSwitch(acceptToggle, acceptCircle, acceptEnabled)
    
    if acceptEnabled then
        status.Text = "Force accept enabled"
    else
        status.Text = "Force accept disabled"
    end
end)

-- Make draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
