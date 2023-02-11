--[[
[Dungeon]
    1-1 =
    2-1 =
    3-1 =
    4-1 =
[Tower]
    Prison Tower = 21
    Atlantis Tower = 23
    Mezuvian Tower = 27
]]

getgenv().Dance = true -- YES
getgenv().AutoUpgrade = true
getgenv().AutoChest = true
getgenv().CoinMagnet = true
getgenv().RemoveDamage = false
getgenv().SkipCutscene = true

getgenv().Settings = {
    Dungeon = {
        Enabled = true,
        AutoSelectHighest = true, -- only select the nomal mode (I'm too lazy)
        CustomDungeon = {
            DungeonId = 16
        },
    },
    Tower = {
        Enabled = false,
        AutoSelectHighest = false, 
        CustomTower = {
            TowerId = 23
        },
    },
    AutoRejoin = { -- rejoin the dungeon/tower after you complete dungeon/tower (Include AutoSelectHighest)
        Enabled = true, -- true/false
        DungeonDelay = 1, -- for dungeon
        TowerDelay = 15 -- for tower
    },
    AutoSell = {
        Enabled = false, -- true/false
        Common = true,
        Uncommon = true,
        Rare = true,
        Epic = true
    },
}

-- Check
if not firetouchinterest then
    return game.Players.LocalPlayer:Kick('Not support ;(')
end

if not require then
    return game.Players.LocalPlayer:Kick('Not support ;(')
end

if not getconnections then
    return game.Players.LocalPlayer:Kick('Not support ;(')
end

-- Load
while not game:IsLoaded() do
    wait()
end

-- Check the player
function getPlayer()
    local player, cha, plr, col, torso = nil, nil, nil, nil

    while not game.Players.LocalPlayer do
        wait()
    end

    while not game.Players.LocalPlayer.Character do
        wait()
    end

    while not game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') do
        wait()
    end

    while not game.Players.LocalPlayer.Character:FindFirstChild('Collider') do
        wait()
    end

    while not game.Players.LocalPlayer.Character:FindFirstChild('LowerTorso') do
        wait()
    end

    while not game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') do
        wait()
    end

    local player = game.Players.LocalPlayer
    local cha = player.Character
    local hum = cha.Humanoid
    local col = cha.Collider
    local torso = cha.LowerTorso
    local plr = cha.HumanoidRootPart
    return player, cha, plr, hum, col, torso

end
local player, cha, plr, hum, col, torso = getPlayer()

-- Load
repeat
	load = pcall(function()
		local Combat = require(game:GetService("ReplicatedStorage").Shared.Combat)
		local CharProfileCheck 	= game:GetService("ReplicatedStorage"):FindFirstChild("Profiles"):FindFirstChild(cha.Name);
		local ClassGUI  = CharProfileCheck and game:GetService("ReplicatedStorage").Profiles[cha.Name].Class;
		local GetEvent = Combat and Combat:GetAttackEvent();
		local Mission = game.Workspace:FindFirstChild("MissionObjects")
        local A = game:GetService("Workspace").Coins
        local B = game:GetService("Workspace").Mobs
	end)
	wait()
until load

-- Variables
local Mission = game.Workspace:FindFirstChild("MissionObjects")
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
	['Archer']			= {'Archer','PiercingArrow1','PiercingArrow2','PiercingArrow3', 'PiercingArrow4', 'PiercingArrow5', 'PiercingArrow5', 'PiercingArrow6', 'PiercingArrow7', 'PiercingArrow8', 'PiercingArrow9', 'PiercingArrow10','SpiritBomb','MortarStrike1','MortarStrike2','MortarStrike3','MortarStrike4','MortarStrike5','MortarStrike6','MortarStrike7', 'HeavenlySword1', 'HeavenlySword2', 'HeavenlySword3', 'HeavenlySword4', 'HeavenlySword5', 'HeavenlySword6', 'HeavenlySword7'};
}

-- Bypass
if (GetEvent) then
    for i,v in next, getconnections(GetEvent.OnClientEvent) do
        v:Disable()
    end
end

-- Auto Sell --
function getItemList()
    local itemList = {}
    for a,b in pairs(require(game:GetService("ReplicatedStorage").Shared.Items)) do
        for i,v in pairs(b) do
            if (i == 'Type') and (v == 'Weapon' or v == 'Armor') then
                table.insert(itemList, b)
            end
        end
    end
    return itemList
end

function getItemName()
    itemNameTable = {}
    for i,v in ipairs(game:GetService("ReplicatedStorage").Profiles["NT_Script"].Inventory.Items:GetChildren()) do
        if v:FindFirstChild('Level') or v:FindFirstChild('Upgrade') or v:FindFirstChild('UpgradeLimit') then
            if not string.find(v.Name:lower(), "pet") then
                table.insert(itemNameTable, v)
            end
        end
    end
    return itemNameTable
end

function ToSell()
    local rarity
    local itemToSell = {}
    local itemTypeTable = getItemList()
    local itemNameTable = getItemName()
    for a,b in pairs(itemNameTable) do
        for c,d in pairs(itemTypeTable) do
            if d.Name == tostring(b) then
                rarity = d.Rarity
                if getgenv().Settings.AutoSell.Common and rarity == 1 then
                    table.insert(itemToSell, b)
                end
                if getgenv().Settings.AutoSell.Uncommon and rarity == 2 then
                    table.insert(itemToSell, b)
                end
                if getgenv().Settings.AutoSell.Rare and rarity == 3 then
                    table.insert(itemToSell, b)
                end
                if getgenv().Settings.AutoSell.Epic and rarity == 4 then
                    table.insert(itemToSell, b)
                end
            end
        end
    end
    return itemToSell
end

function SellItem()
    itemToSell = ToSell()
    for i,v in pairs(itemToSell) do
        warn('Sell:', v)
    end
    if #itemToSell > 0 then
        game:GetService("ReplicatedStorage").Shared.Drops.SellItems:InvokeServer(itemToSell)
    end
end

-- Auto Select --
function GetLevelPlayer()
    return game:GetService("ReplicatedStorage").Profiles[cha.Name].Level.Value
end

function Start(worldId)
    if worldId ~= nil and typeof(worldId) == 'number' then
        game:GetService("ReplicatedStorage").Shared.Teleport.StartRaid:FireServer(worldId)
    end
end

function AutoSelectDungeon(level)
    local dungeonId = nil
    if level >= 90 then -- 7-1
        dungeonId = 26
    elseif level >= 75 then -- 6-1
        dungeonId = 25
    elseif level >= 60 then -- 5-1
        dungeonId = 24
    elseif level >= 55 then -- final dungoen world 4
        dungeonId = 18
    elseif level >= 50 then -- 4-2
        dungeonId = 19
    elseif level >= 45 then -- 4-1
        dungeonId = 20
    elseif level >= 40 then -- final dungoen world 3
        dungeonId = 16
    elseif level >= 35 then -- 3-2
        dungeonId = 15
    elseif level >= 30 then -- 3-1
        dungeonId = 14
    elseif level >= 26 then -- final dungoen world 2
        dungeonId = 7
    elseif level >= 22 then -- 2-3
        dungeonId = 13
    elseif level >= 18 then -- 2-2
        dungeonId = 12
    elseif level >= 15 then -- 2-1
        dungeonId = 11
    elseif level >= 12 then -- final dungoen world 1
        dungeonId = 6
    elseif level >= 10 then -- 1-4
        dungeonId = 4
    elseif level >= 7 then -- 1-3
        dungeonId = 2
    elseif level >= 4 then -- 1-2
        dungeonId = 3
    elseif level >= 1 then -- 1-1
        dungeonId = 1
    end
    Start(dungeonId)
end

function AutoSelectTower(level)
    local towerId = nil
    if level >= 90 then
        towerId = 27
    elseif level >= 70 then
        towerId = 23
    elseif level >= 60 then
        towerId = 21
    end
    Start(towerId)
end

-- Clear
function ClearMap()
    if Workspace:FindFirstChild("WaveDefenseRoom") then 
        Workspace:FindFirstChild("WaveDefenseRoom"):Destroy()
    end 
    if Workspace:FindFirstChild('BossBuilding') then
        Workspace:FindFirstChild('BossBuilding'):Destroy()
    end 
    if Workspace:FindFirstChild("BossBuilding") then
        Workspace:FindFirstChild("BossBuilding"):Destroy()
    end
    if Workspace:FindFirstChild("SpawnRoom") then
        Workspace:FindFirstChild("SpawnRoom"):Destroy()
    end
    if Mission:FindFirstChild('GatesAAA') then
        Mission:FindFirstChild('GatesAAA'):Destroy()
    end
    if Mission:FindFirstChild('CeilingGood') then
        Mission:FindFirstChild('CeilingGood'):Destroy()
    end
    --workspace.Terrain:Clear()
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
	[6075085184] = 'Atlantis Tower',
    [7071564842] = 'Mezuvian Tower'
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


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/LuckyToT/Roblox/main/UI/Wally%20UI%20III.lua')))()
local Game = library:CreateWindow("AutoFarm") -- Creates the window
local Credit = Game:CreateFolder("Credit")
local Update = Game:CreateFolder("Latest Updated")

-- Credit
Credit:Label("Scirpt: LuckyToT#0001",{
    TextSize = 16;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(38,38,38);
})

Credit:Button("Copy user",function()
    if not setclipboard then return player:Kick('Bye not support') end
    setclipboard("LuckyToT#0001")
end)

Update:Label("07/14/21",{
    TextSize = 20;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(38,38,38);
})


function noClip()
    local player, cha, plr, hum, col, torso = getPlayer()
    repeat
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.P = 9000
        bv.Parent = plr
        print('wait')
        wait()
    until plr:FindFirstChild('BodyVelocity')
    plr.CanCollide = false
    col.CanCollide = false
    torso.CanCollide = false
    ClearMap()
end

workspace.Coins.ChildAdded:Connect(function(v)
    if v.Name == 'CoinPart' and getgenv().CoinMagnet then
        repeat
            pcall(function()
                v.CanCollide = false
                v.CFrame = plr.CFrame
            end)
            wait(.2)
        until v == nil 
    end
end)

-- Auto Rejoin Tower
player.PlayerGui.MainGui.TowerFinish.Close.Changed:Connect(function()
    local getLevel = GetLevelPlayer()
    if getgenv().Settings.AutoRejoin.Enabled then
        warn('Leaving')
        wait(getgenv().Settings.AutoRejoin.TowerDelay)
        if getgenv().Settings.Tower.Enabled then
            if getgenv().Settings.Tower.AutoSelectHighest then -- AutoSelectHighest
                AutoSelectTower(getLevel)
            else
                Start(getgenv().Settings.Tower.CustomTower.TowerId) -- Custom tower
            end
        end

    end
end)

-- Auto Rejoin Dungeon
player.PlayerGui.MainGui.MissionRewards.Rewards.Changed:Connect(function()
    wait(8)
    game:GetService("ReplicatedStorage").Shared.Missions.GetMissionPrize:InvokeServer()
    game:GetService("ReplicatedStorage").Shared.Missions.LeaveChoice:FireServer(true)

    warn('Claim Reward')
    warn('Leaving')

    local getLevel = GetLevelPlayer()
    if getgenv().Settings.AutoRejoin.Enabled then
        wait(getgenv().Settings.AutoRejoin.DungeonDelay)
        if getgenv().Settings.Dungeon.Enabled then
            if getgenv().Settings.Dungeon.AutoSelectHighest then -- AutoSelectHighest
                AutoSelectDungeon(getLevel)
            else
                Start(getgenv().Settings.Dungeon.CustomDungeon.DungeonId) -- Custom dungeon
            end
        end
    else
        game:GetService("ReplicatedStorage").Shared.Missions.LeaveChoice:FireServer(true)
        game:GetService("ReplicatedStorage").Shared.Missions.NotifyReadyToLeave:FireServer()
    end
end)

-- Remove Damge
workspace.ChildAdded:Connect(function(v)
    if v.Name == 'DamageNumber' and getgenv().RemoveDamage then -- remove damage
        v:Destroy()
    end
end)

-- Skip Cutscens
local cutScence = require(game.ReplicatedStorage.Client.Camera)
player.PlayerGui.CutsceneUI.Changed:Connect(function()
    if getgenv().SkipCutscene then
        cutScence:SkipCutscene()
    end
end)

-- Anti AFK
player.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Credit -- 
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

-- Auto Chest -- 
function autoChest()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v:IsA('Model') and string.find(v.Name:lower(), 'chest') and getgenv().AutoChest then
            pcall(function()
                v.PrimaryPart.CFrame = plr.CFrame
            end)
        end
    end
    wait()
end

function move(enemies, x ,y , z)
    if x == nil and y == nil and z == nil then -- check if it nill or not
        col.CFrame = enemies.CFrame
        torso.CFrame = enemies.CFrame
    else
        col.CFrame = enemies.CFrame * CFrame.new(x , y, z)
        torso.CFrame = enemies.CFrame * CFrame.new(x ,y, z)
    end
end

function touchPart(part)
    firetouchinterest(plr, part, 0)
    wait(.25)
    firetouchinterest(plr, part, 1)
end

if not inLobby and not inDungeon and not inTower then
    return player:Kick("S U S")
elseif inLobby then

    -- Custom dungeon
    local getLevel = GetLevelPlayer()
    if getgenv().Settings.Dungeon.Enabled then
        if getgenv().Settings.Dungeon.AutoSelectHighest then -- AutoSelectHighest
            AutoSelectDungeon(getLevel)
        else
            Start(getgenv().Settings.Dungeon.CustomDungeon.DungeonId) -- Custom dungeon
        end
    elseif getgenv().Settings.Tower.Enabled then
        if getgenv().Settings.Tower.AutoSelectHighest then -- AutoSelectHighest
            AutoSelectTower(getLevel)
        else
            Start(getgenv().Settings.Tower.CustomTower.TowerId)  -- Custom tower
        end
    end

    -- Auto Sell
    if getgenv().Settings.AutoSell.Enabled then
        SellItem()
    end

elseif inDungeon then
    local player, cha, plr, hum, col, torso = getPlayer()

    if getgenv().Settings.AutoSell.Enabled then
        SellItem()
    end

    wait(5)
    -- Mission 1-1
    if Mission:FindFirstChild('Cabbages') then
        Mission.Cabbages.DescendantAdded:Connect(function(v)
            if v.ClassName == 'TouchTransmitter' then
                repeat
                    touchPart(v.Parent)
                    wait()
                until v == nil
            end
        end)
    end

	local msWorkspace = { -- do mission in workspace
		["Cage1Marker"] = true,
		["Cage2Marker"] = true,
		["TreasureMarker"] = true
	}

    -- Do mission
    workspace.ChildAdded:Connect(function(v)
        if msWorkspace[v.Name] then
            repeat 
                wait()
            until v:FindFirstChild('Collider')
            touchPart(v.PrimaryPart)
        end
    end)

	local msIgnore = { 
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
		['BossE0'] = true
	}

    function ClearMission()
        for i,v in ipairs(Mission:GetChildren()) do
            if v.Name == 'MissionStart' then
                for _,b in ipairs(v:GetChildren()) do
                    warn(b)
                    if b:FindFirstChild('TouchInterest') then
                        print(b)
                        touchPart(b)
                    end
                end
            end
            if v:FindFirstChild('TouchInterest') then
                if not msIgnore[v.Name] then
                    touchPart(v)
                end
            end
        end
    end

	-- return the nearest mob
	function getNearest()
        local player, cha, plr, hum, col, torso = getPlayer()
		local target, distance
		local closet = math.huge
		for _, v in ipairs(workspace.Mobs:GetChildren()) do
			if v:FindFirstChild('Collider') and v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then
                local distance = player:DistanceFromCharacter(v.Collider.Position)
				if distance < closet then
					closet = distance
					target = v
				end
			end
		end
        if workspace:FindFirstChild('IceWall') then
            target = workspace.IceWall
        end
		return target
	end

    function killObject()
        local objectName, myPosition = {}, {}
        if game.PlaceId == 3383444582 then -- final world 1
            for i,v in ipairs(workspace:GetChildren()) do
                if v:FindFirstChild('HealthProperties') and v:FindFirstChild('AllDamage') and v.HealthProperties.Health.Value > 0 then
                    table.insert(objectName, v)
                    table.insert(myPosition, plr.Position)
                end
            end
        end
        if game.PlaceId == 4465989351 then -- 3-2
			if Mission:FindFirstChild('IceBarricade') and Mission.IceBarricade:FindFirstChild('HealthProperties') and Mission.IceBarricade.HealthProperties.Health.Value > 0 then
                table.insert(objectName, Mission.IceBarricade)
                table.insert(myPosition, plr.Position)
            end
        end
        if game.PlaceId == 4465989998 then -- 3-3
            for i,v in ipairs(Mission.SpikeCheckpoints:GetChildren()) do
				if v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then
					table.insert(objectName, v)
					table.insert(myPosition, plr.Position)
				end
			end
        end
        return objectName, myPosition
    end

    function getMonster()
        local monsterName, myPosition = {}, {}
        for i,v in ipairs(workspace.Mobs:GetChildren()) do
            if v:FindFirstChild('Collider') and v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then
                table.insert(monsterName, v)
                table.insert(myPosition, plr.Position)
            end
        end
        return monsterName, myPosition
    end

    function mergeTable(monsterTable, objectTable, myPosition1, myPosition2)
        if #objectTable > 0  and #myPosition2 > 0 then
            for i, monster in pairs(objectTable) do
                monsterTable[i] = monster
            end
            for i, position in pairs(myPosition2) do
                myPosition1[i] = position
            end
        end
        return monsterTable, myPosition1
    end

    function getMobTable()
        local monsterTable, myPosition1 = getMonster()
        local objectTable, myPosition2  = killObject()
        local mob, pos = mergeTable(monsterTable, objectTable, myPosition1, myPosition2)
        return mob, pos
    end

    function killAura() -- kill aura
        for _, class in pairs(Classes[ClassGUI.Value]) do
            monsterTable,  myPosition1 = getMobTable()
            if  #monsterTable > 0 and #myPosition1 > 0 then
                game:GetService("ReplicatedStorage").Shared.Combat.Skillsets.DualWielder.AttackBuff:FireServer()
                Combat.AttackTargets(nil , monsterTable, myPosition1, class)
                wait(.2)
            end
        end
        wait(1)
    end

    function main2()
        while wait(.1) do
            spawn(ClearMission)
            local target = getNearest()
            if target ~= nil then
                move(target.PrimaryPart, 0, 50, 0)
            end
        end
    end

    function main()
        local player, cha, plr, hum, col, torso = getPlayer()
        noClip()
        credit()
        spawn(main2)
		while wait() do
			killAura()
		end
	end

    credit()
	main()
    function onCharacterAdded(character)
        local player, cha, plr, hum, col, torso = getPlayer()
        main() 
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded) 

elseif inTower then
    local player, cha, plr, hum, col, torso = getPlayer()

    if getgenv().Settings.AutoSell.Enabled then
        SellItem()
    end

    function getMission() -- auto mission
        for i,v in pairs(Mission:GetChildren()) do
            if v:FindFirstChild('TouchInterest') then
                if v.Name == 'MinibossExit' then
                    touchPart(v)
                end
                if v.Name == 'WaveStarter' then
                    touchPart(v)
                end
            end
            if v:FindFirstChild('Collider') then
                if v.Name == 'MissionStart' then
                    touchPart(v.Collider)
                end
            end
        end
    end

    local bossTable = { -- boss table
        -- Tower 1
        ['MagmaGigaBlob'] = true,
        ['FireCastleCommander'] = true,
        ['BOSSFireTreeEnt'] = true,
        ['BOSSFireAnubis'] = true,
        --['BOSSIgnisFireDragon'] = true,
        -- Tower 2
        ['MamaMegalodile'] = true,
        ['PirateCrab'] = true,
        ['Siren'] = true,
        ['BOSSKrakenMain'] = true,
        ['Nautilus'] = true,
        -- Tower 3
       ['BOSSZeus'] = true
    }

    function monster() -- get monster in distance
        local mob = {}
        local pos = {}
        for i,v in pairs(workspace.Mobs:GetChildren()) do
           if v:FindFirstChild('Collider') and v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then --v.HealthProperties.Health > 0 then
                table.insert(mob, v)
                table.insert(pos, plr.Position)
                if bossTable[v.Name] then
                    move(v.PrimaryPart, 0, 9999, 0)
                end
           end
        end
        return mob, pos
    end

	function checkClass()
		local delay = 0.1
		if ClassGUI.Value == 'Berserker' then
			delay = 0.2
			return delay
		end
		return delay
	end

	local delayKillAura = checkClass()
    
    function killAura() -- kill aura
        for i,c in pairs(Classes[ClassGUI.Value]) do
            mob, pos = monster()
            if  #mob > 0 and #pos > 0 then
                game:GetService("ReplicatedStorage").Shared.Combat.Skillsets.DualWielder.AttackBuff:FireServer()
                Combat.AttackTargets(nil , mob, pos, c)
                wait(.2)
            end
        end
        wait(1)
    end

    function existDoor()
        if workspace:FindFirstChild('Map') then
            for _,a in ipairs(workspace.Map:GetChildren()) do
                if a:FindFirstChild('BoundingBox') then
                    touchPart(a.BoundingBox)
                end
                if a:FindFirstChild('Model') or a:FindFirstChild('Tiles') or a:FindFirstChild('Gate') then
                    pcall(function()
                        a.Model:Destroy()
                        a.Tiles:Destroy()
                        a.Gate:Destroy()
                    end)
                end
            end
        end
        wait()
    end

    -- add go to the door
    function spawnMob()
        while true do
            waveText = player.PlayerGui.MainGui.TowerVisual.KeyImage.TextLabel.Text
            if waveText:find('WAVE') then
                move(Mission.WaveStarter)
            end
            wait()
            if workspace:FindFirstChild('Map') then
                for _,a in ipairs(workspace.Map:GetChildren()) do
                    if a:FindFirstChild('MobSpawns') then
                        for _,b in ipairs(a.MobSpawns:GetChildren()) do
                            if b:FindFirstChild('Spawns') then
                                for _,v in ipairs(b.Spawns:GetChildren()) do
                                    if (v:IsA('Part') and v.Name == 'Spawn') then
                                        move(v, 0, 20, 0)
                                        wait(1)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            wait()
        end
    end

    function main2()
        while true do
            spawn(getMission)
            wait(.1)
            spawn(existDoor)
            wait(.1)
            spawn(autoChest)
        end
    end

	function main()
        local player, cha, plr, hum, col, torso = getPlayer()
        noClip()
        credit()
        spawn(main2)
        spawn(spawnMob)
		while wait() do
			killAura()
		end
	end

    credit()
	main()
    function onCharacterAdded(character)
        local player, cha, plr, hum, col, torso = getPlayer()
        main() 
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded) 
end
