local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

local function pressKey(key, duration)
    duration = duration or 0.1
    local input = game:GetService("VirtualInputManager")
    input:SendKeyEvent(true, key, false, game)
    task.wait(duration)
    input:SendKeyEvent(false, key, false, game)
end

while true do
    task.wait(0.5)
    
    local bossFound = false
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") then
            local name = v.Name:lower()
            if name:find("volcanic") or name:find("magma") or name:find("inferno") or name:find("king") then
                bossFound = true
                break
            end
        end
    end
    
    if bossFound then
        pressKey(Enum.KeyCode.Q, 0.5)
        task.wait(0.3)
        
        for i = 1, 3 do
            pressKey(Enum.KeyCode.E, 0.2)
            task.wait(0.2)
        end
        
        local dirs = {Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D}
        local dodgeDir = dirs[math.random(1, 4)]
        pressKey(Enum.KeyCode.LeftShift, 0.1)
        pressKey(dodgeDir, 0.2)
    end
    
    local lootUI = player.PlayerGui:FindFirstChild("LootUI")
    if lootUI and lootUI.Visible then
        task.wait(2)
        pressKey(Enum.KeyCode.R, 0.2)
        task.wait(1)
        pressKey(Enum.KeyCode.Return, 0.2)
        task.wait(3)
    end
end
