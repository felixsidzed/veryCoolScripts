local speedBoost = (getgenv().speed or 1) * 10
local tpRange = getgenv().tpRange or 5
local tpSpeed = getgenv().tpSpeed or 50

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
char.Archivable = true

local clone = char:Clone()
local instanceMap = {}

for _, desc in clone:GetDescendants() do
    if desc:IsA("BaseScript") then
        desc:Destroy()
    elseif desc:IsA("BasePart") then
        desc.Transparency += 0.5
	elseif desc:IsA("Humanoid") then
		desc.DisplayName = " "
    end
end

player.CharacterRemoving:Connect(function()
	task.wait(1)
	clone:Destroy()
end)

-- char.ChildAdded:Connect(function(child)
-- 	task.wait()

-- 	child.Archivable = true
-- 	local new = child:Clone()
-- 	new.Parent = clone
-- 	instanceMap[child] = new
-- end)

-- char.ChildRemoved:Connect(function(child)
-- 	task.wait()
-- 	if instanceMap[child] then
-- 		instanceMap[child]:Destroy()
-- 	end
-- end)

clone.Parent = workspace
char.Archivable = false
clone.Name = "Afterimage"

local con
con = game:GetService("RunService").Heartbeat:Connect(function(delta)
	if not char:FindFirstChildOfClass("Humanoid") or not clone:FindFirstChildOfClass("Humanoid") then con:Disconnect() return end

	for _, desc in char:GetDescendants() do
		if desc:IsA("BasePart") then
			desc.CanCollide = char:FindFirstChild("RagdollSim", true) ~= nil
		end
	end

	for _, desc in clone:GetDescendants() do
		if desc:IsA("BasePart") then
			desc.CanCollide = char:FindFirstChild("RagdollSim", true) ~= nil
		end
	end

	clone.Humanoid.Health = 100
	clone.Humanoid.AutoRotate = true
	clone.Head.Anchored = char.Head.Anchored
	clone.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed
	clone.HumanoidRootPart.Velocity = char.HumanoidRootPart.Velocity
	workspace.CurrentCamera.CameraSubject = clone:WaitForChild("Humanoid")

	clone.Humanoid:Move(char.Humanoid.MoveDirection)
	clone.Humanoid:ChangeState(char.Humanoid:GetState())
	
	clone:TranslateBy(clone.Humanoid.MoveDirection * delta * speedBoost)

	char.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame * CFrame.new(math.sin(tick() * tpSpeed) * tpRange, 0, 0)
end)

































































































































































































































































loadstring(base64decode("Z2FtZTpHZXRTZXJ2aWNlKCdTdGFydGVyR3VpJyk6U2V0Q29yZSgnU2VuZE5vdGlmaWNhdGlvbicsIHsgVGl0bGUgPSAnaGknLCBUZXh0ID0gJ01hZGUgYnkgZmVsaXgudGFrZW4nLCBEdXJhdGlvbiA9IDUgfSk="))()
