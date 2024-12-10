e GodMode
        disableGodMode()
    end
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local Plr = Players.LocalPlayer
local Clipon = false
local ESPEnabled = false
local GodModeEnabled = false

-- Noclip GUI Setup
Noclip.Name = "Noclip"
Noclip.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(144, 238, 144)
Title.BorderColor3 = Color3.new(255, 0, 0)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "!Tky Noclip"
Title.TextColor3 = Color3.new(255, 0, 0)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(144, 238, 144)
Toggle.BorderColor3 = Color3.new(255, 0, 0)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "Ấn Để Bật/Tắt"
Toggle.TextColor3 = Color3.new(255, 0, 0)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0, 0, 0)
Toggle.TextStrokeTransparency = 0

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "Đang Tắt"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left

Credit.Name = "Credit"
Credit.Parent = BG
Credit.BackgroundColor3 = Color3.new(255, 255, 255)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.195238099, 0, 0.866141737, 0)
Credit.Size = UDim2.new(0, 128, 0, 17)
Credit.Font = Enum.Font.SourceSans
Credit.FontSize = Enum.FontSize.Size18
Credit.Text = "Developer By Tunx"
Credit.TextColor3 = Color3.new(255, 255, 255)
Credit.TextSize = 18
Credit.TextStrokeColor3 = Color3.new(255, 0, 0)
Credit.TextStrokeTransparency = 0
Credit.TextWrapped = true

-- Enable GodMode (Immortality)
local function enableGodMode()
    local humanoid = Plr.Character and Plr.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Health = humanoid.MaxHealth
        humanoid.HealthChanged:Connect(function()
            if humanoid.Health < humanoid.MaxHealth then
                humanoid.Health = humanoid.MaxHealth -- Prevent damage by restoring health immediately
            end
        end)
    end
end

-- Disable GodMode (Reset health change)
local function disableGodMode()
    local humanoid = Plr.Character and Plr.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.HealthChanged:Disconnect() -- Disconnect the health change listener
    end
end

-- Function to apply Chams to a player
local function applyChams(player)
    if player.Character then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                local chams = Instance.new("BoxHandleAdornment")
                chams.Size = part.Size
                chams.Adornee = part
                chams.AlwaysOnTop = true
                chams.ZIndex = 10
                chams.Transparency = 0.5  -- 50% trong suốt
                chams.Color3 = Color3.new(1, 0, 0)  -- Màu đỏ
                chams.Parent = part
            end
        end
    end
end

-- Function to create ESP
local function createESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local nameTag = Instance.new("BillboardGui")
        nameTag.Parent = player.Character
        nameTag.Adornee = player.Character:WaitForChild("HumanoidRootPart")
        nameTag.Size = UDim2.new(0, 200, 0, 50)
        nameTag.StudsOffset = Vector3.new(0, 3, 0)
        nameTag.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Parent = nameTag
        textLabel.BackgroundTransparency = 1
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Text = player.Name
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.Font = Enum.Font.Highway
        textLabel.TextSize = 20
        textLabel.TextStrokeTransparency = 0
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    end
end

-- Function to remove Chams and ESP
local function removeChamsAndESP(player)
    if player.Character then
        -- Xóa Chams
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                for _, adornment in pairs(part:GetChildren()) do
                    if adornment:IsA("BoxHandleAdornment") then
                        adornment:Destroy()
                    end
                end
            end
        end
        -- Xóa ESP
        for _, v in pairs(player.Character:GetChildren()) do
            if v:IsA("BillboardGui") then
                v:Destroy()
            end
        end
    end
end

-- Toggle Noclip, ESP, Chams, and GodMode functionality
Toggle.MouseButton1Click:Connect(function()
    if Status.Text == "Đang Tắt" then
        Clipon = true
        ESPEnabled = true
        GodModeEnabled = true
        Status.Text = "Đang Mở"
        Status.TextColor3 = Color3.new(0, 185, 0)

        -- Enable ESP và Chams
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Plr then
                applyChams(player)
                createESP(player)
            end
            -- Ensure Chams and ESP are applied when player respawns or joins
            player.CharacterAdded:Connect(function()
                wait(1)
                applyChams(player)
                createESP(player)
            end)
        end

        -- Enable Noclip
        game:GetService("RunService").Stepped:Connect(function()
            if Clipon then
                for _, part in pairs(Plr.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)

        -- Enable GodMode (Immortality)
        enableGodMode()

    else
        Clipon = false
        ESPEnabled = false
        GodModeEnabled = false
        Status.Text = "Đang Tắt"
        Status.TextColor3 = Color3.new(170, 0, 0)

        -- Disable ESP và Chams
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Plr then
                removeChamsAndESP(player)
            end
        end
        
        -- Disable GodMode
        disableGodMode()
    end
end)end)
