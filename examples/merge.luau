local function merge(tableA, tableB)
	local newTable = {}

	for key, value in tableA do
		newTable[key] = value
	end

	for key, value in tableB do
		newTable[key] = value
	end

	return newTable
end

return merge
