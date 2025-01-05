-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyScriptUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 300)  -- Adjusted size to fit 5 buttons
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background
frame.Parent = screenGui

-- Add UICorner to the Frame for rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)  -- Adjust the radius for the corners
uiCorner.Parent = frame

-- Function to create a button
local function createButton(text, position, loadstringUrl)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.Text = text  -- Button text
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background for the button
    button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text color
    button.Font = Enum.Font.SourceSansBold  -- Set font to bold
    button.TextScaled = true  -- Scale text to fit
    button.Parent = frame

    -- Add UICorner to the button for rounded corners
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)  -- Adjust the radius for the button corners
    buttonCorner.Parent = button

    -- Connect the button click to run the loadstring
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(loadstringUrl))()
    end)
end

-- Create buttons with their respective loadstring URLs
createButton("Chat Bypass v1", UDim2.new(0.5, -100, 0, 10), "https://pastebin.com/raw/aqmCAz7b")  -- Loadstring 1
createButton("Chat Bypass v2", UDim2.new(0.5, -100, 0, 70), "https://raw.githubusercontent.com/skirescript/Ouxie/main/project/simplebypass.lua")  -- Loadstring 2
createButton("Chat Bypass v3", UDim2.new(0.5, -100, 0, 130), "https://raw.githubusercontent.com/AlgariBot/lua/refs/heads/Lua-Script-Executor/LocalNeverPatchedBypass.txt")  -- Loadstring 3
createButton("Chat Bypass v4", UDim2.new(0.5, -100, 0, 190), "https://raw.githubusercontent.com/AlgariBot/lua/refs/heads/Lua-Script-Executor/Chat%20bypass%202.2.txt")  -- Loadstring 4
createButton("Chat Bypass v5", UDim2.new(0.5, -100, 0, 250), "https://raw.githubusercontent.com/AlgariBot/lua/refs/heads/Lua-Script-Executor/chat%20bypass%20lol%20weird.txt")  -- Loadstring 5

-- Make the Frame draggable for mobile
local dragging = false
local dragInput, touchPos, framePos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragInput = input
        touchPos = input.Position
        framePos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch and dragging then
        local delta = input.Position - touchPos
        frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    end
end)

-- Run the initial loadstring when the GUI is created
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Just-A-Script-Rewrite-12363"))()
