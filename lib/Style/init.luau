local Types = require("@self/PropertyTypes")

export type Attribute =
	number
	| string
	| boolean
	| Color3
	| BrickColor
	| ColorSequence
	| CFrame
	| Vector2
	| Vector3
	| UDim
	| UDim2
	| Font
	| NumberSequence
	| NumberRange
	| Rect
	| Enum
	| EnumItem
export type Tokens = {
	[string]: Attribute,
}
export type Derives = { { Sheet: StyleSheet?, Priority: number? } }
export type Rule = Types.AllProperties & { Transition: { [string]: TweenInfo }? }
export type SheetProperties = { [string]: Rule, Tokens: Tokens?, Derives: Derives? }

local function newRule(selector: string, props: { [string]: Rule })
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

local function newSheet(props: SheetProperties)
	local styleSheet = Instance.new("StyleSheet")

	-- Set attribute tokens
	local tokens = props.Tokens or {}
	for key, value in tokens do
		styleSheet:SetAttribute(key, value)
	end
	props.Tokens = nil

	-- Derive from other style sheets
	local derives = props.Derives or {}
	for _, derive in derives do
		newDerive(derive.StyleSheet, derive.Priority).Parent = styleSheet
	end
	props.Derives = nil

	-- Apply style rules
	for selector, props in props do
		newRule(selector, props :: { [string]: Rule }).Parent = styleSheet
	end

	return styleSheet
end

return newSheet
