export type InstanceProperties = {
	Archivable: boolean?,
	Name: string?,
	Parent: Instance?,
}

export type GuiObjectProperties = CommonUIProperties & {
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
	Selectable: boolean?,
	SelectionOrder: number?,
	Size: UDim2?,
	SizeConstraint: Enum.SizeConstraint?,
}

export type GuiButtonProperties = {
	AutoButtonColor: boolean?,
}

export type TextProperties = {
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

export type CommonImageProperties = {
	ImageColor3: Color3?,
	ImageTransparency: number?,
}

export type CommonUIProperties = {
	Visible: boolean?,
	Thickness: number?,
	Transparency: number? | NumberSequence?,
	ZIndex: number?,
	Color: Color3? | ColorSequence?,
	Enabled: boolean?,
	Rotation: number?,
	Offset: UDim2? | Vector2?,
	ItemLineAlignment: Enum.ItemLineAlignment?,
	Padding: UDim?,
}

export type CommonSizeProperties = {
	MaxSize: number?,
	MinSize: number?,
}

export type ImageProperties = CommonImageProperties & {
	Image: string?,
	ImageContent: Content?,
	ImageRectOffset: Vector2?,
	ImageRectSize: Vector2?,
	ResampleMode: Enum.ResamplerMode?,
	ScaleType: Enum.ScaleType?,
	SliceCenter: Rect?,
	SliceScale: number?,
	TileSize: UDim2?,
}

export type ImageButtonProperties = ImageProperties & {
	HoverImage: string?,
	HoverImageContent: Content?,
	PressedImage: string?,
	PressedImageContent: Content?,
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

export type ViewportFrameProperties = CommonImageProperties & {
	Ambient: Color3?,
	LightColor: Color3?,
	LightDirection: Vector3?,
}

export type Path2DProperties = CommonUIProperties & {
	Closed: boolean?,
	Color3: Color3?,
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

export type UIPaddingProperties = {
	PaddingBottom: UDim?,
	PaddingLeft: UDim?,
	PaddingRight: UDim?,
	PaddingTop: UDim?,
}

export type UIShadowProperties = CommonUIProperties & {
	BlurRadius: UDim?,
	Spread: UDim2?,
}

export type UIStrokeProperties = CommonUIProperties & {
	ApplyStrokeMode: Enum.ApplyStrokeMode?,
	LineJoinMode: Enum.LineJoinMode?,
}

export type UIListLayoutProperties = CommonUIProperties & {
	HorizontalFlex: Enum.UIFlexAlignment?,
	HorizontalPadding: UDim?,
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

export type UIPageLayoutProperties = CommonUIProperties & {
	Animated: boolean?,
	Circular: boolean?,
	EasingDirection: Enum.EasingDirection?,
	EasingStyle: Enum.EasingStyle?,
	GamepadInputEnabled: boolean?,
	ScrollWheelInputEnabled: boolean?,
	TouchInputEnabled: boolean?,
	TweenTime: number?,
}

export type UIAspectRatioConstraintProperties = {
	AspectRatio: number?,
	AspectType: Enum.AspectType?,
	DominantAxis: Enum.DominantAxis?,
}

export type UITextSizeConstraintProperties = {
	MaxTextSize: number?,
	MinTextSize: number?,
}

export type UIScaleProperties = {
	Scale: number?,
}

export type UIFlexItemProperties = CommonUIProperties & {
	FlexMode: Enum.UIFlexMode?,
	GrowRatio: number?,
	ShrinkRatio: number?,
}

export type StyleQueryProperties = CommonSizeProperties & {
	AspectRatioRange: NumberRange?,
	PreferredInputType: Enum.PreferredInput?,
	ReduceMotionEnabled: boolean?,
	ViewportDisplaySize: Enum.DisplaySize?,
}

export type AllProperties =
	InstanceProperties
	& CommonSizeProperties
	& GuiObjectProperties
	& GuiButtonProperties
	& TextProperties
	& ImageProperties
	& ImageButtonProperties
	& TextBoxProperties
	& ScrollingFrameProperties
	& ViewportFrameProperties
	& Path2DProperties
	& CanvasGroupProperties
	& UICornerProperties
	& UIPaddingProperties
	& UIShadowProperties
	& UIStrokeProperties
	& UIListLayoutProperties
	& UIGridStyleLayoutProperties
	& UIGridLayoutProperties
	& UIPageLayoutProperties
	& UIAspectRatioConstraintProperties
	& UITextSizeConstraintProperties
	& UIScaleProperties
	& UIFlexItemProperties
	& StyleQueryProperties

return nil
