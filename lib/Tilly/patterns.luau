export type Pattern = {
	namespace: string,
	properties: { string },
	pseudoInstance: string?,
	propertyComponent: string?,
}

const PATTERNS: { [string]: { Pattern } } = {
	-- Background utils
	["bg"] = {
		{
			namespace = "color",
			properties = { "BackgroundColor3" },
		},
	},
	["opacity"] = {
		{
			namespace = "transparency",
			properties = { "Transparency" },
		},
	},

	-- Text utils
	["text"] = {
		{
			namespace = "text",
			properties = { "TextSize" },
		},
		{
			namespace = "color",
			properties = { "TextColor3" },
		},
	},
	["font"] = {
		{
			namespace = "font",
			properties = { "FontFace" },
			propertyComponent = "Family",
		},
		{
			namespace = "fontWeight",
			properties = { "FontFace" },
			propertyComponent = "Weight",
		},
	},
	["leading"] = {
		{
			namespace = "leading",
			properties = { "LineHeight" },
		},
	},

	-- Border utils
	["border"] = {
		{
			namespace = "stroke",
			properties = { "Thickness" },
			pseudoInstance = "UIStroke",
		},
		{
			namespace = "color",
			properties = { "Color" },
			pseudoInstance = "UIStroke",
		},
	},
	["rounded"] = {
		{
			namespace = "radius",
			properties = { "CornerRadius" },
			pseudoInstance = "UICorner",
		},
	},
	["rounded-t"] = {
		{
			namespace = "radius",
			properties = { "TopLeftRadius", "TopRightRadius" },
			pseudoInstance = "UICorner",
		},
	},
	["rounded-r"] = {
		{
			namespace = "radius",
			properties = { "TopRightRadius", "BottomRightRadius" },
			pseudoInstance = "UICorner",
		},
	},
	["rounded-b"] = {
		{
			namespace = "radius",
			properties = { "BottomRightRadius", "BottomLeftRadius" },
			pseudoInstance = "UICorner",
		},
	},
	["rounded-l"] = {
		{
			namespace = "radius",
			properties = { "TopLeftRadius", "BottomLeftRadius" },
			pseudoInstance = "UICorner",
		},
	},
	["rounded-tl"] = {
		{
			namespace = "radius",
			properties = { "TopLeftRadius" },
			pseudoInstance = "UICorner",
		},
	},
	["rounded-tr"] = {
		{
			namespace = "radius",
			properties = { "TopRightRadius" },
			pseudoInstance = "UICorner",
		},
	},
	["rounded-br"] = {
		{
			namespace = "radius",
			properties = { "BottomRightRadius" },
			pseudoInstance = "UICorner",
		},
	},
	["rounded-bl"] = {
		{
			namespace = "radius",
			properties = { "BottomLeftRadius" },
			pseudoInstance = "UICorner",
		},
	},

	-- Spacing
	["p"] = {
		{
			namespace = "spacing",
			properties = { "PaddingTop", "PaddingRight", "PaddingBottom", "PaddingLeft" },
			pseudoInstance = "UIPadding",
		},
	},
	["px"] = {
		{
			namespace = "spacing",
			properties = { "PaddingLeft", "PaddingRight" },
			pseudoInstance = "UIPadding",
		},
	},
	["py"] = {
		{
			namespace = "spacing",
			properties = { "PaddingTop", "PaddingBottom" },
			pseudoInstance = "UIPadding",
		},
	},
	["pt"] = {
		{
			namespace = "spacing",
			properties = { "PaddingTop" },
			pseudoInstance = "UIPadding",
		},
	},
	["pr"] = {
		{
			namespace = "spacing",
			properties = { "PaddingRight" },
			pseudoInstance = "UIPadding",
		},
	},
	["pb"] = {
		{
			namespace = "spacing",
			properties = { "PaddingBottom" },
			pseudoInstance = "UIPadding",
		},
	},
	["pl"] = {
		{
			namespace = "spacing",
			properties = { "PaddingLeft" },
			pseudoInstance = "UIPadding",
		},
	},
	["gap"] = {
		{
			namespace = "spacing",
			properties = { "Padding" },
			pseudoInstance = "UIListLayout",
		},
	},
	["gap-x"] = {
		{
			namespace = "spacing",
			properties = { "HorizontalPadding" },
			pseudoInstance = "UIListLayout",
		},
	},
	["gap-y"] = {
		{
			namespace = "spacing",
			properties = { "VerticalPadding" },
			pseudoInstance = "UIListLayout",
		},
	},

	-- Sizing utils
	["w"] = {
		{
			namespace = "spacing",
			properties = { "Size" },
			propertyComponent = "X",
		},
	},
	["h"] = {
		{
			namespace = "spacing",
			properties = { "Size" },
			propertyComponent = "Y",
		},
	},
	["size"] = {
		{
			namespace = "spacing",
			properties = { "Size" },
		},
	},
	["min-w"] = {
		{
			namespace = "spacing",
			properties = { "MinSize" },
			pseudoInstance = "UISizeConstraint",
			propertyComponent = "X",
		},
	},
	["min-h"] = {
		{
			namespace = "spacing",
			properties = { "MinSize" },
			pseudoInstance = "UISizeConstraint",
			propertyComponent = "Y",
		},
	},
	["max-w"] = {
		{
			namespace = "spacing",
			properties = { "MaxSize" },
			pseudoInstance = "UISizeConstraint",
			propertyComponent = "X",
		},
	},
	["max-h"] = {
		{
			namespace = "spacing",
			properties = { "MaxSize" },
			pseudoInstance = "UISizeConstraint",
			propertyComponent = "Y",
		},
	},
	["aspect"] = {
		{
			namespace = "aspect",
			properties = { "AspectRatio" },
			pseudoInstance = "UIAspectRatioConstraint",
		},
	},

	-- Positioning utils
	["inset"] = {
		{
			namespace = "spacing",
			properties = { "Position" },
		},
	},
	["inset-x"] = {
		{
			namespace = "spacing",
			properties = { "Position" },
			propertyComponent = "X",
		},
	},
	["inset-y"] = {
		{
			namespace = "spacing",
			properties = { "Position" },
			propertyComponent = "Y",
		},
	},
	["top"] = {
		{
			namespace = "spacing",
			properties = { "Position" },
			propertyComponent = "Y",
		},
	},
	["left"] = {
		{
			namespace = "spacing",
			properties = { "Position" },
			propertyComponent = "X",
		},
	},
}

return table.freeze(PATTERNS)
