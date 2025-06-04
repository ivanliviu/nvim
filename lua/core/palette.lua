-- TODO: update bazecor, st palette

local main_hue = 255

local function hex(h, s, l)
	local c = (1 - math.abs(2 * l - 1)) * s
	local x = c * (1 - math.abs(h / 60 % 2 - 1))
	local m = l - c * 0.5
	local r, g, b
	if h < 60 then
		r, g, b = c, x, 0
	elseif h < 120 then
		r, g, b = x, c, 0
	elseif h < 180 then
		r, g, b = 0, c, x
	elseif h < 240 then
		r, g, b = 0, x, c
	elseif h < 300 then
		r, g, b = x, 0, c
	else
		r, g, b = c, 0, x
	end
	return string.format(
		'#%02x%02x%02x',
		(r + m) * 255,
		(g + m) * 255,
		(b + m) * 255
	)
end

local colors = {}
for i = 0, 11 do
	colors[i + 1] = hex((main_hue + 30 * i) % 360, 0.875, 0.75)
end

local gradient = {}
local lights = { 0.125, 0.25, 0.5, 0.75, 0.875 }
for i = 1, #lights do
	gradient[i] = hex(main_hue, 0.25, lights[i])
end

local function closest(hue)
	return colors[math.floor((hue - main_hue) % 360 / 30) % 12 + 1]
end

return {
	-- TODO: universal hue wrap - closest, fg
	fg = hex((main_hue + 180) % 360, 0.75, 0.875),
	gradient = gradient,
	colors = colors,
	red = closest(0),
	orange = closest(30),
	yellow = closest(60),
	chartreuse = closest(90),
	green = closest(120),
	spring_green = closest(150),
	cyan = closest(180),
	azure = closest(210),
	blue = closest(240),
	violet = closest(270),
	magenta = closest(300),
	rose = closest(330),

	-- TODO:
	bg = gradient[1],
	selection = gradient[2],
	comment = gradient[4],
	purple = closest(270),
	pink = closest(300),
	bright_red = closest(330),
	bright_green = closest(90),
	bright_yellow = closest(30),
	bright_blue = closest(210),
	bright_magenta = closest(270),
	bright_cyan = closest(120),
	bright_white = gradient[5],
	menu = gradient[2],
	visual = gradient[2],
	gutter_fg = gradient[4],
	nontext = gradient[1],
	white = gradient[5],
	black = gradient[1],
}
