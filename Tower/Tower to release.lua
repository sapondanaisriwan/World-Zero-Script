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
	end)
	wait()
until load

function ClearMap()

    for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
        if v:IsA('Sky') then
            v.MoonTextureId = 'rbxassetid://3176877317'
            v.SkyboxBk = 'rbxassetid://3176877317'
            v.SkyboxDn = 'rbxassetid://3176877696'
            v.SkyboxFt = 'rbxassetid://3176878020'
            v.SkyboxLf = 'rbxassetid://3176878336'
            v.SkyboxRt = 'rbxassetid://3176878576'
            v.SkyboxUp = 'rbxassetid://3176878816'
            v.SunTextureId = 'rbxassetid://1084351190'
        end
    end

    local Mission = game.Workspace:FindFirstChild("MissionObjects")
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
    workspace.Terrain:Clear()
end

-- Variables
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

-- get all
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
    for i,v in ipairs(game:GetService("ReplicatedStorage").Profiles[cha.Name].Inventory.Items:GetChildren()) do
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
                if getgenv().Common and rarity == 1 then
                    table.insert(itemToSell, b)
                end
                if getgenv().Uncommon and rarity == 2 then
                    table.insert(itemToSell, b)
                end
                if getgenv().Rare and rarity == 3 then
                    table.insert(itemToSell, b)
                end
                if getgenv().Epic and rarity == 4 then
                    table.insert(itemToSell, b)
                end
                if getgenv().Legendary and rarity == 5 then
                    table.insert(itemToSell, b)
                end
            end
        end
    end
    return itemToSell
end

function SellItem()
    itemToSell = ToSell()
    if #itemToSell > 0 then
        table.foreach(itemToSell, print)
        game:GetService("ReplicatedStorage").Shared.Drops.SellItems:InvokeServer(itemToSell)
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
local Game = library:CreateWindow("AutoFarm Tower") -- Creates the window
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

Update:Label("07/10/21",{
    TextSize = 20;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(38,38,38);
})


if not inLobby and not inDungeon and not inTower then
    return player:Kick("S U S")
elseif inLobby then
    SellItem()
    game:GetService("ReplicatedStorage").Shared.Teleport.StartRaid:FireServer(getgenv().Tower)
elseif inDungeon then
    return player:Kick("Tower only")
elseif inTower then
    local player, cha, plr, hum, col, torso = getPlayer()
    SellItem()
    repeat 
        load = pcall(function()
            A = game:GetService("Workspace").Coins
            B = game:GetService("Workspace").MissionObjects
            C = game:GetService("Workspace").Mobs
        end)
        wait() 
    until load

    wait(3)

	function noClip()
        local player, cha, plr, hum, col, torso = getPlayer()
		if not col:FindFirstChild('BodyVelocity') then
			local BodyVelocity = Instance.new("BodyVelocity", col)
		end
		wait(0.1)
		plr.CanCollide = false
		col.CanCollide = false
		torso.CanCollide = false
		col:WaitForChild("BodyVelocity").MaxForce = Vector3.new(math.huge, math.huge, math.huge) 
	end

	-- Collect coin
	game:GetService("Workspace").Coins.ChildAdded:Connect(function(v)
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

	-- Do mission
	game:GetService("Workspace").ChildAdded:Connect(function(v)
        if v.Name == 'DamageNumber' and getgenv().RemoveDamage then -- remove damage
			v:Destroy()
		end
	end)

    function getMission() -- auto mission
        for i,v in pairs(game:GetService("Workspace").MissionObjects:GetChildren()) do
            if v:FindFirstChild('TouchInterest') then
                if v.Name == 'MinibossExit' then
                    firetouchinterest(plr, v, 0)
                    wait(.25)
                    firetouchinterest(plr, v, 1)
                end
                if v.Name == 'WaveStarter' then
                    firetouchinterest(plr, v, 0)
                    wait(.25)
                    firetouchinterest(plr, v, 1)
                end
            end
            if v:FindFirstChild('Collider') then
                if v.Name == 'MissionStart' then
                    repeat
                        firetouchinterest(plr, v.Collider, 0)
                        wait(.25)
                        firetouchinterest(plr, v.Collider, 1)
                    until v == nil or not v:FindFirstChild('Collider') or not v:FindFirstChild('MissionStart')
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
        for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
           if v:FindFirstChild('Collider') and v:FindFirstChild('HealthProperties') and v.HealthProperties.Health.Value > 0 then --v.HealthProperties.Health > 0 then
                local distance = (v.Collider.Position - plr.Position).magnitude
                if distance < 10000 then
                    table.insert(mob, v)
                    table.insert(pos, plr.Position)
                end
                if bossTable[v.Name] then
                    col.CFrame = v.PrimaryPart.CFrame * CFrame.new(0,1000,0)
                    torso.CFrame = v.PrimaryPart.CFrame * CFrame.new(0,1000,0)
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
                Combat.AttackTargets(nil , mob, pos, c)
                wait(0.2)
            end
        end
        wait(1)
    end

    -- credit
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

    function existDoor()
        if workspace:FindFirstChild('Map') then
            for _,a in ipairs(game:GetService("Workspace").Map:GetChildren()) do
                if a:FindFirstChild('BoundingBox') then
                    firetouchinterest(plr, a.BoundingBox, 0)
                    wait(.25)
                    firetouchinterest(plr, a.BoundingBox, 1)
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
            if workspace:FindFirstChild('Map') then
                for _,a in ipairs(game:GetService("Workspace").Map:GetChildren()) do
                    if a:FindFirstChild('MobSpawns') then
                        for _,b in ipairs(a.MobSpawns:GetChildren()) do
                            if b:FindFirstChild('Spawns') then
                                for _,v in ipairs(b.Spawns:GetChildren()) do
                                    if (v:IsA('Part') and v.Name == 'Spawn') then
                                        col.CFrame = v.CFrame * CFrame.new(math.random(1,10) , 20, math.random(1,10))
                                        torso.CFrame = v.CFrame * CFrame.new(math.random(1,10), 20, math.random(1,10))
                                        wait(0.7)
                                    end
                                end
                            end
                        end
                    end
                end
            elseif waveText:find('WAVE') then
                col.CFrame = game:GetService("Workspace").MissionObjects.WaveStarter.CFrame
                torso.CFrame = game:GetService("Workspace").MissionObjects.WaveStarter.CFrame
            end
            wait(.2)
        end
    end

    function main2()
        while true do
            spawn(getMission)
            wait(0.2)
            spawn(existDoor)
            wait(0.2)
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
    ClearMap()
	main()
    function onCharacterAdded(character)
        local player, cha, plr, hum, col, torso = getPlayer()
        main() 
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded) 
end
