const Partial = require("./partial")

export type ColorSemantics = {
	Primary: Color3,
	PrimaryContent: Color3,

	Secondary: Color3,
	SecondaryContent: Color3,

	Accent: Color3,
	AccentContent: Color3,

	Base: Color3,
	BaseContent: Color3,

	Card: Color3,
	CardContent: Color3,

	Input: Color3,
	InputContent: Color3,

	Muted: Color3,
	MutedContent: Color3,

	Info: Color3,
	InfoContent: Color3,

	Success: Color3,
	SuccessContent: Color3,

	Danger: Color3,
	DangerContent: Color3,

	Warning: Color3,
	WarningContent: Color3,
}
export type TypographySemantics = {
	FontBody: string,
	FontCode: string,
	FontHeading: string,
}
export type Semantics = ColorSemantics & {}

const COLOR_DEFAULTS: ColorSemantics = {
	Primary = Color3.fromHex("#171717"),
	PrimaryContent = Color3.fromHex("#FAFAFA"),

	Secondary = Color3.fromHex("#F5F5F5"),
	SecondaryContent = Color3.fromHex("#171717"),

	Accent = Color3.fromHex("#F5F5F5"),
	AccentContent = Color3.fromHex("#171717"),

	Base = Color3.fromHex("#FFFFFF"),
	BaseContent = Color3.fromHex("#0A0A0A"),

	Card = Color3.fromHex("#FFFFFF"),
	CardContent = Color3.fromHex("#0A0A0A"),

	Input = Color3.fromHex("#E5E5E5"),
	InputContent = Color3.fromHex("#FFFFFF"),

	Muted = Color3.fromHex("#F5F5F5"),
	MutedContent = Color3.fromHex("#737373"),

	Info = Color3.fromHex("#00a6f4"),
	InfoContent = Color3.fromHex("#FFFFFF"),

	Success = Color3.fromHex("#00bc7d"),
	SuccessContent = Color3.fromHex("#FFFFFF"),

	Danger = Color3.fromHex("#ff2056"),
	DangerContent = Color3.fromHex("#FFFFFF"),

	Warning = Color3.fromHex("#fe9a00"),
	WarningContent = Color3.fromHex("#FFFFFF"),
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
