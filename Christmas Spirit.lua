--!optimize 2
local grassMaterials = {
	Enum.Material.Grass,
	Enum.Material.LeafyGrass
}

local function winterSky()
	local skybox = Instance.new("Sky")
	skybox.Name = "Winter Skybox"
	skybox.SkyboxUp = "http://www.roblox.com/asset/?id=9457790985"
	skybox.SkyboxDn = "http://www.roblox.com/asset/?id=9457792251"
	skybox.SkyboxFt = "http://www.roblox.com/asset/?id=9457784308"
	skybox.SkyboxLf = "http://www.roblox.com/asset/?id=9457787935"
	skybox.SkyboxRt = "http://www.roblox.com/asset/?id=9457789800"
	skybox.SkyboxBk = "http://www.roblox.com/asset/?id=9457789056"

	local prev = game.Lighting:FindFirstChildOfClass("Sky")
	if prev then prev:Destroy() end

	skybox.Parent = game.Lighting
end

local function grass2snow(parent)
	local function isGreen(color)
		local red = color.R * 255
		local green = color.G * 255
		local blue = color.B * 255

		return green > red and green > blue
	end

	local function recolor(child)
		if child:IsA("BasePart") and isGreen(child.Color) and table.find(grassMaterials, child.Material) then
			child.BrickColor = BrickColor.new("Institutional white")
			child.Material = Enum.Material.Snow

			if child:IsA("PartOperation") then
				child.UsePartColor = true
			end
		end
	end

	parent = parent or (workspace:FindFirstChild("Map") or workspace)
	
	for _, child in parent:GetDescendants() do
		recolor(child)
	end
	recolor(parent)
end

winterSky()
grass2snow()

loadstring(base64decode("Z2FtZTpHZXRTZXJ2aWNlKCdTdGFydGVyR3VpJyk6U2V0Q29yZSgnU2VuZE5vdGlmaWNhdGlvbicsIHsgVGl0bGUgPSAnaGknLCBUZXh0ID0gJ01hZGUgYnkgZmVsaXgudGFrZW4nLCBEdXJhdGlvbiA9IDUgfSk="))()

workspace.DescendantAdded:Connect(function(child)
	if child:IsA("BasePart") then
		grass2snow(child)
	end
end)

local audio = Instance.new("Sound")
audio.SoundId = "rbxassetid://1838667168"
audio.Looped = true
audio.Playing = true
audio.Parent = game.Players.LocalPlayer.PlayerGui
audio.Destroying:Connect(function()
	audio:Clone().Parent = game.Players.LocalPlayer.PlayerGui
end)
