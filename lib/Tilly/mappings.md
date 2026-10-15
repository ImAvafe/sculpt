# Tailwind → Roblox mappings

Research notes for `utilityTags`. Sources:

- Tailwind class patterns: `tailwindlabs/tailwindcss.com` `src/docs/*.mdx` (the `ApiTable` rows are the real class → CSS definitions) and `packages/tailwindcss/theme.css` (v4 default theme).
- Roblox: `Roblox/creator-docs` class/enum reference YAML, `ui/styling/*.md` (including `compatibility.md`, the authoritative list of **styleable** properties and `css-comparisons.md`), `ui/rich-text.md`, `ui/*-layouts.md`.

Everything below was read from those files unless marked **(unverified)**.

## How Roblox styling works (constraints that shape the design)

- **Selectors:** class `TextButton`, tag `.Foo` (CollectionService, our utility tags), name `#Foo`, state `:Hover`, children `>`, descendants `>>`, lists `,`.
- **Pseudo-instances:** `::UIPadding`, `::UICorner`, `::UIListLayout` etc. create the modifier instance on demand. This is how `rounded-*`, `p-*`, `flex` can be pure style rules.
- **States:** `Enum.GuiState` (`Idle`, `Hover`, `Press`, `NonInteractable`) → `hover:`, `active:`, `disabled:`. There is no focus state.
- **Queries:** `@Name` selectors. Built-ins: `@ViewportDisplaySize{Small,Medium,Large}`, `@PreferredInput{KeyboardAndMouse,Touch,Gamepad}`, `@ReducedMotionEnabled{True,False}`. Custom: a `::StyleQuery` rule with `MinSize`/`MaxSize`/`AspectRatioRange`. **These measure the parent container's `AbsoluteSize`, not the viewport**, so they behave like container queries. There is no dark-mode query; use theme `StyleSheet`s (`StyleDerive`) swapping token attributes.
- **Tokens:** `"$Name"` references an attribute on a `StyleSheet`/`StyleRule` chain. Attribute names allow letters, digits, `.`, `-`, `/`, `_`, so kebab-case names are valid attributes. **(unverified)** whether the `$token-name` reference parser accepts hyphens; test before committing to kebab-case keys.
- **Transitions:** `StyleRule:SetPropertyTransition(s)` with `TweenInfo` per property.
- **Only properties listed in `compatibility.md` are styleable.** Notably NOT styleable: `UIStroke.BorderOffset`, `UIStroke.StrokeSizingMode`, `UIStroke.BorderStrokePosition` and `UITableLayout`. `CanvasGroup.GroupTransparency`, `UIFlexItem` and `UIShadow` are styleable.

### Composition problems (same property written by several utilities)

Tailwind utilities are independent; Roblox properties are often atomic. The `tag()` renderer will have to merge these into one value:

| Roblox property | Written by |
|---|---|
| `Size` (UDim2) | `w-*`, `h-*`, `size-*`, `inset-*` |
| `Position` (UDim2) | `top/left/inset-*` |
| `FontFace` (family + weight + style) | `font-sans`, `font-bold`, `italic` |
| `UIGradient.Color` (ColorSequence) | `from-*`, `via-*`, `to-*` |
| `UIListLayout` axis properties | `flex-row/col` decides whether `justify-*` writes `HorizontalFlex` or `VerticalFlex` |

## Layout

| Tailwind | Roblox | Notes |
|---|---|---|
| `aspect-<ratio>`, `aspect-square`, `aspect-video` | `::UIAspectRatioConstraint.AspectRatio` | `AspectType`, `DominantAxis` available. `aspect-auto` = remove the modifier. |
| `flex` / `grid` (display) | `::UIListLayout` / `::UIGridLayout` | `hidden` → `Visible=false`. |
| `flex-row`, `flex-col` | `UIListLayout.FillDirection` | `*-reverse`: no direct equivalent. |
| `flex-wrap`, `flex-nowrap` | `UIListLayout.Wraps` | `wrap-reverse`: none. |
| `justify-start/center/end` | `HorizontalAlignment`/`VerticalAlignment` (main axis) | |
| `justify-between/around/evenly/stretch` | `HorizontalFlex`/`VerticalFlex` = `SpaceBetween/SpaceAround/SpaceEvenly/Fill` | `UIFlexAlignment` is `None, Fill, SpaceAround, SpaceBetween, SpaceEvenly`. |
| `items-start/center/end/stretch` | `UIListLayout.ItemLineAlignment` = `Start/Center/End/Stretch` | `items-baseline`: none. |
| `self-*` | `UIFlexItem.ItemLineAlignment` | `Automatic` = `self-auto`. |
| `grow`, `shrink`, `flex-1`, `flex-none` | `UIFlexItem.FlexMode` = `Grow/Shrink/Fill/None` | `grow-<n>` → `Custom` + `GrowRatio`; `shrink-<n>` → `ShrinkRatio`. |
| `basis-*` | none | Basis is the object's own `Size` along the axis. |
| `order-<n>`, `order-first/last` | `LayoutOrder` (+ `SortOrder.LayoutOrder`) | first/last = -9999 / 9999 as in Tailwind. |
| `gap-<n>` | `UIListLayout.Padding` / `UIGridLayout.CellPadding` | |
| `gap-x-<n>`, `gap-y-<n>` | `UIListLayout.HorizontalPadding` / `VerticalPadding` | Listed in `compatibility.md`; absent from the class reference mirror I pulled, so confirm. |
| `grid-cols-<n>` | `UIGridLayout.FillDirectionMaxCells` + `CellSize` | `col-span-*`, `row-*`, `subgrid`: none. `grid-flow-col/row` → `FillDirection`. |
| `columns-*`, `float`, `clear`, `break-*`, `isolation`, `box-sizing` | none | |
| `static/relative/absolute/fixed/sticky` | none | Roblox is "absolute" unless a layout drives it; `relative` is a no-op. |
| `top/left/inset-*` | `Position` + `AnchorPoint` | Atomic `Position`. |
| `z-<n>` | `ZIndex` | |
| `overflow-hidden/clip` | `ClipsDescendants=true` | |
| `overflow-auto/scroll`, `overflow-x/y-*` | `ScrollingFrame` (`ScrollingDirection`, `ScrollingEnabled`) | Class can't be changed by style; selector must target `ScrollingFrame`. |
| `visible` / `invisible` | `Visible` | `invisible` (keeps layout space) vs `hidden`: **(unverified)** how `Visible=false` interacts with `UIListLayout`. |
| `object-cover/contain/fill` | `ImageLabel.ScaleType` = `Crop/Fit/Stretch` | `object-none/scale-down`, `object-position`: none. |
| `overscroll-*` | `ScrollingFrame.ElasticBehavior` (`WhenScrollable/Always/Never`) | |

## Spacing and sizing

Tailwind v4: `p-<n>`, `m-<n>`, `w-<n>`, `gap-<n>`, `inset-<n>` etc. are `calc(var(--spacing) * <n>)` (4px per unit). `-m-<n>`/`-inset-<n>` are negative. Fractions `w-1/2` are `calc(1/2 * 100%)`. Keywords `full`, `auto`, `px`, `screen`, `min/max/fit`, plus the **container** scale (`w-3xs … w-7xl`, `--container-*`: 256px … 1280px).

| Tailwind | Roblox | Notes |
|---|---|---|
| `p-*`, `px/py/pt/pr/pb/pl-*` | `::UIPadding` `Padding{Top,Right,Bottom,Left}` (UDim) | `ps/pe/pbs/pbe` need an LTR assumption. |
| `m-*`, `space-x/y-*` | none | Approximate with parent `UIPadding`/layout `Padding`. `space-*` ≈ gap. |
| `w-<n>`, `h-<n>`, `size-<n>` | `Size` offset | |
| `w-<fraction>`, `w-full` | `Size` scale | |
| `w-auto`, `w-min/max/fit` | `AutomaticSize` (`X`, `Y`, `XY`) | |
| `min-w/h-*`, `max-w/h-*` | `::UISizeConstraint` `MinSize`/`MaxSize` (pixels only) | Fractions/percent unsupported. |
| `w-screen`, `dvh`, `svw`… | none | No viewport units. |

## Typography

| Tailwind | Roblox | Notes |
|---|---|---|
| `text-xs … text-9xl` | `TextSize` + `LineHeight` | Each size also sets `--text-*--line-height`; matches our `text` namespace. `LineHeight` is a multiplier. |
| `leading-tight/snug/normal/relaxed/loose` | `LineHeight` | `leading-none` = 1. |
| `leading-<n>`, `text-sm/6` | needs `TextSize` | Tailwind makes these absolute (`spacing*n`); Roblox `LineHeight` is relative, so it's not statically convertible. |
| `font-sans/serif/mono` | `FontFace` (family) | Tokens already hold asset ids. |
| `font-thin … font-black` | `FontFace` weight (`Enum.FontWeight`) | **Naming mismatch**: Tailwind's tokens are `--font-weight-{thin,extralight,light,normal,medium,semibold,bold,extrabold,black}`; ours use `regular` and `heavy`. |
| `italic`, `not-italic` | `FontFace` style | |
| `tracking-*` | **none** | Rich text has no letter-spacing tag. |
| `text-left/center/right` | `TextXAlignment` | `justify`: none. Vertical via `align-*` → `TextYAlignment`. |
| `truncate`, `text-ellipsis`, `text-clip` | `TextTruncate` = `AtEnd` / `AtEnd` / `None` | `SplitWord` also exists. |
| `text-wrap/nowrap`, `whitespace-nowrap/normal` | `TextWrapped` | `balance/pretty`, `pre*`: none. |
| `line-clamp-<n>` | none exact | `TextTruncate` + fixed height only. |
| `uppercase`, `capitalize`, `lowercase` | none via style | Rich text has `<uppercase>`, `<smallcaps>` tags (markup in the string, not a style). |
| `underline`, `line-through` | rich text `<u>`, `<s>` only | |
| `tabular-nums`, `font-feature-settings`, `slashed-zero`… | `OpenTypeFeatures` (styleable) | Comma list of OpenType tags such as `zero`, `ss03`; only a supported subset applies. |
| `text-<color>` | `TextColor3` | `text-<color>/<alpha>` → `TextTransparency`. |
| `text-shadow-*` | none | `TextStrokeColor3`/`UIStroke` is an outline, not an offset shadow. |
| `text-balance`, `indent`, `tab-size`, `hyphens`, `break-*`, `list-*`, `content` | none | |

## Backgrounds, borders, effects

| Tailwind | Roblox | Notes |
|---|---|---|
| `bg-<color>` | `BackgroundColor3` | `bg-<color>/<a>` and `bg-transparent` → `BackgroundTransparency`. |
| `bg-linear-to-{t,tr,r,br,b,bl,l,tl}` + `from/via/to-*` | `::UIGradient` `Rotation` + `Color` | `UIGradient` also supports radial/conical. Composition problem above. |
| `bg-cover/contain` | `ImageLabel.ScaleType` = `Crop/Fit` | |
| `bg-repeat`, `bg-no-repeat` | `ScaleType.Tile` + `TileSize` | `repeat-x/y/space/round`: none. |
| `bg-<position>`, `bg-clip`, `bg-origin`, `bg-attachment` | none | `ImageRectOffset` is atlas selection, not positioning. |
| `rounded-*` | `::UICorner` `CornerRadius` (UDim) | Per-corner properties exist, so `rounded-t/r/b/l/tl/tr/br/bl` all map. Logical `s/e/ss/se/ee/es` need an LTR assumption. |
| `rounded-full` | `CornerRadius` large offset or scale | **(unverified)** clamping behavior; Tailwind uses `calc(infinity * 1px)`. |
| `border`, `border-<n>`, `border-<color>` | `::UIStroke` `Thickness`, `Color`, `ApplyStrokeMode=Border` | **Uniform only**: `border-x/y/t/r/b/l-*` have no equivalent. `border-dashed/dotted`: none. |
| `outline-<n>`, `outline-<color>` | second `UIStroke` | **(unverified)** whether several `UIStroke`s can coexist on one object, which border + outline would need. `outline-offset-*`: `UIStroke.BorderOffset` exists but is not styleable. |
| `ring-<n>`, `ring-<color>` | `UIStroke` | Same as outline. |
| `shadow-*`, `inset-shadow-*` | `::UIShadow` (`BlurRadius`, `Color`, `Offset`, `Spread`, `Transparency`, `ZIndex`) | `UIShadow` exists and is styleable. `ZIndex` ordering implies stacking multiple shadows. No inset. |
| `drop-shadow-*` | `UIShadow` | Closest; `UIShadow` renders below the parent instance. |
| `opacity-<n>` | `GuiObject.Transparency` (styleable, mixed background + text) | Images/strokes need their own `*Transparency`; whole-subtree opacity needs `CanvasGroup.GroupTransparency`. `opacity-50` = `Transparency 0.5`. |
| `blur`, `brightness`, `backdrop-*`, `mix-blend-*`, `mask-*` | none | |
| `fill-*`, `stroke-*` | `ImageColor3` | No SVG. |

## Transforms, transitions, interactivity

| Tailwind | Roblox | Notes |
|---|---|---|
| `rotate-<deg>` | `Rotation` | `rotate-x/y/z`, `skew`, `perspective`: none. |
| `scale-<n>` | `::UIScale` `Scale` (`scale-<n>` is a percent: `scale-95` → 0.95) | `scale-x/y`: none. `zoom` is not a Tailwind utility. |
| `translate-<n>`, `translate-x/y` | `Position` offset | Atomic `Position`. |
| `origin-*` | `AnchorPoint` | Affects `Rotation` pivot. |
| `transition`, `transition-colors/opacity/transform/all` | `SetPropertyTransition(s)` | Property list chooses which props. Default = 150ms + ease-in-out. |
| `duration-<ms>`, `delay-<ms>` | `TweenInfo.Time` (÷1000), `TweenInfo.DelayTime` | |
| `ease-linear/in/out/in-out` | `EasingStyle`/`EasingDirection` | See `ease` mapping in our notes (Sine In, Cubic Out, Sine InOut; `linear` = `Linear`). |
| `animate-*` | none | |
| `cursor-*` | `MouseIcon` (needs a texture id per cursor) | |
| `pointer-events-none/auto` | `Interactable` / `Active` | |
| `select-*`, `resize`, `appearance`, `caret-color`, `touch-action`, `will-change`, `accent-color` | none | |
| `scrollbar-*` | `ScrollBarThickness`, `ScrollBarImageColor3`, `ScrollBarImageTransparency` | |
| `scroll-snap-*`, `scroll-margin/padding` | none | |
| `scroll-smooth` | none | |

## Modifiers

| Tailwind | Roblox |
|---|---|
| `hover:`, `active:`, `disabled:` | `:Hover`, `:Press`, `:NonInteractable` |
| `focus:` | none |
| `sm: md: lg: xl: 2xl:` | `::StyleQuery` with `MinSize` from our `breakpoint` tokens (container-relative). Built-in `@ViewportDisplaySize*` is only Small/Medium/Large. |
| `motion-reduce:` / `motion-safe:` | `@ReducedMotionEnabledTrue` / `False` |
| `dark:` | theme `StyleSheet` swap |
| `portrait:` / `landscape:` | `AspectRatioRange` query |
| `pointer-coarse:` etc. | `@PreferredInputTouch` etc. |

## Gaps and corrections to our current tokens

1. **`container` namespace is missing.** Tailwind v4 has `--container-3xs … 7xl` (16rem … 80rem), used by `w-*`, `max-w-*`, `min-w-*`, `basis-*`.
2. **`font-weight` names differ** from Tailwind (`normal`/`black` vs ours `regular`/`heavy`).
3. **`leading` named steps** are multipliers (good); `leading-<n>` is spacing-based and doesn't convert.
4. **`tracking`** has no Roblox mechanism, and neither does `text-transform` via style.
5. **`shadow`/`drop-shadow`**: a native `UIShadow` does exist, so `shadow-*` does map. That is separate from whether they fit as static tokens.
6. **`ease`** maps to Enum pairs (already done); Tailwind's default transition is 150ms ease-in-out.
7. **Bare `rounded`** (no suffix) is `--radius: 0.25rem` in v4's legacy theme block, equal to `rounded-sm`. Our `radius-base` is 6px, which is Tailwind's `md`.
