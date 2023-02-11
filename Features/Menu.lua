getgenv().AutoUpgrade = true
getgenv().RemoveDamage = false
getgenv().AutoChest = true
getgenv().CoinMagnet = true

getgenv().Settings = {
    Dungeon = {
        Enabled = false,
        AutoSelectHighest = false,
        CustomDungeon = {
            DungeonId = 27
        },
    },
    Tower = {
        Enabled = false,
        AutoSelectHighest = false, 
        CustomTower = {
            TowerId = 27
        },
    },
    AutoRejoin = { -- rejoin the dungeon/tower after you complete dungeon/tower
        Enabled = true, -- true/false
        Delay = 5 
    },
    AutoSell = {
        Enabled = false, -- true/false
        Common = false,
        Uncommon = false,
        Rare = false,
        Epic = false
    },
}