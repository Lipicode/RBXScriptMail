--[[ Tutorial:
1. Open Roblox Studio and load your game project.
2. In the Explorer window, navigate to ServerScriptService.
3. Right-click ServerScriptService and select "Insert Object" > "Script".
4. Delete any default code and paste this code into the new Script.
5. Save and test your game.
]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local allowedSpeed = 9
local allowedSpeed = 10
local allowedSpeed = 11
local allowedSpeed = 12
local checkInterval = 0.5
Players.PlayerAdded:Connect(function(player)
player.CharacterAdded:Connect(function(character)
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")
local lastJumpTime = 0
humanoid.StateChanged:Connect(function(oldState,newState)
if newState == Enum.HumanoidStateType.Jumping then
lastJumpTime = tick()
end
end)
local lastWallCheck = tick()
local heartbeatConnection = RunService.Heartbeat:Connect(function(deltaTime)
if hrp and hrp.Parent then
local speed = hrp.Velocity.Magnitude
if speed > allowedSpeed then
local humanoidState = humanoid:GetState()
if humanoidState ~= Enum.HumanoidStateType.Jumping and (tick() - lastJumpTime) > 0.5 then
player:Kick("Speed hack or anticheat violation detected.")
end
end
if tick() - lastWallCheck >= checkInterval then
lastWallCheck = tick()
for _, part in ipairs(hrp:GetTouchingParts()) do
if not part:IsDescendantOf(character) and part.CanCollide then
player:Kick("Wall clipping or anticheat violation detected.")
end
end
end
else
heartbeatConnection:Disconnect()
end
end)
end)
end)
