local cutScence = require(game.ReplicatedStorage.Client.Camera)
player.PlayerGui.CutsceneUI.Changed:Connect(function()
    if getgenv().skip then
        cutScence:SkipCutscene()
    end
end)