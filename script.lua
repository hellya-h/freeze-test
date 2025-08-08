-- Удаление старого GUI если он есть
pcall(function()
    game.CoreGui:FindFirstChild("FreezeTradeUI"):Destroy()
end)

-- Создание UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FreezeTradeUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 320, 0, 180)
main.Position = UDim2.new(0.5, -160, 0.5, -90)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
main.BorderSizePixel = 0
main.BackgroundTransparency = 0.1
main.Parent = ScreenGui
main.ClipsDescendants = true

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Viral Hub Scripts"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.Parent = main

-- Имя пользователя
local username = Instance.new("TextLabel")
username.Size = UDim2.new(1, 0, 0, 30)
username.Position = UDim2.new(0, 0, 0, 35)
username.BackgroundTransparency = 1
username.Text = "howlcsg0e"
username.Font = Enum.Font.Gotham
username.TextSize = 18
username.TextColor3 = Color3.fromRGB(255, 255, 255)
username.Parent = main

-- Функция для создания переключателя в стиле iOS
local function createToggle(parent, text, posY)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -40, 0, 40)
    container.Position = UDim2.new(0, 20, 0, posY)
    container.BackgroundTransparency = 1
    container.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.Gotham
    label.TextSize = 18
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 50, 0, 25)
    toggle.Position = UDim2.new(1, -60, 0.5, -12)
    toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    toggle.BorderSizePixel = 0
    toggle.Text = ""
    toggle.AutoButtonColor = false
    toggle.Parent = container

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0, 3, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    knob.BorderSizePixel = 0
    knob.BackgroundTransparency = 0
    knob.Parent = toggle

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
        IsOn = function() return enabled end,
        Set = function(state)
            enabled = state
            if enabled then
                toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                knob.Position = UDim2.new(1, -23, 0.5, -10)
            else
                toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
                knob.Position = UDim2.new(0, 3, 0.5, -10)
            end
        end
    }
end

-- Переключатели
local freezeToggle = createToggle(main, "Freeze Trade ❄", 70)
local forceToggle = createToggle(main, "Force Accept ✅", 120)

-- Подпись
local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 1, -20)
credit.BackgroundTransparency = 1
credit.Text = "Freeze Trade By @thebestexploiterr"
credit.Font = Enum.Font.Gotham
credit.TextSize = 14
credit.TextColor3 = Color3.fromRGB(120, 180, 255)
credit.TextTransparency = 0.2
credit.Parent = main
