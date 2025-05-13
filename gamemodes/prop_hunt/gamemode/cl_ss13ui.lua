local tex_mats = {
	slimecore = {
		background4 = "vgui/ss13_phe/slimecore/background4.png",
		corner64 = "vgui/ss13_phe/slimecore/corner64.png",
		border24 = "vgui/ss13_phe/slimecore/border24.png",
		border24_h = "vgui/ss13_phe/slimecore/border24_h.png"
	}
}

surface.CreateFont("SpessFont_HUD1", {
	font = "Spess Font",
	size = 16,
	antialias = false,
	weight = 500,
})

surface.CreateFont("Grand9K_Tiny", {
	font = "Grand9K Pixel",
	size = 18,
	antialias = false
})

surface.CreateFont("TinyUnicode_Tiny", {
	font = "TinyUnicode",
	size = 24,
	antialias = false
})

draw.SS13Box = function( uitype, _bordersize, x, y, w, h)
	surface.SetDrawColor( 255,255,255,255)
	bordersize = _bordersize * 8

	x = math.Round( x )
	y = math.Round( y )
	w = math.Round( w )
	h = math.Round( h )
	bordersize = math.min( math.Round( bordersize ), math.floor( w / 2 ), math.floor( h / 2 ) )

	surface.SetMaterial( Material(tex_mats[uitype].background4, "noclamp") )
	local ugh1 = bordersize - (_bordersize * 2)
	local ugh2 = bordersize + (_bordersize * 4)
	local wtf = bordersize * 8

	local boxHeight = h
	local segmentHeight = (bordersize / 4) -- The height of each texture segment (half of 2x4px)

	local currentY = y + ugh1
	local alternate = false

	local maxAttempts = 1000
	local curAttempts = 0
	while currentY < y + boxHeight do
		-- failsafe
		maxAttempts = maxAttempts + 1
		if (curAttempts > maxAttempts) then break end
		local segmentEndY = math.min(currentY + segmentHeight, y + boxHeight)

		-- Calculate UV coordinates: alternate between (0,0,1,0.5) and (0,0.5,1,1)
		local uvStartY = alternate and 0.5 or 0
		local uvEndY = alternate and 1 or 0.5

		surface.DrawTexturedRectUV(
			x + ugh1,
			currentY,
			w - ugh2,
			segmentEndY - currentY,
			0, uvStartY, 1, uvEndY
		)

		currentY = segmentEndY
		alternate = not alternate
	end

	surface.SetMaterial( Material(tex_mats[uitype].corner64, "noclamp mips") )

	surface.DrawTexturedRectUV( x, y, bordersize, bordersize, 0,0,1,1 )
	surface.DrawTexturedRectUV( x + w - bordersize, y, bordersize, bordersize, 1, 0, 0, 1 )
	surface.DrawTexturedRectUV( x, y + h -bordersize, bordersize, bordersize, 0, 1, 1, 0 )
	surface.DrawTexturedRectUV( x + w - bordersize, y + h - bordersize, bordersize, bordersize, 1, 1, 0, 0 )

	-- Borders
  local borderHeight = _bordersize * 6
  local sideOffset = _bordersize * 2  -- Adjust the offset for bordersize 1 and 2

  -- Top border
  surface.SetMaterial(Material(tex_mats[uitype].border24), "noclamp mips")
  surface.DrawTexturedRectUV(x + bordersize, y, w - bordersize * 2, borderHeight, 0, 0, 1, 1)

  -- Left border
  surface.SetMaterial(Material(tex_mats[uitype].border24_h), "noclamp mips")
  surface.DrawTexturedRectUV(x, y + bordersize, bordersize - (_bordersize * 2), h - bordersize * 2, 0, 0, 1, 1)

  -- Bottom border
  surface.SetMaterial(Material(tex_mats[uitype].border24), "noclamp mips")
  surface.DrawTexturedRectUV(x + bordersize, y + h - borderHeight, w - bordersize * 2, borderHeight, 0, 0, 1, 1)

  -- Right border
  surface.SetMaterial(Material(tex_mats[uitype].border24_h), "noclamp mips")
  surface.DrawTexturedRectUV(x + w - bordersize + sideOffset, y + bordersize, bordersize - (_bordersize * 2), h - bordersize * 2, 0, 0, 1, 1)
end
