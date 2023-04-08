local ArrayLib = {}
local Array = Instance.new("ScreenGui")
if syn then syn.protect_gui(Array) end
Array.Name = game:GetService("HttpService"):GenerateGUID(false)
Array.ResetOnSpawn = false
Array.Enabled = shared["azura"]["arrayenabled"]
Array.Parent = (gethui and gethui()) or game:GetService("CoreGui")
local Frm = Instance.new("Frame")
Frm.BackgroundTransparency = 1
Frm.BorderSizePixel = 0
Frm.AnchorPoint = Vector2.new(0.5, 0.5)
Frm.Size = UDim2.new(0, 130, 0, 910)
Frm.Position = UDim2.new(0.96, 0, 0.47, 0)
Frm.Parent = Array
local Grid = Instance.new("UIGridLayout")
Grid.CellPadding = UDim2.new(0, 0, 0.0001, 0)
Grid.SortOrder = Enum.SortOrder.LayoutOrder
Grid.CellSize = UDim2.new(0, 130, 0, 25)
Grid.HorizontalAlignment = Enum.HorizontalAlignment.Right
Grid.VerticalAlignment = Enum.VerticalAlignment.Top
Grid.Parent = Frm

spawn(function()
    repeat
        task.wait(1)
        Array.Enabled = shared["azura"]["arrayenabled"] or false
    until not Array
end)

function ArrayLib.Add(Name, Suffix)
    local newname
    local newname2
    if Suffix then
        newname = Name.." <font color='rgb(125, 125, 125)'>"..Suffix.."</font>"
        newname2 = Name.." "..Suffix
    else
        newname = Name
        newname2 = Name
    end
    local label = Instance.new("TextLabel")
    label.Font = Enum.Font.GothamMedium
    label.RichText = true
    label.BackgroundTransparency = 1
    label.BorderSizePixel = 0
    label.Size = UDim2.new(0, 130, 0, 25)
    label.TextColor3 = Color3.fromRGB(180, 80, 255)
    label.Text = newname
    label.TextSize = 28
    label.TextXAlignment = "Right"
    label.TextStrokeTransparency = 0.6
    label.Name = Name
    label.Parent = Frm
    local size = game:GetService("TextService"):GetTextSize(newname2, label.AbsoluteSize.Y * 0.7, Enum.Font.SourceSans, Vector2.new(1000000, 1000000))
    label.LayoutOrder = -size.X
end

function ArrayLib.Remove(Name)
    if Frm:FindFirstChild(Name) ~= nil then
        Frm:FindFirstChild(Name):Destroy()
    end
end

function ArrayLib.FullStop()
    for i,v in pairs(Frm:GetChildren()) do
        v:Destroy()
    end
    Array:Destroy()
end

return ArrayLib