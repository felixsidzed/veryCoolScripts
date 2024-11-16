local player = game.Players.LocalPlayer

local tool = Instance.new("Tool")
tool.Name = "Lunchly"
tool.RequiresHandle = true

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 1)
handle.Anchored = false
handle.CanCollide = false
handle.Parent = tool

local mesh = Instance.new("SpecialMesh", handle)
mesh.MeshId = "rbxassetid://101409816736345"
mesh.TextureId = "rbxassetid://93963003953340"
mesh.Scale = Vector3.new(0.255, 0.325, 0.382)

tool.Parent = player.Backpack

local tool = Instance.new("Tool")
tool.Name = "Prime"
tool.RequiresHandle = true

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 1)
handle.Anchored = false
handle.CanCollide = false
handle.Parent = tool

local mesh = Instance.new("SpecialMesh", handle)
mesh.MeshId = "rbxassetid://11539378085"
mesh.TextureId = "rbxassetid://11539378165"
mesh.Scale = Vector3.new(0.04, 0.04, 0.04)

tool.Parent = player.Backpack

local shirt = player.Character:FindFirstChild("JonklerTShirt") or Instance.new("ShirtGraphic")
shirt.Name = "JonklerTShirt"
shirt.Graphic = "rbxassetid://98934812661165"
shirt.Parent = player.Character

local function makeSkibidi(who)
	local skibidi = who.Character:FindFirstChild("Skibidi") or Instance.new("Part")
	skibidi.Name = "Skibidi"
	skibidi.Size = Vector3.new(1, 1, 1)
	skibidi.Anchored = false
	skibidi.CanCollide = false
	skibidi.Massless = true

	local specialMesh = skibidi:FindFirstChildOfClass("SpecialMesh") or Instance.new("SpecialMesh")
	specialMesh.MeshId = "rbxassetid://4718140898"
	specialMesh.Scale = Vector3.new(1, 1, 1)
	specialMesh.Parent = skibidi

	local waist = who.Character:FindFirstChild("LowerTorso") or who.Character:FindFirstChild("Torso")
	if waist then
		local weld = Instance.new("WeldConstraint")
		weld.Part0 = waist
		weld.Part1 = skibidi
		weld.Parent = waist
		skibidi.Position = waist.Position
		skibidi.Orientation = Vector3.new(0, waist.Orientation.Y - 90, 0)

		game:GetService("RunService").Heartbeat:Connect(function()
			skibidi.Position = waist.Position
			skibidi.Orientation = Vector3.new(0, waist.Orientation.Y - 90, 0)
		end)
	end

	skibidi.Parent = who.Character
end

for _, plr in game.Players:GetPlayers() do
	if not plr.Character then plr.CharacterAdded:Wait() end
	makeSkibidi(plr)
	plr.CharacterAdded:Connect(makeSkibidi)
end

game.Players.PlayerAdded:Connect(function(plr)
	if not plr.Character then plr.CharacterAdded:Wait() end
	makeSkibidi(plr)
	plr.CharacterAdded:Connect(makeSkibidi)
end)

local sky = game.Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky")

sky.SkyboxBk = "rbxassetid://115223153680994"
sky.SkyboxDn = "rbxassetid://115223153680994"
sky.SkyboxFt = "rbxassetid://115223153680994"
sky.SkyboxLf = "rbxassetid://115223153680994"
sky.SkyboxRt = "rbxassetid://115223153680994"
sky.SkyboxUp = "rbxassetid://115223153680994"

sky.SunTextureId = "http://www.roblox.com/asset/?id=6787778454"

sky.Parent = game.Lighting
