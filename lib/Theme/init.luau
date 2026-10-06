const generatePrimitives = require("@self/generatePrimitives")
const generatePalette = require("@self/generatePalette")
const generateSemantics = require("@self/generateSemantics")

return table.freeze({
	primitives = generatePrimitives,
	palette = generatePalette,
	semantics = generateSemantics,
})
