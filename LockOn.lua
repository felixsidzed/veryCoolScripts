local lplr = cloneref(game:GetService("Players")).LocalPlayer
local char = lplr.Character or lplr.CharacterAdded:Wait()
local hum  = char:WaitForChild("Humanoid")
local UIS  = cloneref(game:GetService("UserInputService"))

local lockingOn = nil
local lockOnGui = nil

local scriptSettings = {
	tpwalk_speed = getgenv().tpwalk_speed or 3,
	hotkey = getgenv().hotkey or Enum.KeyCode.E,
}

local succ, _ = pcall(function()
	UIS:IsKeyDown(scriptSettings.hotkey)
end)
assert(succ, "hotkey must be an Enum.KeyCode")
assert(typeof(scriptSettings.tpwalk_speed) == "number", "tpwalk speed must be a number")

cloneref(game:GetService("StarterGui")):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

UserSettings():GetService("UserGameSettings"):GetPropertyChangedSignal("MouseSensitivity"):Connect(function()
	cameraSens = UserSettings():GetService("UserGameSettings").MouseSensitivity
end)

function getClosestCharacterToPoint(point, maxDistance)
    local closest = nil
    local closestDistance = maxDistance or 1000

    for _, c in workspace.Live:GetChildren() do
        if c ~= char and c:FindFirstChild("HumanoidRootPart") and c.Humanoid.Health > 0 then
            local distance = (c.HumanoidRootPart.Position - point).Magnitude

            if distance < closestDistance then
                closestDistance = distance
                closest = c
            end
        end
    end

    return closest, closestDistance
end

UIS.InputBegan:Connect(function(input, p)
    if p then return end
	
	if input.KeyCode == scriptSettings.hotkey then
		if lockingOn then
			lockingOn = nil
			lockOnGui:Destroy()
		else
			lockingOn = getClosestCharacterToPoint(lplr:GetMouse().Hit.Position, 50)

			if lockingOn then
				lockOnGui = Instance.new("BillboardGui", lockingOn.Torso)
				lockOnGui.Size = UDim2.new(5, 0, 5, 0)
				lockOnGui.AlwaysOnTop = true

				local img = Instance.new("ImageLabel", lockOnGui)
				img.Size = UDim2.new(1, 0, 1, 0)
				img.Image = "rbxassetid://378475097"
				img.BackgroundTransparency = 1
			end
		end
    end
end)

lplr.CharacterAdded:Connect(function(c)
    char = c
    hum  = char:WaitForChild("Humanoid")
end)

cloneref(game:GetService("RunService")).Heartbeat:Connect(function(delta)
    if char and hum then
		char:TranslateBy(hum.MoveDirection * scriptSettings.tpwalk_speed * delta)
        
		if lockingOn and lockingOn:FindFirstChild("Torso") and lockingOn.Humanoid.Health > 0 then
			workspace.CurrentCamera.CFrame = CFrame.lookAt(
				workspace.CurrentCamera.CFrame.Position,
				workspace.CurrentCamera.CFrame.Position:Lerp(lockingOn.Torso.Position - Vector3.new(0, 1.5, 0), delta)
			)
		end
    end
end)
