-- Place in StarterPlayer - StarterPlayerScripts - ToggleLampClient | LocalScript

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")


--RemoteEvent Instance created in ToggleLampServer script
local toggleEvent = ReplicatedStorage:WaitForChild("ToggleLamp")

-- SWITCH MODEL instead of Part - Light Switch model
local switchModel = workspace.StarterHouse.LightSwitch -- Change to your model’s name
local primaryPart = switchModel.LightSwitchBase
if not primaryPart then
	warn("No PrimaryPart set for switch model!")
	return
end

-- BillboardGui and TextLabel inside of the LightSwitchBase
local billboard = primaryPart.PressEBillboard
local label = billboard:WaitForChild("PressELabel")

local nearSwitch = false

--This is the activate distance between the Player and the BillboardGui in the Light Switch model to activate the TextLabel
local ACTIVATE_DISTANCE = 10

-- Place a point light in the CeilingLight Model
local lampLight = workspace.StarterHouse.CeilingLight.PointLight
local lampState = lampLight.Enabled

-- Press E and it tells you if the light is on or off in the TextLabel. Important!
local function updateBillboardText()
	label.Text = lampState and "E to Turn Off" or "E to Turn On"
end

updateBillboardText()
billboard.Enabled = false

-- Position where the player is near the LightSwitchBase for the TextLabel to active.
RunService.RenderStepped:Connect(function()
	local dist = (hrp.Position - primaryPart.Position).Magnitude
	if dist <= ACTIVATE_DISTANCE then
		billboard.Enabled = true
		nearSwitch = true
	else
		billboard.Enabled = false
		nearSwitch = false
	end
end)


-- Press E and it toggles the light on or off. Important!
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.E and nearSwitch then
		toggleEvent:FireServer()
		lampState = not lampState
		updateBillboardText()
	end
end)