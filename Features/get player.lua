-- Check the player
function getPlayer()
    local player, cha, plr, col, torso = nil, nil, nil, nil

    while not game.Players.LocalPlayer do
        print('Waiting')
        wait()
    end

    while not game.Players.LocalPlayer.Character do
        print('Waiting2')
        wait()
    end

    while not game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') do
        print('Waiting3')
        wait()
    end

    while not game.Players.LocalPlayer.Character:FindFirstChild('Collider') do
        print('Waiting4')

        wait()
    end

    while not game.Players.LocalPlayer.Character:FindFirstChild('LowerTorso') do
        print('Waiting5')
        wait()
    end

    while not game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') do
        print('Waiting6')
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