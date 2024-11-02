------------------- Scripts starts here ------------------------

-- functions --

local function sendNotification(Title: string, Text: string, Duration: number?): ()
    game:GetService('StarterGui'):SetCore('SendNotification', {
        Title = Title,
        Text = Text or '',
        Duration = Duration}
    )
end

local function kill(path, object): ()
    for i, v in ipairs(path:GetChildren()) do
        if v.Name == object then
            v:Destroy()
            return true
        end
    end
end

--

if game.PlaceId ~= 552500546 then
    if game.PlaceId ~= 536102540 then
        game:GetService('TeleportService'):Teleport(536102540)
    end
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local virtualUser = game:GetService("VirtualUser")
local plr = game:GetService('Players').LocalPlayer
local gui = plr:WaitForChild('PlayerGui')


-- anti afk --
plr.Idled:Connect(function()
    virtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    virtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- anti kick --
game:GetService('RunService').Stepped:Connect(function()
    if game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)

-- blue screen fix --
local bool: boolean = false
task.spawn(function()
    task.spawn(function()

        task.wait(10)
        if not bool then
            if plr.Character then task.wait(30) end
            if not bool then
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end
    end)

    plr.CharacterAdded:Wait()
    bool = true
end)

-- reset place --
if game.PlaceId == 552500546 then
    local setup = gui:waitForChild('Setup')
    local frame = setup:WaitForChild('Frame')

    repeat task.wait() until plr.Backpack:FindFirstChild('Scripter')
    local event: RemoteEvent = plr.Backpack.Scripter:waitForChild('RemoteEvent')

    repeat task.wait()
        if frame.Side:FindFirstChild('Race') then
            event:FireServer(frame.Side.Race, 'up')
            task.wait(2)
        end
    until frame.Side.Race.Set.Texter.Text == 'Namekian'

    event:FireServer('woah')
end


-- earth --
sendNotification("Insomnia's Inf Stat", 'Discord: real.insomnia')

local wiping: boolean = false
local killnpcs: boolean = true
local nextPhase: boolean = false
local leveling: boolean = false

local function doStuff(): ()
    print(0)
    local npcs: Folder = workspace:WaitForChild('FriendlyNPCs')
    local kami: Model = npcs:FindFirstChild('KAMI')
    print(1)
    repeat
        task.wait()
    until plr:FindFirstChild('Backpack') and plr.Backpack:FindFirstChild('ServerTraits')
    local serverTraits: Folder = plr.Backpack.ServerTraits
    local chatS: RemoteEvent = serverTraits.ChatStart
    local chatA: RemoteEvent = serverTraits.ChatAdvance
    print(2)
    local char: Model = plr.Character or plr.CharacterAdded:Wait()
    repeat
        task.wait()
    until char:FindFirstChild('HumanoidRootPart') and char:FindFirstChild('Race')
    print(3)
    local hrp: Part = char.HumanoidRootPart
    local race: StringValue = char.Race
    print(4)
    local hud = gui:WaitForChild('HUD')
    local bottom = hud:WaitForChild('Bottom')
    local stat = bottom:WaitForChild('Stats')
    local chatGui = bottom:WaitForChild('ChatGui')
    local chatLabel: TextLabel = chatGui:WaitForChild('TextLabel')
    print(5)
    stat.Visible = true

    local function speedChat(args: {[number]: string}, text: string, waitTime: number?): ()
        repeat
            chatA:FireServer(args)
            task.wait(waitTime)
        until not gui:FindFirstChild('HUD') or chatLabel.Text == text
    end

    if race.Value == 'Namekian' then
        if wiping or not kami then
            sendNotification('Wiping..')

            chatS:FireServer(npcs['Start New Game [Redo Character]'])

            speedChat({[1] = 'Yes'}, 'This will cause all your stats to dissapear')
            speedChat({[1] = 'k'}, 'Are you sure?')
            speedChat({[1] = 'Yes'}, "Alright Let's do it!")
        end
        if wiping then return end

        if tonumber(plr.PlayerGui.HUD.Bottom.Stats.Speed.Val.Text) < 25 then
            print('leveling up')
            leveling = true
            if killnpcs then
                killnpcs = false
                kill(npcs, 'Quest Giver')
                kill(npcs, 'Quest Giver')
            end

            chatS:FireServer(npcs['Bulma'])
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'Yes'})
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            task.wait(1.3)
            chatS:FireServer(npcs['Spaceship'])
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'No'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.7)
            chatS:FireServer(npcs['Trunks [Future]'])
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'Yes'})
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            task.wait(1.3)
            chatS:FireServer(npcs['TimeMachine'])
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'No'})
            task.wait(.7)
            chatS:FireServer(npcs['Quest Giver'])
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'Yes'})
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            task.wait(1.3)
            chatS:FireServer(npcs['NamekianShip'])
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'No'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.5)
            chatS:FireServer(npcs['Elder Kai'])
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'Yes'})
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatS:FireServer(npcs['Korin'].Chat.Chat)
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'k'})
            task.wait(.35)
            chatA:FireServer({[1] = 'DRINK'})
            task.wait(1)
            char:BreakJoints()
            task.wait(3)
            leveling = false
        else
            chatS:FireServer(npcs:FindFirstChild('Character Slot Changer'))

            speedChat({[1] = 'Yes'}, 'Alright')
            speedChat({[1] = 'k'}, 'Which slot would you like to play in?')
            speedChat({[1] = Slots.PointSlot}, 'Loading!', .2)
            task.wait(.13)
            chatS:FireServer(kami.Chat)
            chatA:FireServer({[1] = 'k'})

            task.wait(.1)

            if chatLabel.Text == 'Mr Popo is a nice guy' then
                wiping = true
            end

            if not kami then
                wiping = true
            end


            task.spawn(function()
                if wiping then return end
                if chatLabel.Text ~= "Alright let's do it" then return end

                if not hrp:FindFirstChild('Booster') then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                else
                    print('good')
                end
            end)
        end

    else
        if wiping then
            sendNotification('Wiping your namekian slot..')
        end
        chatS:FireServer(npcs:FindFirstChild('Character Slot Changer'))

        speedChat({[1] = 'Yes'}, 'Alright')
        speedChat({[1] = 'k'}, 'Which slot would you like to play in?')
        speedChat({[1] = Slots.NamekianSlot}, 'Loading!', .1)
    end

    nextPhase = true
end

while true do
    nextPhase = false
    task.spawn(doStuff)

    task.spawn(function()
        local t = os.time()
        repeat task.wait()
            if nextPhase then
                return
            end
        until os.time() - t >= 4
        if leveling then
            return
        end

        plr.Character:BreakJoints()
        nextPhase = true
    end)

    repeat
        task.wait()
    until nextPhase

    task.wait(3.5)
end
