local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sazzy's Universal Gui",
   LoadingTitle = "Sazzy Universal",
   LoadingSubtitle = "by Sazzy",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Sazzy Sigma GUI"
   },
   Discord = {
      Enabled = true,
      Invite = "zTK6wY3umX", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sazzy Universal",
      Subtitle = "Sazzy | Key System",
      Note = "Get Key: discord.gg/zTK6wY3umX",
      FileName = "Sazzy Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/v81gVV7M"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local BfTab = Window:CreateTab("Blox Fruits", nil)
local AimTab = Window:CreateTab("Aimbot", nil)
local MiscTab = Window:CreateTab("Misc", nil) 
local CredTab = Window:CreateTab("Credits", nil)
local AimbotSection = AimTab:CreateSection("Aimbot")
local CredSection = CredTab:CreateSection("Credits:")
local MainSection = MainTab:CreateSection("Main")
local BasicSection = BfTab:CreateSection("Basic")
local MiscSection = MiscTab:CreateSection("Misc") 

Rayfield:Notify({
   Title = "Thanks for using Sazzy Universal!",
   Content = "Best Universal Gui: https://discord.gg/zTK6wY3umX",
   Duration = 6.5,
   Image = 13583000024,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay Master Sigma!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MiscTab:CreateButton({
   Name = "Inf Yield",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Label = CredTab:CreateLabel("Creator: Sazzy")
local Label = CredTab:CreateLabel("Gui Core: Rayfield/Sirius")
local Label = CredTab:CreateLabel("Other creds are made in noti's on buttons.")

local Button = MiscTab:CreateButton({
   Name = "Universal Sword Reach",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/v85uKg67", true))()
   end,
})

local Button = AimTab:CreateButton({
   Name = "Button Example",
   Callback = function()
   
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
  local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Lock Character | Press G",
   Callback = function()
   local locked = false -- Initially unlocked

local function toggleLock()
    locked = not locked
    if locked then
        -- Save the current position
        local currentPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        -- Set up a loop to keep the player in place
        while locked do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentPosition)
            wait(0.1) -- Adjust as needed for smoothness
        end
    end
end

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
    if key:lower() == "g" then
        toggleLock()
    end
end)

   end,
})

local Button = MainTab:CreateButton({
   Name = "FE Fling All Players",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "TP To Closest Player | Press F",
   Callback = function()
   local function findClosestPlayer(player)
    local closestPlayer = nil
    local shortestDistance = math.huge
    local playerPosition = player.Character.HumanoidRootPart.Position
    
    for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local otherPlayerPosition = otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") and otherPlayer.Character.HumanoidRootPart.Position
            if otherPlayerPosition then
                local distance = (playerPosition - otherPlayerPosition).magnitude
                if distance < shortestDistance then
                    closestPlayer = otherPlayer
                    shortestDistance = distance
                end
            end
        end
    end
    
    return closestPlayer
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            -- Handle player death if needed
        end)
    end)
end)

game.Players.PlayerRemoving:Connect(function(player)
    -- Cleanup if needed
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
    if key:lower() == "f" then
        local closestPlayer = findClosestPlayer(game.Players.LocalPlayer)
        if closestPlayer then
            game.Players.LocalPlayer.Character:MoveTo(closestPlayer.Character.HumanoidRootPart.Position)
        end
    end
end)

        
   end,
})
