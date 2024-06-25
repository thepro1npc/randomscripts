local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "MADE BY npc",
    LoadingTitle = "My Custom Script",
    LoadingSubtitle = "Made By npc",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "TEST TITLE",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"test"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
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

local function sendNotification(title, message)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = message,
        Duration = 8
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
                sendNotification("HR Join", player.Name .. " (" .. rank .. ") has joined the game.")
                break
            end
        end
    end
end

-- Notify that the script is working
sendNotification("NOTIFICATION", "Scanner is WORKING")

-- Listen for new players joining
game.Players.PlayerAdded:Connect(checkAndNotifyHR)

local function flingAll()
    for _, v in pairs(workspace.SpawnedCars:GetChildren()) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
        task.wait(0.2)
    end
end

 local Tab = Window:CreateTab("Main Page", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Main Page")

 local Button = Tab:CreateButton({
    Name = "Fling Users in Cars",
    Callback = function()
        flingAll()
    end,
 })

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
		local mrCount = countPlayersByRank(mrRankNames)
		local mrUsernames = {}  -- Table to store MR usernames
		for _, player in ipairs(game.Players:GetPlayers()) do
			local success, rank = pcall(function()
				return player:GetRoleInGroup(groupId)
			end)
			if success then
				for _, rankName in ipairs(mrRankNames) do
					if rankName == rank then
						table.insert(mrUsernames, player.Name)  -- Add MR username to the table
						break
					end
				end
			end
		end
		local mrUsernamesStr = table.concat(mrUsernames, ", ")  -- Concatenate usernames into a string
		if mrCount > 3 then
			sendNotification("MR SCAN", "There are " .. mrCount .. " MR's in-game:\n" .. mrUsernamesStr)
		else
			sendNotification("MR SCAN", "There are " .. mrCount .. " MR's in-game:\n" .. mrUsernamesStr)
		end
  		print("MR scan completed")
  	end    
})

local isSpamming = false
local Toggle = Tab:CreateToggle({
    Name = "Spam Discord Invite",
    CurrentValue = false,
    Flag = "SpamToggle",
    Callback = function(Value)
        isSpamming = Value
        if isSpamming then
            spawn(function()
                while isSpamming do
                    wait(1) -- Wait for 1 second
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(". g g / washieztroll", "All")
                end
            end)
        end
    end
})

local Section = Tab:CreateSection("Other")

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

local Tab = Window:CreateTab("Teleport", 4483362458) -- Title, Image

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

local Tab = Window:CreateTab("Training", 4483362458) -- Title, Image

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

local Tab = Window:CreateTab("Vehicle", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Vehicle Modifications")

local Section = Tab:CreateSection("Credit to mye_real on discord")
local Dropdown = Tab:CreateDropdown({
        Name = "Car Choice (only SUV for now)",
        Options = {"SUV"},
        CurrentOption = {"SUV"},
        MultipleOptions = false,
        Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Option)
_G.CarChoice = Option
        end,
     })
     local Slider = Tab:CreateSlider({
        Name = "MaxSpeed",
        Range = {0, 250},
        Increment = 1,
        Suffix = "Speeds",
        CurrentValue = 60,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("MaxSpeed", Value)
                end
        end,
     })
     local Slider = Tab:CreateSlider({
        Name = "ReverseSpeed",
        Range = {0, 250},
        Increment = 1,
        Suffix = "Speeds",
        CurrentValue = 60,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("ReverseSpeed", Value)
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

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("DrivingTorque", Value)
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

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("BrakingTorque", Value)
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

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("MaxSteer", Value)
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

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("Fuel", Value)
                end
        end,
     })
     local Slider = Tab:CreateSlider({
        Name = "WheelFriction (client sided)",
        Range = {1, 100},
        Increment = 1,
        Suffix = "Values",
        CurrentValue = 2,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("WheelFriction", Value)
                end
        end,
     })
     local Slider = Tab:CreateSlider({
        Name = "BaseEngineRPM (client sided)",
        Range = {1500, 10000},
        Increment = 100,
        Suffix = "Values",
        CurrentValue = 1500,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("BaseEngineRPM", Value)
                end
        end,
     })
     local Slider = Tab:CreateSlider({
        Name = "MaxEngineRPM (client sided)",
        Range = {3000, 50000},
        Increment = 1000,
        Suffix = "Values",
        CurrentValue = 5000,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)

local username = game.Players.LocalPlayer.Name -- replace with the username you're looking for
local carType = tostring(_G.CarChoice) -- replace with the car type you're looking for

local spawnedCars = game.Workspace.SpawnedCars
local foundModel = nil

for _, model in pairs(spawnedCars:GetDescendants()) do
       if model:IsA("Model") and model.Name:match("%w+-".. carType) then
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
                if foundModel then
                        foundModel:SetAttribute("MaxEngineRPM", Value)
                end
        end,
     })

local Paragraph = Tab:CreateParagraph({Title = "Coming Soon...", Content = "Will hopefully be ready by 6/26"})

local Tab = Window:CreateTab("Misc", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Misc")

local Paragraph = Tab:CreateParagraph({Title = "DISCORD", Content = "discord.gg/washieztroll"})

local Paragraph = Tab:CreateParagraph({Title = "CREDIT", Content = "Credit to @patriotic_american on Discord!"})

local Button = Tab:CreateButton({
    Name = "Raid Meetup (if neded)",
    Callback = function()
		local targetPosition = Vector3.new(799, 3, -590)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})
