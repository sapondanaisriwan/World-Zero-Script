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
}

-- Bypass
if (GetEvent) then
    for i,v in next, getconnections(GetEvent.OnClientEvent) do
        v:Disable();
    end;
end;

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
	[5] = 'Deserted Burrowmine (4-2)',
	[6] = 'Pyramid Dungeon (4-3)',
	
	[7] = 'Konoh Heartlands (5-1)',
	[8] = 'Rough Waters (6-1)'
}

local lobbyId = {
	[2727067538] = 'Main menu',
	[4310463616] = 'World 1',
	[4310463940] = 'World 2',
	[1] = 'World 3'
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
    for i,v in pairs(dungeonId) do
        if game.PlaceId == i then
			warn('Checking Dungeon')
			warn("Dungeon:", v)
           return true
        end
    end
    return false
end 

local inLobby = lobbyCheck()
local inDungeon = dungeonCheck()
if inLobby then
	print('here')
elseif inDungeon then
	
	if ms:FindFirstChild('invisibleparts') then
		ms.invisibleparts:Destroy()
	end
	
	if ms:FindFirstChild('Darts') then
		ms.Darts:Destroy()
	end
	
	if workspace:FindFirstChild("MobBlockers") then
		workspace:FindFirstChild("MobBlockers"):Destroy()
	end
	
	-- Start game
	function start()
		local startMission = ms:FindFirstChild("MissionStart")
		if startMission then
			print('Start')
			repeat
				pcall(function()
					startMission.PrimaryPart.CanCollide = false
					startMission.PrimaryPart.CFrame = plr.CFrame
				end)
				wait(.1)
			until not ms:FindFirstChild("MissionStart")
			wait(_G.WaitTime)
			print("Start Farming")
		end
	end
	
	local Vitals = player:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Hotbar"):WaitForChild("Vitals")
	--player:WaitForChild("PlayerGui"):WaitForChild("BoardGui"):Destroy()
	function customUI()
	   Vitals.XP.TextLabel.Visible = false 
	   Vitals.XP.Shadow.Visible = false
	end

	Vitals.Health.HealthText.Changed:Connect(function()
		Vitals.Health.HealthText.Text = 'Script by LuckyToT#0001'
		Vitals.Health.HealthText.Overlay.Text = 'Script by LuckyToT#0001'
	end)

	function credit()
		Vitals.Health.HealthText.Text = 'Script by LuckyToT#0001'
		Vitals.Health.HealthText.Overlay.Text = 'Script by LuckyToT#0001'
		game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGui"):WaitForChild("Menu"):WaitForChild("DesktopMenu"):WaitForChild("Button"):WaitForChild("ImageLabel").Image = "rbxassetid://4782301932"
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
		['CastleBackGate0'] = true
	}
	
	local msSpecial = { -- special mission that can't CanCollide
		["WallsTrigger"] =  true,
		["WallsFinalTrigger"] = true,
		["CaveTrigger"] = true
	}

	local destroyFolder = {
		-- world 2-
		["Spikes"] = true,
		["Gates"] = true,
		["SwingingHammers"] = true,
		-- world 2-3
		["Geysers"] = true,
		['LavaTriggers'] = true,
		['ToxicDispensers'] = true
	}
	-- Do mission
	game:GetService("Workspace").ChildAdded:Connect(function(v)
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

	-- Do mission
	function getMission()
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
		
		end
		return special, mob, pos
	end
	
	local mobTable = { -- normol mob
		-- world 2
		['FireFlower'] = true,
		['GoblinSlingshot'] = true,
		-- world 3
		['IceFlower'] = true
	}
	local bossTable = { -- boss table
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
		['BOSSWinterfallIceDragon'] = true
	}
	local golemTable = {
		-- world 2-4
		['LavaGolem'] = true,
		['FrostGolem'] = true
		-- world 2-3
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
			for _,o in pairs(ms.SpikeCheckpoints:GetChildren()) do
				if o:FindFirstChild('HealthProperties') and o.HealthProperties.Health.Value > 0 then
					target, _, __ = specialMob()
					return target
				end
			end
		end
		for _, v in pairs(game.workspace.Mobs:GetChildren()) do
			if game.PlaceId == 3383444582 then
				if v:FindFirstChild('Collider') and v.Collider.Anchored then
					target, _, __ = specialMob()
					return target
				end
			end
		
			if v:FindFirstChild('Collider') and v:FindFirstChild("HealthProperties").Health.Value > 0 then
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
				if distance <= 50 then
					table.insert(mob, v)
					table.insert(pos, v.Collider.Position)
				end
				if game.PlaceId == 3383444582 then 
					if v:FindFirstChild('Collider') and v.Collider.Anchored then
						_, mob, pos = specialMob()
					end
				end
		    end
		end
		if game.PlaceId == 4465989351 then
			if ms:FindFirstChild('IceBarricade') and ms.IceBarricade:FindFirstChild('HealthProperties') and ms.IceBarricade.HealthProperties:FindFirstChild("Health").Value > 0 then
				_, mob, pos = specialMob()
			end
		elseif game.PlaceId == 4465989998 then
			for _,o in pairs(ms.SpikeCheckpoints:GetChildren()) do
				if o:FindFirstChild('HealthProperties') and o.HealthProperties.Health.Value > 0 then
					_, mob, pos = specialMob()
				end
			end
		end
		return mob, pos
	end
	
	function killAura()
		--pcall(function()
		local mobs, mobsPos = getMobInArea()
		if #mobs ~= 0 and #mobsPos ~= 0 then
			for _,class in pairs(Classes[ClassGUI.Value]) do
				mobs, mobsPos = getMobInArea()
				Combat.AttackTargets(nil , mobs, mobsPos, class)
				wait(0.25)
			end
		end
		wait(0.2)
		--end)
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
	
	function move(mob)
	    mobPos = mob.Collider.Position
		posX = mobPos.X
		posY = mobPos.Y
		posZ = mobPos.Z
		cha:MoveTo(mobPos + Vector3.new(0,10,10))
	end
	
	function move2(mob,x,y,z)
		local player, cha, plr, col = getPlayer()
		if mob.Name == 'IceWall' then
			col.CFrame = mob.Ring.CFrame * CFrame.new(x,y,z)
			cha.LowerTorso.CFrame = mob.Ring.CFrame * CFrame.new(x,y,z)
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
		for i,v in pairs(game.Workspace:GetChildren()) do
			if v:IsA('Model') and not msWorkspace[v.Name] then
		       v:Destroy() 
		    end
			pcall(function() 
				v.Transparency = 1 
			end)
		end
	end

	function main2()
		while wait(.1) do
			spawn(getMission)
			local target = nearest()
			if target ~= nil then
				boss = bossTable[target.Name] --string.find(target.Name:lower(), "boss")
				mob = mobTable[target.Name]
				if target.Name == 'CastleKnight' or target.Name == 'BOSSWinterfallIceDragon' then
					move2(target, 0, 20, 20)
				elseif target.Name == 'IceWall' then
					move2(target, 0, 3, 0)
				elseif target.Name == 'BOSSWoollyMammoose' then
					move2(target, 0, -15, 10)
				elseif boss and not target.Collider.Anchored then
					move2(target, 0, 15, 10)
				elseif boss and target.Collider.Anchored then
					move2(target, 0, 15, 10)
				else
					move2(target, 0, -15, 10)
				end
			end
			wait()
		end
	end

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
	invisibleModel()
	--invisible()
	start()
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