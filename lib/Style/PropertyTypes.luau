export type InstanceProperties = {
	Archivable: string? | boolean?,
	Name: string?,
	Parent: string? | Instance?,
}

export type GuiObjectProperties = CommonUIProperties & {
	Active: boolean? | string?,
	AnchorPoint: Vector2? | string?,
	AutomaticSize: Enum.AutomaticSize? | string?,
	BackgroundColor: BrickColor? | string?,
	BackgroundColor3: Color3? | string?,
	BackgroundTransparency: number? | string?,
	BorderColor3: Color3? | string?,
	BorderMode: Enum.BorderMode? | string?,
	BorderSizePixel: number? | string?,
	ClipsDescendants: boolean? | string?,
	Interactable: boolean? | string?,
	LayoutOrder: number? | string?,
	Position: UDim2? | string?,
	Selectable: boolean? | string?,
	SelectionOrder: number? | string?,
	Size: UDim2? | string?,
	SizeConstraint: Enum.SizeConstraint? | string?,
}

export type GuiButtonProperties = {
	AutoButtonColor: boolean? | string?,
}

export type TextProperties = {
	Font: Enum.Font? | string?,
	FontFace: Font? | string?,
	LineHeight: number? | string?,
	MaxVisibleGraphemes: number? | string?,
	OpenTypeFeatures: string?,
	RichText: boolean? | string?,
	Text: string?,
	TextColor3: Color3? | string?,
	TextDirection: Enum.TextDirection? | string?,
	TextScaled: boolean? | string?,
	TextSize: number? | string?,
	TextStrokeColor3: Color3? | string?,
	TextStrokeTransparency: number? | string?,
	TextTransparency: number? | string?,
	TextTruncate: Enum.TextTruncate? | string?,
	TextWrapped: boolean? | string?,
	TextXAlignment: Enum.TextXAlignment? | string?,
	TextYAlignment: Enum.TextYAlignment? | string?,
}

export type CommonImageProperties = {
	ImageColor3: Color3? | string?,
	ImageTransparency: number? | string?,
}

export type CommonUIProperties = {
	Visible: boolean? | string?,
	Thickness: number? | string?,
	Transparency: number? | NumberSequence? | string?,
	ZIndex: number? | string?,
	Color: Color3? | ColorSequence? | string?,
	Enabled: boolean? | string?,
	Rotation: number? | string?,
	Offset: UDim2? | Vector2? | string?,
	ItemLineAlignment: Enum.ItemLineAlignment? | string?,
	Padding: UDim? | string?,
}

export type CommonSizeProperties = {
	MaxSize: number? | string?,
	MinSize: number? | string?,
}

export type ImageProperties = CommonImageProperties & {
	Image: string?,
	ImageContent: Content? | string?,
	ImageRectOffset: Vector2? | string?,
	ImageRectSize: Vector2? | string?,
	ResampleMode: Enum.ResamplerMode? | string?,
	ScaleType: Enum.ScaleType? | string?,
	SliceCenter: Rect? | string?,
	SliceScale: number? | string?,
	TileSize: UDim2? | string?,
}

export type ImageButtonProperties = ImageProperties & {
	HoverImage: string?,
	HoverImageContent: Content? | string?,
	PressedImage: string? | string?,
	PressedImageContent: Content? | string?,
}

export type TextBoxProperties = {
	ClearTextOnFocus: boolean? | string?,
	MultiLine: boolean? | string?,
	PlaceholderColor3: Color3? | string?,
	PlaceholderText: string?,
	ShowNativeInput: string?,
	TextEditable: boolean? | string?,
}

export type ScrollingFrameProperties = {
	AutomaticCanvasSize: Enum.AutomaticSize? | string?,
	BottomImage: string?,
	BottomImageContent: Content? | string?,
	CanvasSize: UDim2? | string?,
	ElasticBehavior: Enum.ElasticBehavior? | string?,
	HorizontalScrollBarInset: Enum.ScrollBarInset? | string?,
	MidImage: string?,
	MidImageContent: Content? | string?,
	ScrollBarImageColor3: Color3? | string?,
	ScrollBarImageTransparency: number? | string?,
	ScrollBarThickness: number? | string?,
	ScrollingDirection: Enum.ScrollingDirection? | string?,
	ScrollingEnabled: boolean? | string?,
	TopImage: string? | string?,
	TopImageContent: Content? | string?,
	VerticalScrollBarInset: Enum.ScrollBarInset? | string?,
	VerticalScrollBarPosition: Enum.VerticalScrollBarPosition? | string?,
}

export type ViewportFrameProperties = CommonImageProperties & {
	Ambient: Color3? | string?,
	LightColor: Color3? | string?,
	LightDirection: Vector3? | string?,
}

export type Path2DProperties = CommonUIProperties & {
	Closed: boolean? | string?,
	Color3: Color3? | string?,
}

export type CanvasGroupProperties = {
	GroupColor3: Color3? | string?,
	GroupTransparency: number? | string?,
}

export type UICornerProperties = {
	CornerRadius: UDim? | string?,
	BottomLeftRadius: UDim? | string?,
	BottomRightRadius: UDim? | string?,
	TopLeftRadius: UDim? | string?,
	TopRightRadius: UDim? | string?,
}

export type UIPaddingProperties = {
	PaddingBottom: UDim? | string?,
	PaddingLeft: UDim? | string?,
	PaddingRight: UDim? | string?,
	PaddingTop: UDim? | string?,
}

export type UIShadowProperties = CommonUIProperties & {
	BlurRadius: UDim? | string?,
	Spread: UDim2? | string?,
}

export type UIStrokeProperties = CommonUIProperties & {
	ApplyStrokeMode: Enum.ApplyStrokeMode? | string?,
	LineJoinMode: Enum.LineJoinMode? | string?,
}

export type UIListLayoutProperties = CommonUIProperties & {
	HorizontalFlex: Enum.UIFlexAlignment? | string?,
	HorizontalPadding: UDim? | string?,
	VerticalFlex: Enum.UIFlexAlignment? | string?,
	VerticalPadding: UDim? | string?,
	Wraps: boolean? | string?,
}

export type UIGridStyleLayoutProperties = {
	FillDirection: Enum.FillDirection? | string?,
	HorizontalAlignment: Enum.HorizontalAlignment? | string?,
	SortOrder: Enum.SortOrder? | string?,
	VerticalAlignment: Enum.VerticalAlignment? | string?,
}

export type UIGridLayoutProperties = {
	CellPadding: UDim2? | string?,
	CellSize: UDim2? | string?,
	FillDirectionMaxCells: number? | string?,
	StartCorner: Enum.StartCorner? | string?,
}

export type UIPageLayoutProperties = CommonUIProperties & {
	Animated: boolean? | string?,
	Circular: boolean? | string?,
	EasingDirection: Enum.EasingDirection? | string?,
	EasingStyle: Enum.EasingStyle? | string?,
	GamepadInputEnabled: boolean? | string?,
	ScrollWheelInputEnabled: boolean? | string?,
	TouchInputEnabled: boolean? | string?,
	TweenTime: number? | string?,
}

export type UIAspectRatioConstraintProperties = {
	AspectRatio: number? | string?,
	AspectType: Enum.AspectType? | string?,
	DominantAxis: Enum.DominantAxis? | string?,
}

export type UITextSizeConstraintProperties = {
	MaxTextSize: number? | string?,
	MinTextSize: number? | string?,
}

export type UIScaleProperties = {
	Scale: number? | string?,
}

export type UIFlexItemProperties = CommonUIProperties & {
	FlexMode: Enum.UIFlexMode? | string?,
	GrowRatio: number? | string?,
	ShrinkRatio: number? | string?,
}

export type StyleQueryProperties = CommonSizeProperties & {
	AspectRatioRange: NumberRange? | string?,
	PreferredInputType: Enum.PreferredInput? | string?,
	ReduceMotionEnabled: boolean? | string?,
	ViewportDisplaySize: Enum.DisplaySize? | string?,
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
