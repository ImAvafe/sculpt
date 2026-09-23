local Partial = require("@self/partial")

export type Theme = {
	Size3Xs: number,
	Size2Xs: number,
	SizeXs: number,
	SizeSm: number,
	SizeBase: number,
	SizeLg: number,
	SizeXl: number,
	Size2Xl: number,
	Size3Xl: number,
	Size4Xl: number,
	Size5Xl: number,
	Size6Xl: number,
	Size7Xl: number,

	SpaceXs: number,
	SpaceSm: number,
	SpaceBase: number,
	SpaceLg: number,
	SpaceXl: number,
	Space2Xl: number,
	Space3Xl: number,
	Space4Xl: number,
	Space5Xl: number,

	TextXs: number,
	TextSm: number,
	TextBase: number,
	TextLg: number,
	TextXl: number,
	Text2Xl: number,
	Text3Xl: number,
	Text4Xl: number,
	Text5Xl: number,
	Text6Xl: number,
	Text7Xl: number,
	Text8Xl: number,
	Text9Xl: number,

	WeightBase: number,
	WeightMedium: number,
	WeightSemibold: number,
	WeightBold: number,

	RadiusXs: number,
	RadiusSm: number,
	RadiusBase: number,
	RadiusLg: number,
	RadiusXl: number,
	Radius2Xl: number,
	Radius3Xl: number,
	Radius4Xl: number,
	RadiusFull: number,

	StrokeSm: number,
	StrokeBase: number,
	StrokeLg: number,
	StrokeXl: number,

	TransparencyFull: number,
	TransparencyXHeavy: number,
	TransparencyHeavy: number,
	TransparencyBase: number,
	TransparencyLight: number,
	TransparencyXLight: number,
	TransparencyNone: number,

	[string]: any,
}

const SIZE_SCALE: { [string]: number } = {
	Size3Xs = 4 / 7,
	Size2Xs = 9 / 14,
	SizeXs = 5 / 7,
	SizeSm = 6 / 7,
	SizeBase = 1,
	SizeLg = 8 / 7,
	SizeXl = 9 / 7,
	Size2Xl = 3 / 2,
	Size3Xl = 12 / 7,
	Size4Xl = 2,
	Size5Xl = 16 / 7,
	Size6Xl = 18 / 7,
	Size7Xl = 20 / 7,
}
const SPACING_SCALE: { [string]: number } = {
	SpaceXs = 4 / 12,
	SpaceSm = 8 / 12,
	SpaceBase = 1,
	SpaceLg = 16 / 12,
	SpaceXl = 24 / 12,
	Space2Xl = 32 / 12,
	Space3Xl = 40 / 12,
	Space4Xl = 48 / 12,
	Space5Xl = 64 / 12,
}
const TEXT_SCALE: { [string]: number } = {
	TextXs = 12 / 16,
	TextSm = 14 / 16,
	TextBase = 1,
	TextLg = 18 / 16,
	TextXl = 20 / 16,
	Text2Xl = 24 / 16,
	Text3Xl = 30 / 16,
	Text4Xl = 36 / 16,
	Text5Xl = 48 / 16,
	Text6Xl = 60 / 16,
	Text7Xl = 72 / 16,
	Text8Xl = 96 / 16,
	Text9Xl = 128 / 16,
}
const RADIUS_SCALE: { [string]: number } = {
	RadiusXs = 2 / 6,
	RadiusSm = 4 / 6,
	RadiusBase = 1,
	RadiusLg = 8 / 6,
	RadiusXl = 12 / 6,
	Radius2Xl = 16 / 6,
	Radius3Xl = 24 / 6,
	Radius4Xl = 32 / 6,
	RadiusFull = 10000,
}
const STROKE_SCALE: { [string]: number } = {
	StrokeSm = 1 / 2,
	StrokeBase = 1,
	StrokeLg = 1.5,
	StrokeXl = 2,
}
const WEIGHT_SCALE: { [string]: number } = {
	WeightBase = 1,
	WeightMedium = 5 / 4,
	WeightSemibold = 6 / 4,
	WeightBold = 7 / 4,
}
const TRANSPARENCY_SCALE: { [string]: number } = {
	TransparencyFull = 1000,
	TransparencyXHeavy = 2,
	TransparencyHeavy = 1.5,
	TransparencyBase = 1,
	TransparencyLight = 0.5,
	TransparencyXLight = 0.25,
	TransparencyNone = 0,
}

const function newTheme(input: Partial.Partial<Theme>): Theme
	local theme = {}

	for token, multiplier in SIZE_SCALE do
		if input[token] == nil then
			theme[token] = math.floor((input.SizeBase or 448) * multiplier)
		end
	end

	for token, multiplier in SPACING_SCALE do
		if input[token] == nil then
			theme[token] = math.floor((input.SpaceBase or 12) * multiplier)
		end
	end

	for token, multiplier in TEXT_SCALE do
		if input[token] == nil then
			theme[token] = math.floor((input.TextBase or 16) * multiplier)
		end
	end

	for token, multiplier in WEIGHT_SCALE do
		if input[token] == nil then
			theme[token] = math.floor((input.WeightBase or 1) * multiplier)
		end
	end

	for token, multiplier in RADIUS_SCALE do
		if input[token] == nil then
			theme[token] = math.floor((input.RadiusBase or 6) * multiplier)
		end
	end

	for token, multiplier in STROKE_SCALE do
		if input[token] == nil then
			theme[token] = math.floor((input.StrokeBase or 1) * multiplier)
		end
	end

	for token, multiplier in TRANSPARENCY_SCALE do
		if input[token] == nil then
			theme[token] = math.floor((input.TransparencyBase or 1) * multiplier)
		end
	end

	return theme
end

return newTheme
