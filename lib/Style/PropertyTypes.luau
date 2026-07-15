export type InstanceProperties = {
	Archivable: boolean?,
	Name: string?,
	Parent: Instance?,
	[string]: any,
}

export type GuiObjectProperties = {
	Active: boolean?,
	AnchorPoint: Vector2?,
	AutomaticSize: Enum.AutomaticSize?,
	BackgroundColor: BrickColor?,
	BackgroundColor3: Color3?,
	BackgroundTransparency: number?,
	BorderColor3: Color3?,
	BorderMode: Enum.BorderMode?,
	BorderSizePixel: number?,
	ClipsDescendants: boolean?,
	Interactable: boolean?,
	LayoutOrder: number?,
	Position: UDim2?,
	Rotation: number?,
	Selectable: boolean?,
	SelectionOrder: number?,
	Size: UDim2?,
	SizeConstraint: Enum.SizeConstraint?,
	Transparency: number?,
	Visible: boolean?,
	ZIndex: number?,
}

export type GuiButtonProperties = {
	AutoButtonColor: boolean?,
}

export type TextLabelProperties = {
	Font: Enum.Font?,
	FontFace: Font?,
	LineHeight: number?,
	MaxVisibleGraphemes: number?,
	OpenTypeFeatures: string?,
	RichText: boolean?,
	Text: string?,
	TextColor3: Color3?,
	TextDirection: Enum.TextDirection?,
	TextScaled: boolean?,
	TextSize: number?,
	TextStrokeColor3: Color3?,
	TextStrokeTransparency: number?,
	TextTransparency: number?,
	TextTruncate: Enum.TextTruncate?,
	TextWrapped: boolean?,
	TextXAlignment: Enum.TextXAlignment?,
	TextYAlignment: Enum.TextYAlignment?,
}

export type TextButtonProperties = {
	Font: Enum.Font?,
	FontFace: Font?,
	LineHeight: number?,
	MaxVisibleGraphemes: number?,
	OpenTypeFeatures: string?,
	RichText: boolean?,
	Text: string?,
	TextColor3: Color3?,
	TextDirection: Enum.TextDirection?,
	TextScaled: boolean?,
	TextSize: number?,
	TextStrokeColor3: Color3?,
	TextStrokeTransparency: number?,
	TextTransparency: number?,
	TextTruncate: Enum.TextTruncate?,
	TextWrapped: boolean?,
	TextXAlignment: Enum.TextXAlignment?,
	TextYAlignment: Enum.TextYAlignment?,
}

export type ImageLabelProperties = {
	Image: string?,
	ImageColor3: Color3?,
	ImageContent: Content?,
	ImageRectOffset: Vector2?,
	ImageRectSize: Vector2?,
	ImageTransparency: number?,
	ResampleMode: Enum.ResamplerMode?,
	ScaleType: Enum.ScaleType?,
	SliceCenter: Rect?,
	SliceScale: number?,
	TileSize: UDim2?,
}

export type ImageButtonProperties = {
	HoverImage: string?,
	HoverImageContent: Content?,
	Image: string?,
	ImageColor3: Color3?,
	ImageContent: Content?,
	ImageRectOffset: Vector2?,
	ImageRectSize: Vector2?,
	ImageTransparency: number?,
	PressedImage: string?,
	PressedImageContent: Content?,
	ResampleMode: Enum.ResamplerMode?,
	ScaleType: Enum.ScaleType?,
	SliceCenter: Rect?,
	SliceScale: number?,
	TileSize: UDim2?,
}

export type TextBoxProperties = {
	ClearTextOnFocus: boolean?,
	MultiLine: boolean?,
	PlaceholderColor3: Color3?,
	PlaceholderText: string?,
	ShowNativeInput: string?,
	TextEditable: boolean?,
}

export type ScrollingFrameProperties = {
	AutomaticCanvasSize: Enum.AutomaticSize?,
	BottomImage: string?,
	BottomImageContent: Content?,
	CanvasSize: UDim2?,
	ElasticBehavior: Enum.ElasticBehavior?,
	HorizontalScrollBarInset: Enum.ScrollBarInset?,
	MidImage: string?,
	MidImageContent: Content?,
	ScrollBarImageColor3: Color3?,
	ScrollBarImageTransparency: number?,
	ScrollBarThickness: number?,
	ScrollingDirection: Enum.ScrollingDirection?,
	ScrollingEnabled: boolean?,
	TopImage: string?,
	TopImageContent: Content?,
	VerticalScrollBarInset: Enum.ScrollBarInset?,
	VerticalScrollBarPosition: Enum.VerticalScrollBarPosition?,
}

export type ViewportFrameProperties = {
	Ambient: Color3?,
	ImageColor3: Color3?,
	ImageTransparency: number?,
	LightColor: Color3?,
	LightDirection: Vector3?,
}

export type Path2DProperties = {
	Closed: boolean?,
	Color3: Color3?,
	Thickness: number?,
	Visible: boolean?,
	ZIndex: number?,
}

export type CanvasGroupProperties = {
	GroupColor3: Color3?,
	GroupTransparency: number?,
}

export type UICornerProperties = {
	CornerRadius: UDim?,
	BottomLeftRadius: UDim?,
	BottomRightRadius: UDim?,
	TopLeftRadius: UDim?,
	TopRightRadius: UDim?,
}

export type UIGradientProperties = {
	Color: ColorSequence?,
	Enabled: boolean?,
	Offset: Vector2?,
	Rotation: number?,
	Transparency: NumberSequence?,
}

export type UIPaddingProperties = {
	PaddingBottom: UDim?,
	PaddingLeft: UDim?,
	PaddingRight: UDim?,
	PaddingTop: UDim?,
}

export type UIShadowProperties = {
	BlurRadius: UDim?,
	Color: Color3?,
	Offset: UDim2?,
	Spread: UDim2?,
	Transparency: number?,
	ZIndex: number?,
}

export type UIStrokeProperties = {
	ApplyStrokeMode: Enum.ApplyStrokeMode?,
	Color: Color3?,
	Enabled: boolean?,
	LineJoinMode: Enum.LineJoinMode?,
	Thickness: number?,
	Transparency: number?,
}

export type UIListLayoutProperties = {
	HorizontalFlex: Enum.UIFlexAlignment?,
	HorizontalPadding: UDim?,
	ItemLineAlignment: Enum.ItemLineAlignment?,
	Padding: UDim?,
	VerticalFlex: Enum.UIFlexAlignment?,
	VerticalPadding: UDim?,
	Wraps: boolean?,
}

export type UIGridStyleLayoutProperties = {
	FillDirection: Enum.FillDirection?,
	HorizontalAlignment: Enum.HorizontalAlignment?,
	SortOrder: Enum.SortOrder?,
	VerticalAlignment: Enum.VerticalAlignment?,
}

export type UIGridLayoutProperties = {
	CellPadding: UDim2?,
	CellSize: UDim2?,
	FillDirectionMaxCells: number?,
	StartCorner: Enum.StartCorner?,
}

export type UIPageLayoutProperties = {
	Animated: boolean?,
	Circular: boolean?,
	EasingDirection: Enum.EasingDirection?,
	EasingStyle: Enum.EasingStyle?,
	GamepadInputEnabled: boolean?,
	Padding: UDim?,
	ScrollWheelInputEnabled: boolean?,
	TouchInputEnabled: boolean?,
	TweenTime: number?,
}

export type UIAspectRatioConstraintProperties = {
	AspectRatio: number?,
	AspectType: Enum.AspectType?,
	DominantAxis: Enum.DominantAxis?,
}

export type UISizeConstraintProperties = {
	MaxSize: Vector2?,
	MinSize: Vector2?,
}

export type UITextSizeConstraintProperties = {
	MaxTextSize: number?,
	MinTextSize: number?,
}

export type UIScaleProperties = {
	Scale: number?,
}

export type UIFlexItemProperties = {
	FlexMode: Enum.UIFlexMode?,
	GrowRatio: number?,
	ItemLineAlignment: Enum.ItemLineAlignment?,
	ShrinkRatio: number?,
}

export type StyleQueryProperties = {
	AspectRatioRange: NumberRange?,
	MaxSize: Vector2?,
	MinSize: Vector2?,
	PreferredInputType: Enum.PreferredInput?,
	ReduceMotionEnabled: boolean?,
	ViewportDisplaySize: Enum.DisplaySize?,
}

export type AllProperties =
	InstanceProperties
	& GuiObjectProperties
	& GuiButtonProperties
	& TextLabelProperties
	& TextButtonProperties
	& ImageLabelProperties
	& ImageButtonProperties
	& TextBoxProperties
	& ScrollingFrameProperties
	& ViewportFrameProperties
	& Path2DProperties
	& CanvasGroupProperties
	& UICornerProperties
	& UIGradientProperties
	& UIPaddingProperties
	& UIShadowProperties
	& UIStrokeProperties
	& UIListLayoutProperties
	& UIGridStyleLayoutProperties
	& UIGridLayoutProperties
	& UIPageLayoutProperties
	& UIAspectRatioConstraintProperties
	& UISizeConstraintProperties
	& UITextSizeConstraintProperties
	& UIScaleProperties
	& UIFlexItemProperties
	& StyleQueryProperties

return nil
