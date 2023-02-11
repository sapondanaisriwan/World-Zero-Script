_G.CoinMagnet = true


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

local places = {2978696440, 4310463616 ,4310463940, 4310476380, 4310464656, 4310478830, 3383444582}
function placeIdCheck()
    for i,v in pairs(places) do
        if game.PlaceId == v then
           return true
        end
    end
    return false
end

-- Chceck 
if placeIdCheck() then
	
	if ms:FindFirstChild('invisibleparts') then
		ms.invisibleparts:Destroy()
	end
	
	-- Start game
	function start()
		if not ms then
			for _, i in pairs(game:GetService("Workspace").MissionObjects.MissionStart:GetChildren()) do
				if i:FindFirstChild('TouchInterest') then
					i.CanCollide = false
					i.CFrame = plr.CFrame
				end
			end
		end
	end
	
	local Vitals = player:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Hotbar"):WaitForChild("Vitals")
	player:WaitForChild("PlayerGui"):WaitForChild("BoardGui"):Destroy()
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
                wait(.1)
            until v == nil 
		end
	end)
	
	local msLog = {
		["Cage1Marker"] = true,
		["Cage2Marker"] = true
	}

	local msIngore = {
		['WaterKillPart'] = true,
		['HammerReset1'] = true,
		['WallsTrigger'] = true,
		['WallsFinalTrigger'] = true
		
	}
	
	-- Do mission
	game:GetService("Workspace").ChildAdded:Connect(function(v)
		if msLog[v.Name] then
		    repeat
                pcall(function()
                    v.PrimaryPart.CanCollide = false
                    v.PrimaryPart.CFrame = plr.CFrame
                end)
                wait(.1)
            until v == nil 
		end
	end)
	
	-- Do mission
	function getMission()
		for i, v in pairs(ms:GetDescendants()) do
			if v:FindFirstChild('TouchInterest') then
			    if msIngore[v.Name] then
			       v:Destroy()
			    end
			    v.CanCollide = false
				v.CFrame = plr.CFrame
			end
		end
	end
	
	function specialMob()
		local mob = {}
		local pos = {}
		local special = 
		warn('special')
		pcall(function()
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
		end)
		return special, mob, pos
	end

	-- return the nearest mob
	function nearest()
		local player, cha, plr, col = getPlayer()
		local target, distance
		local closet = math.huge
		for _, v in pairs(game.workspace.Mobs:GetChildren()) do
			if v:FindFirstChild('Collider') and v:FindFirstChild("HealthProperties").Health.Value > 0 then
				distance = (v.Collider.Position - plr.Position).magnitude
				if distance < closet then
					closet = distance
					target = v
				end
			end
			if v:FindFirstChild('Collider') and v:FindFirstChild("HealthProperties").Health.Value == 0 then
				v:Destroy()
			end
			if (game.PlaceId == 3383444582) and v:FindFirstChild('Collider') and v.Collider.Anchored then
				print('nearest')
				target, mob, pos = specialMob()
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
				if (game.PlaceId == 3383444582) and v:FindFirstChild('Collider') and v.Collider.Anchored then
					print('getMobInArea')
					_, mob, pos = specialMob()
				end
		   end
		end
		return mob, pos
	end
	
	function killAura()
		local mobs, mobsPos = getMobInArea()
		if #mobs ~= 0 and #mobsPos ~= 0 then
			for i,c in pairs(Classes[ClassGUI.Value]) do
				mobs, mobsPos = getMobInArea()
				Combat.AttackTargets(nil , mobs, mobsPos, c)
				wait(0.4)
			end
		end
		wait(.2)
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
		if mob:FindFirstChild("Collider") then
			col.CFrame = mob.Collider.CFrame * CFrame.new(x,y,z)
			cha.LowerTorso.CFrame = mob.Collider.CFrame * CFrame.new(x,y,z)
		elseif mob:FindFirstChild('Base') then
			col.CFrame = mob.Base.CFrame * CFrame.new(x,y,z)
			cha.LowerTorso.CFrame = mob.Base.CFrame * CFrame.new(x,y,z)
		end
	end

	function invisible()
		for i,v in pairs(cha:GetDescendants()) do
		    pcall(function()
				v.Transparency = 1 
			end) 
		end
	end

	function main2()
		while wait() do
			getMission()
			local target = nearest()
			if target ~= nil then
				boss = string.find(target.Name:lower(), "boss")
				if boss and not target.Collider.Anchored then
					move2(target, 0, 10, 10)
				elseif boss and target.Collider.Anchored then
					move2(target, 0, 10, 10)
				else
					move2(target, 0, -10, 10)
				end
			end
		end
	end

	function main()
		local player, cha, plr, hum = getPlayer()
		noClip()
		spawn(main2)
		while wait() do
			killAura()
		end
	end
	
	credit()
	invisible()
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