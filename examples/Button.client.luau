local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Style = require(ReplicatedStorage.Sculpt.Style)

local screenGui = Instance.new("ScreenGui")
local styleLink = Instance.new("StyleLink")
local button = Instance.new("TextButton")

local styleSheet = Style {
	Tokens = {
		Primary = Color3.fromRGB(255, 100, 100),
		PrimaryDark = Color3.fromRGB(240, 90, 90),
	},
	["TextButton"] = {
		BackgroundColor3 = "$Primary",
		BackgroundTransparency = 0,
		TextSize = 16,
		AutomaticSize = Enum.AutomaticSize.XY,
		AutoButtonColor = false,
		Transition = {
			BackgroundColor3 = TweenInfo.new(0.15, Enum.EasingStyle.Cubic),
		},
	},
	["TextButton:Hover"] = {
		BackgroundColor3 = "$PrimaryDark",
	},
}
styleSheet.Parent = screenGui

styleLink.StyleSheet = styleSheet
styleLink.Parent = screenGui

button.Parent = screenGui

screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
