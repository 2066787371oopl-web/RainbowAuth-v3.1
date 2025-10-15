-- 🌈 RainbowAuth v3.1 - 手机优化版
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local UserName = LocalPlayer.Name
local WHITELIST = {"xingcan01","wwwwwwwwtsg","玩家3"}
local GROUP_ID = "615109797"
local SCRIPT_URL = "https://raw.githubusercontent.com/dashabi888/dbznkzbznzj/78356f1e27b680ed209da7e7aee3007b2a38ff89/%EF%BC%88%E7%9C%9F%EF%BC%89.txt"
local RainbowColors = {Color3.fromRGB(255,0,0),Color3.fromRGB(255,127,0),Color3.fromRGB(255,255,0),Color3.fromRGB(0,255,0),Color3.fromRGB(0,0,255),Color3.fromRGB(75,0,130),Color3.fromRGB(148,0,211)}
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")
local StatusLabel = Instance.new("TextLabel")
local GroupButton = Instance.new("TextButton")
ScreenGui.Name = "RainbowAuth";ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui");ScreenGui.ResetOnSpawn = false
MainFrame.Name = "MainFrame";MainFrame.Parent = ScreenGui;MainFrame.BackgroundColor3 = Color3.fromRGB(25,25,25);MainFrame.BorderSizePixel = 0;MainFrame.Position = UDim2.new(0.5,-175,0.5,-100);MainFrame.Size = UDim2.new(0,350,0,200);MainFrame.Active = true;MainFrame.Draggable = true
local Corner = Instance.new("UICorner");Corner.CornerRadius = UDim.new(0,15);Corner.Parent = MainFrame
CloseButton.Name = "CloseButton";CloseButton.Parent = MainFrame;CloseButton.BackgroundColor3 = Color3.fromRGB(255,85,85);CloseButton.Position = UDim2.new(1,-30,0,10);CloseButton.Size = UDim2.new(0,20,0,20);CloseButton.Font = Enum.Font.GothamBold;CloseButton.Text = "✕";CloseButton.TextColor3 = Color3.fromRGB(255,255,255);CloseButton.TextSize = 14;local CloseCorner = Instance.new("UICorner");CloseCorner.CornerRadius = UDim.new(0,5);CloseCorner.Parent = CloseButton
Title.Name = "Title";Title.Parent = MainFrame;Title.BackgroundTransparency = 1;Title.Position = UDim2.new(0,0,0,10);Title.Size = UDim2.new(1,-35,0,40);Title.Font = Enum.Font.GothamBold;Title.Text = "🌈 暴龙战士验证器";Title.TextColor3 = Color3.fromRGB(255,255,255);Title.TextSize = 24;Title.TextXAlignment = Enum.TextXAlignment.Left
ToggleButton.Name = "ToggleButton";ToggleButton.Parent = MainFrame;ToggleButton.BackgroundColor3 = Color3.fromRGB(0,170,255);ToggleButton.Position = UDim2.new(0.1,0,0.4,0);ToggleButton.Size = UDim2.new(0.8,0,0,50);ToggleButton.Font = Enum.Font.GothamBold;ToggleButton.Text = "🔐 验证身份";ToggleButton.TextColor3 = Color3.fromRGB(255,255,255);ToggleButton.TextSize = 18;local ButtonCorner = Instance.new("UICorner");ButtonCorner.CornerRadius = UDim.new(0,10);ButtonCorner.Parent = ToggleButton
StatusLabel.Name = "StatusLabel";StatusLabel.Parent = MainFrame;StatusLabel.BackgroundTransparency = 1;StatusLabel.Position = UDim2.new(0,0,0.6,0);StatusLabel.Size = UDim2.new(1,0,0,30);StatusLabel.Font = Enum.Font.Gotham;StatusLabel.Text = "准备验证...";StatusLabel.TextColor3 = Color3.fromRGB(200,200,200);StatusLabel.TextSize = 14
GroupButton.Name = "GroupButton";GroupButton.Parent = MainFrame;GroupButton.BackgroundColor3 = Color3.fromRGB(255,85,85);GroupButton.Position = UDim2.new(0.1,0,0.75,0);GroupButton.Size = UDim2.new(0.8,0,0,35);GroupButton.Font = Enum.Font.Gotham;GroupButton.Text = "❌ 加入群组获取白名单";GroupButton.TextColor3 = Color3.fromRGB(255,255,255);GroupButton.TextSize = 14;local GroupCorner = Instance.new("UICorner");GroupCorner.CornerRadius = UDim.new(0,8);GroupCorner.Parent = GroupButton
local TweenInfo = TweenInfo.new(0.3,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local RainbowConnection
local function StartRainbowEffect()local colorIndex=1 RainbowConnection=RunService.Heartbeat:Connect(function()if MainFrame and MainFrame.Visible then MainFrame.BackgroundColor3=RainbowColors[colorIndex]colorIndex=colorIndex+1;if colorIndex>#RainbowColors then colorIndex=1 end end end)end
local function ButtonClickEffect(button)local originalSize=button.Size local tween1=TweenService:Create(button,TweenInfo.new(0.1),{Size=UDim2.new(originalSize.X.Scale*.95,0,originalSize.Y.Scale*.95,0)});local tween2=TweenService:Create(button,TweenInfo.new(0.1),{Size=originalSize})tween1:Play()tween1.Completed:Connect(function()tween2:Play()end)end
local function VerifyUser()local isWhitelisted=false for _,name in pairs(WHITELIST)do if UserName==name then isWhitelisted=true;break end end;if isWhitelisted then _G.暴龙战士=true;StatusLabel.Text="✅ "..UserName.." 验证成功！";StatusLabel.TextColor3=Color3.fromRGB(0,255,0);ToggleButton.Text="✅ 已验证";ToggleButton.BackgroundColor3=Color3.fromRGB(0,200,0);GroupButton.Visible=false wait(1)StarterGui:SetCore("SendNotification",{Title="🌈 验证成功",Text="欢迎回来！正在加载脚本...",Duration=3})wait(2)pcall(function()loadstring(game:HttpGet(SCRIPT_URL))()end)StatusLabel.Text="🎉 脚本加载完成！"else setclipboard(GROUP_ID);StatusLabel.Text="❌ 未找到白名单";StatusLabel.TextColor3=Color3.fromRGB(255,100,100)StarterGui:SetCore("SendNotification",{Title="❌ 验证失败",Text="已复制群号: "..GROUP_ID.."\n加入群聊获取白名单！",Duration=8})end end
local function CloseUI()local hideTween=TweenService:Create(MainFrame,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0),Position=UDim2.new(0.5,0,0.5,0)})hideTween:Play()hideTween.Completed:Connect(function()ScreenGui:Destroy()if RainbowConnection then RainbowConnection:Disconnect()end end)StarterGui:SetCore("SendNotification",{Title="🌈 已关闭",Text="验证器已隐藏，按 F9 重新执行脚本",Duration=3})end
ToggleButton.MouseButton1Click:Connect(function()ButtonClickEffect(ToggleButton)VerifyUser()end)
GroupButton.MouseButton1Click:Connect(function()ButtonClickEffect(GroupButton)setclipboard(GROUP_ID)StarterGui:SetCore("SendNotification",{Title="📋 已复制",Text="群号 "..GROUP_ID.." 已复制到剪贴板！",Duration=3})end)
CloseButton.MouseButton1Click:Connect(function()ButtonClickEffect(CloseButton)CloseUI()end)
StartRainbowEffect()
StarterGui:SetCore("SendNotification",{Title="🌈 彩虹验证器 v3.1",Text="UI已加载！右上✕可关闭",Duration=3})
print("🌈 彩虹UI开关器 v3.1加载完成！")