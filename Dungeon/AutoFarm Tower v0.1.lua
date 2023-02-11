--[[
if game.workspace:FindFirstChild("Map") then
game.workspace.Map:Destroy()
--game:GetService("ReplicatedStorage"):WaitForChild("getgenv()"):WaitForChild("Teleport").TeleportToHub:FireServer(32)
end
]]

_G.CoinMagnet = true
_G.WaitTime = 2
_G.Setting = {
	AutoSelectHighest = {
		Enabled = true,
	}
}
-- Load
repeat wait() until game:IsLoaded()

-- Check the player
function getPlayer()
    local load
    player, cha, plr, col = nil, nil, nil, nil
    repeat 
        load = pcall(function()
            local player = game.Players.LocalPlayer
            local cha = player.Character
            local plr = cha.HumanoidRootPart
            local col = cha.Collider
        end)
        wait()
    until load
    local player = game.Players.LocalPlayer
    local cha = player.Character
    local plr = cha.HumanoidRootPart
    local col = cha.Collider
    return player, cha, plr, col
end
local player, cha, plr, col = getPlayer()

-- Load
repeat
	load = pcall(function()
		local Combat = require(game:GetService("ReplicatedStorage").getgenv().Combat)
		local CharProfileCheck 	= game:GetService("ReplicatedStorage"):FindFirstChild("Profiles"):FindFirstChild(cha.Name);
		local ClassGUI  = CharProfileCheck and game:GetService("ReplicatedStorage").Profiles[cha.Name].Class;
		local GetEvent = Combat and Combat:GetAttackEvent();
		local Mission = game.Workspace:FindFirstChild("MissionObjects")
	end)
	wait()
until load

-- Variables
local player = game.Players.LocalPlayer
local cha = player.Character
local plr = cha.HumanoidRootPart
local Combat = require(game:GetService("ReplicatedStorage").getgenv().Combat)
local CharProfileCheck 	= game:GetService("ReplicatedStorage"):FindFirstChild("Profiles"):FindFirstChild(cha.Name);
local ClassGUI  = CharProfileCheck and game:GetService("ReplicatedStorage").Profiles[cha.Name].Class;
local GetEvent = Combat and Combat:GetAttackEvent();
local ms = game.Workspace:FindFirstChild("MissionObjects")
local places = {4310463616 ,4310463940}

-- table Classes
local Classes = {
    ["Swordmaster"]     = {"Swordmaster1", "Swordmaster2", "Swordmaster3", "Swordmaster4", "Swordmaster5", "Swordmaster6", "CrescentStrike1", "CrescentStrike2", "CrescentStrike3", "Leap"};
    ["Mage"]            = {"Mage1", "ArcaneBlastAOE", "ArcaneBlast", "ArcaneWave1", "ArcaneWave2", "ArcaneWave3", "ArcaneWave4", "ArcaneWave5", "ArcaneWave6", "ArcaneWave7", "ArcaneWave8", "ArcaneWave9"};
    ["Defender"]        = {"Defender1", "Defender2", "Defender3", "Defender4", "Defender5", "Groundbreaker", "Spin1", "Spin2", "Spin3", "Spin4", "Spin5"};
    ["DualWielder"]     = {"DualWield1", "DualWield2", "DualWield3", "DualWield4", "DualWield5", "DualWield6", "DualWield7", "DualWield8", "DualWield9", "DualWield10", "DashStrike", "CrossSlash1", "CrossSlash2", "CrossSlash3", "CrossSlash4"};
    ["Guardian"]        = {"Guardian1", "Guardian2", "Guardian3", "Guardian4", "SlashFury1", "SlashFury2", "SlashFury3", "SlashFury4", "SlashFury5", "SlashFury6", "SlashFury7", "SlashFury8", "SlashFury9", "SlashFury10", "SlashFury11", "SlashFury12", "SlashFury13", "RockSpikes1", "RockSpikes2", "RockSpikes3"};
    ["IcefireMage"]     = {"IcefireMage1", "IcySpikes1", "IcySpikes2", "IcySpikes3", "IcySpikes4", "IcefireMageFireballBlast", "IcefireMageFireball", "LightningStrike1", "LightningStrike2", "LightningStrike3", "LightningStrike4", "LightningStrike5", "IcefireMageUltimateFrost", "IcefireMageUltimateMeteor1"};
    ["Berserker"]       = {"Berserker1", "Berserker2", "Berserker3", "Berserker4", "Berserker5", "Berserker6", "AggroSlam", "GigaSpin1", "GigaSpin2", "GigaSpin3", "GigaSpin4", "GigaSpin5", "GigaSpin6", "GigaSpin7", "GigaSpin8", "Fissure1", "Fissure2", "FissureErupt1", "FissureErupt2", "FissureErupt3", "FissureErupt4", "FissureErupt5"};
    ["Paladin"]         = {"Paladin1", "Paladin2", "Paladin3", "Paladin4", "LightThrust1", "LightThrust2", "LightPaladin1", "LightPaladin2"};
    ["MageOfLight"]     = {"MageOfLight", "MageOfLightBlast"};
    ["Demon"]           = {"Demon1", "Demon4", "Demon7", "Demon10", "Demon13", "Demon16", "Demon19", "Demon22", "Demon25", "DemonDPS1", "DemonDPS2", "DemonDPS3", "DemonDPS4", "DemonDPS5", "DemonDPS6", "DemonDPS7", "DemonDPS8", "DemonDPS9", "ScytheThrowDPS1", "ScytheThrowDPS2", "ScytheThrowDPS3", "DemonLifeStealDPS", "DemonSoulDPS1", "DemonSoulDPS2", "DemonSoulDPS3"};
    ['Dragoon']          = {'Dragoon1', 'Dragoon2', 'Dragoon3', 'Dragoon4', 'Dragoon5', 'Dragoon6', 'Dragoon7', 'DragoonDash','DragoonCross1', 'DragoonCross2', 'DragoonCross3', 'DragoonCross4', 'DragoonCross5', 'DragoonCross6', 'DragoonCross7', 'DragoonCross8', 'DragoonCross9', 'DragoonCross10', 'MultiStrike1', 'MultiStrike2', 'MultiStrike3', 'MultiStrike4', 'MultiStrike5', 'MultiStrikeDragon1', 'MultiStrikeDragon2', 'MultiStrikeDragon3', 'DragoonFall'};
	['Archer']			= {'Archer','PiercingArrow1','PiercingArrow2','PiercingArrow3', 'PiercingArrow4', 'PiercingArrow5', 'PiercingArrow5', 'PiercingArrow6', 'PiercingArrow7', 'PiercingArrow8', 'PiercingArrow9', 'PiercingArrow10','SpiritBomb','MortarStrike1','MortarStrike2','MortarStrike3','MortarStrike4','MortarStrike5','MortarStrike6','MortarStrike7', 'HeavenlySword1', 'HeavenlySword2', 'HeavenlySword3', 'HeavenlySword4', 'HeavenlySword5', 'HeavenlySword6'};
}

-- Bypass
if (GetEvent) then
    for i,v in next, getconnections(GetEvent.OnClientEvent) do
        v:Disable()
    end
end
--[[
11
31
21 -- normal
]]
local dungeonId = {
	-- world 1
	[2978696440] = 'Crabby Crusade (1-1)', 
	[4310476380] = 'Scarecrow Defense (1-2)', 
	[4310464656] = 'Dire Problem (1-3)',
	[4310478830] = 'Kingslayer (1-4)',
	[3383444582] = 'Gravetower Dungeon (1-5)',
	
	[3885726701] = 'Temple of Ruin (2-1)',
	[3994953548] = 'Mama Trauma (2-2)',
	[4050468028] = "Volcano's Shadow (2-3)",
	[3165900886] = 'Volcano Dungeon (2-4)',
	
	[4465988196] = 'Mountain Pass (3-1)',
	[4465989351] = 'Winter Cavern (3-2)',
	[4465989998] = 'Winter Dungeon (3-3)',

	[4646473427] = 'Scrap Canyon (4-1)',
	[4646475342] = 'Deserted Burrowmine (4-2)',
	[4646475570] = 'Pyramid Dungeon (4-3)',
	
	[6386112652] = 'Konoh Heartlands (5-1)',
	[6510862058] = 'Atlantic Atoll (6-1)',
	[6847034886] = 'Mezuvia Skylands (7-1)'
}

local towerId = {
	[5703353651] = 'Prison Tower',
	[6075085184] = 'Atlantis Tower'
}

local lobbyId = {
	[2727067538] = 'Main menu',
	[4310463616] = 'World 1',
	[4310463940] = 'World 2',
	[4465987684] = 'World 3',
	[4646472003] = 'World 4',
	[5703355191] = 'World 5',
	[6075083204] = 'World 6',
	[6847035264] = 'World 7'
}

function lobbyCheck()
    for i,v in pairs(lobbyId) do
        if game.PlaceId == i then
			warn('Checking Lobby')
			warn("Lobby:", v)
           return true
        end
    end
    return false
end

function dungeonCheck()
	warn('Checking')
    for i,v in pairs(dungeonId) do
        if game.PlaceId == i then
			warn("Dungeon:", v)
           return true
        end
    end
	for i,v in pairs(towerId) do
		if game.PlaceId == i then
			warn("Tower:", v)
           return true
        end
	end
	warn('S U S')
    return player:Kick('SUS')
end 


local inLobby = lobbyCheck()
local inDungeon = dungeonCheck()
if inLobby then
	print('here')
elseif inDungeon then
	--repeat wait() until player:WaitForChild("PlayerGui"):WaitForChild("BoardGui")

	if ms:FindFirstChild('invisibleparts') then
		ms.invisibleparts:Destroy()
	end
	
	if workspace:FindFirstChild("MobBlockers") then
		workspace:FindFirstChild("MobBlockers"):Destroy()
	end
	
	player.PlayerGui.CutsceneUI.Changed:Connect(function()
		warn('CutsceneUI')
		player.PlayerGui.CutsceneUI.Enabled = false
	end)
	
	-- Start game
	function start()
		local startMission = ms:FindFirstChild("MissionStart")
		if startMission then
			warn('Start')
			repeat
				pcall(function()
					startMission.PrimaryPart.CanCollide = false
					startMission.PrimaryPart.CFrame = plr.CFrame
				end)
				wait(.1)
			until not ms:FindFirstChild("MissionStart")
			wait(_G.WaitTime)
			warn("Start Farming")
		end
	end
	
	-- get reward
	player.PlayerGui.MainGui.MissionRewards.Changed:Connect(function(v)
		warn('Claim Reward')
		game:GetService("ReplicatedStorage").getgenv().Missions.GetMissionPrize:InvokeServer()
		wait(.5)
		game:GetService("ReplicatedStorage").getgenv().Missions.LeaveChoice:FireServer(true)
		wait(.5)
		game:GetService("ReplicatedStorage").getgenv().Missions.NotifyReadyToLeave:FireServer()
		warn('Leave')
	end)
	
	local Vitals = player:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Hotbar"):WaitForChild("Vitals")
	--player:WaitForChild("PlayerGui"):WaitForChild("BoardGui"):Destroy()
	function customUI()
		--player.PlayerGui.BoardGui.Frame.Visible = false
	    Vitals:WaitForChild("XP"):WaitForChild("TextLabel").Visible = false 
	    Vitals:WaitForChild("XP"):WaitForChild("Shadow").Visible = false
	end
	
	Vitals.XP.TextLabel.Changed:Connect(function()
		Vitals:WaitForChild("XP"):WaitForChild("TextLabel").Visible = false 
	    Vitals:WaitForChild("XP"):WaitForChild("Shadow").Visible = false
	end)
	
	Vitals.Health.HealthText.Changed:Connect(function()
		Vitals.Health.HealthText.Text = 'Script by LuckyToT#0001'
		Vitals.Health.HealthText.Overlay.Text = 'Script by LuckyToT#0001'
	end)

	function credit()
		Vitals.Health.HealthText.Text = 'Script by LuckyToT#0001'
		Vitals.Health.HealthText.Overlay.Text = 'Script by LuckyToT#0001'
		player.PlayerGui:WaitForChild("MainGui"):WaitForChild("Menu"):WaitForChild("DesktopMenu"):WaitForChild("Button"):WaitForChild("ImageLabel").Image = "rbxassetid://4782301932"
	end

	-- Collect coin
	game:GetService("Workspace").Coins.ChildAdded:Connect(function(v)
		if v.Name == 'CoinPart' and _G.CoinMagnet then
		    repeat
                pcall(function()
                    v.CanCollide = false
                    v.CFrame = plr.CFrame
                end)
                wait()
            until v == nil 
		end
	end)
	
	local msWorkspace = { -- mission in workspace
		["Cage1Marker"] = true,
		["Cage2Marker"] = true,
		["TreasureMarker"] = true
	}
	local msIngore = { 
		-- world 2-1
		['WaterKillPart'] = true,
		['HammerReset1'] = true,
		-- world 2-2
		['Water'] = true,
		['WaterEnd'] = true,
		['MushroomTriggers'] = true,
		['TempleTrigger'] = true,
		-- world 2-3
		['LavaTrigger'] = true,
		-- world 3-2
		['Phase1Fall0'] = true,
		['Phase2Fall0'] = true,
		-- world 3-3
		['CastleBossArena0'] = true,
		['CastleFrontGate0'] = true,
		['CastleBackGate0'] = true,
		-- wrold 4-3
		['Gate0'] = true,
		['Gate1'] = true,
		['TriggerFloor'] = true,
		['Boss0'] = true,
		['BossE0'] = true,
		['Teleporter'] = true
	}

	local msSpecial = { -- special mission that can't CanCollide
		["WallsTrigger"] =  true,
		["WallsFinalTrigger"] = true,
		["CaveTrigger"] = true,
		['MinibossExit'] = true
	}

	local destroyFolder = {
		-- world 2-
		['Darts'] = true,
		["Spikes"] = true,
		["Gates"] = true,
		["SwingingHammers"] = true,
		-- world 2-3
		["Geysers"] = true,
		['LavaTriggers'] = true,
		['ToxicDispensers'] = true,
		-- world 4-3
		['FallBricks'] = true,
		['Bricks'] = true,
		-- world 5-1
		['DamageDroppers'] = true,
		['BlazeShooters'] = true,
		['DamageDroppers'] = true,
		['FallAreas'] = true
	}
	-- Do mission
	game:GetService("Workspace").ChildAdded:Connect(function(v)
		if string.find(v.Name:lower(), 'chest') then
			warn(v)
		    repeat
                pcall(function()
                    v.PrimaryPart.CanCollide = false
                    v.PrimaryPart.CFrame = plr.CFrame
                end)
                wait(.1)
            until v == nil
		end
		if msWorkspace[v.Name] then
		    repeat
                pcall(function()
                    v.PrimaryPart.CanCollide = false
                    v.PrimaryPart.CFrame = plr.CFrame
                end)
                wait(.1)
            until v == nil
		end
		if v.Name == 'Model' then
			repeat
				wait(.1)
				v:Destroy()
			until v == nil 
		end
	end)

	local Camera = require(game.ReplicatedStorage.Client.Camera)
	player.PlayerGui.CutsceneUI.Changed:Connect(function(v)
			Camera:SkipCutscene()
	end)

	-- Do mission
	function getMission()
		if (game.PlaceId == 5703353651 or game.PlaceId == 6075085184) and game.workspace:FindFirstChild('Map') then
			for i,v in pairs(game:GetService("Workspace").Map:GetDescendants()) do
				if v:FindFirstChild('TouchInterest') then
					v.CFrame = plr.CFrame
					v.CanCollide = true
					v.CanCollide = false
					wait()
				end
			end
		end
		for i, v in pairs(ms:GetDescendants()) do
			if v:IsA('Folder') and destroyFolder[v.Name] then
				v:Destroy()
			end
			if v:FindFirstChild('TouchInterest') and tostring(v.Parent) ~= "Checkpoints" then
			    if msIngore[v.Name] then
			        v:Destroy()
				end
				if msSpecial[v.Name] then
					v.CanCollide = true
				end
				v.CanCollide = false
				v.CFrame = plr.CFrame
				wait()
			end
		end
	end
	
	function specialMob()
		local mob = {}
		local pos = {}
		local special = nil
		pcall(function()
		if game.PlaceId == 3383444582 then
			if workspace:FindFirstChild('Pillar1') and workspace.Pillar1.HealthProperties.Health.Value > 0 then
				table.insert(mob, workspace.Pillar1)
				table.insert(pos, workspace.Pillar1.Base.Position)
				special = workspace.Pillar1
			elseif workspace:FindFirstChild('Pillar2') and workspace.Pillar2.HealthProperties.Health.Value > 0 then
				table.insert(mob, workspace.Pillar2)
				table.insert(pos, workspace.Pillar2.Base.Position)
				special = workspace.Pillar2
			elseif workspace:FindFirstChild('Pillar3') and workspace.Pillar3.HealthProperties.Health.Value > 0 then
				table.insert(mob, workspace.Pillar3)
				table.insert(pos, workspace.Pillar3.Base.Position)
				special = workspace.Pillar3
			end
		elseif game.PlaceId == 4465989351 then
			if ms:FindFirstChild('IceBarricade') and ms.IceBarricade.HealthProperties.Health.Value > 0 then
				table.insert(mob, ms.IceBarricade)
				table.insert(pos, ms.IceBarricade.Part.Position)
				special = ms.IceBarricade
			end
		elseif game.PlaceId == 4465989998 then
			for i,v in pairs(ms.SpikeCheckpoints:GetChildren()) do
				if v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then
					table.insert(mob, v)
					table.insert(pos, v.PrimaryPart.Position)
					special = v
				end
			end
			if workspace:FindFirstChild('IceWall') then
				table.insert(mob, workspace.IceWall)
				table.insert(pos, workspace.IceWall.Ring.Position)
				special = workspace.IceWall
			end
		elseif game.PlaceId == 4646473427 then
			for i,v in pairs(ms.TowerLegs:GetChildren()) do
				if v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then
					table.insert(mob, v)
					table.insert(pos, v.PrimaryPart.Position)
					special = v
				end
			end
		elseif game.PlaceId == 6386112652 then
			for i,v in pairs(game:GetService("Workspace").FearNukes:GetChildren()) do
				if v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then
					table.insert(mob, v)
					table.insert(pos, v.PrimaryPart.Position)
					special = v
				end
			end
		elseif game.PlaceId == 6510862058 then
			if game.workspace:FindFirstChild('TriggerBarrel') and game.workspace.TriggerBarrel:FindFirstChild('HealthProperties').Health.Value > 0 then
				table.insert(mob, game.workspace.TriggerBarrel)
				table.insert(pos, game.workspace.TriggerBarrel.PrimaryPart.Position)
				special = game.workspace.TriggerBarrel
			end
		elseif game.PlaceId == 5703353651 then -- tower
			for i,v in pairs(ms.Shields:GetChildren()) do
				if v:FindFirstChild('Blade').Light.Enabled then
					table.insert(mob, v)
					table.insert(pos, v.PrimaryPart.Position)
					special = v
				end
			end
		end
		end)
		warn('Special:', special)
		return special, mob, pos
	end
	
	local mobTable = { -- normol mob
		-- world 2
		['FireFlower'] = true,
		['GoblinSlingshot'] = true,
		-- world 3
		['IceFlower'] = true,
		['DesertFlower'] = true,
		-- world 5-1
		['BlossomTree'] = true,
		['KrakenArm'] = true
	}
	local bossTable = { -- boss table
		['BOSSTreeEnt'] = true,
		-- world 2-1, 2-2
		['GoblinGatekeeper'] = true,
		['GoblinKnightTR'] = true,
		['BOSSMamaQuillodile'] = true,
		-- world 2-3
		['CerberusMinion'] = true,
		--['BOSSCerberus'] = true
		-- world 3-1
		['BOSSWoollyMammoose'] = true,
		-- world 3-3
		['CastleKnight'] = true,
		['BOSSWinterfallIceDragon'] = true,
		-- world 4-1 4-2
		['BOSSHogRider'] = true,
		['BuffCactus'] = true,
		['BOSSSandScorpion'] = true,
		['BOSSAnubis'] = true
		-- world 5-1
		--['CorruptedGreaterTree'] = true
		-- world 6-1
	}
	local golemTable = {
		-- world 2-4
		['LavaGolem'] = true,
		['FrostGolem'] = true,
		['RockGolem'] = true,
		['ElderGolem'] = true
	}
	-- return the nearest mob
	function nearest()
		local player, cha, plr, col = getPlayer()
		local target, distance
		local closet = math.huge
		if game.PlaceId == 4465989351 then
			if ms:FindFirstChild('IceBarricade') and ms.IceBarricade:FindFirstChild('HealthProperties') and ms.IceBarricade.HealthProperties.Health.Value > 0 then
				target, _, __ = specialMob()
				return target
			end
		elseif game.PlaceId == 4465989998 then
			if workspace:FindFirstChild('IceWall') then
				target, _, __ = specialMob()
				return target
			end
			for i,o in pairs(ms.SpikeCheckpoints:GetChildren()) do
				if o:FindFirstChild('HealthProperties') and o.HealthProperties.Health.Value > 0 then
					target, _, __ = specialMob()
					return target
				end
			end
		elseif game.PlaceId == 4646473427 then
			for i,o in pairs(ms.TowerLegs:GetChildren()) do
				if o:FindFirstChild('HealthProperties') and o.HealthProperties.Health.Value > 0 then
					target, _, __ = specialMob()
					return target
				end
			end
		elseif game.PlaceId == 4646475570 then
			for i,o in pairs(game.workspace:GetChildren()) do
				if o.Name == 'Gate' and o:FindFirstChild('HealthProperties').Health.Value > 0 then
					target, _, __ = specialMob()
					return target
				end
			end
		elseif game.PlaceId == 6386112652 then
			for i,o in pairs(game:GetService("Workspace").FearNukes:GetChildren()) do
				if o:FindFirstChild('HealthProperties') and o.HealthProperties.Health.Value > 0 then
					wait(0.3)
					target, _, __ = specialMob()
					return target
				end
			end
		elseif game.PlaceId == 6510862058 then
			if game.workspace:FindFirstChild('TriggerBarrel') and game.workspace.TriggerBarrel:FindFirstChild('HealthProperties').Health.Value > 0 then
				target, _, __ = specialMob()
				return target
			end
		elseif game.PlaceId == 5703353651 then -- tower
			for i,v in pairs(ms.Shields:GetChildren()) do
				if v:FindFirstChild('Blade').Light.Enabled then
					target, _, __ = specialMob()
					return target
				end
			end
		end
		
		for _, v in pairs(game.workspace.Mobs:GetChildren()) do
			if v:FindFirstChild('Collider') and v:FindFirstChild("HealthProperties").Health.Value > 0 then
				v.MobProperties.Elite.Value = true
				if bossTable[v.Name] then
					target = v
					return target
				elseif golemTable[v.Name] then
					target = v
					return target
				elseif mobTable[v.Name] then
					target = v
					return target
				end
				distance = (v.Collider.Position - plr.Position).magnitude
				if distance < closet then
					closet = distance
					target = v
				end
			end
			if (game.PlaceId == 3383444582) and (v.Name == "BOSSTreeEnt" and v.Collider.Anchored) then 
				target, _, _ = specialMob()
				return target
			elseif (game.PlaceId == 6386112652) and (v.Name == 'CorruptedGreaterTree' and not game:GetService("Workspace"):FindFirstChild("GreaterTreeShield")) then
				return target
			end
		end
		return target
	end
	
	-- Return the mob that around you
	function getMobInArea()
		local mob = {}
		local pos = {}
		local player, cha, plr, col = getPlayer()
		for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
		   if v:FindFirstChild('Collider') and v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then 
				local distance = (v.Collider.Position - plr.Position).magnitude
				if distance <= 10000 then
					table.insert(mob, v)
					table.insert(pos, plr.Position)
				end
				if (game.PlaceId == 3383444582) and (v.Name == "BOSSTreeEnt" and v.Collider.Anchored) then 
					_, mob, pos = specialMob()
				end
		    end
		end
		if (game.PlaceId == 4465989351) and ms:FindFirstChild('IceBarricade') and ms.IceBarricade:FindFirstChild('HealthProperties') and ms.IceBarricade.HealthProperties:FindFirstChild("Health").Value > 0 then
			_, mob, pos = specialMob()
		elseif game.PlaceId == 4465989998 then
			for i,o in pairs(ms.SpikeCheckpoints:GetChildren()) do
				if o:FindFirstChild('HealthProperties') and o.HealthProperties.Health.Value > 0 then
					_, mob, pos = specialMob()
				end
			end
		elseif game.PlaceId == 4646473427 then
			for i,o in pairs(ms.TowerLegs:GetChildren()) do
				if o:FindFirstChild('HealthProperties') and o.HealthProperties.Health.Value > 0 then
					_, mob, pos = specialMob()
				end
			end
		elseif game.PlaceId == 4646475570 then
			for i,o in pairs(game.workspace:GetChildren()) do
				if o.Name == 'Gate' and o:FindFirstChild('HealthProperties').Health.Value > 0 then
				    _, mob, pos = specialMob()
				end
			end
		elseif game.PlaceId == 6386112652 then
			for i,v in pairs(game:GetService("Workspace").FearNukes:GetChildren()) do
				if v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then
				    _, mob, pos = specialMob()
				end
			end
		elseif game.PlaceId == 6510862058 then
			if game.workspace:FindFirstChild('TriggerBarrel') and game.workspace.TriggerBarrel:FindFirstChild('HealthProperties').Health.Value > 0 then
			    _, mob, pos = specialMob()
			end
		end
		return mob, pos
	end
	
	function killAura()
		local mobs, mobsPos = getMobInArea()
		if #mobs ~= 0 and #mobsPos ~= 0 then
			for _,class in pairs(Classes[ClassGUI.Value]) do
				mobs, mobsPos = getMobInArea()
				Combat.AttackTargets(nil , mobs, mobsPos, class)
				wait(0.1)
			end
		end
		wait(3.5)
	end
	
	function noClip()
		local player, cha, plr, col = getPlayer()
		if not col:FindFirstChild('BodyVelocity') then
			local BodyVelocity = Instance.new("BodyVelocity", col)
		end
		wait(0.1)
		plr.CanCollide = false
		col.CanCollide = false
		cha:WaitForChild("LowerTorso").CanCollide = false
		col:WaitForChild("BodyVelocity").MaxForce = Vector3.new(math.huge, math.huge, math.huge) 
	end
	
	function move2(mob)
	    mobPos = mob.Collider.Position
		posX = mobPos.X
		posY = mobPos.Y
		posZ = mobPos.Z
		cha:MoveTo(mobPos + Vector3.new(0,10,10))
	end
	
	function move(mob,x,y,z)
		local player, cha, plr, col = getPlayer()
		if mob.Name == 'IceWall' or mob.Name == 'Shield' then
			col.CFrame = mob.Ring.CFrame * CFrame.new(0,3,0)
			cha.LowerTorso.CFrame = mob.Ring.CFrame * CFrame.new(0,3,0)
		else
			col.CFrame = mob.PrimaryPart.CFrame * CFrame.new(x,y,z)
			cha.LowerTorso.CFrame = mob.PrimaryPart.CFrame * CFrame.new(x,y,z)
		end		
		--[[
		if mob:FindFirstChild("Collider") then
			col.CFrame = mob.Collider.CFrame * CFrame.new(x,y,z)
			cha.LowerTorso.CFrame = mob.Collider.CFrame * CFrame.new(x,y,z)
		elseif mob:FindFirstChild('Base') then
			col.CFrame = mob.Base.CFrame * CFrame.new(x,y,z)
			cha.LowerTorso.CFrame = mob.Base.CFrame * CFrame.new(x,y,z)
		elseif mob:FindFirstChild('Part') then
			col.CFrame = mob.Part.CFrame * CFrame.new(x,y,z)
			cha.LowerTorso.CFrame = mob.Part.CFrame * CFrame.new(x,y,z)
		end]]
	end

	function invisible()
		for i,v in pairs(cha:GetDescendants()) do
		    pcall(function()
				v.Transparency = 1 
			end) 
		end
	end

	function invisibleModel()
		game.workspace.Terrain:Clear()
		for i,v in pairs(game.Workspace:GetChildren()) do
			if v:IsA('Model') and not msWorkspace[v.Name] and not v.Name == 'Gate' then
		       v:Destroy()
		    end
			if v:IsA('Part') then
				v:Destroy()
			end
			pcall(function() 
				v.Transparency = 1 
			end)
		end
	end

	function invisibleMap()
		if game.workspace:FindFirstChild('Map') then
			for i,v in pairs(game:GetService("Workspace").Map:GetDescendants()) do
				pcall(function()
					v.Transparency = 1
				end)
			end
		end
		wait(.2)
	end
	local dodgeY = -20
	local dodgeZ = 0
	local CorrupDodgeY = -10
	game:GetService("Workspace").ChildAdded:Connect(function(attack)
		local mob = nearest()
		if mob ~= nil then
			pcall(function()
				if attack:FindFirstChild('Inner') and attack.Inner.Size.Y > 28 then
					warn("Dodge:", attack)
					distance = player:DistanceFromCharacter(attack.Base.Position)
					if distance < 10 then
						if dodgeY == -20 then
							dodgeY = 15
						else
							CorrupDodgeY = CorrupDodgeY + 10
							dodgeY = dodgeY + 10
						end
						wait(2.75)
						dodgeY = -20
						CorrupDodgeY = -10
					end
				end
			end)
		end
	end)
	
	local bossTower = {
		['MagmaGigaBlob'] = true,
		['FireCastleCommander'] = true,
		['ssad'] = true
	}
	
	function main2()
		while wait() do
			spawn(getMission)
			local target = nearest()
			if target ~= nil then
				boss = bossTable[target.Name] --string.find(target.Name:lower(), "boss")
				mob = mobTable[target.Name]
				if (game.PlaceId == 5703353651 or game.PlaceId == 6075085184) then
					if target.Name == 'MagmaGigaBlob' then
						move(target, 0, 20, 20)
					else
						move(target, 0, 15, 15)
					end
				elseif target.Name == 'BOSSHogRider' or target.Name == 'BlossomTree' then
					move(target, 0, dodgeY, 15)
				elseif target.Name == "CorruptedGreaterTree" then
					move(target, 0, CorrupDodgeY, 15)
				elseif target.Name == 'CastleKnight' or target.Name == 'BOSSWinterfallIceDragon' then
					move(target, 20, 20, 20)
				elseif target.Name == 'BOSSWoollyMammoose' or target.Name == 'BOSSTreeEnt' or target.Name == 'BOSSSandScorpion' then
					move(target, 0, -20, 15)
				elseif boss and not target.Collider.Anchored then
					move(target, 0, 15, 20)
				elseif boss and target.Collider.Anchored then
					move(target, 0, 15, 20)
				else
					move(target, 0, dodgeY, 15)
				end
			elseif target == nil and (game.PlaceId == 5703353651 or game.PlaceId == 6075085184) then
				spawn(invisibleMap)
				wait(0.25)
				--warn('teleport')
				--game:GetService("ReplicatedStorage").MissionScripts["21"].RequestSpawn:FireServer()
			end
			wait()
		end
	end

--[[
pet attack
local userdata_1 = game:GetService("Workspace").Mobs.BOSSSandScorpion;
local userdata_2 = Vector3.new(-826.420593, 660.992004, -1045.45093);
local number_1 = 0.53267406887478;
local Target = game:GetService("ReplicatedStorage").getgenv().PetSkills.UseSkill;
Target:FireServer(userdata_1, userdata_2, number_1);

]]	
-- dodge

	function main()
		local player, cha, plr, hum = getPlayer()
		noClip()
		spawn(main2)
		_G.run = true
		while _G.run and wait() do
			killAura()
		end
	end
	
	credit()
	customUI()
	--invisible()
	start()
	invisibleModel()
	main()
	--[[
	start()
	noClip()
	main()
	function onCharacterAdded(character)
        local player, cha, plr, col = getPlayer()
        main() 
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)]]
	
end