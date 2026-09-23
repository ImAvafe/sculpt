type function stringify_preview(input: type)
	return `\n> {string.gsub(stringify(input), "\n", "\n> ")}`
end

type function is_primitive(input_tag: string)
	return input_tag == "any"
		or input_tag == "unknown"
		or input_tag == "never"
		or input_tag == "boolean"
		or input_tag == "buffer"
		or input_tag == "number"
		or input_tag == "integer"
		or input_tag == "string"
		or input_tag == "thread"
end

type function table_set_write_indexer_or_remove(input: typeof(types.newtable()), index: type, result: type?)
	if not result then
		return table_remove_write_indexer_hacky_fix(input)
	else
		input:setwriteindexer(index, result)
	end
	return input
end

type function table_remove_indexer_hacky_fix(input: typeof(types.newtable()))
	local output = types.newtable()

	for key, value in input:properties() do
		table_set_property(output, key, value)
	end

	return output
end

type function table_remove_read_indexer_hacky_fix(input: typeof(types.newtable()))
	local output = types.newtable()

	for key, value in input:properties() do
		table_set_property(output, key, value)
	end

	local indexer = input:indexer()
	if indexer then
		local indexer_write = indexer.writeresult
		if indexer_write then
			output:setwriteindexer(indexer.index, indexer_write)
		end
	end

	return output
end

type function table_set_read_indexer_or_remove(input: typeof(types.newtable()), index: type, result: type?)
	if not result then
		return table_remove_read_indexer_hacky_fix(input)
	else
		input:setreadindexer(index, result)
	end
	return input
end

type function table_set_property(input: type, key: type, value: { read: type?, write: type? }?)
	if value == nil then
		return
	end

	local value_read, value_write = value.read, value.write
	if value_read == value_write then
		input:setproperty(key, value_read)
	else
		input:setreadproperty(key, value_read)
		input:setwriteproperty(key, value_write)
	end
end

type function table_remove_write_indexer_hacky_fix(input: typeof(types.newtable()))
	local output = types.newtable()

	for key, value in input:properties() do
		table_set_property(output, key, value)
	end

	local indexer = input:indexer()
	if indexer then
		local indexer_read = indexer.readresult
		if indexer_read then
			output:setreadindexer(indexer.index, indexer_read)
		end
	end

	return output
end

type function table_set_indexer_or_remove(input: typeof(types.newtable()), index: type, result: type?)
	if not result then
		return table_remove_indexer_hacky_fix(input)
	else
		input:setindexer(index, result)
	end
	return input
end

type function table_map_values_shallow(input: typeof(types.newtable()), callback: (input: type) -> type?)
	for key, value in input:properties() do
		local value_read, value_write = value.read, value.write

		if value_read == value_write then
			input:setproperty(key, callback(value_read :: type))
		else
			if value_read then
				input:setreadproperty(key, callback(value_read))
			end

			if value_write then
				input:setwriteproperty(key, callback(value_write))
			end
		end
	end

	local indexer = input:indexer()
	if indexer then
		local indexer_index = indexer.index
		local indexer_read, indexer_write = indexer.readresult, indexer.writeresult

		if indexer_read == indexer_write then
			table_set_indexer_or_remove(input, indexer_index, callback(indexer_read))
		else
			if indexer_read then
				table_set_read_indexer_or_remove(input, indexer_index, callback(indexer_read))
			end

			if indexer_write then
				table_set_write_indexer_or_remove(input, indexer_index, callback(indexer_write))
			end
		end
	end

	return input
end

type function assert_tag(input: type, expected: string)
	local input_tag = input.tag
	local actual = if input_tag == "singleton" then type(input:value()) else input_tag

	if actual == expected then
		return
	end

	error(
		`\nExpected type '{expected}' `
			.. if is_primitive(actual) then `but got '{actual}'!` else `but got '{actual}': {stringify_preview(input)}`
	)
end

type function intersection_from_components(input: { type })
	local input_len = #input
	return if input_len == 0 then nil elseif input_len == 1 then input[1] else types.intersectionof(table.unpack(input))
end

type function intersection_filter(input: type, callback: (component: type) -> boolean)
	if input.tag == "intersection" then
		return intersection_from_components(
			components_filter(input:components(), "intersection", intersection_from_components, callback)
		)
	else
		return if callback(input) then nil else input
	end
end

type function table_value_swap_remove(input: { [any]: any }, input_len: number, idx: number)
	-- Last item, we can just remove from
	-- the end of the input table.
	if idx == input_len then
		table.remove(input, idx)

	-- Swap remove optimisation.
	else
		input[idx] = table.remove(input)
	end

	return input_len - 1
end

type function components_filter(
	input: { type },
	as: "union" | "intersection",
	as_builder: (
		components: { type }
	) -> typeof(types.unionof()) | typeof(types.intersectionof()),
	callback: (component: type) -> boolean
)
	local input_len = #input

	for idx = input_len, 1, -1 do
		local component = input[idx]

		if component.tag == as then
			local filtered = as_builder(components_filter(component:components(), as, as_builder, callback))

			if filtered == nil then
				input_len = table_value_swap_remove(input, input_len, idx)
			else
				input[idx] = filtered
			end
		else
			if not callback(component) then
				continue
			end

			input_len = table_value_swap_remove(input, input_len, idx)
		end
	end

	return input
end

type function components_find(
	input: { type },
	as: "union" | "intersection",
	callback: (component: type, component_tag: string) -> boolean
): boolean
	for _, component in input do
		local component_tag = component.tag

		if component_tag == as then
			if components_find(component:components(), as, callback) then
				return true
			end
		elseif callback(component, component_tag) then
			return true
		end
	end

	return false
end

type function components_map(input: { type }, callback: (value: type, ...type) -> type, ...: type)
	for idx, value in input do
		input[idx] = callback(value, ...)
	end
	return input
end

type function union_from_components(input: { type })
	local input_len = #input
	return if input_len == 0 then nil elseif input_len == 1 then input[1] else types.unionof(table.unpack(input))
end

type function union_filter(input: type, callback: (component: type) -> boolean)
	if input.tag == "union" then
		return union_from_components(components_filter(input:components(), "union", union_from_components, callback))
	else
		return if callback(input) then nil else input
	end
end

type function partial_core(
	input: typeof(types.newtable()),
	map_callback: (
		input: typeof(types.newtable()),
		callback: (input: type) -> type?
	) -> typeof(types.newtable())
)
	local input_tag = input.tag
	if input_tag == "union" then
		return union_from_components(components_map(input:components(), partial_core, map_callback)) or types.never
	elseif input_tag == "intersection" then
		return intersection_from_components(components_map(input:components(), partial_core, map_callback))
			or types.never
	end

	assert_tag(input, "table")

	local nil_singleton = types.singleton(nil)

	return map_callback(input, function(value: type)
		if value.tag == "union" then
			local components = value:components()

			if
				components_find(components, "union", function(component: type)
					return component == nil_singleton
				end)
			then
				return value
			else
				table.insert(components, nil_singleton)
				return union_from_components(components)
			end
		else
			return types.optional(value)
		end
	end)
end

export type function Partial(input: typeof(types.newtable()))
	return partial_core(input, table_map_values_shallow)
end

return nil
