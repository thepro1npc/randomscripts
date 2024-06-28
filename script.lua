local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "MADE BY npc",
    LoadingTitle = "My Custom Script",
    LoadingSubtitle = "Made By npc",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "MADE BY npc",
       Subtitle = "Key System",
       Note = "Get the key here! https://link-target.net/1195296/script-key",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local groupId = 10261023
local hrRankNames = {
    "Junior Director", "Senior Director", "Head Director", "Corporate Intern", 
    "Junior Corporate", "Senior Corporate", "Head Corporate", "Chief Human Resources Officer",
    "Chief Public Relations Officer", "Chief Operating Officer", "Chief Administrative Officer",
    "Developer", "Vice Chairman", "Chairman"
}

local mrRankNames = {
    "Shift Leader", "Supervisor", "Assistant Manager", "General Manager"
}

local toggleEnabled = false  -- Initial state of toggle

local function sendNotification(title, message)
    Rayfield:Notify({
        Title = title,
        Content = message,
        Duration = 8,
        Image = 4483362458,
     })
end

local function countPlayersByRank(rankNames)
    local count = 0
    for _, player in ipairs(game.Players:GetPlayers()) do
        local success, rank = pcall(function()
            return player:GetRoleInGroup(groupId)
        end)
        if success then
            for _, rankName in ipairs(rankNames) do
                if rankName == rank then
                    count = count + 1
                    break
                end
            end
        end
    end
    return count
end

local function checkAndNotifyHR(player)
    local success, rank = pcall(function()
        return player:GetRoleInGroup(groupId)
    end)
    if success then
        for _, rankName in ipairs(hrRankNames) do
            if rankName == rank then
                if toggleEnabled then
                    sendNotification("HR ALERT", player.Name .. " (" .. rank .. ") has joined the game.")
                end
                break
            end
        end
    end
end

-- Notify that the script is working
sendNotification("NOTIFICATION", "Thanks for using my script :)")

-- Listen for new players joining
game.Players.PlayerAdded:Connect(checkAndNotifyHR)

local Tab = Window:CreateTab("Main Page", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Main Page")

local Button = Tab:CreateButton({
    Name = "Fling GUI",
    Callback = function ()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'), true))()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Infinite Yield",
    Callback = function ()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
 })

backpack = game:GetService("Players").LocalPlayer.Backpack

local Button = Tab:CreateButton({
     Name = "Btools",
     Callback = function()
hammer = Instance.new("HopperBin")
hammer.Name = "Hammer"
hammer.BinType = 4
hammer.Parent = backpack
 
cloneTool = Instance.new("HopperBin")
cloneTool.Name = "Clone"
cloneTool.BinType = 3
cloneTool.Parent = backpack
 
grabTool = Instance.new("HopperBin")
grabTool.Name = "Grab"
grabTool.BinType = 2
grabTool.Parent = backpack
     end    
})

local Toggle = Tab:CreateToggle({
	Name = "Spam Discord Invite",
	CurrentValue = false,
    Flag = "SpamToggle",
	Callback = function(Value)
		isSpamming = Value
		while isSpamming do
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(". g g / rоblоxtrоllеrѕ", "All")
			wait(1)
		end
		print("Spam toggle:", Value)
	end    
})

local Slider = Tab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 250},  -- Adjust the range as needed
    Increment = 1,
    Suffix = "Speed",
    Flag = "WalkSpeedSlider",  -- Ensure each slider has a unique flag for configuration purposes
    CurrentValue = 16,  -- Set an initial value if needed
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            character.Humanoid.WalkSpeed = Value
        end
    end,
})

local Slider = Tab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 250},  -- Adjust the range as needed
    Increment = 1,
    Suffix = "Power",
    Flag = "JumpPowerSlider",  -- Ensure each slider has a unique flag for configuration purposes
    CurrentValue = 50,  -- Set an initial value if needed
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            character.Humanoid.JumpPower = Value
        end
    end,
})

local Section = Tab:CreateSection("Misc")

local Paragraph = Tab:CreateParagraph({Title = "DISCORD", Content = "discord.gg/robloxtrollers"})

local Paragraph = Tab:CreateParagraph({Title = "CREDIT", Content = "Credit to @patriotic_american on Discord!"})

 local Tab = Window:CreateTab("Washiez", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Washiez Main Section")

-- Example toggle implementation (replace with your actual toggle logic)
local Toggle = Tab:CreateToggle({
    Name = "Toggle HR Notifier",
    CurrentValue = false,
    Flag = "Toggle HR",
    Callback = function(Value)
        toggleEnabled = Value
        if toggleEnabled then
            sendNotification("HR Notifier Toggle", "You will be notified whenever an HR joins the game.")
        else
            sendNotification("HR Notifier Toggle", "You will NOT be notified whenever an HR joins the game.")
        end
    end
})

local function flingAll()
    for _, v in pairs(workspace.SpawnedCars:GetChildren()) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
        task.wait(0.2)
    end
end

 local Button = Tab:CreateButton({
    Name = "Fling Users in Cars",
    Callback = function()
        flingAll()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Open Any Door (client-sided)",
    Callback = function ()
		game.Players.LocalPlayer.GroupInfo.Rank.Value = 255
    end,
 })

 local Button = Tab:CreateButton({
	Name = "Scan for HR's!",
	Callback = function()
		local hrCount = countPlayersByRank(hrRankNames)
		local hrUsernames = {}  -- Table to store HR usernames
		for _, player in ipairs(game.Players:GetPlayers()) do
			local success, rank = pcall(function()
				return player:GetRoleInGroup(groupId)
			end)
			if success then
				for _, rankName in ipairs(hrRankNames) do
					if rankName == rank then
						table.insert(hrUsernames, player.Name)  -- Add HR username to the table
						break
					end
				end
			end
		end
		local hrUsernamesStr = table.concat(hrUsernames, ", ")  -- Concatenate usernames into a string
		if hrCount > 3 then
			sendNotification("HR SCAN", "There are " .. hrCount .. " HR's in-game:\n" .. hrUsernamesStr)
		else
			sendNotification("HR SCAN", "There are " .. hrCount .. " HR's in-game:\n" .. hrUsernamesStr)
		end
  		print("HR scan completed")
  	end    
})

local Button = Tab:CreateButton({
    Name = "Scan for MR's!",
    Callback = function()
        local mrCount = 0
        local mrUsernames = {}  -- Table to store MR usernames
        for _, player in ipairs(game.Players:GetPlayers()) do
            local success, rank = pcall(function()
                return player:GetRoleInGroup(groupId)
            end)
            if success then
                for _, rankName in ipairs(mrRankNames) do
                    if rankName == rank then
                        mrCount = mrCount + 1
                        table.insert(mrUsernames, player.Name)  -- Add MR username to the table
                        break
                    end
                end
            end
        end
        local mrUsernamesStr = table.concat(mrUsernames, ", ")  -- Concatenate usernames into a string
        if mrCount > 0 then
            sendNotification("MR SCAN", "There are " .. mrCount .. " MR's in-game:\n" .. mrUsernamesStr)
        else
            sendNotification("MR SCAN", "There are 0 MR's in-game.")
        end
        print("MR scan completed")
    end
})

local Button = Tab:CreateButton({
    Name = "Destroy Barriers",
    Callback = function()
        -- Destroy parts named "PostBarrier"
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Name == "PostBarrier" then
                part:Destroy()
            end
        end

        -- Destroy models named "CarBarrier"
        for _, model in pairs(workspace:GetDescendants()) do
            if model:IsA("Model") and model.Name == "CarBarrier" then
                model:Destroy()
            end
        end
    end    
})

local Section = Tab:CreateSection("Teleporters")

local Button = Tab:CreateButton({
    Name = "Spawn",
    Callback = function()
		local targetPosition = Vector3.new(-106, 4, 99)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Middle Area",
    Callback = function()
		local targetPosition = Vector3.new(351, 4, 100)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Cafe",
    Callback = function()
		local targetPosition = Vector3.new(463, 4, 206)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Gas Station",
    Callback = function()
		local targetPosition = Vector3.new(494, 3, -181)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Headquarters",
    Callback = function()
		local targetPosition = Vector3.new(-46, 4, -201)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Prison Outdoor",
    Callback = function()
		local targetPosition = Vector3.new(257, 3, -504)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Prison Indoor",
    Callback = function()
		local targetPosition = Vector3.new(267, 4, -570)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Raceway",
    Callback = function()
		local targetPosition = Vector3.new(449, 27, 470)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Staff Spawn",
    Callback = function()
		local targetPosition = Vector3.new(294, 4, -192)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Section = Tab:CreateSection("Training Teleporters")

local Button = Tab:CreateButton({
    Name = "Group A",
    Callback = function()
		local targetPosition = Vector3.new(-473, 4, -315)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Group B",
    Callback = function()
		local targetPosition = Vector3.new(-565, 4, -313)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Group C",
    Callback = function()
		local targetPosition = Vector3.new(-657, 4, -314)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Group D",
    Callback = function()
		local targetPosition = Vector3.new(-473, 4, -418)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Group E",
    Callback = function()
		local targetPosition = Vector3.new(-564, 4, -420)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Button = Tab:CreateButton({
    Name = "Group F",
    Callback = function()
		local targetPosition = Vector3.new(-656, 4, -419)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Section = Tab:CreateSection("Vehicle Modifications (tesla drunk driving moment)")

local Section = Tab:CreateSection("Credit to mye_real on discord")
 local Slider = Tab:CreateSlider({
    Name = "MaxSpeed",
    Range = {0, 250},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 60,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)

            for i,v in game.Workspace.SpawnedCars:GetChildren() do
                    v:SetAttribute("MaxSpeed", Value)
                    print("MaxSpeed value set to: "..Value)
end
    end,
 })
 local Slider = Tab:CreateSlider({
    Name = "ReverseSpeed",
    Range = {0, 250},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 60,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)

            for i,v in game.Workspace.SpawnedCars:GetChildren() do
                    v:SetAttribute("ReverseSpeed", Value)
                    print("ReverseSpeed value set to: "..Value)
end
    end,
 })
 local Slider = Tab:CreateSlider({
    Name = "DrivingTorque (acceleration)",
    Range = {15000, 100000},
    Increment = 2500,
    Suffix = "Values",
    CurrentValue = 5000,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)

            for i,v in game.Workspace.SpawnedCars:GetChildren() do
                    v:SetAttribute("DrivingTorque", Value)
                    print("DrivingTorque value set to: "..Value)
end
    end,
 })
 local Slider = Tab:CreateSlider({
    Name = "BrakingTorque (Brake Power)",
    Range = {30000, 200000},
    Increment = 5000,
    Suffix = "Values",
    CurrentValue = 10000,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)

            for i,v in game.Workspace.SpawnedCars:GetChildren() do
                    v:SetAttribute("BrakingTorque", Value)
                    print("BrakingTorque value set to: "..Value)
end
    end,
 })
 local Slider = Tab:CreateSlider({
    Name = "MaxSteer (Steer Power)",
    Range = {0.1, 2},
    Increment = 0.1,
    Suffix = "Values",
    CurrentValue = 0.6,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)

            for i,v in game.Workspace.SpawnedCars:GetChildren() do
                    v:SetAttribute("MaxSteer", Value)
                    print("MaxSteer value set to: "..Value)
end
    end,
 })
 local Slider = Tab:CreateSlider({
    Name = "Fuel (client sided)",
    Range = {0, 100000},
    Increment = 5000,
    Suffix = "Values",
    CurrentValue = 1000,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)

            for i,v in game.Workspace.SpawnedCars:GetChildren() do
                    v:SetAttribute("Fuel", Value)
                    print("Fuel value set to: "..Value)
end
    end,
 })

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
if model:IsA("Model") and model.Name:match("^".. username .. "-".. carType) then
    foundModel = model
    break
end
end

if foundModel then
print("Found model: ".. foundModel.Name)
-- do something with the found model
else
print("Model not found")
end
