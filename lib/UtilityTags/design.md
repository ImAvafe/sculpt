# utilityTags

`utilityTags` generates `StyleRule`s targeting `CollectionService` tags for utility class styling. It's like TailwindCSS but for Roblox.

## Tokens

Tokens are stored and organized by namespace _(type of token)_. This library holds a predefined set of primitives by default.

Developers can override and define custom tokens at runtime, triggering a rerender of the utility tags and their underlying `StyleRule`s.

The following namespaces could be achieved within the constraints of Roblox's UI engine: `color`, `font`, `text`, `font-weight`, `leading`, `spacing`, `radius`, `aspect`, `zoom`, `breakpoint`, `ease`, `shadow`, `drop-shadow`

## Utilities

Utility tags are comprised of a **purpose** and a **token input**. For example, `bg-red-500` looks within the `color` namespace for `color-red-500`.

The syntax is near-identical to Tailwind for convenience.

## Utility modifiers

Utility tags will support modifiers targeting `GuiState` and `StyleQuery` states to achieve parity with [StyleRule.Selector](https://create.roblox.com/docs/reference/engine/classes/StyleRule#Selector).

## Lazy rendering

Utility tags will be applied to `GuiObject`s via a `tag(utilities: string)` function. `tag()` will track its input to lazily render only tags that are applied. Once a utility tag is rendered, it remains so regardless of application.

`tag()` will be framework-agnostic, although users can wrap it to suit their framework of choice.

## Prior work

### Roblox

Roblox generates utility classes internally as part of its Foundation design system. This is already working in production.

Roblox's workflow relies on maintaining a static set of tokens using Amazon Token Studio, then using them to generate tokens in Luau. I don't want to do that.

Otherwise, their approach is pretty similar to this library. They also lazily render utility tags based on usage.

- [Foundation StyleTags.md](https://github.com/MaximumADHD/Roblox-Client-Tracker/blob/roblox/LuaPackages/Packages/_Index/Foundation/Foundation/StyleSheet/StyleTags.md)

### Tailwind

Tailwind is the classic utility classes tool, performing all its generation at build-time. It's a great reference for utility coverage but its approach is ill-suited to Roblox development.

- [Namespaces](https://tailwindcss.com/docs/theme#theme-variable-namespaces)
