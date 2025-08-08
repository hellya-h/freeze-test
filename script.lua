-- Удаление старого UI
pcall(function()
    game.CoreGui:FindFirstChild("FreezeTradeUI"):Destroy()
end)

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FreezeTradeUI"
gui.ResetOnSpawn = false

-- Основной UI
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 340, 0, 270)
main.Position = UDim2.new(0.5, -170, 0.5, -135)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ClipsDescendants = true

-- Кружочек для перетаскивания
local dragCircle = Instance.new("Frame", main)
dragCircle.Size = UDim2.new(0, 30, 0, 30)
dragCircle.Position = UDim2.new(0, 10, 0, 10)
dragCircle.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
dragCircle.BackgroundTransparency = 0.2
dragCircle.BorderSizePixel = 0
dragCircle.ZIndex = 2
dragCircle.Name = "DragHandle"

-- Крестик и кнопка свернуть
local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local minimize = Instance.new("TextButton", main)
minimize.Size = UDim2.new(0, 30, 0, 30)
minimize.Position = UDim2.new(1, -70, 0, 5)
minimize.Text = "-"
minimize.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minimize.TextColor3 = Color3.fromRGB(255, 255, 100)
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 16

local minimized = false
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, child in ipairs(main:GetChildren()) do
        if child:IsA("GuiObject") and child ~= close and child ~= minimize and child ~= dragCircle then
            child.Visible = not minimized
        end
    end
end)

-- Заголовок
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Trade Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(0, 170, 255)

-- Функция переключателя
local function createToggle(parent, text, posY)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(1, -40, 0, 40)
    container.Position = UDim2.new(0, 20, 0, posY)
    container.BackgroundTransparency = 1
    container.Visible = false -- будет включено после bypass

    local label = Instance.new("TextLabel", container)
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.Gotham
    label.TextSize = 18
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextXAlignment = Enum.TextXAlignment.Left

    local toggle = Instance.new("TextButton", container)
    toggle.Size = UDim2.new(0, 50, 0, 25)
    toggle.Position = UDim2.new(1, -60, 0.5, -12)
    toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    toggle.BorderSizePixel = 0
    toggle.Text = ""
    toggle.AutoButtonColor = false

    local knob = Instance.new("Frame", toggle)
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0, 3, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    knob.BorderSizePixel = 0

    local enabled = false

    toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            knob:TweenPosition(UDim2.new(1, -23, 0.5, -10), "Out", "Sine", 0.2, true)
        else
            toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            knob:TweenPosition(UDim2.new(0, 3, 0.5, -10), "Out", "Sine", 0.2, true)
        end
    end)

    return container
end

-- Кнопка Bypass Anti-Cheat
local bypassBtn = Instance.new("TextButton", main)
bypassBtn.Size = UDim2.new(0.8, 0, 0, 30)
bypassBtn.Position = UDim2.new(0.1, 0, 0, 50)
bypassBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
bypassBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
bypassBtn.Font = Enum.Font.GothamBold
bypassBtn.TextSize = 16
bypassBtn.Text = "Bypass Anti-Cheat"

-- Прогрессбар
local bar = Instance.new("Frame", main)
bar.Size = UDim2.new(0.8, 0, 0, 6)
bar.Position = UDim2.new(0.1, 0, 0, 85)
bar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
bar.Visible = false

local gradient = Instance.new("UIGradient", bar)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(0, 170, 255)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 255, 200))
}

local fill = Instance.new("Frame", bar)
fill.Size = UDim2.new(0, 0, 1, 0)
fill.BackgroundTransparency = 1
fill.BorderSizePixel = 0

local grad2 = Instance.new("UIGradient", fill)
grad2.Color = gradient.Color

bar:AddChild(fill)

-- Переключатели (будут активированы позже)
local freezeToggle = createToggle(main, "Freeze Trade ❄", 120)
local forceToggle = createToggle(main, "Force Accept ✅", 170)

-- Действие Bypass
bypassBtn.MouseButton1Click:Connect(function()
    bypassBtn.Text = "Loading..."
    bypassBtn.AutoButtonColor = false
    bar.Visible = true
    fill.BackgroundTransparency = 0

    local duration = 10
    for i = 0, 100 do
        fill.Size = UDim2.new(i / 100, 0, 1, 0)
        wait(duration / 100)
    end

    -- Обратная связь
    bypassBtn.Text = "Bypass Completed"
    bypassBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)

    StarterGui:SetCore("SendNotification", {
        Title = "Roblox";
        Text = "Bypass Active 😎🔥";
        Duration = 5;
    })

    freezeToggle.Visible = true
    forceToggle.Visible = true
end)

-- Подпись
local credit = Instance.new("TextLabel", main)
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 1, -20)
credit.BackgroundTransparency = 1
credit.Text = "Freeze Trade By @thebestexploiterr"
credit.Font = Enum.Font.Gotham
credit.TextSize = 14
credit.TextColor3 = Color3.fromRGB(120, 180, 255)
credit.TextTransparency = 0.2
