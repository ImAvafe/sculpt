# Sculpt 🖌️

Portable UI toolkit for Roblox

You're familiar with the reactivity layer, usually provided by Fusion, React, or whichever rebel is newest on the block. Sculpt provides the visual layer; a framework-agnostic collection of packages for making your UI beautiful.

> [!WARNING]
> These tools are subject to change at a whim. To install a utility, copy its source code into your project. Feel free to submit PRs!

## `style`

Define and populate style sheets in declarative fashion.

```luau
const myTheme = {
	Primary = Color3.fromRGB(255, 100, 100),
	FontSansSerif = "rbxassetid://16658221428",
	-- and many more...
}

style {
	Tokens = myTheme,

	["TextButton"] = {
		BackgroundColor3 = "$Primary",
		BackgroundTransparency = 0,
		TextSize = 16,
		FontFace = function(tokens: typeof(myTheme))
			return Font.new(tokens.FontSansSerif)
		end,
		AutomaticSize = Enum.AutomaticSize.XY,
		AutoButtonColor = false,
		Transition = {
			BackgroundColor3 = TweenInfo.new(0.15, Enum.EasingStyle.Cubic),
		},
	},
}
```

## `theme`

Generate tokenized themes.

```luau
theme {
	-- List theming properties here
}
```

## Concepts

Anything within this section is conceptual and undeveloped.

### `skin`

Skin your components with fully custom 9-slice images.

```luau
skin {
	Image = "rbxassetid://nil",

	-- Your children here
}
```

### `base`

Unstyled components, a blank canvas for your own design.

🤔 Might separate this out into its own repository. Not sure yet.

```luau
BaseButton {
	Name = "Button",
	StyleLink = ButtonStyle,
}
```
