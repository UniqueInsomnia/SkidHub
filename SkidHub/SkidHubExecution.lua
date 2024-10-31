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

    local function safeLoadScript(url)
        local success, loadResult = pcall(function()
            return loadstring(game:HttpGet(url, true))
        end)
        if success then
            loadResult()  -- Execute the loaded script
        end
    end


    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Looking for status...";
        Text = "This may take a while...";
    })
    wait(1.5)
    if Premium == true then
        local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
        request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

        local whitelisted_HWID = {
            ["97979794-E938-4FA0-B295-09CCC9E8B3E2"] = true,
            ["FC5FFB02-5B74-4DB5-B40F-45A64A8D1CF2"] = true
        }
        if whitelisted_HWID[hwid] then
            local SkidHubPremium = {
                [210213771] = "dbzfs.lua",
            }
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Status found!";
                Text = "You are using the Premium version of Skid Hub!";
            })
            loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/DragonSoulDEMO"))()
            for i, v in pairs(SkidHubPremium) do
                local scriptUrl
                if string.match(i, game.GameId) then
                    scriptUrl = "https://raw.githubusercontent.com/UniqueInsomnia/SkidHub/main/SkidHub/".. v
                else
                    scriptUrl = "https://raw.githubusercontent.com/InsomniaTM/SkidHub/main/Universal"
                end
                safeLoadScript(scriptUrl)
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
            [210213771] = "dbzfs.lua",
        }
        -- ver loader
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Status found!";
            Text = "You are using the free version of Skid Hub!";
        })
        wait(1)
        for i, v in pairs(SkidHubFree) do
            local scriptUrl
            if string.match(i, game.GameId) then
                scriptUrl = "https://raw.githubusercontent.com/UniqueInsomnia/SkidHub/main/SkidHubFree/".. v
            else
                scriptUrl = "https://raw.githubusercontent.com/InsomniaTM/SkidHub/main/Universal"
            end
            safeLoadScript(scriptUrl)
        end
    end
end
