const Partial = require("./partial")

export type ColorSemantics = {
	["primary"]: Color3,
	["primary-content"]: Color3,

	["secondary"]: Color3,
	["secondary-content"]: Color3,

	["accent"]: Color3,
	["accent-content"]: Color3,

	["base"]: Color3,
	["base-content"]: Color3,

	["card"]: Color3,
	["card-content"]: Color3,

	["input"]: Color3,
	["input-content"]: Color3,

	["muted"]: Color3,
	["muted-content"]: Color3,

	["info"]: Color3,
	["info-content"]: Color3,

	["success"]: Color3,
	["success-content"]: Color3,

	["danger"]: Color3,
	["danger-content"]: Color3,

	["warning"]: Color3,
	["warning-content"]: Color3,
}
export type TypographySemantics = {
	["font-body"]: string,
	["font-code"]: string,
	["font-heading"]: string,
}
export type Semantics = ColorSemantics & {}

const COLOR_DEFAULTS: ColorSemantics = {
	["primary"] = Color3.fromHex("#171717"),
	["primary-content"] = Color3.fromHex("#FAFAFA"),

	["secondary"] = Color3.fromHex("#F5F5F5"),
	["secondary-content"] = Color3.fromHex("#171717"),

	["accent"] = Color3.fromHex("#F5F5F5"),
	["accent-content"] = Color3.fromHex("#171717"),

	["base"] = Color3.fromHex("#FFFFFF"),
	["base-content"] = Color3.fromHex("#0A0A0A"),

	["card"] = Color3.fromHex("#FFFFFF"),
	["card-content"] = Color3.fromHex("#0A0A0A"),

	["input"] = Color3.fromHex("#E5E5E5"),
	["input-content"] = Color3.fromHex("#FFFFFF"),

	["muted"] = Color3.fromHex("#F5F5F5"),
	["muted-content"] = Color3.fromHex("#737373"),

	["info"] = Color3.fromHex("#00a6f4"),
	["info-content"] = Color3.fromHex("#FFFFFF"),

	["success"] = Color3.fromHex("#00bc7d"),
	["success-content"] = Color3.fromHex("#FFFFFF"),

	["danger"] = Color3.fromHex("#ff2056"),
	["danger-content"] = Color3.fromHex("#FFFFFF"),

	["warning"] = Color3.fromHex("#fe9a00"),
	["warning-content"] = Color3.fromHex("#FFFFFF"),
}

const function generateSemantics(input: Partial.Partial<Semantics>): Semantics
	local semantics = table.clone(input)

	for token, color in COLOR_DEFAULTS :: { [string]: Color3 } do
		if input[token] == nil then
			semantics[token] = color
		end
	end

	return semantics :: Semantics
end

return generateSemantics
