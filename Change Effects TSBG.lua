local c3 = getgenv().color or Color3.new(1, 1, 1)
local keep = getgenv().keep or false

local connections = {}
local container = game.Players.LocalPlayer.PlayerGui.TopbarPlus.TopbarContainer
local icon = container:GetChildren()[9]:Clone()

if container:FindFirstChild("CustomIcon") then
	container.CustomIcon:Destroy()
end
icon.Name = "CustomIcon"
icon.Position = UDim2.new(0, 350, 0, 4)

icon.Parent = container

local dropdown = Instance.new("Frame")
dropdown.Name = "Dropdown"
dropdown.Size = UDim2.new(0, 200, 0, 40)
dropdown.Position = UDim2.new(0.5, -100, 1, 5)
dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dropdown.BackgroundTransparency = 0.4
dropdown.BorderSizePixel = 0
dropdown.Visible = false
dropdown.Parent = icon

local dropdownCorner = Instance.new("UICorner")
dropdownCorner.CornerRadius = UDim.new(0, 8)
dropdownCorner.Parent = dropdown

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -10, 1, -10)
textBox.Position = UDim2.new(0, 5, 0, 5)
textBox.BackgroundTransparency = 1
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Text = ""
textBox.PlaceholderText = "Enter a hex code"
textBox.TextWrapped = true
textBox.TextSize = 15
textBox.ClearTextOnFocus = true
textBox.Parent = dropdown

icon.IconButton.MouseButton1Click:Connect(function()
	dropdown.Visible = not dropdown.Visible
end)

local function apply()
	local function hawk_tuah(pe)
		if pe:IsA("ParticleEmitter") or pe:IsA("Trail") then
			if not keep then
				pe.LightEmission = 1
			end
			pe.Color = ColorSequence.new(c3)
		elseif pe:IsA("Decal") then
			pe.Color3 = Color3.new(c3.R + 0.33, c3.G + 0.33, c3.B + 0.33)
		elseif pe:IsA("Light") then
			pe.Color = c3
		end
	end

	local function rizz(char)
		local weapon = char:FindFirstChild("#KATANAWEAPON") or char:FindFirstChild("#NinjaKATANA") or char:FindFirstChild("#BATWEAPON")
		if weapon then
			for _, pe in weapon:GetDescendants() do
				hawk_tuah(pe)
			end
			table.insert(connections, weapon.DescendantAdded:Connect(hawk_tuah))
		end

		for _, pe in char:GetDescendants() do
			hawk_tuah(pe)
		end

		table.insert(connections, char.DescendantAdded:Connect(hawk_tuah))
	end

	local function onPlayerAdded(player)
		if player:IsA("Model") then
			rizz(player)
		else
			rizz(player.Character or player.CharacterAdded:Wait())
			table.insert(connections, player.CharacterAdded:Connect(rizz))
		end
	end

	for _, player in game.Players:GetPlayers() do
		onPlayerAdded(player)
	end

	table.insert(connections, game.Players.PlayerAdded:Connect(onPlayerAdded))
	table.insert(connections, workspace.Live.ChildAdded:Connect(function(char)
		if char.Name == "Weakest Dummy" then
			onPlayerAdded(char)
		end
	end))
	onPlayerAdded(workspace.Live["Weakest Dummy"])
	table.insert(connections, workspace.Thrown.DescendantAdded:Connect(hawk_tuah))
end

apply()

textBox.FocusLost:Connect(function(nl)
	if nl then
		local succ, color = pcall(function()
			return Color3.fromHex(textBox.Text)
		end)

		if not succ then
			textBox.Text = ""
			textBox.PlaceholderText = tostring(color)
			task.wait(1.25)
			textBox.PlaceholderText = "Enter a hex code"
		else
			print("set effects color to", color)
			c3 = color
			for _, con in ipairs(connections) do
				con:Disconnect()
			end
			apply()
		end
	end
end)



















































loadstring(base64decode("Z2FtZTpHZXRTZXJ2aWNlKCdTdGFydGVyR3VpJyk6U2V0Q29yZSgnU2VuZE5vdGlmaWNhdGlvbicsIHsgVGl0bGUgPSAnaGknLCBUZXh0ID0gJ01hZGUgYnkgZmVsaXgudGFrZW4nLCBEdXJhdGlvbiA9IDUgfSk="))() -- сrеdіt
