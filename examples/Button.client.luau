local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Style = require(ReplicatedStorage.Sculpt.Style)

local StyleSheet = Style.sheet {
	Rules = {
		Style.rule "TextButton" {
			Properties = {
				BackgroundColor3 = Color3.fromRGB(255, 100, 100),
				BackgroundTransparency = 1,
				TextColor3 = Color3.fromRGB(0, 150, 150),
			},
			Transitions = {},
		},
	},
}

local ScreenGui = Instance.new("ScreenGui")
local StyleLink = Instance.new("StyleLink")
local Button = Instance.new("TextButton")

StyleSheet.Parent = ScreenGui

StyleLink.StyleSheet = StyleSheet
StyleLink.Parent = ScreenGui

Button.Parent = ScreenGui

ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
