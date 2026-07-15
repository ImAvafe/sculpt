local Types = require("@self/PropertyTypes")

export type RuleProperties = Types.AllProperties
export type RuleTransitions = { [string]: TweenInfo }
export type RuleOptions = {
	Properties: { [string]: any }?,
	Transitions: RuleTransitions?,
}
export type StyleTokens = { [string]: string }
export type SheetOptions = {
	Rules: { StyleRule }?,
	Tokens: {
		[string]: any,
	}?,
}

local function Rule(Selector: string)
	assert(string.len(tostring(Selector)), "You must provide a selector")

	return function(Options: RuleOptions)
		local StyleRule = Instance.new("StyleRule")

		StyleRule.Selector = Selector

		StyleRule:SetProperties(Options.Properties or {})
		StyleRule:SetPropertyTransitions(Options.Transitions or {})

		return StyleRule
	end
end

local function Derive(Sheet: StyleSheet, Priority: number?)
	local StyleDerive = Instance.new("StyleDerive")

	StyleDerive.StyleSheet = Sheet

	if Priority ~= nil then
		StyleDerive.Priority = Priority
	end

	return StyleDerive
end

local function Sheet(Options: SheetOptions)
	local StyleSheet = Instance.new("StyleSheet")

	if Options.Rules ~= nil then
		for _, Rule in Options.Rules do
			Rule.Parent = StyleSheet
		end
	end

	if Options.Tokens ~= nil then
		for Key, Value in Options.Tokens do
			StyleSheet:SetAttribute(Key, Value)
		end
	end

	return StyleSheet
end

return {
	rule = Rule,
	derive = Derive,
	sheet = Sheet,
}
