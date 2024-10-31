PremiumFeature = true

repeat wait() until game:IsLoaded();
if game.Workspace:FindFirstChild("SkidHubOnTop") and game.Workspace:FindFirstChild("SkidHubBest") then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Skid Hub";
        Text = "Aleady Executed Bitch";
        Duration = 3;
    })
else
    localcheck = Instance.new("Part")
    localcheck.Parent = game.Workspace
    localcheck.Name = "SkidHubOnTop"

    localcheckcheck = Instance.new("Part")
    localcheckcheck.Parent = game.Workspace
    localcheckcheck.Name = "SkidHubBest"

    if not game:IsLoaded() then
        local loadedcheck = Instance.new("Message",workspace)
        loadedcheck.Text = 'Loading...'
        game.Loaded:Wait()
        loadedcheck:Destroy()
    end

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Looking for status...";
        Text = "This may take a while...";
    })
    wait(1.5)
    if PremiumFeature == true then
        local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
        request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

        local whitelisted_HWID = {
            ["97979794-E938-4FA0-B295-09CCC9E8B3E2"] = true,
            ["FC5FFB02-5B74-4DB5-B40F-45A64A8D1CF2"] = true
        }
        if whitelisted_HWID[hwid] then
            local SkidHubPremium = {
                [210213771] = "final stand",
                [12413786484] = "anime%20lost%20simulator",
                [210213771] = "Ninja Legends",
                [3851622790] = "Breaking Story"
            }
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Status found!";
                Text = "You are using the Premium version of Skid Hub!";
            })
            loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/DragonSoulDEMO"))()
            for i, v in pairs(SkidHubPremium) do
                if string.match(i,game.PlaceId) then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/InsomniaTM/SkidHub/main/SkidHub/"..v..".lua", true))()
                else
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/InsomniaTM/SkidHub/main/Universal"))()
                end
            end
        else
            local httpService = game:GetService("HttpService")
            local webhookUrl = "https://discord.com/api/webhooks/1092475949238460426/RjY9U1pmUJ-dnQLs6p-GtVqbKzPL6usuDx67vh7Ayw3INO3rthJ9-E2fJpMiqgC66ByH"

            local response = request({
                Url = webhookUrl,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = httpService:JSONEncode({
                    ["content"] = "",
                    ["embeds"] = {{
                        ["title"] = "Whitelist Hub",
                        ["description"] = game.Players.LocalPlayer.DisplayName.." was not whitelisted and tried to execute your script!",
                        ["type"] = "rich",
                        ["color"] = tonumber("ffffff", 16),
                        ["fields"] = {{
                            ["name"] = "Hardware ID:",
                            ["value"] = hwid,
                            ["inline"] = true
                        }}
                    }}
                })
            })
            game:shutdown()
        end
    else
        local SkidHubFree = {
            [210213771] = "final stand",
            [12413786484] = "anime%20lost%20simulator",
            [210213771] = "Ninja Legends",
            [3851622790] = "Breaking Story"
        }
        -- ver loader
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Status found!";
            Text = "You are using the free version of Skid Hub!";
        })
        wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/DragonSoulDEMO"))()
        for i, v in pairs(SkidHubFree) do
            if string.match(i,game.PlaceId) then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/InsomniaTM/SkidHub/main/SkidHub/"..v..".lua", true))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/InsomniaTM/SkidHub/main/Universal"))()
            end
        end
    end
end
