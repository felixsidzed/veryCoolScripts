local char = game.Players.LocalPlayer.Character
local humanoid = char:WaitForChild("Humanoid")

char.Archivable = true
local clone = char:Clone()
clone.Parent = workspace

local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://18182425133"

local track = humanoid:LoadAnimation(anim)
track.Priority = Enum.AnimationPriority.Action4

clone.Humanoid.Died:Connect(function()
	task.wait()
	clone:Destroy()
end)

char.Humanoid.Animator.AnimationPlayed:Connect(function(track)
	if track.Animation.AnimationId == "rbxassetid://18182425133" then return end

	warn(pcall(function()
		local a = Instance.new("Animation")
		a.AnimationId = track.Animation.AnimationId
		local t = clone.Humanoid:LoadAnimation(a)
		track.Stopped:Connect(function()
			t:Stop()
		end)
		t.Priority = track.Priority
		t:Play()
		t:AdjustSpeed(track.Speed)
		t.TimePosition = track.TimePosition
	end))
end)

local con
con = game:GetService("RunService").Heartbeat:Connect(function()
	if not clone.Parent then con:Disconnect() return end

	if not track.IsPlaying then
		track:Play()
		track.TimePosition = 1.9
		track:AdjustSpeed(0)
		track:AdjustWeight(1)
	end

	clone.Humanoid:ChangeState(char.Humanoid:GetState())
	clone.Humanoid.Health = 100
	clone.Humanoid.DisplayName = " "

	for _, part in char:GetDescendants() do
		if part:IsA("BasePart") then
			part.CanCollide = char:FindFirstChild("RagdollSim") ~= nil
			part.Massless = true
		end
	end

	for _, part in clone:GetDescendants() do
		if part:IsA("BasePart") then
			if part.Transparency == 0 then
				part.Transparency = 0.5 
			end
			part.CanCollide = false
			part.Massless = true
		end
	end

	clone:MoveTo(char.HumanoidRootPart.Position)
	char.Humanoid.AutoRotate = true
	char:SetPrimaryPartCFrame(clone.HumanoidRootPart.CFrame)

	workspace.CurrentCamera.CameraSubject = clone.Humanoid
end)
