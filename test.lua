local sell = require(game:GetService("ReplicatedStorage").Shared.Drops)

local old = hookfunction(sell.SellItems, function(a,b,c,d,e)
  print(a,b,c)
  print(#a,#b,#c)
  --print(debug.getinfo(a[2]))
  -- if typeof(a) == 'table' then
  --   warn('a: ')
  --   table.foreach(a, warn)
  -- end
  -- if typeof(b) == 'table' then
  --   print('a: ')
  --   table.foreach(b, print)
  -- end
  --table.foreach(c, warn)
  return old(a,b,c,d,e)
end)

local Combat = require(game:GetService("ReplicatedStorage").Shared.Mobs)

local old = hookfunction(Combat.SpawnMob, function(...)
  print(...)
  --table.foreach(..., print)
  return old(...)
end)