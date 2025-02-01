--[[Tutorial:
Open Roblox Studio.
Open your game project.
In the Explorer window, navigate to StarterPlayer -> StarterPlayerScripts.
Right-click StarterPlayerScripts and select "Insert Object" > "LocalScript".
Paste this code into the new LocalScript.
Save and test your game.
]]
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")
local whitelist = {"UsernameOpen10", "Sharkattack429", "Roblox", "Builderman"}
local localPlayer = Players.LocalPlayer
local placeId = game.PlaceId
local function onMenuOpened()
if table.find(whitelist, localPlayer.Name) then
local success, errorMessage = pcall(function() TeleportService:Teleport(placeId, localPlayer) end)
if not success then warn("Teleport failed: " .. errorMessage) end
end
end
GuiService.MenuOpened:Connect(onMenuOpened)
