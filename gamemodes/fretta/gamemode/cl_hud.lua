local hudScreen = nil
local Alive = false
local Class = nil
local Team = 0
local WaitingToRespawn = false
local InRound = false
local RoundResult = 0
local RoundWinner = nil
local IsObserver = false
local ObserveMode = 0
local ObserveTarget = NULL
local InVote = false

function GM:AddHUDItem(item, pos, parent)
	hudScreen:AddItem(item, parent, pos)
end

function GM:HUDNeedsUpdate()
	if not IsValid(LocalPlayer()) then return false end

	if Class ~= LocalPlayer():GetNWString("Class", "Default") then return true end
	if Alive ~= LocalPlayer():Alive() then return true end
	if Team ~= LocalPlayer():Team() then return true end
	if WaitingToRespawn ~= ((LocalPlayer():GetNWFloat("RespawnTime", 0) > CurTime()) and LocalPlayer():Team() ~= TEAM_SPECTATOR and not LocalPlayer():Alive()) then return true end
	if InRound ~= GetGlobalBool("InRound", false) then return true end
	if RoundResult ~= GetGlobalInt("RoundResult", 0) then return true end
	if RoundWinner ~= GetGlobalEntity("RoundWinner", nil) then return true end
	if IsObserver ~= LocalPlayer():IsObserver() then return true end
	if ObserveMode ~= LocalPlayer():GetObserverMode() then return true end
	if ObserveTarget ~= LocalPlayer():GetObserverTarget() then return true end
	if InVote ~= GAMEMODE:InGamemodeVote() then return true end

	return false
end

function GM:OnHUDUpdated()
	Class = LocalPlayer():GetNWString("Class", "Default")
	Alive = LocalPlayer():Alive()
	Team = LocalPlayer():Team()
	WaitingToRespawn = (LocalPlayer():GetNWFloat("RespawnTime", 0) > CurTime()) and LocalPlayer():Team() ~= TEAM_SPECTATOR and not Alive
	InRound = GetGlobalBool("InRound", false)
	RoundResult = GetGlobalInt("RoundResult", 0)
	RoundWinner = GetGlobalEntity("RoundWinner", nil)
	IsObserver = LocalPlayer():IsObserver()
	ObserveMode = LocalPlayer():GetObserverMode()
	ObserveTarget = LocalPlayer():GetObserverTarget()
	InVote = GAMEMODE:InGamemodeVote()
end

function GM:OnHUDPaint() end

function GM:RefreshHUD()
	if not GAMEMODE:HUDNeedsUpdate() then return end
	GAMEMODE:OnHUDUpdated()

	if IsValid(hudScreen) then hudScreen:Remove() end

	hudScreen = vgui.Create("DHudLayout")
	if InVote then return end

	if RoundWinner and RoundWinner ~= NULL then
		GAMEMODE:UpdateHUD_RoundResult(RoundWinner, Alive)
	elseif RoundResult ~= 0 then
		GAMEMODE:UpdateHUD_RoundResult(RoundResult, Alive)
	elseif IsObserver then
		GAMEMODE:UpdateHUD_Observer(WaitingToRespawn, InRound, ObserveMode, ObserveTarget)
	elseif not Alive then
		-- GAMEMODE:UpdateHUD_Dead(WaitingToRespawn, InRound)
		GAMEMODE:UpdateHUD_Player( false, InRound, WaitingToRespawn )
	else
		-- GAMEMODE:UpdateHUD_Alive(InRound)
		GAMEMODE:UpdateHUD_Player(true, InRound, false)

		if GetGlobalBool("RoundWaitForPlayers") and ((team.NumPlayers(TEAM_HUNTERS) < 1) or (team.NumPlayers(TEAM_PROPS) < 1)) then
			GAMEMODE:UpdateHUD_WaitForPlayers(InRound)
		end
	end
end

function GM:HUDPaint()
	self.BaseClass:HUDPaint()

	GAMEMODE:OnHUDPaint()
	GAMEMODE:RefreshHUD()
end

function GM:UpdateHUD_WaitForPlayers(InRound)
	if InRound and Alive then
		local WaitText = vgui.Create("DHudElement")
		WaitText:SizeToContents()
		WaitText:SetText(PHE.LANG.HUD.WAIT)

		GAMEMODE:AddHUDItem(WaitText, 8)
	end
end

function GM:UpdateHUD_RoundResult(RoundResult, Alive)
	local txt = GetGlobalString("RRText")

	if type(RoundResult) == "number" and (team.GetAllTeams()[RoundResult] and txt == "") then
		local TeamName = team.GetName(RoundResult)
		if TeamName then txt = string.format(PHE.LANG.HUD.WIN, TeamName) end
	elseif type(RoundResult) == "Player" and IsValid(RoundResult) and txt == "" then
		txt = RoundResult:Name() .. " Wins!"
	end

	local RespawnText = vgui.Create("DHudElement")
	RespawnText:SizeToContents()
	RespawnText:SetText(txt)
	RespawnText:SetFont( "SpessFont_HUD1" )
	GAMEMODE:AddHUDItem(RespawnText, 8)
end

function GM:UpdateHUD_Observer(bWaitingToSpawn, InRound, ObserveMode, ObserveTarget)
	local lbl = nil
	local txt = nil
	local col = Color(255, 255, 255)

	if IsValid(ObserveTarget) and ObserveTarget:IsPlayer() and ObserveTarget ~= LocalPlayer() and ObserveMode ~= OBS_MODE_ROAMING then
		lbl = "SPECTATING"
		txt = ObserveTarget:Nick()
		col = team.GetColor(ObserveTarget:Team())
	end

	if ObserveMode == OBS_MODE_DEATHCAM or ObserveMode == OBS_MODE_FREEZECAM then
		txt = "You Died!" -- were killed by?
	end

	if txt then
		local txtLabel = vgui.Create("DHudElement")
		txtLabel:SetText(txt)

		if lbl then txtLabel:SetLabel(lbl) end

		txtLabel:SetTextColor(col)
		GAMEMODE:AddHUDItem(txtLabel, 2)
	end

	GAMEMODE:UpdateHUD_Player( false, InRound, bWaitingToSpawn )
end

function GM:UpdateHUD_Player(isAlive, isInRound, isWaitingToSpawn)
	local barPosition = isAlive and 2 or 8
	if GAMEMODE.RoundBased or GAMEMODE.TeamBased then
		local Bar = vgui.Create("DHudBar")
		GAMEMODE:AddHUDItem(Bar, barPosition)

		if GAMEMODE.TeamBased and GAMEMODE.ShowTeamName then
			local teamNameFunc = function()
				local prefix = (not isAlive and LocalPlayer():Team() ~= TEAM_SPECTATOR) and "(DEAD) " or ""
				return prefix .. team.GetName(LocalPlayer():Team())
			end

			local teamColorFunc = function()
				return team.GetColor(LocalPlayer():Team())
			end

			local TeamIndicator = vgui.Create("DHudUpdater")
			TeamIndicator:SizeToContents()
			TeamIndicator:SetValueFunction(teamNameFunc)
			TeamIndicator:SetColorFunction(teamColorFunc)
			TeamIndicator:SetFont("SpessFont_HUD1")
			Bar:AddItem(TeamIndicator)
		end

		if GAMEMODE.RoundBased then
			local RoundNumber = vgui.Create("DHudUpdater")
			RoundNumber:SetPos(0, 0)
			RoundNumber:SizeToContents()
			RoundNumber:SetValueFunction(function() return GetGlobalInt("RoundNumber", 0) end)
			RoundNumber:SetLabel(PHE.LANG.HUD.ROUND)
			RoundNumber:SetFont("SpessFont_HUD1")
			RoundNumber.LabelPanel:SetFont("SpessFont_HUD1")

			Bar:AddItem(RoundNumber)

			local RoundTimer = vgui.Create("DHudCountdown")
			RoundTimer:SizeToContents()
			RoundTimer:SetValueFunction(function()
				if GetGlobalFloat("RoundStartTime", 0) > CurTime() then
					return GetGlobalFloat("RoundStartTime", 0)
				end
				return GetGlobalFloat("RoundEndTime")
			end)
			RoundTimer:SetLabel(PHE.LANG.HUD.TIME)
			RoundTimer:SetFont("SpessFont_HUD1")
			RoundTimer.LabelPanel:SetFont("SpessFont_HUD1")
			Bar:AddItem(RoundTimer)
		end
	end

	if not isAlive then
		if not isInRound and GAMEMODE.RoundBased then
			local RespawnText = vgui.Create("DHudElement")
			RespawnText:SizeToContents()
			RespawnText:SetText("Waiting for round start")
			RespawnText:SetFont("SpessFont_HUD1")
			GAMEMODE:AddHUDItem(RespawnText, 8)
		elseif isWaitingToSpawn then
			local RespawnTimer = vgui.Create("DHudCountdown")
			RespawnTimer:SizeToContents()
			RespawnTimer:SetValueFunction(function() return LocalPlayer():GetNWFloat("RespawnTime", 0) end)
			RespawnTimer:SetLabel("SPAWN IN")
			GAMEMODE:AddHUDItem(RespawnTimer, 8)
		elseif LocalPlayer():Team() ~= TEAM_SPECTATOR and not GAMEMODE.RoundBased then
			local RespawnText = vgui.Create("DHudElement")
			RespawnText:SizeToContents()
			RespawnText:SetText("Press Fire to Spawn")
			RespawnText:SetFont("SpessFont_HUD1")
			GAMEMODE:AddHUDItem(RespawnText, 8)
		end
	end
end