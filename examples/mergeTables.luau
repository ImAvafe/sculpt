const function mergeTables<TableA, TableB>(tableA: TableA & {}, tableB: TableB & {}): TableA & TableB
	const mergedTable = table.clone(tableA)

	for key, value in pairs(tableB) do
		mergedTable[key] = value
	end

	return mergedTable :: TableA & TableB
end

return mergeTables
