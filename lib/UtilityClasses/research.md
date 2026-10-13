## The approach

Tokens are stored and organized by namespace _(type of token)_. This library holds a predefined set of primitives, with semantics registered by the developer.

Utility tag patterns consume tokens via namespace lookup. For example, `bg-red-500` looks for `color-red-500`.

Utility tags will also support modifiers targeting `GuiState` and `StyleQuery` states, as per [StyleRule.Selector](https://create.roblox.com/docs/reference/engine/classes/StyleRule#Selector) documentation.

Utility tags will be applied to `GuiObject`s via a `tag(utilities: string)` function. `tag()` will track applied tags to lazily render only those in use. This will be framework-agnostic, although users could wrap it to suit their framework of choice.

## Prior work

Roblox generates utility classes internally as part of its Foundation design system. This is already working in production.

Roblox's workflow relies on maintaining a static set of tokens using Amazon Token Studio, then using them to generate tokens in Luau. I don't want to do that.

Otherwise, their approach is pretty similar to this library.

- [Foundation StyleTags.md](https://github.com/MaximumADHD/Roblox-Client-Tracker/blob/roblox/LuaPackages/Packages/_Index/Foundation/Foundation/StyleSheet/StyleTags.md)
