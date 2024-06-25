local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "MADE BY npc", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main Page",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Main Page"
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
        task.wait(0.1)
    end
end

Section:AddButton({
	Name = "Fling All",
	Callback = function()
		flingAll()
  		print("button pressed")
  	end    
})

Section:AddButton({
	Name = "Fling GUI",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'), true))()
  		print("Fling GUI script loaded")
  	end    
})

Section:AddButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  		print("Infinite Yield script loaded")
  	end    
})

Section:AddButton({
	Name = "Open Any Door (client-sided)",
	Callback = function()
		game.Players.LocalPlayer.GroupInfo.Rank.Value = 255
  		print("Group rank set to 255")
  	end    
})

Section:AddButton({
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

Section:AddButton({
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

Section:AddToggle({
	Name = "Spam Discord Invite",
	Default = false,
	Callback = function(Value)
		isSpamming = Value
		while isSpamming do
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(". g g / washieztroll", "All")
			wait(1)
		end
		print("Spam toggle:", Value)
	end    
})

local Tab = Window:MakeTab({
	Name = "Teleporters",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Teleporters"
})

Section:AddButton({
    Name = "Spawn",
    Callback = function()
		local targetPosition = Vector3.new(-106, 4, 99)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Middle Area",
    Callback = function()
		local targetPosition = Vector3.new(351, 4, 100)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Cafe",
    Callback = function()
		local targetPosition = Vector3.new(463, 4, 206)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Gas Station",
    Callback = function()
		local targetPosition = Vector3.new(494, 3, -181)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Headquarters",
    Callback = function()
		local targetPosition = Vector3.new(-46, 4, -201)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Prison Outdoor",
    Callback = function()
		local targetPosition = Vector3.new(257, 3, -504)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Prison Indoor",
    Callback = function()
		local targetPosition = Vector3.new(267, 4, -570)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Raceway",
    Callback = function()
		local targetPosition = Vector3.new(449, 27, 470)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Staff Spawn",
    Callback = function()
		local targetPosition = Vector3.new(294, 4, -192)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Tab = Window:MakeTab({
	Name = "Training Teleporters",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Training Teleporters"
})

Section:AddButton({
    Name = "Group A",
    Callback = function()
		local targetPosition = Vector3.new(-473, 4, -315)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Group B",
    Callback = function()
		local targetPosition = Vector3.new(-565, 4, -313)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Group C",
    Callback = function()
		local targetPosition = Vector3.new(-657, 4, -314)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Group D",
    Callback = function()
		local targetPosition = Vector3.new(-473, 4, -418)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Group E",
    Callback = function()
		local targetPosition = Vector3.new(-564, 4, -420)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

Section:AddButton({
    Name = "Group F",
    Callback = function()
		local targetPosition = Vector3.new(-656, 4, -419)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Misc"
})

Tab:AddParagraph("VERSION","1.2")

Tab:AddParagraph("DISCORD","discord.gg/washieztroll")

Tab:AddParagraph("CREDIT","Credit to @patriotic_american on Discord!")

Section:AddButton({
    Name = "Raid Meetup (if neded)",
    Callback = function()
		local targetPosition = Vector3.new(799, 3, -590)
		game.Players.LocalPlayer.Character:MoveTo(targetPosition)
    end    
})
