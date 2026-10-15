const function toUDim(unit: number)
	return UDim.new(0, unit)
end

const function toUDim2(unit: number)
	return UDim2.fromOffset(unit, unit)
end

const function toVector2(unit: number)
	return Vector2.new(unit, unit)
end

const function toTransparency(unit: number)
	return math.clamp(unit, 0, 1)
end

const function toFont(family: string | EnumItem)
	if typeof(family) == "string" then
		return Font.new(family)
	end
	return family
end

const CONVERSIONS: { [string]: (any) -> any } = {
	-- UIPadding (spacing, pixels)
	PaddingTop = toUDim,
	PaddingRight = toUDim,
	PaddingBottom = toUDim,
	PaddingLeft = toUDim,

	-- UIListLayout (spacing, pixels)
	Padding = toUDim,
	HorizontalPadding = toUDim,
	VerticalPadding = toUDim,

	-- UICorner (radius)
	CornerRadius = toUDim,
	TopLeftRadius = toUDim,
	TopRightRadius = toUDim,
	BottomRightRadius = toUDim,
	BottomLeftRadius = toUDim,

	-- Sizing and positioning (spacing, pixels)
	Size = toUDim2,
	Position = toUDim2,
	MinSize = toVector2,
	MaxSize = toVector2,

	Transparency = toTransparency,
	FontFace = toFont,
}

const function convertValue(property: string, value: any): any
	const convert = CONVERSIONS[property]
	if convert then
		return convert(value)
	else
		return value
	end
end

return convertValue
