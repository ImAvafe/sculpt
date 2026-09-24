const generatePrimitives = require("@self/generatePrimitives")
const generatePalette = require("@self/generatePalette")

return table.freeze({
	primitives = generatePrimitives,
	palette = generatePalette,
})
