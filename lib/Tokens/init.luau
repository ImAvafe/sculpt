local aspect = require("@self/namespaces/aspect")
local breakpoint = require("@self/namespaces/breakpoint")
local color = require("@self/namespaces/color")
local fontWeight = require("@self/namespaces/fontWeight")
local leading = require("@self/namespaces/leading")
local radius = require("@self/namespaces/radius")
local spacing = require("@self/namespaces/spacing")
local stroke = require("@self/namespaces/stroke")
local text = require("@self/namespaces/text")
local transparency = require("@self/namespaces/transparency")

const PRIMITIVES = {
	aspect = aspect,
	breakpoint = breakpoint,
	color = color,
	fontWeight = fontWeight,
	leading = leading,
	radius = radius,
	spacing = spacing,
	stroke = stroke,
	text = text,
	transparency = transparency,
}

return table.freeze(PRIMITIVES)
