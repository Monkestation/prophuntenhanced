-- Global Var for custom taunt, delivering from taunts/prop -or- hunter_taunts.lua
PHE.PH_TAUNT_CUSTOM = {}
PHE.PH_TAUNT_CUSTOM.PROP = {}
PHE.PH_TAUNT_CUSTOM.HUNTER = {}

-- Time (in seconds) for spectator check (Default: 0.1)
PHE.SPECTATOR_CHECK_ADD = 0.1

PHE.USABLE_PROP_ENTITIES = {
	"prop_physics",
	"prop_physics_multiplayer"
}

-- Configure your staff admin/mod or donator rank (vip/donator) to the ignore mute list so they cannot be muted for a reason.
PHE.IgnoreMutedUserGroup = {
	-- admin
	"superadmin",
	"admin",
	"Owner",
	"Co-owner",
	-- Misc users
	"Developer",
	"Moderator",
	"Donator",
	"VIP"
}

-- Admin Staffs table for sv_admin.lua, which enables to modify gamemode settings under F1 > Prop Hunt Menu > Admin menu.
PHE.SVAdmins = {
	"admin",
	"superadmin",
	"owner"
}

PHE.UNSTUCK_COMMANDS = {
	"!unstuck", "!stuck",
	"/unstuck", "/stuck",
	"unstuck", "stuck"
}

-- Banned Props models
PHE.BANNED_PROP_MODELS = {
	"models/wrinkleshamwow/oneshot/shadealula_pm.mdl",
	"models/sasamin/oneshot/niko_pm_shadow.mdl"
}

--[[ // DO NOT MODIFY! use from taunts/prop_taunts.lua or hunter_taunts.lua instead! \\ ]]--
PHE.HUNTER_TAUNTS = {
	["Come to Papa"]				=	"taunts/hunters/come_to_papa.wav",
	["I am your Father"]			=	"taunts/hunters/father.wav",
	["Need Fire Assistance!"]		=	"taunts/hunters/fireassis.wav",
	["(GlaDOS) President"]			=	"taunts/hunters/glados-president.wav",
	["I am Hit!"]					=	"taunts/hunters/hitassist.wav",
	["How Rude"]					=	"taunts/hunters/how_rude.wav",
	["Radio Laugh"]					=	"taunts/hunters/laugh.wav",
	["Now What?"]					=	"taunts/hunters/now_what.wav",
	["You dont have the Soul"]		=	"taunts/hunters/you_dont_have_the_soul.wav",
	["You dont know the Power"]		=	"taunts/hunters/you_dont_know_the_power.wav",
	["You are underestimating"]		=	"taunts/hunters/you_underestimate_the_power.wav",
	["Threat Neutralized"]			=	"taunts/hunters/threat_neutralized.wav",
	["DX: My Vision is Augmented"]	=	"taunts/ph_enhanced/dx_augmented.wav",
	["DX: Im gonna Whoop your Ass"]	=	"taunts/ph_enhanced/dx_imgonnawoopyourass.wav",
	["DX: Dont worry we are cops"]	=	"taunts/ph_enhanced/dx_dontworrywurcops.wav",
	["DX: Heheh"]					=	"taunts/ph_enhanced/dx_hehe.wav",
	["Enough of Mambo Jumbo"]		=	"vo/npc/male01/vanswer13.wav",
	["HACKS"]						=	"vo/npc/male01/thehacks01.wav",
	["Over Here"]					=	"vo/npc/male01/overhere01.wav",
	["Over There"]					=	"vo/npc/male01/overthere01.wav",
	["Over There!!"]				=	"vo/npc/male01/overthere02.wav"
}

--[[ // DO NOT MODIFY! use from taunts/props_taunts.lua or hunters_taunts.lua instead! \\ ]]
PHE.PROP_TAUNTS = {
	["Run for your Life!"]					=	"vo/npc/male01/runforyourlife02.wav",
	["BillyMays - Are you on the Balls"]	=	"taunts/props/billymays_areyouontheballs.wav",
	["BillyMays - Get on the Balls"]		=	"taunts/props/billymays_getontheballs.wav",
	["BillyMays - I Guarantee It"]			=	"taunts/props/billymays_iguaranteeit.wav",
	["BillyMays - Its so Easy"]				=	"taunts/props/billymays_itsoeasy.wav",
	["BillyMays - Laundry made Easy"]		=	"taunts/props/billymays_laundrymadeeasy.wav",
	["BillyMays - New OxyClean"]			=	"taunts/props/billymays_newoxyclean.wav",
	["BillyMays - No more Detergent"]		=	"taunts/props/billymays_nomoredetergent.wav",
	["BillyMays - Only $9.99"]				=	"taunts/props/billymays_only9_99.wav",
	["BillyMays - OxyClean"]				=	"taunts/props/billymays_oxyclean.wav",
	["Boom, Headshot!"]						=	"taunts/props/boom_hs.wav",
	["Car Horn"]							=	"taunts/props/car_horn.wav",
	["Chicken Hammer"]						=	"taunts/props/chicken_hammer.wav",
	["DOH"]									=	"taunts/props/doh.wav",
	["Force Eliminated"]					=	"taunts/props/forces_eliminated.wav",
	["Go Away or I Shall"]					=	"taunts/props/go_away_or_i_shall.wav",
	["Ill be back"]							=	"taunts/props/ill_be_back.wav",
	["Oh yeah he will pay"]					=	"taunts/props/oh_yea_he_will_pay.wav",
	["Muffin Man"]							=	"taunts/props/ok_i_will_tell_you.wav",
	["PINGAS"]								=	"taunts/props/pingas.wav",
	["Please Come Again"]					=	"taunts/props/pls_come_again.wav",
	["Pokemon"]								=	"taunts/props/pokemon.wav",
	["Shams Wow"]							=	"taunts/props/sham_wow.wav",
	["This is SPARTA"]						=	"taunts/props/sparta.wav",
	["What is wrong with you"]				=	"taunts/props/wrong.wav",
	["DX: Easy Bruh"]						=	"taunts/ph_enhanced/dx_easy_bruh.wav",
	["DX: Hehe"]							=	"taunts/ph_enhanced/dx_heh.wav",
	["DX: I dont Move Out"]					=	"taunts/ph_enhanced/dx_idonotmoveout.wav",
	["DX: You Killed my Friend"]			=	"taunts/ph_enhanced/dx_iloominarty.wav",
	["DX: Leave me alone"]					=	"taunts/ph_enhanced/dx_leaveme.wav",
	["DX: LOOK AT ME"]						=	"taunts/ph_enhanced/dx_lookatme.wav",
	["DX: AAAAAAARGGHHHHHH"]				=	"taunts/ph_enhanced/dx_molepeople.wav",
	["DX: A BOMB"]							=	"taunts/ph_enhanced/dx_thebomb.wav",
	["DX: THE BOMB JC"]						=	"taunts/ph_enhanced/dx_thebomb2.wav",
	["DX: What a Shame"]					=	"taunts/ph_enhanced/dx_whatashame.wav",
	["DX: Whoa #1"]							=	"taunts/ph_enhanced/dx_whoawhoawhoa_1.wav",
	["DX: Whoa #2"]							=	"taunts/ph_enhanced/dx_whoawhoawhoa_2.wav",
	["SPAGHET"]								=	"taunts/ph_enhanced/ext_spaghet.wav",
	["WHO TOUCHA MY SPAGHET"]				=	"taunts/ph_enhanced/ext_touch_ma_spaghet.wav",
	["I watch your rear"]					=	"taunts/ph_enhanced/ext_crackmod_watchyourrear.wav",
	["You damn Ugly"]						=	"taunts/ph_enhanced/ext_crackmod_youareugly.wav",
	["Bicycle Bell"]						=	"taunts/ph_enhanced/ext_bicycle_bell.wav",
	["Ding"]								=	"taunts/ph_enhanced/ext_cling.wav",
	["deaugh"]								=	"taunts/ph_enhanced/ext_deaugh.wav",
	["CDI Die"]								=	"taunts/ph_enhanced/ext_die.wav",
	["CDI Oah"]								=	"taunts/ph_enhanced/ext_oah.wav",
	["Heres some cash goys"]				=	"taunts/ph_enhanced/ext_dosh1.wav",
	["Loadsam money"]						=	"taunts/ph_enhanced/ext_dosh2.wav",
	["Who needed money"]					=	"taunts/ph_enhanced/ext_dosh3.wav",
	["Money money money"]					=	"taunts/ph_enhanced/ext_dosh4.wav",
	["Dosh grab it while you can"]			=	"taunts/ph_enhanced/ext_dosh5.wav",
	["derpy fart"]							=	"taunts/ph_enhanced/ext_fart1.wav",
	["nice fart"]							=	"taunts/ph_enhanced/ext_fart2.wav",
	["Get out of Here stalker"]				=	"taunts/ph_enhanced/ext_getoutofhere_stalker.wav",
	["This is Illegal"]						=	"taunts/ph_enhanced/ext_illegal.wav",
	["JASONNN"]								=	"taunts/ph_enhanced/ext_jason1.wav",
	["JASON!"]								=	"taunts/ph_enhanced/ext_jason2.wav",
	["JASON"]								=	"taunts/ph_enhanced/ext_jason3.wav",
	["no way"]								=	"taunts/ph_enhanced/ext_nowai.wav",
	["Remove Freeman"]						=	"taunts/ph_enhanced/ext_remove_kebab.wav",
	["JC2: No no no"]						=	"taunts/ph_enhanced/jc2_nonono.wav",
	["JC2: no way"]							=	"taunts/ph_enhanced/jc2_nowai.wav",
	["Yeah Boy"]							=	"taunts/ph_enhanced/ext_yeahboy_mp4.wav",
	["Uuf"]									=	"taunts/ph_enhanced/ext_oof_minecraft.wav",
	["Oof"]									=	"taunts/ph_enhanced/ext_oof_roblox.wav",
	["WOOOOH"]								=	"taunts/ph_enhanced/ext_pyrocynical_woo.wav"
}

-- Custom Player Model bans for props
PHE.PROP_PLMODEL_BANS = {
	"models/player.mdl"
}

PHE.WINNINGSOUNDS = {
	[1] 		= "misc/ph_hunterwin.mp3", 	-- hunter
	[2]			= "misc/ph_propwin.mp3",	-- props
	["Draw"]	= {"misc/ph_rounddraw_1.mp3", "misc/ph_rounddraw_2.mp3"}
}

PHE.STARTSOUNDS = {
	"misc/monke/roundstart/dagoth3.ogg",
	"misc/monke/roundstart/duke2.ogg",
	"misc/monke/roundstart/duke6.ogg",
	"misc/monke/roundstart/intern4.ogg",
	"misc/monke/roundstart/dagoth4.ogg",
	"misc/monke/roundstart/duke3.ogg",
	"misc/monke/roundstart/intern1.ogg",
	"misc/monke/roundstart/medbot1.ogg",
	"misc/monke/roundstart/dagoth1.ogg",
	"misc/monke/roundstart/default.ogg",
	"misc/monke/roundstart/duke4.ogg",
	"misc/monke/roundstart/intern2.ogg",
	"misc/monke/roundstart/medbot2.ogg",
	"misc/monke/roundstart/dagoth2.ogg",
	"misc/monke/roundstart/duke1.ogg",
	"misc/monke/roundstart/duke5.ogg",
	"misc/monke/roundstart/intern3.ogg"
}

PHE.ENDSOUNDS = {
	"misc/monke/roundend/dagoth1.ogg",
	"misc/monke/roundend/dagoth2.ogg",
	"misc/monke/roundend/dagoth3.ogg",
	"misc/monke/roundend/duke1.ogg",
	"misc/monke/roundend/duke2.ogg"
}

PHE.default_prop_plymodel = "models/prop/ss13 toolbox/ss13_toolbox.mdl"


local function AddDemTaunt()
	printVerbose("[PH:E Taunts] Initializing Custom Taunts...")

	for propName,propTaunt in pairs(list.Get("PHE.CustomPropTaunts")) do
		printVerbose("[PH:E Taunts] Adding Custom PROP taunts -> " .. propName)
		PHE.PH_TAUNT_CUSTOM.PROP[propName] = propTaunt
		if SERVER then
			resource.AddSingleFile("sound/" .. propTaunt)
		end
	end

	for huntName,huntTaunt in pairs(list.Get("PHE.CustomHunterTaunts")) do
		printVerbose("[PH:E Taunts] Adding Custom HUNTER taunts -> " .. huntName)
		PHE.PH_TAUNT_CUSTOM.HUNTER[huntName] = huntTaunt
		if SERVER then
			resource.AddSingleFile("sound/" .. huntTaunt)
		end
	end
end
hook.Add("Initialize", "PHE.AddTauntTables", AddDemTaunt)

-- External Use only, such as Taunt Collection and stuff.
-- MAKE SURE TO CALL 'PHE:RefreshTauntList()' AFTER ADDING YOUR CUSTOM TAUNTS!
function PHE:AddCustomTaunt(idTeam,strName,strTaunt)
	if idTeam == TEAM_PROPS then
		PHE.PH_TAUNT_CUSTOM.PROP[strName] = strTaunt
	end
	if idTeam == TEAM_HUNTERS then
		PHE.PH_TAUNT_CUSTOM.HUNTER[strName] = strTaunt
	end
end

-- External Use only, such as Taunt Collection or other.
-- MAKE SURE TO CALL 'PHE:RefreshTauntList()' AFTER REMOVING THE SPECIFIED TAUNTS!
function PHE:RemoveCustomTauntByPath(idTeam, strTaunt)
	if idTeam == TEAM_PROPS and table.HasValue(PHE.PH_TAUNT_CUSTOM.PROP, strTaunt) or
	(idTeam == TEAM_HUNTERS and table.HasValue(PHE.PH_TAUNT_CUSTOM.HUNTER, strTaunt)) then
		table.RemoveByValue(strTaunt)
	end
end

function PHE:GetAllTeamTaunt(teamid)
	if teamid == TEAM_PROPS then
		local taunt = table.Copy(PHE.PROP_TAUNTS)
		if table.Count(PHE.PH_TAUNT_CUSTOM.PROP) > 0 then
			for name,tprop in pairs(PHE.PH_TAUNT_CUSTOM.PROP) do
				taunt[name] = tprop
			end
		end

		return taunt
	end

	if teamid == TEAM_HUNTERS then
		local taunt = table.Copy(PHE.HUNTER_TAUNTS)
		if table.Count(PHE.PH_TAUNT_CUSTOM.HUNTER) > 0 then
			for name,thunter in pairs(PHE.PH_TAUNT_CUSTOM.HUNTER) do
				taunt[name] = thunter
			end
		end

		return taunt
	end

	return false
end

function PHE:GetTeamTaunt(teamid, bCustom)
	if teamid == TEAM_PROPS then
		if bCustom then
			if table.Count(PHE.PH_TAUNT_CUSTOM.PROP) > 0 then
				return PHE.PH_TAUNT_CUSTOM.PROP
			else
				return false
			end
		else
			return PHE.PROP_TAUNTS
		end
	end

	if teamid == TEAM_HUNTERS then
		if bCustom then
			if table.Count(PHE.PH_TAUNT_CUSTOM.HUNTER) > 0 then
				return PHE.PH_TAUNT_CUSTOM.HUNTER
			else
				return false
			end
		else
			return PHE.HUNTER_TAUNTS
		end
	end

	return false
end

function PHE:RefreshTauntList()
	local proptaunt = {
		normal	= table.Copy(PHE.PROP_TAUNTS),
		custom	= table.Copy(PHE.PH_TAUNT_CUSTOM.PROP)
	}
	table.Empty(PHE.PROP_TAUNTS)
	table.Empty(PHE.PH_TAUNT_CUSTOM.PROP)

	local huntertaunt = {
		normal	= table.Copy(PHE.HUNTER_TAUNTS),
		custom	= table.Copy(PHE.PH_TAUNT_CUSTOM.HUNTER)
	}
	table.Empty(PHE.HUNTER_TAUNTS)
	table.Empty(PHE.PH_TAUNT_CUSTOM.HUNTER)

	-- Sort Prop Taunts
	for name, taunt in pairs(proptaunt.normal) do
		PHE.PROP_TAUNTS[name] = taunt
	end
	for name, taunt in pairs(proptaunt.custom) do
		PHE.PH_TAUNT_CUSTOM.PROP[name] = taunt
	end
	table.sort(PHE.PROP_TAUNTS)
	table.sort(PHE.PH_TAUNT_CUSTOM.PROP)

	-- Sort Hunter Taunts
	for name,taunt in pairs(huntertaunt.normal) do
		PHE.HUNTER_TAUNTS[name] = taunt
	end
	for name,taunt in pairs(huntertaunt.custom) do
		PHE.PH_TAUNT_CUSTOM.HUNTER[name] = taunt
	end
	table.sort(PHE.HUNTER_TAUNTS)
	table.sort(PHE.PH_TAUNT_CUSTOM.HUNTER)
end

hook.Add("InitPostEntity", "PHE.RefreshTaunts", function()
	PHE:RefreshTauntList()
end)

concommand.Add("phe_refresh_taunt_list", PHE.RefreshTauntList, nil, "(EXPERIMENTAL) Force Refresh the Taunt List. This may cause some taunts are missing. Restart map is Required!")

-- Add the custom player model bans for props AND prop banned models
if SERVER then
	if not file.Exists("phe_config", "DATA") then
		printVerbose("[PH: Enhanced] Warning: ./data/phe_config/ does not exist. Creating New One...")
		file.CreateDir("phe_config")
	end

	local function AddBadPLModels()
		local dir = "phe_config/prop_plymodel_bans"

		-- Create base config area
		if not file.Exists(dir, "DATA") then
			file.CreateDir(dir)
		end

		-- Create actual config
		if not file.Exists(dir .. "/bans.txt", "DATA") then
			file.Write(dir .. "/bans.txt", util.TableToJSON({"models/player.mdl"}, true))
		end

		if file.Exists(dir .. "/bans.txt", "DATA") then
			local PROP_PLMODEL_BANS_READ = util.JSONToTable(file.Read(dir .. "/bans.txt", "DATA"))

			-- empty the table instead
			table.Empty(PHE.PROP_PLMODEL_BANS)

			for _, v in pairs(PROP_PLMODEL_BANS_READ) do
				printVerbose("[PH:E PlayerModels] Adding custom prop player model ban --> "..string.lower(v))
				table.insert(PHE.PROP_PLMODEL_BANS, string.lower(v))
			end
		else
			printVerbose("[PH: Enhanced] Cannot read " .. dir .. "/bans.txt: Error - did not exist. Did you just delete it or what?")
		end
	end
	hook.Add("Initialize", "PHE.AddBadPlayerModels", AddBadPLModels)

	local function AddBannedPropModels()
		local dir = "phe_config/prop_model_bans"

		local mdlpermabans = {
			"models/props/cs_assault/dollar.mdl",
			"models/props/cs_assault/money.mdl",
			"models/props/cs_office/snowman_arm.mdl",
			"models/props/cs_office/computer_mouse.mdl",
			"models/props/cs_office/projector_remote.mdl",
			"models/foodnhouseholditems/egg.mdl",
			"models/props/cs_militia/reload_bullet_tray.mdl"
		}

		if not file.Exists(dir, "DATA") then
			file.CreateDir(dir)
		end

		if not file.Exists(dir .. "/model_bans.txt", "DATA") then
			file.Write(dir .. "/model_bans.txt", util.TableToJSON(mdlpermabans, true))
		end

		if file.Exists(dir .. "/model_bans.txt", "DATA") then
			local PROP_MODEL_BANS_READ = util.JSONToTable(file.Read(dir .. "/model_bans.txt"))

			-- empty the tables anyway.
			table.Empty(PHE.BANNED_PROP_MODELS)

			for _, v in pairs(PROP_MODEL_BANS_READ) do
				printVerbose("[PH:E Model Bans] Adding entry of restricted model to be used --> " .. string.lower(v))
				table.insert(PHE.BANNED_PROP_MODELS, string.lower(v))
			end
		else
			printVerbose("[PH: Enhanced] Cannot read " .. dir .. "/model_bans.txt: Error - did not exist. Did you just delete it or what?")
		end
	end
	hook.Add("Initialize", "PHE.AddBannedPropModels", AddBannedPropModels)

	-- Add ConCommands.
	concommand.Add("phe_refresh_plmodel_ban", AddBadPLModels, nil, "Refresh Server Playermodel Ban Lists, read from prop_plymodel_bans/bans.txt data.", FCVAR_SERVER_CAN_EXECUTE)
	concommand.Add("phe_refresh_propmodel_ban", AddBannedPropModels, nil, "Refresh Server Prop Models Ban Lists, read from prop_model_bans/model_bans.txt data.", FCVAR_SERVER_CAN_EXECUTE)
end

-- AAAAAAARGGHHHHHH
function PHE:AAAAAAARGGHHHHHH()
	print("oh no, it\'s the AAAAAAARGGHHHHHH AAAHHHHHHHHHHHHHHHH!")
	if CLIENT then
		surface.PlaySound(PHE.PROP_TAUNTS["DX: AAAAAAARGGHHHHHH"])
	end
end
concommand.Add("aaaaaaargghhhhhh", PHE.AAAAAAARGGHHHHHH, nil, "The classic AAAAAAARGGHHHHHH from Deus Ex.", 0x10)
