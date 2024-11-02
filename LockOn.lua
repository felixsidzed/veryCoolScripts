local lplr = cloneref(game:GetService("Players")).LocalPlayer
local char = lplr.Character or lplr.CharacterAdded:Wait()
local hum  = char:WaitForChild("Humanoid")
local UIS  = cloneref(game:GetService("UserInputService"))

local lockingOn = nil

local scriptSettings = {
	tpwalk_speed = getgenv().tpwalk_speed or 2,
	hotkey = getgenv().hotkey or Enum.KeyCode.Z,
}

local succ, _ = pcall(function()
	UIS:IsKeyDown(scriptSettings.hotkey)
end)
assert(succ, "hotkey must be an Enum.KeyCode")
assert(typeof(scriptSettings.tpwalk_speed) == "number", "tpwalk speed must be a number")

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
		else
			lockingOn = getClosestCharacterToPoint(char.HumanoidRootPart.Position, 30)
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
				workspace.CurrentCamera.CFrame.Position:Lerp(lockingOn.Torso.Position - Vector3.new(0, 1, 0), delta)
			)
		end
    end
end)
