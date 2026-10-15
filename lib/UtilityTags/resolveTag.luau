local convertValue = require("./convertValue")
local tokens = require(script.Parent.Parent.Tokens)
local patterns = require(script.Parent.patterns)

local function arrayWithout(array: { [number]: any }, index: number)
	const newArray = table.clone(array)
	table.remove(newArray, index)
	return newArray
end

export type Rule = {
	selector: string,
	properties: { [string]: any },
	propertyComponent: string?,
}

const function resolveTag(tag: string): Rule?
	const tagComponents = string.split(tag, "-")
	const utilityPatterns = patterns[tagComponents[1]]
	const tagValue = table.concat(arrayWithout(tagComponents, 1), "-")

	if utilityPatterns ~= nil then
		for _, pattern in utilityPatterns do
			const hardcodedToken = (tokens.all :: tokens.Tokenset)[`{pattern.namespace}-{tagValue}`]
			const baseMultiplierToken = (tokens.all :: tokens.Tokenset)[pattern.namespace]

			if hardcodedToken or baseMultiplierToken then
				const properties = {}
				for _, property in pattern.properties do
					properties[property] =
						convertValue(property, hardcodedToken or (baseMultiplierToken * tonumber(tagValue)))
				end

				return {
					selector = if pattern.pseudoInstance then `.{tag}::{pattern.pseudoInstance}` else `.{tag}`,
					properties = properties,
				}
			end
		end
	end

	return nil
end

const function resolveTags(tags: string): { Rule }
	const rules = {}
	const separateTags = string.split(tags, " ")

	for _, tag in separateTags do
		const rule = resolveTag(tag)
		if rule then
			table.insert(rules, rule)
		end
	end

	return rules
end

return resolveTags
