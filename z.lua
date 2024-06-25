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
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
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

 local Tab = Window:CreateTab("Main Page", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Main Page")

 local Button = Tab:CreateButton({
    Name = "Button Example",
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
 })
