surface.CreateFont("PHE.TauntFont", {
	font = "Roboto",
	size = 16,
	weight = 500,
	antialias = true,
	shadow = false
})

local mat_src = {
	slimecore = {
		btn_play = "vgui/ss13_phe/slimecore/taunt_menu/btn_play.png",
		btn_playpub = "vgui/ss13_phe/slimecore/taunt_menu/btn_playpub.png",
		btn_playx = "vgui/ss13_phe/slimecore/taunt_menu/btn_playx.png",
		btn_close = "vgui/ss13_phe/slimecore/taunt_menu/btn_close.png",
		button_hover = "vgui/ss13_phe/slimecore/taunt_menu/button_hover.png",
		button_empty = "vgui/ss13_phe/slimecore/taunt_menu/button_empty.png",
		window_base = "vgui/ss13_phe/slimecore/taunt_menu/taunts_window.png",
		dropdown_background = "vgui/ss13_phe/slimecore/taunt_menu/dropdown_background.png"
	}
}

local mat = {
	slimecore = {
		button_hover = Material(mat_src.slimecore.button_hover),
		button_empty = Material(mat_src.slimecore.button_empty),
		window_base = Material(mat_src.slimecore.window_base),
		dropdown_background = Material(mat_src.slimecore.dropdown_background)
	}
}

local isplayed = false
local isopened = false
local isforcedclose = false
local hastaunt = false
net.Receive("PH_ForceCloseTauntWindow", function() isforcedclose = true end)
net.Receive("PH_AllowTauntWindow", function() isforcedclose = false end)
local function MainFrame()
	if GetConVar("ph_enable_custom_taunts"):GetInt() < 1 then
		LocalPlayer():ChatError("This server has custom taunts disabled.", "PH:E Taunts")
		return
	end

	isopened = true
	local frame = vgui.Create("DFrame")
	local frameHeight = 600
	if GetConVar("ph_tauntpitch_allowed"):GetBool() then frameHeight = frameHeight + 72 end
	frame:SetSize(400, frameHeight)
	frame:SetTitle("Prop Hunt | Taunt Menu")
	frame:Center()
	frame:SetVisible(true)
	frame:ShowCloseButton(true)
	frame.btnClose:DockPadding(0, 2, 4, 0)
	frame.btnMaxim:DockPadding(0, 2, 4, 0)
	frame.btnMinim:DockPadding(0, 2, 4, 0)
	frame.PerformLayout = function(s)
		local titlePush = 0
		if IsValid(s.imgIcon) then
			s.imgIcon:SetPos(5, 5)
			s.imgIcon:SetSize(16, 16)
			titlePush = 16
		end

		s.btnClose:SetPos(s:GetWide() - 31 - 3, 1)
		s.btnClose:SetSize(31, 24)
		s.btnMaxim:SetPos(s:GetWide() - 31 * 2 - 3, 1)
		s.btnMaxim:SetSize(31, 24)
		s.btnMinim:SetPos(s:GetWide() - 31 * 3 - 3, 1)
		s.btnMinim:SetSize(31, 24)
		s.lblTitle:SetPos(8 + titlePush, 2)
		s.lblTitle:SetSize(s:GetWide() - 25 - titlePush, 20)
	end

	-- Make sure they have Mouse & Keyboard interactions.
	frame:SetMouseInputEnabled(true)
	frame:SetKeyboardInputEnabled(true)
	frame.Paint = function(self, w, h)
		-- surface.SetDrawColor(Color(40,40,40,180))
		surface.SetDrawColor(255, 255, 255, 255)
		surface.SetMaterial(mat.slimecore.window_base)
		surface.DrawTexturedRect(0, 0, w, h)
	end

	frame.OnClose = function()
		isopened = false
		hastaunt = false
	end

	local function frame_Think_Force()
		if isforcedclose == true and isopened == true then
			isopened = false
			hastaunt = false
			frame:Close()
		end
	end

	hook.Add("Think", "CloseWindowFrame_Force", frame_Think_Force)
	local list = vgui.Create("DListView", frame)
	list:SetMultiSelect(false)
	list:AddColumn("soundlist") -- because header is gone.
	list.m_bHideHeaders = true
	list:SetPos(10, 50)
	list:SetSize(0, 439)
	list:DockMargin(6, 1, 7, 10)
	list:Dock(BOTTOM)
	local TEAM_TAUNTS = {}
	local WHOLE_TEAM_TAUNTS = {}
	-- Determine if prop or hunter taunt list to be used	
	local playerTeam = (LocalPlayer():Team() == TEAM_HUNTERS) and TEAM_HUNTERS or TEAM_PROPS
	TEAM_TAUNTS = PHE:GetTeamTaunt(playerTeam, false)
	WHOLE_TEAM_TAUNTS = PHE:GetAllTeamTaunt(playerTeam)
	for name, _ in pairs(TEAM_TAUNTS) do
		list:AddLine(name)
	end

	local comb = vgui.Create("DComboBox", frame)
	-- comb:Dock(TOP)
	-- comb:Dock(TOP)
	-- comb:DockMargin(4,-4,4,0)
	comb:SetPos(19, 31)
	comb:SetSize(362, 22)
	comb:SetValue("Original Taunts")
	comb:AddChoice("Original Taunts")
	comb:AddChoice("PH:E/Custom Taunts")
	comb:SetTextColor(Color(79, 178, 89))
	-- comb:SetImage(mat_src.slimecore.dropdown_background)
	comb.OldPaint = comb.Paint
	comb.Paint = function(panel, w, h)
		comb.OldPaint(panel, w, h)
		-- surface.SetDrawColor(Color(0,0,0,255))
		surface.SetMaterial(mat.slimecore.dropdown_background)
		surface.DrawTexturedRect(0, 0, w, h)
	end

	function comb:SortAndStyle(pnl)
		pnl:SortByColumn(1, false)
		pnl.Paint = function(self, w, h)
			-- surface.SetDrawColor(Color(50,50,50,180))
			surface.SetDrawColor(Color(0, 0, 0, 0))
			surface.DrawRect(0, 0, w, h)
		end

		local color = {
			hover = Color(88, 254, 66, 66),
			select = Color(120, 120, 120, 0),
			alt = Color(60, 60, 60, 0),
			normal = Color(50, 50, 50, 0)
		}

		for _, line in pairs(pnl:GetLines()) do
			function line:Paint(w, h)
				if self:IsHovered() then
					surface.SetDrawColor(color.hover)
				elseif self:IsSelected() then
					surface.SetDrawColor(color.select)
				elseif self:GetAltLine() then
					surface.SetDrawColor(color.alt)
				else
					surface.SetDrawColor(color.normal)
				end

				surface.DrawRect(0, 0, w, h)
			end

			for _, col in pairs(line["Columns"]) do
				col:SetFont("PHE.TauntFont")
				col:SetTextColor(color_white)
			end
		end
	end

	comb.OnSelect = function(pnl, idx, val)
		if val == "Original Taunts" then
			list:Clear()
			hastaunt = false
			if TEAM_TAUNTS then
				for name, val in pairs(TEAM_TAUNTS) do
					list:AddLine(name)
				end
			end

			pnl:SortAndStyle(list)
		elseif val == "PH:E/Custom Taunts" then
			list:Clear()
			hastaunt = false
			if LocalPlayer():Team() == TEAM_PROPS then
				if PHE:GetTeamTaunt(TEAM_PROPS, true) ~= false then
					for name, val in pairs(PHE:GetTeamTaunt(TEAM_PROPS, true)) do
						list:AddLine(name)
					end
				else
					list:AddLine("<< WARNING: NO TAUNTS DETECTED! >>")
				end
			else
				if PHE:GetTeamTaunt(TEAM_PROPS, true) ~= false then
					for name, val in pairs(PHE:GetTeamTaunt(TEAM_HUNTERS, true)) do
						list:AddLine(name)
					end
				else
					list:AddLine("<< WARNING: NO TAUNTS DETECTED! >>")
				end
			end

			pnl:SortAndStyle(list)
		end
	end

	comb:SortAndStyle(list)
	-- I know, this one is fixed style.
	local btnpanel = vgui.Create("DPanel", frame)
	btnpanel:SetPos(0, 58)
	btnpanel:SetSize(400, 94)
	-- btnpanel:SetBackgroundColor(Color(20,20,20,200))
	btnpanel:SetBackgroundColor(Color(0, 0, 0, 0))
	local function CreateStyledButton(size, offset, ttip, texture, btnfunction)
		local button = vgui.Create("DButton", btnpanel)
		button:SetSize(size, size)
		button:SetPos(offset, 0)
		button:SetText("")
		button:SetTooltip(ttip)
		local image = vgui.Create("DImage", button)
		image:SetImage(texture)
		image:SetSize(size, size)
		image:SetPos(0, 0)
		local image_hover = vgui.Create("DImage", button)
		image_hover:SetImage(mat_src.slimecore.button_hover)
		image_hover:SetSize(size, size)
		image_hover:SetVisible(false)
		image_hover:SetPos(0, 0)
		button.Paint = function(self, w, h)
			surface.SetDrawColor(Color(0, 0, 0, 0))
			if self:IsHovered() then
				-- surface.SetDrawColor(Color(90,90,90,200))
				if not image_hover:IsVisible() then image_hover:SetVisible(true) end
			else
				if image_hover:IsVisible() then image_hover:SetVisible(false) end
			end
			surface.DrawRect(0, 0, w, h)
		end

		button.DoClick = btnfunction
	end

	local function TranslateTaunt(linename)
		return WHOLE_TEAM_TAUNTS[linename]
	end

	local function SendToServer(snd)
		if not isplayed then
			net.Start("CL2SV_PlayThisTaunt")
			net.WriteString(tostring(snd))
			net.SendToServer()
			isplayed = true
			timer.Simple(GetConVar("ph_customtaunts_delay"):GetInt(), function() isplayed = false end)
			LocalPlayer().last_taunt_time = CurTime()
		else
			chat.AddText(Color(220, 40, 0), "[PH:E - Taunts] Warning: ", Color(220, 220, 220), "You have to wait " .. GetConVar("ph_customtaunts_delay"):GetInt() .. " seconds to play this taunt again!")
		end
	end

	CreateStyledButton(84, 16, "Play Taunt Locally", mat_src.slimecore.btn_play, function()
		if hastaunt then
			local getline = TranslateTaunt(list:GetLine(list:GetSelectedLine()):GetValue(1))
			surface.PlaySound(getline)
		end
	end)

	CreateStyledButton(84, 112, "Play Taunt Globally", mat_src.slimecore.btn_playpub, function()
		if hastaunt then
			local getline = TranslateTaunt(list:GetLine(list:GetSelectedLine()):GetValue(1))
			SendToServer(getline)
		end
	end)

	CreateStyledButton(84, 204, "Play Taunt Globally and Close", mat_src.slimecore.btn_playx, function()
		if hastaunt then
			local getline = TranslateTaunt(list:GetLine(list:GetSelectedLine()):GetValue(1))
			SendToServer(getline)
			frame:Close()
		end
	end)

	CreateStyledButton(84, 300, "Close the Window", mat_src.slimecore.btn_close, function() frame:Close() end)
	if GetConVar("ph_tauntpitch_allowed"):GetBool() then
		local randtauntPitchablePanel = vgui.Create("DPanel", frame)
		randtauntPitchablePanel:Dock(BOTTOM)
		randtauntPitchablePanel:SetBackgroundColor(Color(150, 150, 150, 200))

		local randtauntPitchableCheck = vgui.Create("DCheckBoxLabel", randtauntPitchablePanel)
		randtauntPitchableCheck:Dock(FILL)
		randtauntPitchableCheck:SetText(PHE.LANG.TAUNTWINDOW.ph_cl_pitched_randtaunts)
		randtauntPitchableCheck:SetConVar("ph_cl_pitched_randtaunts")
		randtauntPitchableCheck:SetValue(GetConVar("ph_cl_pitched_randtaunts"):GetBool())
		randtauntPitchableCheck:SizeToContents()

		local autotauntPitchablePanel = vgui.Create("DPanel", frame)
		autotauntPitchablePanel:Dock(BOTTOM)
		autotauntPitchablePanel:SetBackgroundColor(Color(150, 150, 150, 200))

		local autotauntPitchableCheck = vgui.Create("DCheckBoxLabel", autotauntPitchablePanel)
		autotauntPitchableCheck:Dock(FILL)
		autotauntPitchableCheck:SetText(PHE.LANG.TAUNTWINDOW.ph_cl_pitched_autotaunts)
		autotauntPitchableCheck:SetConVar("ph_cl_pitched_autotaunts")
		autotauntPitchableCheck:SetValue(GetConVar("ph_cl_pitched_autotaunts"):GetBool())
		autotauntPitchableCheck:SizeToContents()

		local pitchPanel = vgui.Create("DPanel", frame)
		pitchPanel:Dock(BOTTOM)
		pitchPanel:SetBackgroundColor(Color(150, 150, 150, 200))

		local pitchSlider = vgui.Create("DNumSlider", pitchPanel)
		pitchSlider:Dock(FILL)
		pitchSlider:DockMargin(5, 5, 5, 5)
		pitchSlider:SetText(PHE.LANG.TAUNTWINDOW.ph_cl_tauntpitch)
		pitchSlider:SetMin(GetConVar("ph_tauntpitch_min"):GetInt())
		pitchSlider:SetMax(GetConVar("ph_tauntpitch_max"):GetInt())
		pitchSlider:SetDecimals(0)
		pitchSlider:SetValue(100)
		pitchSlider:SetConVar("ph_cl_tauntpitch")
	end


	list.OnRowRightClick = function(panel,line)
		hastaunt = true
		local getline = TranslateTaunt(list:GetLine(list:GetSelectedLine()):GetValue(1))

		local menu = DermaMenu()
		menu:AddOption("Play (Local)", function()
			surface.PlaySound(getline)
			print("Playing: " .. getline)
		end):SetIcon("icon16/control_play.png")
		menu:AddOption("Play (Global)", function() SendToServer(getline) end):SetIcon("icon16/sound.png")
		menu:AddOption("Play and Close (Global)", function()
			SendToServer(getline)
			frame:Close()
		end):SetIcon("icon16/sound_delete.png")
		menu:AddSpacer()
		menu:AddOption("Close Menu", frame.Close):SetIcon("icon16/cross.png")
		menu:Open()
	end

	list.OnRowSelected = function() hastaunt = true end
	list.DoDoubleClick = function(id, line)
		hastaunt = true
		local getline = TranslateTaunt(list:GetLine(list:GetSelectedLine()):GetValue(1))
		SendToServer(getline)

		if GetConVar("ph_cl_autoclose_taunt"):GetBool() then frame:Close() end
	end

	frame:MakePopup()
	frame:SetKeyboardInputEnabled(false)
end

concommand.Add("ph_showtaunts", function()
	if LocalPlayer():Alive() and isforcedclose ~= true and LocalPlayer():GetObserverMode() == OBS_MODE_NONE then
		if isopened ~= true then MainFrame() end
	else
		chat.AddText(Color(220, 40, 0), "[PH:E Taunts] Notice: ", Color(220, 220, 220), "You can only play custom taunts when you\'re alive as prop/hunter!")
	end
end, nil, "Show Prop Hunt taunt list, so you can select and play for self or play as a taunt.")

local function BindPress(ply, bind, pressed)
	if string.find(bind, "+menu_context") and pressed then RunConsoleCommand("ph_showtaunts") end
end

hook.Add("PlayerBindPress", "PlayerBindPress_menuContext", BindPress)
