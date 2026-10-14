const generatePalette = require("@self/generatePalette")
const generateSemantics = require("@self/generateSemantics")

return table.freeze({
	palette = generatePalette,
	semantics = generateSemantics,
})
