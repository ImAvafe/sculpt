-- local Types = require("@self/PropertyTypes")

local function newRule(selector: string, props: { [string]: any })
	assert(string.len(tostring(selector)), "You must provide a selector")

	local styleRule = Instance.new("StyleRule")
	styleRule.Selector = selector

	local properties: { [string]: any } = {}
	local transitions: { [string]: TweenInfo } = {}
	local defaultTransition = nil

	for key, value in props do
		if key == "Transition" and type(value) == "table" then
			for property, tweenInfo in value do
				if property == "Default" then
					defaultTransition = tweenInfo
				else
					transitions[property] = tweenInfo
				end
			end
		else
			properties[key] = value
		end
	end

	styleRule:SetProperties(properties)
	styleRule:SetPropertyTransitions(transitions)

	if defaultTransition ~= nil then
		styleRule:SetDefaultPropertyTransition(defaultTransition)
	end

	return styleRule
end

local function newDerive(sheet: StyleSheet, priority: number?)
	local styleDerive = Instance.new("StyleDerive")
	styleDerive.StyleSheet = sheet

	if priority ~= nil then
		styleDerive.Priority = priority
	end

	return styleDerive
end

local function newSheet(rules: {
	[string]: { [string]: any },
})
	local styleSheet = Instance.new("StyleSheet")

	-- Set attribute tokens
	local tokens = rules.Tokens or {}
	for key, value in tokens do
		styleSheet:SetAttribute(key, value)
	end
	rules.Tokens = nil

	-- Derive from other style sheets
	local derives = rules.Derives or {}
	for _, derive in derives do
		newDerive(derive.StyleSheet, derive.Priority).Parent = styleSheet
	end
	rules.Derives = nil

	-- Apply style rules
	for selector, props in rules do
		newRule(selector, props).Parent = styleSheet
	end

	return styleSheet
end

return newSheet
