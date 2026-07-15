# Sculpt 🖌️

Portable UI toolkit for Roblox

You're familiar with the reactivity layer, usually provided by Fusion, React, or whichever rebel is newest on the block. Sculpt provides the visual layer; a framework-agnostic collection of packages for making your UI beautiful.

## `Style`

Define and populate style sheets in declarative fashion.

```lua
Style {
	Tokens = {
		Primary = Color3.fromRGB(255, 100, 100),
		PrimaryDark = Color3.fromRGB(240, 90, 90),
	},
	["TextButton"] = {
		BackgroundColor3 = "$Primary",
		BackgroundTransparency = 0,
		TextSize = 16,
		AutomaticSize = Enum.AutomaticSize.XY,
		AutoButtonColor = false,
		Transition = {
			BackgroundColor3 = TweenInfo.new(0.15, Enum.EasingStyle.Cubic),
		},
	},
	["TextButton:Hover"] = {
		BackgroundColor3 = "$PrimaryDark",
	},
}
```

## `Theme`

Generate tokenized themes.

```lua
Theme {
	-- List theming properties here
}
```

## `Palette`

Tailwind's famous color palette, prepackaged.

```lua
BackgroundColor3 = Color.Violet["500"]
```

## `Skin`

Skin your components with fully custom 9-slice images.

```lua
Skin {
	Image = "rbxassetid://nil",

	-- Your children here
}
```

## `Base`

Unstyled components, a blank canvas for your own design.

🤔 Might separate this out into its own repository. Not sure yet.

```lua
BaseButton {
	Name = "Button",
	StyleLink = ButtonStyle,
}
```
