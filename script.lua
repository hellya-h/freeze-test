-- UI Script by @thebestexploiterr

local player = game:GetService("Players").LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- Удаление старого UI, если он был
if gui:FindFirstChild("TradeHubUI") then
    gui:FindFirstChild("TradeHubUI"):Destroy()
end

-- Создание ScreenGui
local screenGui = Instance.new("ScreenGui", gui)
screenGui.Name = "TradeHubUI"
screenGui.ResetOnSpawn = false

-- Главный фрейм
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 330, 0, 300)
mainFrame.Position = UDim2.new(0.5, -165, 0.5, -150)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

-- Градиент фона
local bgGradient = Instance.new("UIGradient", mainFrame)
bgGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 85, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
bgGradient.Rotation = 45

-- Заголовок
local title = Instance.new("TextLabel", mainFrame)
title.Text = "Trade Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.TextColor3 = Color3.new(1, 1, 1)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1

-- Кнопка закрытия
local close = Instance.new("TextButton", mainFrame)
close.Text = "✕"
close.Font = Enum.Font.Gotham
close.TextSize = 18
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.BackgroundTransparency = 1
close.TextColor3 = Color3.new(1, 1, 1)
close.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Кнопка свернуть
local minimize = Instance.new("TextButton", mainFrame)
minimize.Text = "_"
minimize.Font = Enum.Font.Gotham
minimize.TextSize = 20
minimize.Size = UDim2.new(0, 30, 0, 30)
minimize.Position = UDim2.new(1, -70, 0, 5)
minimize.BackgroundTransparency = 1
minimize.TextColor3 = Color3.new(1, 1, 1)

local minimized = false
minimize.MouseButton1Click:Connect(function()
    if minimized then
        mainFrame:TweenPosition(UDim2.new(0.5, -165, 0.5, -150), "Out", "Quad", 0.4)
    else
        local view = workspace.CurrentCamera.ViewportSize
        mainFrame:TweenPosition(UDim2.new(0, view.X - 50, 0, view.Y - 50), "Out", "Quad", 0.4)
    end
    minimized = not minimized
end)

-- Точка-декор
local dot = Instance.new("TextLabel", mainFrame)
dot.Text = "•"
dot.Font = Enum.Font.GothamBold
dot.TextSize = 32
dot.TextColor3 = Color3.fromRGB(0, 150, 255)
dot.Position = UDim2.new(0, 10, 0, 45)
dot.Size = UDim2.new(0, 20, 0, 20)
dot.BackgroundTransparency = 1

-- Кнопка Bypass Anti-Cheat
local bypass = Instance.new("TextButton", mainFrame)
bypass.Text = "Bypass Anti-Cheat"
bypass.Font = Enum.Font.GothamBold
bypass.TextSize = 16
bypass.Size = UDim2.new(0.9, 0, 0, 40)
bypass.Position = UDim2.new(0.05, 0, 0, 80)
bypass.TextColor3 = Color3.new(1,1,1)
bypass.BackgroundColor3 = Color3.fromRGB(0, 50, 200)
bypass.AutoButtonColor = false

local bypassGradient = Instance.new("UIGradient", bypass)
bypassGradient.Color = bgGradient.Color

-- Прогресс бар
local progressBar = Instance.new("Frame", bypass)
progressBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.Position = UDim2.new(0, 0, 0, 0)
progressBar.BorderSizePixel = 0
progressBar.BackgroundTransparency = 0.5

-- Стейт
local bypassed = false

-- iOS переключатель
local function createToggle(name, yPos)
    local toggle = Instance.new("Frame", mainFrame)
    toggle.Name = name
    toggle.Size = UDim2.new(0.9, 0, 0, 40)
    toggle.Position = UDim2.new(0.05, 0, 0, yPos)
    toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
    toggle.BorderSizePixel = 0
    local gradient = Instance.new("UIGradient", toggle)
    gradient.Color = bgGradient.Color

    local label = Instance.new("TextLabel", toggle)
    label.Text = name
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.TextColor3 = Color3.new(1,1,1)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1

    local switch = Instance.new("TextButton", toggle)
    switch.Name = "Switch"
    switch.Size = UDim2.new(0, 50, 0, 25)
    switch.Position = UDim2.new(1, -60, 0.5, -12)
    switch.Text = ""
    switch.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    switch.BorderSizePixel = 0
    switch.AutoButtonColor = false

    local knob = Instance.new("Frame", switch)
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0, 3, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.BackgroundTransparency = 0
    knob.ZIndex = 2
    knob.ClipsDescendants = true

    local enabled = false
    switch.MouseButton1Click:Connect(function()
        if not bypassed then return end
        enabled = not enabled
        if enabled then
            switch.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            knob:TweenPosition(UDim2.new(0, 27, 0.5, -10), "Out", "Sine", 0.2)
        else
            switch.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
            knob:TweenPosition(UDim2.new(0, 3, 0.5, -10), "Out", "Sine", 0.2)
        end
    end)
end

-- Тогглы
createToggle("Freeze Trade", 140)
createToggle("Auto Accept", 190)

-- Подпись снизу
local credit = Instance.new("TextLabel", mainFrame)
credit.Text = "By @thebestexploiterr"
credit.Font = Enum.Font.Gotham
credit.TextSize = 14
credit.TextColor3 = Color3.fromRGB(180,180,255)
credit.BackgroundTransparency = 1
credit.Position = UDim2.new(0.5, -80, 1, -25)
credit.Size = UDim2.new(0, 160, 0, 20)

-- Bypass Logic
bypass.MouseButton1Click:Connect(function()
    if bypassed then return end
    for i = 1, 100 do
        progressBar:TweenSize(UDim2.new(i/100, 0, 1, 0), "Out", "Linear", 0.1, true)
        wait(0.1)
    end
    bypass.Text = "Bypass Completed"
    bypassed = true
    game.StarterGui:SetCore("SendNotification", {
        Title = "Bypass Active ✅",
        Text = "Your anti-cheat bypass is now enabled 🎉",
        Duration = 5
    })
end)
