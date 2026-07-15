# Sculpt 🖌️

Portable UI toolkit for Roblox

You're familiar with the reactivity layer, usually provided by Fusion, React, or whichever rebel is newest on the block. Sculpt provides the visual layer; a framework-agnostic collection of packages for making your UI beautiful.

## Style

Define style sheets and their rules.

```lua
Style "TextButton:hover" {
	Properties = {
		BackgroundTransparency = 0.8,
		BackgroundColor3 = Color3.fromRGB(255, 50, 50),
	},
	Transitions = {},
	Tokens = {},
}
```

## Theme

Generate tokenized themes.

```lua
Theme {
	-- List theming properties here
}
```

## Base

Unstyled components, a blank canvas for your own design.

```lua
BaseButton {
	Name = "Button",
	StyleLink = ButtonStyle,
}
```

## Skin

Skin your components with fully custom 9-slice images.

```lua
Skin {
	Image = "rbxassetid://nil",

	-- Your children here
}
```

## Color

Tailwind's famous color palette, prepackaged.

```lua
BackgroundColor3 = Color.Violet["500"]
```
