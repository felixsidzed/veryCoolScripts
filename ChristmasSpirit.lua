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

	local prev = game.Lighting:FindFirstAncestorOfClass("Sky")
	if prev then prev:Destroy() end

	skybox.Parent = game.Lighting
end

local function grass2snow()
	local function isGreen(color)
		local red = color.R * 255
		local green = color.G * 255
		local blue = color.B * 255

		return green > red and green > blue
	end

	local parent = workspace:FindFirstChild("Map") or workspace
	local keepMaterial = math.round(math.random(0, 100) / 100) == 0
	local newMaterial = ({ Enum.Material.Grass, Enum.Material.Snow })[math.round(math.random(100, 200) / 100)]
	
	for _, child in parent:GetDescendants() do
		if child:IsA("BasePart") and isGreen(child.Color) and table.find(grassMaterials, child.Material) then
			child.BrickColor = BrickColor.new("Institutional white")
			if not keepMaterial then child.Material = newMaterial end

			if child:IsA("PartOperation") then
				child.UsePartColor = true
			end
		end
	end
end

winterSky()
grass2snow()

local audio = Instance.new("Sound")
audio.SoundId = "rbxassetid://1838667168"
audio.Looped = true
audio.Playing = true
audio.Parent = game.Players.LocalPlayer.PlayerGui
audio.Destroying:Connect(function()
	audio:Clone().Parent = game.Players.LocalPlayer.PlayerGui
end)
