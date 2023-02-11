getgenv().Common = true
getgenv().Uncommon = true
getgenv().Rare = true
getgenv().Epic = true
getgenv().Legendary = false


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
        game:GetService("ReplicatedStorage").Shared.Drops.SellItems:InvokeServer(itemToSell)
    end
end
SellItem()