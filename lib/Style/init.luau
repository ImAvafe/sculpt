export type Derives = { { Sheet: StyleSheet?, Priority: number? } }

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

export type Computed<Type> = (Tokens) -> Type
export type RuleProperty = any | string | Computed<any>
export type Rule = { [string]: RuleProperty?, Transition: { [string]: TweenInfo | Computed<TweenInfo> }? }

export type SheetProperties = { [string]: Rule, Tokens: Tokens?, Derives: Derives? }

local function newRule(selector: string, props: { [string]: Rule }, tokens: Tokens?)
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
			if type(value) == "function" then
				if tokens ~= nil then
					properties[key] = value(tokens)
				else
					warn("Token constructor used in", styleRule, "with no tokens passed")
				end
			else
				properties[key] = value
			end
		end
	end

	styleRule:SetProperties(properties)
	styleRule:SetPropertyTransitions(transitions)

	if defaultTransition ~= nil then
		styleRule:SetDefaultPropertyTransition(defaultTransition)
	end

	if #styleRule.SelectorError > 0 then
		warn(styleRule, "has SelectorError:", styleRule.SelectorError)
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
	for selector, prop in props do
		newRule(selector, prop :: { [string]: Rule }, tokens).Parent = styleSheet
	end

	return styleSheet
end

return newSheet
