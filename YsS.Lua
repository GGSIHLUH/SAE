-- [[ YSS HUB | CUSTOM OPENING & LOADER ]]
-- DEV: GG SIH LUH | YouTube: yys_hub

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer

local function makeGui(name)
    local gui = Instance.new("ScreenGui")
    gui.Name = name
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 99999

    if syn and syn.protect_gui then
        pcall(syn.protect_gui, gui)
    end

    local candidates = {
        function() return gethui and gethui() end,
        function() return CoreGui end,
        function() return LP:WaitForChild("PlayerGui", 5) end,
    }
    for _, getParent in ipairs(candidates) do
        local ok, p = pcall(getParent)
        if ok and p then
            local ok2 = pcall(function() gui.Parent = p end)
            if ok2 and gui.Parent == p then return gui end
        end
    end
    return gui
end

local gui = makeGui("YSS_Opening")

-- 1. FRAME UTAMA (LATAR HITAM)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = gui

-- 2. LOGO BUNGA DI AWAL (❀)
local logoLabel = Instance.new("TextLabel")
logoLabel.Name = "LogoLabel"
logoLabel.Size = UDim2.new(0, 150, 0, 150)
logoLabel.AnchorPoint = Vector2.new(0.5, 0.5)
logoLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
logoLabel.BackgroundTransparency = 1
logoLabel.Text = "☯️"
logoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
logoLabel.TextSize = 25
logoLabel.Font = Enum.Font.FredokaOne
logoLabel.Parent = mainFrame

-- Fade in background hitam
TweenService:Create(mainFrame, TweenInfo.new(0.8), {BackgroundTransparency = 0}):Play()

-- Animasi Muter & Makin Besar selama 5 Detik
local rotConn
local tickStart = tick()
rotConn = RunService.RenderStepped:Connect(function()
    local elapsed = tick() - tickStart
    if elapsed <= 5 then
        logoLabel.Rotation = logoLabel.Rotation + 4
        local scaleFactor = 25 + (elapsed * 45)
        logoLabel.TextSize = math.clamp(scaleFactor, 25, 280)
    else
        if rotConn then rotConn:Disconnect() end
    end
end)

-- Setelah 5 Detik: Logo Hilang, Muncul Teks & Tombol
task.delay(5, function()
    if rotConn then rotConn:Disconnect() end
    TweenService:Create(logoLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    task.wait(0.3)
    logoLabel.Visible = false

    -- Tulisan di Tengah: 「❀」│᭙ꫀꪶꪫꪮꪑꫀ┆🌸
    local centerText = Instance.new("TextLabel")
    centerText.Name = "CenterText"
    centerText.Size = UDim2.new(0, 600, 0, 50)
    centerText.AnchorPoint = Vector2.new(0.5, 0.5)
    centerText.Position = UDim2.new(0.5, 0, 0.35, 0)
    centerText.BackgroundTransparency = 1
    centerText.Text = "「❀」│᭙ꫀꪶꪫꪮꪑꫀ┆🌸"
    centerText.TextColor3 = Color3.fromRGB(255, 255, 255)
    centerText.TextSize = 22
    centerText.Font = Enum.Font.FredokaOne
    centerText.TextTransparency = 1
    centerText.Parent = mainFrame
    TweenService:Create(centerText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

    -- Tombol 1: THE SCRIPT HAS READY CLIK FOR EXECUTE
    local btnReady = Instance.new("TextButton")
    btnReady.Name = "BtnReady"
    btnReady.Size = UDim2.new(0, 380, 0, 45)
    btnReady.AnchorPoint = Vector2.new(0.5, 0.5)
    btnReady.Position = UDim2.new(0.5, 0, 0.52, 0)
    btnReady.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
    btnReady.TextColor3 = Color3.fromRGB(255, 255, 255) -- Warna teks putih bersih
    btnReady.TextSize = 12
    btnReady.Font = Enum.Font.FredokaOne
    btnReady.Text = "THE SCRIPT HAS READY CLIK FOR EXECUTE"
    btnReady.AutoButtonColor = false
    btnReady.BackgroundTransparency = 1
    btnReady.TextTransparency = 1
    btnReady.Parent = mainFrame
    Instance.new("UICorner", btnReady).CornerRadius = UDim.new(0, 8)
    
    TweenService:Create(btnReady, TweenInfo.new(0.5), {BackgroundTransparency = 0, TextTransparency = 0}):Play()

    -- Tombol 2: Not Thanks I mean the script is Not good (Teks diubah jadi putih terang)
    local btnNotGood = Instance.new("TextButton")
    btnNotGood.Name = "BtnNotGood"
    btnNotGood.Size = UDim2.new(0, 380, 0, 40)
    btnNotGood.AnchorPoint = Vector2.new(0.5, 0.5)
    btnNotGood.Position = UDim2.new(0.5, 0, 0.63, 0)
    btnNotGood.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btnNotGood.TextColor3 = Color3.fromRGB(255, 255, 255) -- Warna teks putih bersih
    btnNotGood.TextSize = 12
    btnNotGood.Font = Enum.Font.FredokaOne
    btnNotGood.Text = "Not Thanks I mean the script is Not good"
    btnNotGood.AutoButtonColor = false
    btnNotGood.BackgroundTransparency = 1
    btnNotGood.TextTransparency = 1
    btnNotGood.Parent = mainFrame
    Instance.new("UICorner", btnNotGood).CornerRadius = UDim.new(0, 8)

    TweenService:Create(btnNotGood, TweenInfo.new(0.5), {BackgroundTransparency = 0.2, TextTransparency = 0}):Play()

    -- Fungsi Animasi Keluar: Semua Unsur Menghilang ke Atas
    local function slideUpAndDestroy()
        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        
        TweenService:Create(centerText, tweenInfo, {Position = UDim2.new(0.5, 0, -0.3, 0)}):Play()
        TweenService:Create(btnReady, tweenInfo, {Position = UDim2.new(0.5, 0, -0.2, 0)}):Play()
        TweenService:Create(btnNotGood, tweenInfo, {Position = UDim2.new(0.5, 0, -0.1, 0)}):Play()
        
        local fadeBg = TweenService:Create(mainFrame, TweenInfo.new(0.6), {BackgroundTransparency = 1})
        fadeBg:Play()

        fadeBg.Completed:Connect(function()
            gui:Destroy()
        end)
    end

    -- Event Tombol Execute (Load script utama dari GitHub kamu)
    btnReady.MouseButton1Click:Connect(function()
        slideUpAndDestroy()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GGSIHLUH/STEAL-AN-EGG-FARMING/refs/heads/main/V10YSS.Lua"))()
        end)
    end)

    -- Event Tombol Cancel
    btnNotGood.MouseButton1Click:Connect(function()
        slideUpAndDestroy()
    end)
end)
