local c3 = getgenv().color or Color3.new(0.9, 0.33, 0.43)

local function sigma(input)
	local r, g, b, n

	if typeof(input) == "Color3" then
		r, g, b = input.R, input.G, input.B
		n = 1
	elseif typeof(input) == "ColorSequence" then
		r, g, b, n = 0, 0, 0, #input.Keypoints
		for _, k in ipairs(input.Keypoints) do
			r, g, b = r + k.Value.R, g + k.Value.G, b + k.Value.B
		end
	else
		error("Input must be a Color3 or ColorSequence.")
	end

	return (r + g + b) / (3 * n)
end

local function rizz(char)
	local function hawk_tuah(pe)
		if pe:IsA("ParticleEmitter") then
			pe.LightEmission = 1
			pe.Color = ColorSequence.new(c3)
		elseif pe:IsA("Decal") then
			pe.Color3 = Color3.new(c3.R + 0.33, c3.G + 0.33, c3.B + 0.33)
		elseif pe:IsA("Light") then
			pe.Color = c3
		end
	end

	local weapon = char:FindFirstChild("#KATANAWEAPON") or char:FindFirstChild("#NinjaKATANA") or char:FindFirstChild("#BATWEAPON")
	if weapon then
		for _, pe in weapon:GetDescendants() do
			hawk_tuah(pe)
		end
		weapon.DescendantAdded:Connect(hawk_tuah)
	end

	workspace.Thrown.DescendantAdded:Connect(hawk_tuah)

	for _, pe in char:GetDescendants() do
		hawk_tuah(pe)
	end
end

rizz(game.Players.LocalPlayer.Character)
game.Players.LocalPlayer.CharacterAdded:Connect(rizz)
loadstring(base64decode("Z2FtZTpHZXRTZXJ2aWNlKCdTdGFydGVyR3VpJyk6U2V0Q29yZSgnU2VuZE5vdGlmaWNhdGlvbicsIHsgVGl0bGUgPSAnaGknLCBUZXh0ID0gJ01hZGUgYnkgZmVsaXgudGFrZW4nLCBEdXJhdGlvbiA9IDUgfSk="))()
