--Sky = Lighting.Sky
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