hook.Add("Move", "moveProp", function(ply, move)
	if SERVER and ply:Alive() and ply:Team() == TEAM_PROPS then
		local ent = ply.ph_prop

		-- Set position and angles
		if IsValid(ent) and IsValid(ply) and ply:Alive() then
			-- Set position
			if ent:GetModel() == PHE.default_prop_plymodel or ent:GetModel() == player_manager.TranslatePlayerModel(ply:GetInfo("cl_playermodel")) then
				ent:SetPos(move:GetOrigin())
			else
				ent:SetPos(move:GetOrigin() - Vector(0, 0, ent:OBBMins().z))
			end

			-- Set angles
			if not ply:GetPlayerLockedRot() then
				local ang = move:GetAngles()
				ent:SetAngles(Angle(0,ang.y,0))
			end
		end
	end
end)