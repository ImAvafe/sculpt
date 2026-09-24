local HSL = require("@self/hsl")

local SATURATION_MAP = { 0.32, 0.16, 0.08, 0.04, 0, 0, 0.04, 0.08, 0.16, 0.32, 0.84 }
local LIGHTNESS_MAP = { 0.95, 0.85, 0.75, 0.65, 0.55, 0.45, 0.35, 0.25, 0.15, 0.1, 0.05 }

const function clampColor(color: Color3): Color3
	local red = math.clamp(color.R, 0, 1)
	local green = math.clamp(color.G, 0, 1)
	local blue = math.clamp(color.B, 0, 1)

	return Color3.new(red, green, blue)
end

const function saturate(color: Color3, coefficient: number): Color3
	local H, S, V = color:ToHSV()
	S += S * coefficient

	return clampColor(Color3.fromHSV(H, math.clamp(S, 0, 1), V))
end

const function getBaseColorSaturationIndex(hsl: HSL.HSL): number
	local goal = hsl.L / 100

	local closestLightness = LIGHTNESS_MAP[1]
	for index = 2, #LIGHTNESS_MAP do
		local current = LIGHTNESS_MAP[index]
		if math.abs(current - goal) < math.abs(closestLightness - goal) then
			closestLightness = current
		end
	end

	return table.find(LIGHTNESS_MAP, closestLightness) or 0
end

const function generatePalette(base: Color3)
	local newColors = {}
	local hsl = HSL.toHSL(base)
	local satIndex = getBaseColorSaturationIndex(hsl)

	local colors = {}
	for index, lightness in LIGHTNESS_MAP do
		local color = HSL.fromHSL({ H = hsl.H, S = hsl.S, L = lightness * 100 })
		local satDelta = SATURATION_MAP[index] - SATURATION_MAP[satIndex]
		table.insert(colors, saturate(color, satDelta))
	end

	for index, color in colors do
		local key = if index == 1 then 50 else (index - 1) * 100

		if index == #colors then
			key -= 50
		end

		newColors[key] = color
	end

	return newColors
end

return generatePalette
