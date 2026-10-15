local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local style = require(ReplicatedStorage.Sculpt.Style)
local theme = require(ReplicatedStorage.Sculpt.Theme)
local mergeTables = require("./mergeTables")

local screenGui = Instance.new("ScreenGui")
local styleLink = Instance.new("StyleLink")
local button = Instance.new("TextButton")

const myTheme = mergeTables(theme.primitives({}), theme.semantics({}))

const styleSheet = style {
	Tokens = myTheme,

	["TextButton"] = {
		BackgroundColor3 = "$Primary",
		TextColor3 = "$PrimaryContent",
		TextSize = "$TextBase",
		FontFace = function(tokens: typeof(myTheme))
			return Font.new(tokens.FontSansSerif)
		end,
		BackgroundTransparency = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
	},
	["TextButton::UIPadding"] = {
		PaddingLeft = UDim.new(0, 8),
		PaddingRight = UDim.new(0, 8),
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
	},
	["TextButton::UICorner"] = {
		CornerRadius = UDim.new(0, 6),
	},
}

styleSheet.Parent = screenGui

styleLink.StyleSheet = styleSheet
styleLink.Parent = screenGui

button.Parent = screenGui

screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
