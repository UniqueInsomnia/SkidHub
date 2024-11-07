-- locals
local library = loadstring(game:HttpGet"https://raw.githubusercontent.com/InsomniaTM/SkidHub/main/SkidHub/SkidHubLib.lua")()
local skidhub = library:Window("SkidHub",Color3.fromRGB(255, 0, 0), Enum.KeyCode.RightControl)
local main = skidhub:Tab("Main")
local misc = skidhub:Tab("Misc")
local teleports = skidhub:Tab("Teleports")
local autofarm = skidhub:Tab("Auto Farm")
local buy = skidhub:Tab("Buy")
local statchecker = skidhub:Tab("Stat Checker")
local settings = skidhub:Tab("Settings")

local EGod
local FB
local plr = game:GetService("Players").LocalPlayer
local Char = plr.Character
local Live = game:GetService("Workspace").Live
local plrs = game:GetService("Players")

-- functions
function generateRandomString(length)
    local result = ""
    for i = 1, length do
        local randNum = math.random(1, 3)
        if randNum == 1 then
            result = result .. string.char(math.random(48, 57))
        elseif randNum == 2 then
            result = result .. string.char(math.random(65, 90))
        else
            result = result .. string.char(math.random(97, 122))
        end
    end
    return result
end
--[[local guiname = generateRandomString(10)
for i, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
    if v.Name == "TabHold" then
        if v.Parent.Name == "Main" then
            if v.Parent.Parent.Name == "ui" then
                v.Parent.Parent.Name = guiname
            end
        end
    end
end]]--
function updateLabel(targetText, newText)
    for _, v in pairs(game:GetService("CoreGui")[guiname].Main.TabFolder:GetDescendants()) do
        if v:IsA("TextLabel") and string.find(v.Text, targetText) then
            v.Text = string.gsub(v.Text, targetText, newText)
            break
        end
    end
end
function findPlayerName(target)
    local targetPlayerName
    local PlayerN
    for _, player in pairs(game.Players:GetPlayers()) do
        if string.sub(string.lower(player.Name), 1, #target) == string.lower(target) then
            targetPlayerName = player.Name
            break
        end
    end
    if targetPlayerName then
        PlayerN = targetPlayerName
    end
    return PlayerN
end

main:Toggle("NoSlow",false, function(noslow)
    getgenv().nosloww = noslow
    while wait() do
        if not nosloww then break end
        game:service'RunService'.RenderStepped:connect(function(...)
            pcall(function()
              game:service'Players'.LocalPlayer.Character.Action:Destroy();
              game:service'Players'.LocalPlayer.Character.Activity:Destroy();
              game:service'Players'.LocalPlayer.Character.Killed:Destroy();
              game:service'Players'.LocalPlayer.Character.Attacking:Destroy();
            end);
        end);
        if game.Players.LocalPlayer.Character.Block.Value then
            game.Players.LocalPlayer.Character.Block.Value = false;
        end;
    end 
end)

main:Dropdown("Slot Changer", {"Slot1","Slot2","Slot3"}, function(choosenSlot)
    game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs
    ["Character Slot Changer"])
    wait(0.7)
    game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({ [1] = "Yes" })
    wait(0.7)
    game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({ [1] = "k" })
    wait(0.7)
    game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({ choosenSlot })
    wait(0.7)
    game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({ [1] = "k" })
    task.wait(0.7)
    game.Players.LocalPlayer.CharacterRemoving:Wait()
    game.Players.LocalPlayer.CharacterAdded:Wait()
    task.wait(1)
end)

main:Slider("TeleSpeed",1,14500,1, function(telespeed)
    _G.TeleSpeed_Bind = "Q"
    down = false
    velocity = Instance.new("BodyVelocity")
    velocity.maxForce = Vector3.new(10000000, 0, 10000000)
    local speed = telespeed
    gyro = Instance.new("BodyGyro")
    gyro.maxTorque = Vector3.new(10000000, 0, 10000000)
    local hum = game.Players.LocalPlayer.Character.Humanoid
    function onButton1Down(mouse)
        down = true
        velocity.Parent = game.Players.LocalPlayer.Character.UpperTorso
        velocity.velocity = (hum.MoveDirection) * speed
        gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
        while down do
            if not down then
                break
            end
            velocity.velocity = (hum.MoveDirection) * speed
            local refpos = gyro.Parent.Position +
                (gyro.Parent.Position - workspace.CurrentCamera.CoordinateFrame.p).unit * 5
            gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
            wait(0.1)
        end
    end

    function onButton1Up(mouse)
        velocity.Parent = nil
        gyro.Parent = nil
        down = false
    end

    function onSelected(mouse)
        mouse.KeyDown:connect(function(k)
            if k:upper() == _G.TeleSpeed_Bind then
                onButton1Down(mouse)
            end
        end)
        mouse.KeyUp:connect(function(k)
            if k:upper() == _G.TeleSpeed_Bind then
                onButton1Up(mouse)
            end
        end)
    end

    onSelected(game.Players.LocalPlayer:GetMouse())
end)

main:Toggle("Stay in Form", function(StayInForm)
    if StayinForm == true then
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("SaiyanAuraWeak") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.SaiyanAuraWeak:Destroy()
        end

        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MajinParticle") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.MajinParticle:Destroy()
        end

        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Lightning2") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Lightning2:Destroy()
        end

        if game.Players.LocalPlayer.Character:FindFirstChild("SaiyanHair") then
            game.Players.LocalPlayer.Character.SaiyanHair:Destroy()
        end

        if game.Players.LocalPlayer.Character.Head:FindFirstChild("Tatoo") then
            game.Players.LocalPlayer.Character.Head.Tatoo:Destroy()
        end

        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MajinAura") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.MajinAura:Destroy()
        end
    else
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
end)

main:Toggle("Anti Grab",false, function(antigrab)
    val = antigrab
    while val do
        if not val then break end
        if not game:GetService("Workspace").Live[game.Players.LocalPlayer.Name]:FindFirstChild('MoveStart') then
            repeat
                wait()
            until
                game:GetService("Workspace").Live[game.Players.LocalPlayer.Name]:FindFirstChild('MoveStart')
        else
            if game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].MoveStart then
                if game.PlaceId == 536102540 then
                    if game.Workspace.Live[game.Players.LocalPlayer.Name].Race.Value == "Saiyan" or "Android" or "Human" then
                        for i = 1, 18 do
                            local args = {
                                [1] = workspace.FriendlyNPCs:FindFirstChild("Hair Stylist")
                            }
                            game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(unpack(
                                args))
                        end
                        wait(.3)
                        for i = 1, 78 do
                            local args = {
                                [1] = {
                                    [1] = "Yes"
                                }
                            }
                            game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer(
                                unpack(args))
                        end
                        wait(.3)
                        local args = {
                            [1] = "woah"
                        }
                        game:GetService("Players").LocalPlayer.Backpack.HairScript.RemoteEvent:FireServer(unpack(
                            args))
                        oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        teleporter = game:GetService('RunService').RenderStepped:Connect(function()
                            pcall(function()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
                            end)
                        end)
                        wait(3)
                        teleporter:Disconnect()
                    end
                end
            end
        end
    end
end)

main:Toggle("Rainbow Hair Godmode",false, function(RHGOD)
    if RHGOD == true then
        game.Workspace.Live[plr.name].Parent = game.Workspace.Effects
        wait()
        local args1 = game:GetService("Workspace").FriendlyNPCs["Hair Stylist"]
        game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(args1)
        wait(0.30)
        local args = {
            [1] = {
                [1] = "Yes",
            },
        }
        game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer(unpack(args))

        game:GetService("RunService").RenderStepped:connect(function()
            game:GetService("Players").LocalPlayer.PlayerGui.Setup.Enabled = false
            game:GetService("Players").LocalPlayer.Backpack.HairScript.RemoteEvent:FireServer(
                game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.HairColor, "up")
            game:GetService("Players").LocalPlayer.Backpack.HairScript.RemoteEvent:FireServer(
                game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.Skin, "up")
            game:GetService("Players").LocalPlayer.Backpack.HairScript.RemoteEvent:FireServer(
                game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.Hair, "up")
        end)
    else
        plr.Character:BreakJoints()
    end
end)

main:Toggle("Earth Godmode", function(Earth_Godmode)
    if Earth_Godmode == true then
        local God = game.Workspace.Touchy.Part
        local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
        EGod = game:GetService("RunService").RenderStepped:Connect(function()
            firetouchinterest(Root, God, 0)
            firetouchinterest(Root, God, 1)
            if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Popup") then
                game.Players.LocalPlayer.PlayerGui.Popup:Destroy()
            end
        end)
    else
        EGod:Disconnect()
        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Popup") then
            game.Players.LocalPlayer.PlayerGui.Popup:Destroy()
        end
    end
end)

main:Button("God / UI / MUI", function()
    game:GetService("ReplicatedStorage").ResetChar:FireServer() repeat task.wait() until not plr.Character or plr.Character.Humanoid.Health < 1.1 for _ = 1,20,1 do plr.Backpack.ServerTraits.Input:FireServer({"decrease"}, true) end task.wait(.2) if plr.Character:FindFirstChild("Killed") and plr.Character:FindFirstChild("Action") then plr.Character.Killed:Destroy() plr.Character.Action:Destroy() end plr.Backpack.ServerTraits.Transform:FireServer("h") plr.Backpack.ServerTraits.Transform:FireServer("g") for _ = 1,20,1 do plr.Backpack.ServerTraits.Input:FireServer({"increase"}, true) end
end)

main:Button("Ranked/HTC Godmode", function(RGod)
    Char.Stats["Phys-Resist"]:Destroy()
    Char.Stats["Ki-Resist"]:Destroy()
end)

misc:Toggle("TOP Respawn", function(TOPRespawn)
    while TOPRespawn do
        if game.Players.LocalPlayer.Character:FindFirstChild("SuperAction") then
            game.Players.LocalPlayer.Character("SuperAction"):Destroy()
        end
    end
end)

misc:Slider("FOV",1,120,70, function(desiredfov)
    game:GetService'Workspace'.Camera.FieldOfView = desiredfov
end)

misc:Button("No Flying Ki Drain", function()
    local metatable = getrawmetatable(game)
    local namecall = metatable.__namecall
    setreadonly(metatable, false)

    metatable.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" and self.Name == "Super" then
            return nil
        end
        return namecall(self, ...)
    end)
end)

misc:Button("Wing/Halo Remover", function()
    if game.Players.LocalPlayer.Character:FindFirstChild("RebirthWings") then
        game.Players.LocalPlayer.Character.RebirthWings:Destroy()
    elseif game.Players.LocalPlayer.Character:FindFirstChild("RealHalo") then
        game.Players.LocalPlayer.Character.RealHalo:Destroy()
    end
end)

misc:Button("Level Remove", function()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for i, model in pairs(character:GetChildren()) do
        if string.match(model.Name, "Lvl") then
            model:Destroy()
            break
        end
    end
end)

misc:Button("Naked", function()
    game.Players.LocalPlayer.Character.Shirt:Destroy()
    game.Players.LocalPlayer.Character.Pants:Destroy()
end)

misc:Button("Remove Aura", function()
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("TempAura") or game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Lightning") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.TempAura:Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Lightning:Destroy()
    end
end)

teleports:Button("Earth", function()
    game:GetService("TeleportService"):Teleport(536102540, game.Players.LocalPlayer)
end)
teleports:Button("Namek", function()
    game:GetService("TeleportService"):Teleport(882399924, game.Players.LocalPlayer)
end)
teleports:Button("Space", function()
    game:GetService("TeleportService"):Teleport(478132461, game.Players.LocalPlayer)
end)
teleports:Button("Future", function()
    game:GetService("TeleportService"):Teleport(569994010, game.Players.LocalPlayer)
end)
teleports:Button("Secret World", function()
    game:GetService("TeleportService"):Teleport(2046990924, game.Players.LocalPlayer)
end)
teleports:Button("Queue World", function()
    game:GetService("TeleportService"):Teleport(3565304751, game.Players.LocalPlayer)
end)
teleports:Button("HTC", function()
    game:GetService("TeleportService"):Teleport(882375367, game.Players.LocalPlayer)
end)
teleports:Button("Zaros", function()
    game:GetService("TeleportService"):Teleport(2651456105, game.Players.LocalPlayer)
end)
teleports:Button("Heaven", function()
    game:GetService("TeleportService"):Teleport(3552157537, game.Players.LocalPlayer)
end)
teleports:Button("South City", function()
    local tweenservice = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character

    local tweeninfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
    local cframe = { CFrame = CFrame.new( -456.616272, 24.4875565, -6411.93945, 1, 0, 0, 0, 1, 0, 0, 0, 1) }
    tweenservice:Create(char.HumanoidRootPart, tweeninfo, cframe):Play()
end)
teleports:Button("West City", function()
    local tweenservice = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character

    local tweeninfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
    local cframe = { CFrame = CFrame.new( -570.783386, 19.4874763, -2884.49414, 1, 0, 0, 0, 1, 0, 0, 0, 1) }
    tweenservice:Create(char.HumanoidRootPart, tweeninfo, cframe):Play()
end)
teleports:Button("Korin Tower", function()
    local tweenservice = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character

    local tweeninfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
    local cframe = {
        CFrame = CFrame.new(2036.96008, 1493.73865, -2287.70313, -0.560825825, 0.219532698, -0.798298001, -0.391403764, -0.919956446, 0.0219828039, -0.729573488, 0.324785352, 0.601861298) }
    tweenservice:Create(char.HumanoidRootPart, tweeninfo, cframe):Play()
end)
teleports:Button("Central City", function()
    local tweenservice = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character

    local tweeninfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
    local cframe = { CFrame = CFrame.new( -3834.28442, 19.4875641, -1428.18091, 1, 0, 0, 0, 1, 0, 0, 0, 1) }
    tweenservice:Create(char.HumanoidRootPart, tweeninfo, cframe):Play()
end)
teleports:Button("Goku's House", function()
    local tweenservice = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character

    local tweeninfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
    local cframe = { CFrame = CFrame.new( -5946.98193, 18.687664, -4229.69336, 1, 0, 0, 0, 1, 0, 0, 0, 1) }
    tweenservice:Create(char.HumanoidRootPart, tweeninfo, cframe):Play()
end)
teleports:Button("Broly Pad", function()
    local tweenservice = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character

    local tweeninfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
    local cframe = { CFrame = CFrame.new(2751.67725, 3944.85986, -2272.62622) }
    tweenservice:Create(char.HumanoidRootPart, tweeninfo, cframe):Play()
end)
teleports:Button("TOP Pad", function()
    local tweenservice = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character

    local tweeninfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
    local cframe = { CFrame = CFrame.new(2508.15, 3945.41, -2029.8) }
    tweenservice:Create(char.HumanoidRootPart, tweeninfo, cframe):Play()
end)
teleports:Button("Hard TOP Pad", function()
    local tweenservice = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character

    local tweeninfo = TweenInfo.new(2, Enum.EasingStyle.Quad)
    local cframe = { CFrame = CFrame.new(2510.97656, 3944.75, -2527.53125) }
    tweenservice:Create(char.HumanoidRootPart, tweeninfo, cframe):Play()
end)

autofarm:Toggle("Autofarm",false, function(farmm)
    while farmm do
        local npcs = {
            [1] = "Evil Saiyan",
            [2] = "Chi",
            [3] = "Kick",
            [4] = "Saibab",
            [5] = "Saibam",
            [6] = "Super Elite Frieza Soldier",
            [7] = "Rogue Namek",
            [8] = "Executive Frieza Soldier",
            [9] = "Frieza Soldier",
            [10] = "Strong Frieza Soldier",
            [11] = "Frost Demon",
            [12] = "Zarbon",
            [13] = "Strong Frost Demon",
            [14] = "Elite Frieza Soldier",
            [15] = "Recruit Frieza Soldier",
            [16] = "Gorgolian Elite",
            [17] = "Gorgolian",
            [18] = "Kachukian",
            [19] = "Zentarian",
            [20] = "Evil Yardrat",
            [21] = "Zentarian Android",
            [22] = "Oriodian Exectuive",
            [23] = "Oriodian",
            [24] = "Fishmanian",
            [25] = "Evil Saiyan {SSJ3}",
            [26] = "Kaioken Master",
            [27] = "Femiatin",
            [28] = "Evil Saiyan {SSJ2}",
            [29] = "Ultra Elite Frieza Solider",
            [30] = "Rogue Namek",
            [31] = "Rogue Namek Captain",
            [32] = "Double Eye",
            [33] = "Runt",
            [34] = "Tenta",
            [35] = "Armored Runt",
            [36] = "Brainiac",
            [37] = "Speed",
            [38] = "Foot Soldier",
            [39] = "Hexad",
            [40] = "Stinker",
            [41] = "Corruption",
        }
        
        local function load(loadobj)
            repeat wait() until(loadobj)
        end
        
        local function dist(v1, v2)
            return(v1 - v2).Magnitude
        end
        
        local function kill(path, obj)
            for i, v in ipairs(path) do
                if v.Name == obj then
                    v:Destroy()
                end
            end
        end
        
        local function twn(char, time, coords)
            game:GetService("TweenService"):Create(char, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = coords}):Play()
        end
        
        local tnpc = {}
        local function getnpc(NpcName)
            tnpc = {}
            if NpcName ~= "" then
                local lower = NpcName:lower()
                for i, npc in next, game.workspace.Live:GetChildren() do
                    if npc.Name:sub(1, #NpcName):lower() == lower then
                        if not npc:FindFirstChild("PowerOutput") then
                            table.insert(tnpc, npc)
                        end
                    end
                end
            end
        end
        
        load(game:IsLoaded())
        load(game.Players.LocalPlayer.Character)
        local plr = game.Players.LocalPlayer
        local cam = game.workspace.CurrentCamera
        load(plr.Character:FindFirstChild("Block"))
        
        local part = Instance.new("Part", game.workspace)
        part.Anchored = true
        part.Transparency = 1
        while wait() do
            part.Position = plr.Character.HumanoidRootPart.CFrame * Vector3.new(0, -3, 0)
            for i, v in ipairs(npcs) do
                getnpc(v)
                for i2, idk in ipairs(tnpc) do
                    if idk:FindFirstChild("Humanoid") and idk.Humanoid.Health > 0 then
                        repeat wait()
                            local distance = dist(plr.Character.HumanoidRootPart.Position, idk.HumanoidRootPart.Position)
                            if distance > 50000 then
                                DoIBreak2 = true
                                break
                            end
                            twn(plr.Character.HumanoidRootPart, distance/4500, idk.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                            wait(distance/4400)
                        until(distance < 500)
                        DoIBreak = false
                        coroutine.wrap(function()
                            repeat
                                if DoIBreak or DoIBreak2 then
                                    break
                                end
                                plr.Backpack.ServerTraits.Input:FireServer({[1] = "md"},CFrame.new(0,0,0),nil,false)
                                wait(.4 - math.random())
                            until(DoIBreak or DoIBreak2)
                        end){}
                        repeat wait()
                            if not game.workspace.Live:FindFirstChild(idk.Name) then
                                break
                            end
                            if DoIBreak2 then
                                DoIBreak2 = false
                                break
                            end
                            plr.Character.HumanoidRootPart.CFrame = idk.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                            cam.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(idk.HumanoidRootPart.Position.X, plr.Character.HumanoidRootPart.Position.Y, idk.HumanoidRootPart.Position.Z)) * CFrame.new(0, 2, 10)
                        until(not game.workspace.Live:FindFirstChild(idk.Name) or idk.Humanoid.Health <= 0)
                        DoIBreak = true
                    end
                end
            end
        end
    end
end)

autofarm:Toggle("Beanspam",false, function(spammingbeans)
    if spammingbeans then
        while task.wait() do
            game.Players.LocalPlayer.Backpack.ServerTraits.EatSenzu:FireServer("")
        end
    end
end)

autofarm:Button("Do All", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/DoAll.lua"))()
end)
autofarm:Button("Do Bulma Quest", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/BulmaQuest.lua"))()
end)
autofarm:Button("Do Trunks Quest", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/TrunksFuture.lua"))()
end)
autofarm:Button("Do Namek Ship Quest", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/NamekSpaceShip.lua"))()
end)
autofarm:Button("Do Korin Tower Quest", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/KorinDrink.lua"))()
end)
autofarm:Button("Get Elder Kai Once", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/ElderKaiOnce.lua"))()
end)

buy:Dropdown("Buy Beans", {"Green","Red","Blue","Yellow"}, function(beanColor)
    while wait() do
        local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
        Event:FireServer(A_1)
        wait(0.3)
        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "Beans"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "80"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)
        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = beanColor
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)
        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "Yes"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)
    end
end)

buy:Dropdown("Buy Jars", {"Green","Red","Blue","Yellow"}, function(jarColor)
    while wait() do
        local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
        Event:FireServer(A_1)
        wait(0.3)
        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "Jars"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "80"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)
        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = jarColor
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)
        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "Yes"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)

        local A_1 = {
            [1] = "k"
        }
        local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
        Event:FireServer(A_1)
        wait(0.3)
    end
end)

buy:Button("MSSJB, CSSJB, SSJBE", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Complete Super Saiyan Blue")
end)
buy:Button("Super Saiyan 4", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("SSJ4")
end)
buy:Button("Cooler Form", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Cooler Form")
end)
buy:Button("Golden Cooler", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Golden Cooler")
end)
buy:Button("Kaioken x100", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("KaioKenx100")
end)
buy:Button("Dark Human", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Dark Human")
end)
buy:Button("Despair", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Despair")
end)
buy:Button("Demon Namekian", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Demon Namekian")
end)
buy:Button("White Namekian", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("White Namek")
end)
buy:Button("Dark Majin", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Dark Majin")
end)
buy:Button("Unstable", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Unstable")
end)
buy:Button("Mastered Ultra Instinct", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Mastered Ultra Instinct")
end)
buy:Button("God Evade", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("God Evade")
end)
buy:Button("God Punch", function()
    game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("God Punch")
end)

statchecker:Textbox("Stat Checker", true, function(Target)
    local PlayerN = findPlayerName(Target)
    local stats = {
        Na = game.Workspace.Live[PlayerN].Name,
        Ra = game.Workspace.Live[PlayerN].Race.Value,
        Hp = game.Workspace.Live[PlayerN].Stats["Health-Max"].Value,
        Ki = game.Workspace.Live[PlayerN].Stats["Ki-Max"].Value,
        MD = game.Workspace.Live[PlayerN].Stats["Phys-Damage"].Value,
        KD = game.Workspace.Live[PlayerN].Stats["Ki-Damage"].Value,
        MR = game.Workspace.Live[PlayerN].Stats["Phys-Resist"].Value,
        KR = game.Workspace.Live[PlayerN].Stats["Ki-Resist"].Value,
        SP = game.Workspace.Live[PlayerN].Stats["Speed"].Value,
    }
    updateLabel("Name:", "Name: " .. stats.Na)
    updateLabel("Race:", "Race: " .. stats.Ra)
    updateLabel("Health:", "Health: " .. stats.Hp)
    updateLabel("Ki:", "Ki: " .. stats.Ki)
    updateLabel("Melee:", "Melee: " .. stats.MD)
    updateLabel("Ki Dmg:", "Ki Dmg: " .. stats.KD)
    updateLabel("MeleeRes:", "MeleeRes: " .. stats.MR)
    updateLabel("KiRes:", "KiRes: " .. stats.KR)
    updateLabel("Speed:", "Speed: " .. stats.SP)
end)

statchecker:Label("Name: ")
statchecker:Label("Race: ")
statchecker:Label("Health: ")
statchecker:Label("Ki: ")
statchecker:Label("Melee: ")
statchecker:Label("Ki Dmg: ")
statchecker:Label("MeleeRes: ")
statchecker:Label("KiRes: ")
statchecker:Label("Speed: ")

settings:Button("Destroy UI", function()
    game:GetService("CoreGui").ui:Destroy()
end)

settings:Colorpicker("Change UI Color",Color3.fromRGB(44, 120, 224), function(t)
    library:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)
