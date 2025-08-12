# Roblox-CeilingLamp-Switch
Roblox Lua scripts for making a basic ceiling lamp in Roblox Studio. These are Roblox Lua scripts for toggling a ceiling lamp. Modding and editing this code is greatly appreciated on this one, this is just a base model for the Beginners.

To use this, you should have a tree like this for your light switch:

LightSwitch (Model)
 - LightSwitchBase (Part) --Needed
    - PressEBillboard (BillboardGui)
       - PressELabel (TextLabel)
 - LightSwitch (Part) --For asthetic, needed for an actual light switch on the LightSwitchBase

To use this, you should have a tree like this for your ceiling lamp:


CeilingLamp (Model)
 - PointLight (PointLight)


On your BillboardGui, you should size set to (0, 200, 50, 0), StudsOffset set to (0, 2, 0) --Set to offset as needed && offset above the switch, have MaxDistance set to 20 (or a bit higher), and have AlwaysOnTop equal to True

On your TextLabel (Inside BillboardGui), size should be set to (1, 0, 1, 0) --Fills entire GUI, have TextScaled equaled to False, TextSize set to 18 or higher, TextWrapped equaled to True, BackgroundTransparency set to 1, TextColor3 is whatever you like, and Font is whatever you like.
