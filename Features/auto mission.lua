while not workspace:FindFirstChild('MissionObjects') then
    wait()
end

workspace.MissionObjects.DescendantAdded:Connect(function(v)
    firetouchinterest(plr, v.Parent, 0)
    wait(0.25)
    firetouchinterest(plr, v.Parent, 1)
	print(v)
end)