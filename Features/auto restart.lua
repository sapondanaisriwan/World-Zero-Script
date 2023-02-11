
getgenv().Tower = 27
getgenv().RemoveDamage = false
getgenv().AutoChest = true
getgenv().CoinMagnet = true

getgenv().Settings = {
    AutoRestart = { -- rejoin the dungeon/tower when you finished it
        Enabled = true, -- true/false
        Delay = 5 
    },
    autosell = {

    }
}

getgenv().Common = true
getgenv().Uncommon = true
getgenv().Rare = true
getgenv().Epic = true
getgenv().Legendary = false

player.PlayerGui.MainGui.MissionRewards

player.PlayerGui.MainGui.TowerFinish.Title.Changed:Connect(function()
    --if getgenv().Settings.AutoRestart.Enabled then
        --wait(getgenv().AutoRestart)
        warn('leave')
        wait(5)
        game:GetService("ReplicatedStorage").Shared.Teleport.StartRaid:FireServer(27)

   -- end
end