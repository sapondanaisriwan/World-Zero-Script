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
		local Combat = require(game:GetService("ReplicatedStorage").Shared.Combat)
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
local Combat = require(game:GetService("ReplicatedStorage").Shared.Combat)
local CharProfileCheck 	= game:GetService("ReplicatedStorage"):FindFirstChild("Profiles"):FindFirstChild(cha.Name);
local ClassGUI  = CharProfileCheck and game:GetService("ReplicatedStorage").Profiles[cha.Name].Class;
local GetEvent = Combat and Combat:GetAttackEvent();

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
    ['Dragoon']         = {'Dragoon1', 'Dragoon2', 'Dragoon3', 'Dragoon4', 'Dragoon5', 'Dragoon6', 'Dragoon7', 'DragoonDash','DragoonCross1', 'DragoonCross2', 'DragoonCross3', 'DragoonCross4', 'DragoonCross5', 'DragoonCross6', 'DragoonCross7', 'DragoonCross8', 'DragoonCross9', 'DragoonCross10', 'MultiStrike1', 'MultiStrike2', 'MultiStrike3', 'MultiStrike4', 'MultiStrike5', 'MultiStrikeDragon1', 'MultiStrikeDragon2', 'MultiStrikeDragon3', 'DragoonFall'};
	['Archer']			= {'Archer','PiercingArrow1','PiercingArrow2','PiercingArrow3', 'PiercingArrow4', 'PiercingArrow5', 'PiercingArrow5', 'PiercingArrow6', 'PiercingArrow7', 'PiercingArrow8', 'PiercingArrow9', 'PiercingArrow10','SpiritBomb','MortarStrike1','MortarStrike2','MortarStrike3','MortarStrike4','MortarStrike5','MortarStrike6','MortarStrike7', 'HeavenlySword1', 'HeavenlySword2', 'HeavenlySword3', 'HeavenlySword4', 'HeavenlySword5', 'HeavenlySword6'};
}

-- Bypass
if (GetEvent) then
    for i,v in next, getconnections(GetEvent.OnClientEvent) do
        v:Disable()
    end
end

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
			warn("Lobby:", v)
           return true
        end
    end
    return false
end

function dungeonCheck()
    for i,v in pairs(dungeonId) do
        if game.PlaceId == i then
			warn("Dungeon:", v)
           return true
        end
    end
    return false
end 

function towerCheck()
	for i,v in pairs(towerId) do
		if game.PlaceId == i then
			warn("Tower:", v)
           return true
        end
	end
    return false
end

warn('Checking')
local inLobby = lobbyCheck()
local inDungeon = dungeonCheck()
local inTower = towerCheck()

if not inLobby and not inDungeon and not inTower then
    while true do end
    return player:Kick("S U S")
elseif inLobby then
	return player:Kick("Tower only")
elseif inDungeon then
    return player:Kick("Tower only")
elseif inTower then
    local player, cha, plr, col = getPlayer()
    local hiDumb = loadstring(game:HttpGet(('https://raw.githubusercontent.com/LuckyToT/Roblox/main/test/wc.lua')))()
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

	-- Collect coin
	game:GetService("Workspace").Coins.ChildAdded:Connect(function(v)
		if v.Name == 'CoinPart' then
		    repeat
                pcall(function()
                    v.CanCollide = false
                    v.CFrame = plr.CFrame
                end)
                wait(.1)
            until v == nil 
		end
	end)

	-- Do mission
	game:GetService("Workspace").ChildAdded:Connect(function(v)
        if v.Name == 'DamageNumber' then -- remove damage
			v:Destroy()
            wait()
		end

		if string.find(v.Name:lower(), 'chest') then -- collect the chest
		    repeat
                pcall(function()
                    v.PrimaryPart.CanCollide = false
                    v.PrimaryPart.CFrame = plr.CFrame
                end)
                wait()
            until v == nil
		end
	end)

    function getMission() -- auto mission
        for i,v in pairs(game:GetService("Workspace").MissionObjects:GetChildren()) do
            if v:FindFirstChild('TouchInterest') then
                if v.Name == 'MinibossExit' then
                    v.CanCollide = true
                    v.CFrame = plr.CFrame
                end
                v.CanCollide = false
            end
            if v.Name == 'MissionStart' then
                 v.PrimaryPart.CanCollide = false
                 v.PrimaryPart.CFrame = plr.CFrame
            end
        end
        wait(.25)
    end
    
    local bossTable = { -- boss table
        ['MamaMegalodile'] = true,
        ['PirateCrab'] = true,
        ['Siren'] = true,
        ['BOSSKrakenMain'] = true,
        ['Nautilus'] = true
    }

    function monster() -- get monster in distance
        local mob = {}
        local pos = {}
        for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
           if v:FindFirstChild('Collider') and v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then --v.HealthProperties.Health > 0 then
                local distance = (v.Collider.Position - plr.Position).magnitude
                if distance < 10000 then
                    table.insert(mob, v)
                    table.insert(pos,player.Character.Head.Position)
                end
                -- if bossTable[v.Name] then
                --     col.CFrame = v.PrimaryPart.CFrame * CFrame.new(0,100,200)
                --     cha.LowerTorso.CFrame = v.PrimaryPart.CFrame * CFrame.new(0,100,200)
                -- end
           end
        end
        return mob, pos
    end

    function killAura() -- kill aura
        mob, pos = monster()
        if #mob ~= 0 and #pos ~= 0 then
            for i,c in pairs(Classes[ClassGUI.Value]) do
                mob, pos = monster()
                if  #mob > 0 and #pos > 0 then
                    Combat.AttackTargets(nil , mob, pos, c)
                    wait(.2)
                end
            end
        end
        wait(3.5)
    end

	local Vitals = player:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Hotbar"):WaitForChild("Vitals")
	function customUI()
        pcall(function()
            Vitals:WaitForChild("XP"):WaitForChild("TextLabel").Visible = false 
            Vitals:WaitForChild("XP"):WaitForChild("Shadow").Visible = false
        end)
	end
	
	Vitals.XP.TextLabel.Changed:Connect(function()
        pcall(function()
            Vitals:WaitForChild("XP"):WaitForChild("TextLabel").Visible = false 
            Vitals:WaitForChild("XP"):WaitForChild("Shadow").Visible = false
        end)
	end)
	
	Vitals.Health.HealthText.Changed:Connect(function()
        pcall(function()
            Vitals.Health.HealthText.Text = 'Script by LuckyToT#0001'
            Vitals.Health.HealthText.Overlay.Text = 'Script by LuckyToT#0001'
        end)
	end)

	function credit()
        pcall(function()
            Vitals.Health.HealthText.Text = 'Script by LuckyToT#0001'
            Vitals.Health.HealthText.Overlay.Text = 'Script by LuckyToT#0001'
            player.PlayerGui:WaitForChild("MainGui"):WaitForChild("Menu"):WaitForChild("DesktopMenu"):WaitForChild("Button"):WaitForChild("ImageLabel").Image = "rbxassetid://4782301932"
        end)
    end

    function spawnMob()
        while getgenv().run do
            if workspace:FindFirstChild('Map') then
                for i,v in ipairs(game:GetService("Workspace").Map:GetDescendants()) do
                    pcall(function() v.Transparency = 1 end)
                    if v:FindFirstChild('Active') then
                        for i,d in ipairs(v:GetDescendants()) do
                            if (d:IsA('Part') and d.Name == 'Spawn') then
                                col.CFrame = d.CFrame * CFrame.new(math.random(1,10) , 3, math.random(1,10))
                                cha.LowerTorso.CFrame = d.CFrame * CFrame.new(math.random(1,10), 3, math.random(1,10))
                                wait(.5)
                                gethiddenproperty(v)
                            end
                        end
                    end
                end
            end
            wait()
        end
    end

    function clearMap()
        if workspace:FindFirstChild('Map') then
            for i,v in ipairs(game:GetService("Workspace").Map:GetDescendants()) do
                pcall(function() v.Transparency = 1 end)
            end
        end
    end

    function backToSpawn()
        if workspace:FindFirstChild('Map') then
             for i,v in ipairs(game:GetService("Workspace").Map:GetDescendants()) do
                if v:FindFirstChild('TouchInterest') then
                    v.CFrame = plr.CFrame
                end
            end
        end
    end

    function main2()
        while getgenv().run do
            spawn(backToSpawn)
            wait(.1)
            spawn(getMission)
            wait(.1)
            spawn(clearMap)
            wait(.1)
        end
    end

	function main()
		local player, cha, plr, hum = getPlayer()
        getgenv().run = true
        noClip()
        credit()
        spawn(main2)
        spawn(spawnMob)
		while getgenv().run and wait() do
			killAura()
		end
	end
    credit()
	main()
    function onCharacterAdded(character)
        local player, cha, plr, col = getPlayer()
        main() 
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded) 
end
