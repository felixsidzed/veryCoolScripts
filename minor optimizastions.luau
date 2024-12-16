local function r(o)
	if o:IsA("Trail") or o:IsA("Decal") then
		o.Texture = "rbxassetid://0"
	end
	if workspace:FindFirstChild("Thrown") and workspace.Thrown:IsAncestorOf(o) then
		if o.Name:lower():match("debris") or o.Name == "Part" then
			game:GetService("Debris"):AddItem(o, task.wait())
		end
	end
end
for _, o in workspace:GetDescendants() do
	r(o)
end
workspace.DescendantAdded:Connect(r)
