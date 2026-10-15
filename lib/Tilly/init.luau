local resolveTag = require("@self/resolveTag")

const function tilly(styleSheet: StyleSheet)
	const resolvedStyleRules = {} :: { [string]: StyleRule | false }

	const function tag(instance: Instance, tags: string)
		const tagsArray = string.split(tags, " ")

		for _, tag in tagsArray do
			instance:AddTag(tag)

			if resolvedStyleRules[tag] == nil then
				const freshTagRule = resolveTag(tag)

				if freshTagRule ~= nil then
					const styleRule = Instance.new("StyleRule")
					styleRule.Selector = freshTagRule.selector
					styleRule:SetProperties(freshTagRule.properties)
					styleRule.Parent = styleSheet
					resolvedStyleRules[tag] = styleRule
				else
					-- Tag is invalid and should never be considered
					resolvedStyleRules[tag] = false
				end
			end
		end
	end

	const function destroy()
		for _, styleRule in resolvedStyleRules do
			if styleRule then
				styleRule:Destroy()
			end
		end
	end

	return tag, destroy
end

return tilly
