local generateUtilitySheet = require("@game/ReplicatedStorage/Sculpt/UtilityTags/generateUtilitySheet")

local sheet = generateUtilitySheet()

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("Players"):WaitForChild("ImAvafe"):FindFirstChild("PlayerGui")

local link = Instance.new("StyleLink")
link.Parent = gui
link.StyleSheet = sheet

sheet.Parent = link

local button = Instance.new("TextButton")
button:AddTag("bg-red-500")
button:AddTag("font-bold")
button:AddTag("text-xl")
button:AddTag("rounded-full")
button.Size = UDim2.fromOffset(200, 50)
button.Parent = gui
