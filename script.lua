-- Удаление предыдущего GUI
pcall(function()
    game.CoreGui:FindFirstChild("FreezeTradeUI"):Destroy()
end)

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- UI контейнер
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FreezeTradeUI"
ScreenGui.ResetOnSpawn = false

-- Основная рамка
local main = Instance.new("Frame", ScreenGui)
main.Size = UDim2.new(0, 340, 0, 240)
main.Position = UDim2.new(0.5, -170, 0.5, -120)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true -- Перетаскивание
main.ClipsDescendants = true

-- Закрывающий крестик
local close = Instance.new("TextButton", main)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Заголовок
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Trade Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(0, 170, 255)

-- Функция создания iOS-переключателя
local function createToggle(parent, text, posY)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(1, -40, 0, 40)
    container.Position = UDim2.new(0, 20, 0, posY)
    container.BackgroundTransparency = 1

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

    return {
        IsOn = function() return enabled end
    }
end

-- Переключатели
local freezeToggle = createToggle(main, "Freeze Trade ❄", 50)
local forceToggle = createToggle(main, "Force Accept ✅", 100)

-- Кнопка Bypass Anti-Cheat
local bypassBtn = Instance.new("TextButton", main)
bypassBtn.Size = UDim2.new(0.8, 0, 0, 30)
bypassBtn.Position = UDim2.new(0.1, 0, 0, 150)
bypassBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
bypassBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
bypassBtn.Font = Enum.Font.GothamBold
bypassBtn.TextSize = 16
bypassBtn.Text = "Bypass Anti-Cheat"

-- Прогрессбар
local bar = Instance.new("Frame", main)
bar.Size = UDim2.new(0.8, 0, 0, 6)
bar.Position = UDim2.new(0.1, 0, 0, 185)
bar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
bar.Visible = false

local fill = Instance.new("Frame", bar)
fill.Size = UDim2.new(0, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
fill.BorderSizePixel = 0

bypassBtn.MouseButton1Click:Connect(function()
    bar.Visible = true
    fill.Size = UDim2.new(0, 0, 1, 0)

    -- Анимация прогресса
    local duration = 10
    for i = 0, 100 do
        fill.Size = UDim2.new(i / 100, 0, 1, 0)
        wait(duration / 100)
    end

    -- Уведомление от Roblox
    StarterGui:SetCore("SendNotification", {
        Title = "Roblox";
        Text = "Bypass Active 😎🔥";
        Duration = 5;
    })
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
