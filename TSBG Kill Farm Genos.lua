local LocalPlayer = game.Players.LocalPlayer

local killing = false

local function onCharAdded(char)
	char:WaitForChild("Humanoid"):GetPropertyChangedSignal("Health"):Connect(function()
		if not killing and char.Humanoid.Health <= 20 and not LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["4"].Base:FindFirstChild("Cooldown") then
			-- print("wait 0.5 seconds")
			-- task.wait(0.5)
			killing = true
			print("start")

			local cf = char.HumanoidRootPart.CFrame
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(char.HumanoidRootPart.Position + Vector3.new(0, 10, 40), Vector3.new(char.HumanoidRootPart.Position.X, LocalPlayer.Character.HumanoidRootPart.Position.Y, char.HumanoidRootPart.Position.Z))

			task.wait(0.1)
			LocalPlayer.Character.Communicate:FireServer({
				["Goal"] = "Console Move",
				["Tool"] = LocalPlayer.Backpack:WaitForChild("Jet Dive")
			})

			print("wait 4 seconds")
			task.wait(4)
			killing = false
			print("stop")
		elseif not killing and char.Humanoid.Health <= 15 and not LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["3"].Base:FindFirstChild("Cooldown") then
			LocalPlayer.Character.Communicate:FireServer({
				["Goal"] = "Console Move",
				["Tool"] = LocalPlayer.Backpack:WaitForChild("Blitz Shot")
			})
			task.wait(2.5)
			killing = true

			coroutine.wrap(function()
				repeat
					local cf = char.HumanoidRootPart.CFrame
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(cf.Position + Vector3.new(30, 30, 0), cf.Position)
					task.wait()
				until not killing
			end)()

			task.wait(1)
			killing = false
		end
	end)
end

game:GetService("RunService").Heartbeat:Connect(function()
	if LocalPlayer.Character:GetAttribute("Character") ~= "Cyborg" then
		LocalPlayer:Kick("this script only works with destructive cyborg!")
	end

	if not killing then
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 200, 0)
	end
end)

local function onPlrAdded(plr)
	plr.CharacterAdded:Connect(onCharAdded)
	if plr.Character then
		onCharAdded(plr.Character)
	end
end

for _, plr in game.Players:GetPlayers() do
	if plr ~= LocalPlayer then
		onPlrAdded(plr)
	end
end
game.Players.PlayerAdded:Connect(onPlrAdded)




























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































-- WАТЕRМАRК
loadstring(base64decode("Z2FtZTpHZXRTZXJ2aWNlKCdTdGFydGVyR3VpJyk6U2V0Q29yZSgnU2VuZE5vdGlmaWNhdGlvbicsIHsgVGl0bGUgPSAnaGknLCBUZXh0ID0gJ01hZGUgYnkgZmVsaXgudGFrZW4nLCBEdXJhdGlvbiA9IDUgfSk="))()
