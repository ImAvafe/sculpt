local convertValue = require("./convertValue")
local tokens = require(script.Parent.Parent.Tokens)
local patterns = require(script.Parent.patterns)

export type Rule = {
	selector: string,
	properties: { [string]: any },
	propertyComponent: string?,
}

const function parseMultiplier(multiplier: string): number?
	if multiplier == "px" then
		return 1
	end
	if string.match(multiplier, "^%d+$") or string.match(multiplier, "^%d+_%d+$") then
		return tonumber((string.gsub(multiplier, "_", ".")))
	end
	return nil
end

const function resolvePattern(tag: string, pattern: patterns.Pattern, tagValue: string): Rule?
	const hardcodedToken = (tokens.all :: tokens.Tokenset)[`{pattern.namespace}-{tagValue}`]
	const baseMultiplierToken = (tokens.all :: tokens.Tokenset)[pattern.namespace]

	if hardcodedToken or baseMultiplierToken then
		const multiplier = parseMultiplier(tagValue)
		const endValue = if hardcodedToken
			then hardcodedToken
			elseif multiplier then baseMultiplierToken * multiplier
			else nil

		print(string.match(tagValue, "^%d+$"))

		if endValue ~= nil then
			const properties = {}

			for _, property in pattern.properties do
				if endValue ~= nil then
					properties[property] = convertValue(property, endValue)
				end
			end

			if next(properties) ~= nil then
				return {
					selector = if pattern.pseudoInstance then `.{tag}::{pattern.pseudoInstance}` else `.{tag}`,
					properties = properties,
				}
			end
		end
	end

	return nil
end

const function resolveTag(tag: string): Rule?
	const tagParts = string.split(tag, "-")

	for _, part in tagParts do
		if part == "" then
			return nil
		end
	end

	for i = #tagParts - 1, 1, -1 do
		const prefix = table.concat(tagParts, "-", 1, i)
		const value = table.concat(tagParts, "-", i + 1)
		const utilityPatterns = patterns[prefix]

		if utilityPatterns then
			for _, pattern in utilityPatterns do
				const rule = resolvePattern(tag, pattern, value)
				if rule then
					return rule
				end
			end
		end
	end

	warn(`\"{tag}\"`, "utility tag is not valid.")

	if string.find(tag, ".") then
		warn("Using decimals within utility tags conflicts with StyleRule's selector syntax. Prefer underscores.")
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
