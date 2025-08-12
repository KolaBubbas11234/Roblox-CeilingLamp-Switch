-- Place in ServerScriptService - ToggleLampServer - Script

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- RemoteEventInstance in ReplicatedStorage Service - NEEDED!
local toggleEvent = Instance.new("RemoteEvent")
toggleEvent.Name = "ToggleLamp"
toggleEvent.Parent = ReplicatedStorage

-- CeilingLamp model here.
local lampPart = workspace.StarterHouse.CeilingLight

-- CeilingLamp PointLight here.
local lampLight = workspace.StarterHouse.CeilingLight.PointLight


local lampState = lampLight.Enabled

-- Visual effect for turning the light on and off.
toggleEvent.OnServerEvent:Connect(function(player)
	lampState = not lampState
	
	
	if lampState then
		lampLight.Enabled = true
		lampLight.Color = Color3.fromRGB(255, 230, 150)
		lampLight.Brightness = 5
		lampLight.Range = 15
		lampPart.Material = Enum.Material.Neon
		lampPart.Color = Color3.fromRGB(255, 240, 180)
		
	else
		lampLight.Enabled = false
		lampLight.Color = Color3.fromRGB(0, 0, 0)
		lampPart.Material = Enum.Material.SmoothPlastic
		lampPart.Color = Color3.fromRGB(0, 0, 0)
	end
end)