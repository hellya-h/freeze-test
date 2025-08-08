local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- UI
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "TradeHubUI"
ScreenGui.ResetOnSpawn = false

-- Draggable frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 220)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Drag Circle
local DragCircle = Instance.new("ImageLabel", MainFrame)
DragCircle.Size = UDim2.new(0, 20, 0, 20)
DragCircle.Position = UDim2.new(0, 5, 0, 5)
DragCircle.BackgroundTransparency = 1
DragCircle.Image = "rbxassetid://11372950109"

-- Gradient Title
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -40, 0, 30)
Title.Position = UDim2.new(0, 30, 0, 0)
Title.Text = "Trade Hub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1

local UIGradient = Instance.new("UIGradient", Title)
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 200, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 60, 255))
}

-- Gradient animation
task.spawn(function()
	while true do
		UIGradient.Rotation = UIGradient.Rotation + 1
		task.wait(0.01)
	end
end)

-- Close Button
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -25, 0, 5)
CloseBtn.Text = "✖"
CloseBtn.Font = Enum.Font.Gotham
CloseBtn.TextSize = 14
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundTransparency = 1
CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Minimize Button
local MinimizeBtn = Instance.new("TextButton", MainFrame)
MinimizeBtn.Size = UDim2.new(0, 20, 0, 20)
MinimizeBtn.Position = UDim2.new(1, -50, 0, 5)
MinimizeBtn.Text = "_"
MinimizeBtn.Font = Enum.Font.Gotham
MinimizeBtn.TextSize = 18
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.BackgroundTransparency = 1

local minimized = false

MinimizeBtn.MouseButton1Click:Connect(function()
	if minimized then
		MainFrame:TweenSizeAndPosition(
			UDim2.new(0, 300, 0, 220),
			UDim2.new(0.3, 0, 0.3, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quad,
			0.4
		)
	else
		local corner = UDim2.new(0.9, -100, 1, -40)
		MainFrame:TweenSizeAndPosition(
			UDim2.new(0, 120, 0, 30),
			corner,
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quad,
			0.4
		)
	end
	minimized = not minimized
end)

-- Enable buttons after bypass
local bypassed = false

-- Bypass Button
local BypassBtn = Instance.new("TextButton", MainFrame)
BypassBtn.Size = UDim2.new(0.8, 0, 0, 40)
BypassBtn.Position = UDim2.new(0.1, 0, 0, 40)
BypassBtn.Text = "Bypass Anti-Cheat"
BypassBtn.Font = Enum.Font.GothamBold
BypassBtn.TextSize = 16
BypassBtn.TextColor3 = Color3.new(1, 1, 1)
BypassBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
BypassBtn.BorderSizePixel = 0
BypassBtn.AutoButtonColor = true

-- Progress Bar
local LoadingBar = Instance.new("Frame", BypassBtn)
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
LoadingBar.Size = UDim2.new(0, 0, 1, 0)
LoadingBar.Position = UDim2.new(0, 0, 0, 0)
LoadingBar.BorderSizePixel = 0

-- Freeze Trade Button
local FreezeBtn = Instance.new("TextButton", MainFrame)
FreezeBtn.Size = UDim2.new(0.8, 0, 0, 35)
FreezeBtn.Position = UDim2.new(0.1, 0, 0, 130)
FreezeBtn.Text = "Freeze Trade"
FreezeBtn.Font = Enum.Font.Gotham
FreezeBtn.TextSize = 16
FreezeBtn.TextColor3 = Color3.new(1, 1, 1)
FreezeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
FreezeBtn.BorderSizePixel = 0
FreezeBtn.AutoButtonColor = true
FreezeBtn.Active = false

-- Auto Accept Button
local AcceptBtn = Instance.new("TextButton", MainFrame)
AcceptBtn.Size = UDim2.new(0.8, 0, 0, 35)
AcceptBtn.Position = UDim2.new(0.1, 0, 0, 175)
AcceptBtn.Text = "Force Accept"
AcceptBtn.Font = Enum.Font.Gotham
AcceptBtn.TextSize = 16
AcceptBtn.TextColor3 = Color3.new(1, 1, 1)
AcceptBtn.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
AcceptBtn.BorderSizePixel = 0
AcceptBtn.AutoButtonColor = true
AcceptBtn.Active = false

-- Bypass logic
BypassBtn.MouseButton1Click:Connect(function()
	if bypassed then return end
	bypassed = true

	local duration = 10
	local startTime = tick()
	local conn
	conn = game:GetService("RunService").RenderStepped:Connect(function()
		local elapsed = tick() - startTime
		local percent = math.clamp(elapsed / duration, 0, 1)
		LoadingBar.Size = UDim2.new(percent, 0, 1, 0)
		if percent == 1 then
			conn:Disconnect()
			BypassBtn.Text = "Bypass Completed"
			StarterGui:SetCore("SendNotification", {
				Title = "Bypass Active",
				Text = "✔ Anti-Cheat disabled 🎉",
				Duration = 4
			})
			FreezeBtn.Active = true
			AcceptBtn.Active = true
		end
	end)
end)
