- Hello! It seems you have bought the source for "Kermit's FE Admin"
-- Please do not new user off of this script.
local LPLR = game:GetService('Players').LocalPlayer
local CMDS = {}
local SEIZURE = false
local FEAdmin = Instance.new("ScreenGui")
local Cmdbar = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Bar = Instance.new("TextBox")
local Scroll = Instance.new("ScrollingFrame")
FEAdmin.Name = "FEAdmin"
FEAdmin.Parent = game:GetService('CoreGui')
FEAdmin.ResetOnSpawn = false
Cmdbar.Name = "Cmdbar"
Cmdbar.Parent = FEAdmin
Cmdbar.Active = true
Cmdbar.Visible = false
Cmdbar.BackgroundColor3 = Color3.new(0.266667, 0.266667, 0.266667)
Cmdbar.BorderSizePixel = 0
Cmdbar.Position = UDim2.new(0.137623757, 0, 0.874380171, 0)
Cmdbar.Size = UDim2.new(0, 731, 0, 31)
TextLabel.Parent = Cmdbar
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0.0357045159, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSansLight
TextLabel.Text = ">"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 18
TextLabel.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel.TextStrokeTransparency = 0.80000001192093
TextLabel.TextWrapped = true
TextLabel_2.Parent = Cmdbar
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.645690858, 0, 1, 0)
TextLabel_2.Size = UDim2.new(0.353078157, 0, 0.45161289, 0)
TextLabel_2.Font = Enum.Font.SourceSansLight
TextLabel_2.Text = "Kermit's FE Admin (scuba kermit#0104)"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextSize = 18
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Right
Bar.Name = "Bar"
Bar.Parent = Cmdbar
Bar.BackgroundColor3 = Color3.new(1, 1, 1)
Bar.BackgroundTransparency = 1
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0.0355677158, 0, 0, 0)
Bar.Size = UDim2.new(0.922024608, 0, 1, 0)
Bar.ClearTextOnFocus = false
Bar.Font = Enum.Font.SourceSansLight
Bar.PlaceholderText = "enter command here"
Bar.Text = ""
Bar.TextColor3 = Color3.new(1, 1, 1)
Bar.TextSize = 16
Bar.TextXAlignment = Enum.TextXAlignment.Left
Scroll.Name = "Scroll"
Scroll.Parent = FEAdmin
Scroll.Active = true
Scroll.BackgroundColor3 = Color3.new(0.266667, 0.266667, 0.266667)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.Position = UDim2.new(0.137623787, 0, 0.656198382, 0)
Scroll.Rotation = 180
Scroll.Selectable = false
Scroll.Visible = false
Scroll.Size = UDim2.new(0.722871363, 0, 0.20578517, 0)
Scroll.ScrollBarThickness = 0
function AddCmd(name,desc,func)
local TextLab = Instance.new('TextLabel',Scroll)
TextLab.Parent = Scroll
TextLab.BackgroundColor3 = Color3.new(0.266667, 0.266667, 0.266667)
TextLab.BackgroundTransparency = 0.10000000149012
TextLab.BorderSizePixel = 0
TextLab.Rotation = 180
TextLab.Size = UDim2.new(1, 0, 0, 35)
TextLab.Font = Enum.Font.SourceSansLight
TextLab.Text = name.." | "..desc
TextLab.TextColor3 = Color3.new(1, 1, 1)
TextLab.TextSize = 16
CMDS[name]=func
end
function Service(thing)
return game:GetService(thing)
end
AddCmd('blockhats','Turns your hats into blocks!',function()
for i,v in pairs(LPLR.Character:GetChildren()) do
if v:IsA('Accessory') or v:IsA('Hat') then
for _,x in pairs(v.Handle:GetChildren()) do
if x:IsA('FileMesh') or x:IsA('SpecialMesh') then
x:Destroy()
end
end
end
end
end)
AddCmd('drophats','Drops your hats on the ground!',function()
for i,v in pairs(LPLR.Character:GetChildren()) do
if v:IsA('Accessory') or v:IsA('Hat') then
v.Parent = workspace
end
end
end)
AddCmd('boombox','Checks for a boombox and plays a meme on it!',function()
for i,v in pairs(Service('Players'):GetPlayers()) do
for _,x in pairs(v.Character:GetChildren()) do
if string.find(x.Name:lower(),'boombo') then
x.Remote:FireServer("PlaySong",2823274771)
end
end
end
end)
AddCmd('breakgame','Breaks the game (WARNING: IRREVERSIBLE)',function()
game:GetService('StarterGui'):SetCoreGuiEnabled('Backpack',false)
game:GetService('StarterGui'):SetCoreGuiEnabled('Chat',false)
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA('BasePart') then
local ahh=Instance.new('Decal',v)
ahh.Texture='rbxassetid://888498549'
ahh.Face='Front'
local ahh2=ahh:Clone()
ahh2.Parent=v
ahh2.Face='Top'
local ahh3=ahh:Clone()
ahh3.Parent=v
ahh3.Face='Bottom'
local ahh4=ahh:Clone()
ahh4.Parent=v
ahh4.Face='Back'
local ahh5=ahh:Clone()
ahh5.Parent=v
ahh5.Face='Left'
local ahh6=ahh:Clone()
ahh6.Parent=v
ahh6.Face='Right'
end
end
end)
AddCmd('doublejump','Makes you jump twice! (BUGGY)',function()
LPLR:GetMouse().KeyDown:Connect(function(key)
if key == ' ' then
wait(.1)
LPLR.Character.Humanoid.Sit = true
wait()
LPLR.Character.Humanoid.Jump = true
wait()
LPLR.Character.Humanoid.Sit = true
wait()
LPLR.Character.Humanoid.Jump = true
end
end)
end)
AddCmd('invisible','Makes you invisible! (BUGGY)',function()
LPLR.Character.HumanoidRootPart.Anchored = true
end)
AddCmd('visible','Makes you visible! (BUGGY)',function()
LPLR.Character.HumanoidRootPart.Anchored = false
end)
AddCmd('seizure','Makes you have a seizure!',function()
SEIZURE = true
end)
AddCmd('stopseizure','Stops the seizure!',function()
SEIZURE = false
end)
 
-- Bar handling
LPLR:GetMouse().KeyDown:Connect(function(k)
if k == '-' then
Cmdbar.Visible = true
Scroll.Visible = true
Bar:CaptureFocus()
wait()
Bar.Text = ""
end
end)
Bar.FocusLost:Connect(function(enter)
if enter == true then
Cmdbar.Visible = false
Scroll.Visible = false
if CMDS[Bar.Text] then
CMDS[Bar.Text]()
end
Bar.Text = ""
end
end)
 
-- Text stuff
Match = function(name,str) return name:lower():find(str:lower()) and true end
function CIndex(Text)
local Index,SizeY = 0,0
for i,x in pairs(Scroll:GetChildren()) do
if Match(x.Text,Text) then
Index = Index + 1
x.Position = UDim2.new(0,0,0,Index*x.AbsoluteSize.Y-x.AbsoluteSize.Y)
x.Visible = true
SizeY = SizeY + x.AbsoluteSize.Y
Scroll.CanvasSize = UDim2.new(0,0,0,SizeY)
else
x.Visible = false
end
end
end
CIndex('')
Bar:GetPropertyChangedSignal("Text"):Connect(function()
CIndex(Bar.Text)
end)
--Stuff
while wait() do
if SEIZURE then
LPLR.Character.HumanoidRootPart.Massless = true
wait()
LPLR.Character.HumanoidRootPart.Massless = false
wait()
end
end
