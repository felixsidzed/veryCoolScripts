if game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)["Name"] ~= "The Strongest Battlegrounds" then
	warn("This script only works in The Strongest Battlegrounds!")
	return
end



local folder = game.Players.LocalPlayer.PlayerGui.ScreenGui.MagicHealth:FindFirstChild("Cooldowns")
if folder then
	folder:Destroy()
end

folder = Instance.new("Folder")
folder.Name = "Cooldowns"

local EvasiveCD = Instance.new("ImageLabel")
EvasiveCD.Name = "EvasiveCD"
EvasiveCD.ZIndex = 3
EvasiveCD.Size = UDim2.new(0, 25, 0, 25)
EvasiveCD.ClipsDescendants = true
EvasiveCD.BorderColor3 = Color3.fromRGB(27, 42, 53)
EvasiveCD.BackgroundTransparency = 1
EvasiveCD.Position = UDim2.new(0, 0, -2.3599999, 25)
EvasiveCD.BorderSizePixel = 0
EvasiveCD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EvasiveCD.ImageTransparency = 0.1
EvasiveCD.Image = "rbxassetid://16397287321"
EvasiveCD.ImageColor3 = Color3.fromRGB(0, 0, 0)
EvasiveCD.Parent = folder

Instance.new("UICorner", EvasiveCD).CornerRadius = UDim.new(0.3, 0)

local UIStroke = Instance.new("UIStroke")
UIStroke.Transparency = 0.1
UIStroke.Thickness = 2
UIStroke.Parent = EvasiveCD

local ecd = Instance.new("Frame")
ecd.Name = "Cooldown"
ecd.Size = UDim2.new(1, 0, -1, 0)
ecd.BorderColor3 = Color3.fromRGB(0, 0, 0)
ecd.BackgroundTransparency = 0.5
ecd.Position = UDim2.new(0, 0, 1, 0)
ecd.BorderSizePixel = 0
ecd.BackgroundColor3 = Color3.fromRGB(127, 51, 51)
ecd.Parent = EvasiveCD

Instance.new("UICorner", ecd).CornerRadius = UDim.new(1, 0)

local DashCD = Instance.new("ImageLabel")
DashCD.Name = "DashCD"
DashCD.ZIndex = 3
DashCD.Size = UDim2.new(0, 25, 0, 25)
DashCD.ClipsDescendants = true
DashCD.BorderColor3 = Color3.fromRGB(27, 42, 53)
DashCD.BackgroundTransparency = 1
DashCD.Position = UDim2.new(0.093199, 0, -2.3599999, 25)
DashCD.BorderSizePixel = 0
DashCD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DashCD.ImageTransparency = 0.1
writefile("11432052.png", game:HttpGet("https://cdn-icons-png.flaticon.com/512/11432/11432052.png"))
DashCD.Image = getcustomasset("11432052.png")
DashCD.ImageColor3 = Color3.fromRGB(0, 0, 0)
DashCD.Parent = folder

Instance.new("UICorner", DashCD).CornerRadius = UDim.new(0.3, 0)

local UIStroke1 = Instance.new("UIStroke")
UIStroke1.Transparency = 0.1
UIStroke1.Thickness = 2
UIStroke1.Parent = DashCD

local fdcd = Instance.new("Frame")
fdcd.Name = "Cooldown"
fdcd.Size = UDim2.new(1, 0, -1, 0)
fdcd.BorderColor3 = Color3.fromRGB(0, 0, 0)
fdcd.BackgroundTransparency = 0.5
fdcd.Position = UDim2.new(0, 0, 1, 0)
fdcd.BorderSizePixel = 0
fdcd.BackgroundColor3 = Color3.fromRGB(127, 51, 51)
fdcd.Parent = DashCD

Instance.new("UICorner", fdcd).CornerRadius = UDim.new(1, 0)

local SideDashCD = Instance.new("ImageLabel")
SideDashCD.Name = "SideDashCD"
SideDashCD.ZIndex = 3
SideDashCD.Size = UDim2.new(0, 25, 0, 25)
SideDashCD.ClipsDescendants = true
SideDashCD.BorderColor3 = Color3.fromRGB(27, 42, 53)
SideDashCD.BackgroundTransparency = 1
SideDashCD.Position = UDim2.new(0.186398, 0, -2.3599999, 25)
SideDashCD.BorderSizePixel = 0
SideDashCD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SideDashCD.ImageTransparency = 0.1
SideDashCD.Image = "rbxassetid://16924813825"
SideDashCD.ImageColor3 = Color3.fromRGB(0, 0, 0)
SideDashCD.Parent = folder

Instance.new("UICorner", SideDashCD).CornerRadius = UDim.new(0.3, 0)

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Transparency = 0.1
UIStroke2.Thickness = 2
UIStroke2.Parent = SideDashCD

local sdcd = Instance.new("Frame")
sdcd.Name = "Cooldown"
sdcd.Size = UDim2.new(1, 0, -1, 0)
sdcd.BorderColor3 = Color3.fromRGB(0, 0, 0)
sdcd.BackgroundTransparency = 0.5
sdcd.Position = UDim2.new(0, 0, 1, 0)
sdcd.BorderSizePixel = 0
sdcd.BackgroundColor3 = Color3.fromRGB(127, 51, 51)
sdcd.Parent = SideDashCD

Instance.new("UICorner", sdcd).CornerRadius = UDim.new(1, 0)

folder.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui.MagicHealth

local function handleDashes(track)
	if track.Animation.AnimationId == "rbxassetid://10480793962" or track.Animation.AnimationId == "rbxassetid://10480796021" then
		sdcd.Size = UDim2.new(1, 0, 0, 0)
		cloneref(game:GetService("TweenService")):Create(sdcd, TweenInfo.new(3), { Size = UDim2.new(1, 0, -1, 0) }):Play()
		
	elseif table.find({ "rbxassetid://10479335397", "rbxassetid://13380255751", "rbxassetid://10491993682" }, track.Animation.AnimationId) then
		fdcd.Size = UDim2.new(1, 0, 0, 0)
		cloneref(game:GetService("TweenService")):Create(fdcd, TweenInfo.new(6), { Size = UDim2.new(1, 0, -1, 0) }):Play()

	end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
	task.wait()
	char.Humanoid.Animator.AnimationPlayed:Connect(hawk_tuah)
	game.Players.LocalPlayer.Character.ChildAdded:Connect(function(child)
		if child.Name == "RagdollCancel" then
			ecd.Size = UDim2.new(1, 0, 0, 0)
			cloneref(game:GetService("TweenService")):Create(ecd, TweenInfo.new(31), { Size = UDim2.new(1, 0, -1, 0) }):Play()
		end
	end)
end)
game.Players.LocalPlayer.Character.Humanoid.Animator.AnimationPlayed:Connect(handleDashes)
game.Players.LocalPlayer.Character.ChildAdded:Connect(function(child)
	if child.Name == "RagdollCancel" then
		ecd.Size = UDim2.new(1, 0, 0, 0)
		cloneref(game:GetService("TweenService")):Create(ecd, TweenInfo.new(31), { Size = UDim2.new(1, 0, -1, 0) }):Play()
	end
end)
