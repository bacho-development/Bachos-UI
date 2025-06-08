local module = {}
module.__index = module
local ConfigurationExtension = ".blcfg"

local CheckboxOn = "rbxassetid://104734605967860"

function module:CreateWindow(Name: string, Animation: boolean | nil, AnimationInfo: {any} | nil, SaveConfig: boolean | nil, ConfigInfo: {any} | nil, Debug: boolean | nil)
	-- Load configuration --
	local ConfigFilename, ConfigFilePath, Config
	--[[if SaveConfig then
		if not ConfigInfo then
			SaveConfig = false
			warn("Config will not be saved due to non-existent configfile information.")
		else
			ConfigFilename = ConfigInfo.FileName
			xpcall(function()
				if isfile(ConfigFilename..ConfigurationExtension) then Config = readfile(ConfigFilename..ConfigurationExtension)
				else Config = writefile(ConfigFilename..ConfigurationExtension) end
				ConfigFilePath = ConfigFilename..ConfigurationExtension
			end, function(err)
				if Debug then 
					warn("Bacho UI: An error happened while trying to get configuration.\n\n"..err) 
				end
			end)
		end
	end]]
	
	-- Variables --
	local Tabs = 0
	
	local Players = game:GetService('Players')
	local Player = Players.LocalPlayer
	
	-- Gui --
	local Window = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TabsButtons = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local User = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Frame = Instance.new("Frame")
	local Avatar = Instance.new("ImageLabel")
	local Username = Instance.new("TextLabel")
	local TabButtonHolder = Instance.new("ScrollingFrame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local UIListLayout = Instance.new("UIListLayout")
	local Close = Instance.new("TextButton")
	local Minimize = Instance.new("TextButton")
	local TabsHolder = Instance.new("Frame")

	Window.Parent = game:GetService("CoreGui")
	Window.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Window.ResetOnSpawn = false
	Window.IgnoreGuiInset = true

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Window
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	MainFrame.BorderColor3 = Color3.new(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0.4, 0, 0.5, 0)

	UICorner.Parent = MainFrame
	UICorner.CornerRadius = UDim.new(0, 15)

	TabsButtons.Name = "TabsButtons"
	TabsButtons.Parent = MainFrame
	TabsButtons.AnchorPoint = Vector2.new(0.5, 0.5)
	TabsButtons.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
	TabsButtons.BorderColor3 = Color3.new(0, 0, 0)
	TabsButtons.BorderSizePixel = 0
	TabsButtons.Position = UDim2.new(0.126141548, 0, 0.5, 0)
	TabsButtons.Size = UDim2.new(0.252283216, 0, 1, 0)

	UICorner_2.Parent = TabsButtons
	UICorner_2.CornerRadius = UDim.new(0, 15)

	User.Name = "User"
	User.Parent = TabsButtons
	User.AnchorPoint = Vector2.new(0.5, 0.5)
	User.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
	User.BorderColor3 = Color3.new(0, 0, 0)
	User.BorderSizePixel = 0
	User.Position = UDim2.new(0.500000119, 0, 0.909751117, 0)
	User.Size = UDim2.new(1.00000072, 0, 0.180497855, 0)

	UICorner_3.Parent = User
	UICorner_3.CornerRadius = UDim.new(0, 15)

	Frame.Parent = User
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
	Frame.BorderColor3 = Color3.new(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.500000119, 0, 0.114731371, 0)
	Frame.Size = UDim2.new(1.00000072, 0, 0.237969086, 0)

	Avatar.Name = "Avatar"
	Avatar.Parent = User
	Avatar.BackgroundColor3 = Color3.new(1, 1, 1)
	Avatar.BackgroundTransparency = 1
	Avatar.BorderColor3 = Color3.new(0, 0, 0)
	Avatar.BorderSizePixel = 0
	Avatar.Position = UDim2.new(0.0399999991, 0, 0.100000001, 0)
	Avatar.Size = UDim2.new(0.234262466, 0, 0.789271355, 0)
	Avatar.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size420x420)

	Username.Name = "Username"
	Username.Parent = User
	Username.BackgroundColor3 = Color3.new(1, 1, 1)
	Username.BackgroundTransparency = 1
	Username.BorderColor3 = Color3.new(0, 0, 0)
	Username.BorderSizePixel = 0
	Username.Position = UDim2.new(0.302135617, 0, 0.0957831368, 0)
	Username.Size = UDim2.new(0.697863877, 0, 0.770497918, 0)
	Username.Font = Enum.Font.Cartoon
	Username.Text = Player.Name
	Username.TextColor3 = Color3.new(1, 1, 1)
	Username.TextSize = 20
	Username.TextXAlignment = Enum.TextXAlignment.Left

	TabButtonHolder.Name = "Holder"
	TabButtonHolder.Parent = TabsButtons
	TabButtonHolder.Active = true
	TabButtonHolder.BackgroundColor3 = Color3.new(1, 1, 1)
	TabButtonHolder.BackgroundTransparency = 1
	TabButtonHolder.BorderColor3 = Color3.new(0, 0, 0)
	TabButtonHolder.BorderSizePixel = 0
	TabButtonHolder.Position = UDim2.new(0, 0, 0.0518672168, 0)
	TabButtonHolder.Size = UDim2.new(1, 0, 0.767635047, 0)
	TabButtonHolder.BottomImage = ""
	TabButtonHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabButtonHolder.MidImage = ""
	TabButtonHolder.TopImage = ""

	UIGridLayout.Parent = TabButtonHolder
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(0.899999976, 0, 0.125, 0)

	UIListLayout.Parent = TabButtonHolder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	Close.Name = "Close"
	Close.Parent = MainFrame
	Close.BackgroundColor3 = Color3.new(1, 1, 1)
	Close.BackgroundTransparency = 1
	Close.BorderColor3 = Color3.new(0, 0, 0)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0.926559985, 0, 0, 0)
	Close.Size = UDim2.new(0.073363781, 0, 0.125795305, 0)
	Close.Font = Enum.Font.Cartoon
	Close.Text = "X"
	Close.TextColor3 = Color3.new(0.686275, 0.686275, 0.686275)
	Close.TextScaled = true
	Close.TextSize = 14
	Close.TextWrapped = true
	local CloseFunction
	CloseFunction = Close.MouseButton1Click:Connect(function()
		MainFrame:TweenSizeAndPosition(UDim2.fromScale(0.001,MainFrame.Size.Y.Scale), MainFrame.Position, Enum.EasingDirection.In, Enum.EasingStyle.Linear, 1.5)
		task.wait(1.5)
		MainFrame:TweenSizeAndPosition(UDim2.fromScale(0,0), MainFrame.Position, Enum.EasingDirection.In, Enum.EasingStyle.Linear, 1.5)
		task.wait(1.5)
		CloseFunction:Disconnect()
		Window:Destroy()
	end)

	Minimize.Name = "Minimize"
	Minimize.Parent = MainFrame
	Minimize.BackgroundColor3 = Color3.new(1, 1, 1)
	Minimize.BackgroundTransparency = 1
	Minimize.BorderColor3 = Color3.new(0, 0, 0)
	Minimize.BorderSizePixel = 0
	Minimize.Position = UDim2.new(0.852359116, 0, 0, 0)
	Minimize.Size = UDim2.new(0.073363781, 0, 0.125795305, 0)
	Minimize.Font = Enum.Font.Cartoon
	Minimize.Text = "-"
	Minimize.TextColor3 = Color3.new(0.686275, 0.686275, 0.686275)
	Minimize.TextScaled = true
	Minimize.TextSize = 14
	Minimize.TextWrapped = true
	local MinimizeFunction
	MinimizeFunction = Minimize.MouseButton1Click:Connect(function()
		
	end)

	TabsHolder.Name = "TabsHolder"
	TabsHolder.Parent = MainFrame
	TabsHolder.BackgroundColor3 = Color3.new(1, 1, 1)
	TabsHolder.BackgroundTransparency = 1
	TabsHolder.BorderColor3 = Color3.new(0, 0, 0)
	TabsHolder.BorderSizePixel = 0
	TabsHolder.Position = UDim2.new(0.264459938, 0, 0.124481112, 0)
	TabsHolder.Size = UDim2.new(0.720243573, 0, 0.851382732, 0)

	-- Scripts
	local DragScript = Instance.new('LocalScript', MainFrame)
	DragScript.Source = [[
local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"));

local gui = script.Parent

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
	return a + (b - a) * m
end;

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (8);
function Update(dt)
	if not (startPos) then return end;
	if not (dragging) and (lastGoalPos) then
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
		return 
	end;

	local delta = (lastMousePos - UserInputService:GetMouseLocation())
	local xGoal = (startPos.X.Offset - delta.X);
	local yGoal = (startPos.Y.Offset - delta.Y);
	lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
	gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
end;

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		lastMousePos = UserInputService:GetMouseLocation()

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

runService.Heartbeat:Connect(Update)
	]]
	DragScript.Enabled = true
	
	-- Functions --
	local Functions = {}
	Functions.__index = Functions
	function Functions:CreateTab(Name: string, Icon: string | number)
		if typeof(Icon) == "number" then Icon = "rbxassetid://"..tostring(Icon) end
		if #string.split(Icon, "://") < 2 then if Debug then warn("Icon link for tab "..Name.." is not supported. Only supported rbxassetid.") end
		elseif #string.split(Icon, "://") > 2 then if string.split(Icon, "://")[1] ~= "rbxassetid" then if Debug then warn("Icon link for tab "..Name.." is not supported. Only supported rbxassetid.") end end end
		Tabs += 1
		
		-- Tab UI --
		local TabFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local UIPadding = Instance.new("UIPadding")

		if Tabs ~= 1 then TabFrame.Visible = false end
		TabFrame.Name = tostring(Tabs)
		TabFrame.Parent = TabsHolder
		TabFrame.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
		TabFrame.BorderColor3 = Color3.new(0, 0, 0)
		TabFrame.BorderSizePixel = 0
		TabFrame.Size = UDim2.new(1, 0, 1, 0)

		UICorner.Parent = TabFrame
		UICorner.CornerRadius = UDim.new(0, 15)

		UIListLayout.Parent = TabFrame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 7)

		UIPadding.Parent = TabFrame
		UIPadding.PaddingLeft = UDim.new(0, 6)
		UIPadding.PaddingTop = UDim.new(0, 10)
		
		-- Tab Button --
		local TabButton = Instance.new("Frame")
		local Clickable = Instance.new("TextButton")
		local TabIcon = Instance.new("ImageLabel")
		local Title = Instance.new("TextLabel")

		TabButton.Name = "TabButton"
		TabButton.Parent = TabButtonHolder
		TabButton.BackgroundColor3 = Color3.new(1, 1, 1)
		TabButton.BackgroundTransparency = 1
		TabButton.BorderColor3 = Color3.new(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(0, 100, 0, 100)

		Clickable.Name = "Clickable"
		Clickable.Parent = TabButton
		Clickable.BackgroundColor3 = Color3.new(1, 1, 1)
		Clickable.BackgroundTransparency = 1
		Clickable.BorderColor3 = Color3.new(0, 0, 0)
		Clickable.BorderSizePixel = 0
		Clickable.Size = UDim2.new(1, 0, 1, 0)
		Clickable.Font = Enum.Font.SourceSans
		Clickable.Text = ""
		Clickable.TextColor3 = Color3.new(0, 0, 0)
		Clickable.TextSize = 14

		TabIcon.Name = "Icon"
		TabIcon.Parent = Clickable
		TabIcon.BackgroundColor3 = Color3.new(1, 1, 1)
		TabIcon.BackgroundTransparency = 1
		TabIcon.BorderColor3 = Color3.new(0, 0, 0)
		TabIcon.BorderSizePixel = 0
		TabIcon.Position = UDim2.new(0.0586559139, 0, 0, 0)
		TabIcon.Size = UDim2.new(0.200000003, 0, 1, 0)
		TabIcon.Image = Icon

		Title.Name = "Title"
		Title.Parent = Clickable
		Title.BackgroundColor3 = Color3.new(1, 1, 1)
		Title.BackgroundTransparency = 1
		Title.BorderColor3 = Color3.new(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0.258656174, 0, 0, 0)
		Title.Size = UDim2.new(0.741344154, 0, 1, 0)
		Title.Font = Enum.Font.Cartoon
		Title.Text = Name
		Title.TextColor3 = Color3.new(1, 1, 1)
		Title.TextSize = 20
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		local OnTabButtonClick = Instance.new('LocalScript', Clickable)
		OnTabButtonClick.Source = [[
local index = ]]..tostring(Tabs)..[[

local tabs = script.Parent.Parent.Parent.Parent.Parent.TabsHolder

local unselectedcolor, selectedcolor = Color3.fromRGB(181, 181, 181), Color3.fromRGB(255,255,255)
script.Parent.MouseButton1Click:Connect(function()
	for _, v in pairs(tabs:GetChildren()) do
		if v:IsA("Frame") then
			v.Visible =false
		end
	end
	for _,v in pairs(script.Parent.Parent:GetChildren()) do
		if v.Name == "Clickable" and v:IsA("TextButton") then
			v:FindFirstChild("Title").TextColor3 = unselectedcolor
		end
	end
	local tab = tabs:FindFirstChild(tostring(index))
	if tab:IsA("Frame") then
		tab.Visible = true
		script.Parent.Title.TextColor3 = selectedcolor
	end
end)
		]]
		OnTabButtonClick.Enabled = true
		
		-- Tab Functions --
		local TabFunctions = {}
		TabFunctions.__index = TabFunctions
		function TabFunctions:CreateLabel(text: string)
			local Label = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Text = Instance.new("TextLabel")

			Label.Name = "Label"
			Label.Parent = TabFrame
			Label.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
			Label.BorderColor3 = Color3.new(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.0125000002, 0, 0, 0)
			Label.Size = UDim2.new(0.949999988, 0, 0.150000006, 0)

			UICorner.Parent = Label
			UICorner.CornerRadius = UDim.new(0, 15)

			UIStroke.Parent = Label
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			UIStroke.Color = Color3.fromRGB(255,255,255)
			UIStroke.LineJoinMode = Enum.LineJoinMode.Round
			UIStroke.Thickness = 2
			UIStroke.Transparency = 0.5

			Text.Name = "Text"
			Text.Parent = Label
			Text.Text = text
			Text.BackgroundColor3 = Color3.new(1, 1, 1)
			Text.BackgroundTransparency = 1
			Text.BorderColor3 = Color3.new(0, 0, 0)
			Text.BorderSizePixel = 0
			Text.Position = UDim2.new(0.016852241, 0, 0, 0)
			Text.Size = UDim2.new(0.98314774, 0, 1, 0)
			Text.Font = Enum.Font.Cartoon
			Text.TextColor3 = Color3.new(1, 1, 1)
			Text.TextScaled = true
			Text.TextSize = 14
			Text.TextWrapped = true
			Text.TextXAlignment = Enum.TextXAlignment.Left
		end
		function TabFunctions:CreateButton(text: string, callback: any | nil)
			local Button = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Button_2 = Instance.new("TextButton")
			
			if typeof(callback) ~= "function" and callback ~= nil then if Debug then warn("Unsupported type of callback.") callback = nil end end
			
			Button.Name = "Button"
			Button.Parent = TabFrame
			Button.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
			Button.BorderColor3 = Color3.new(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.0125000002, 0, 0, 0)
			Button.Size = UDim2.new(0.949999988, 0, 0.150000006, 0)

			UICorner.Parent = Button
			UICorner.CornerRadius = UDim.new(0, 15)

			UIStroke.Parent = Button
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			UIStroke.Color = Color3.fromRGB(255,255,255)
			UIStroke.LineJoinMode = Enum.LineJoinMode.Round
			UIStroke.Thickness = 2
			UIStroke.Transparency = 0.5
			
			Button_2.Name = "Button"
			Button_2.Parent = Button
			Button_2.Text = text
			Button_2.BackgroundColor3 = Color3.new(1, 1, 1)
			Button_2.BackgroundTransparency = 1
			Button_2.BorderColor3 = Color3.new(0, 0, 0)
			Button_2.BorderSizePixel = 0
			Button_2.Position = UDim2.new(0.0170000009, 0, 0, 0)
			Button_2.Size = UDim2.new(0.98299998, 0, 1, 0)
			Button_2.Font = Enum.Font.Cartoon
			Button_2.TextColor3 = Color3.new(1, 1, 1)
			Button_2.TextScaled = true
			Button_2.TextSize = 14
			Button_2.TextStrokeColor3 = Color3.new(1, 1, 1)
			Button_2.TextWrapped = true
			Button_2.TextXAlignment = Enum.TextXAlignment.Left
			
			if not callback then
				Button_2.MouseButton1Click:Connect(function()
					print("Click!")
				end)
			else
				Button_2.MouseButton1Click:Connect(callback)
			end
		end
		function TabFunctions:CreateCheckbox(name: string, default: boolean | false, callback: any | nil)
			if typeof(callback) ~= "function" and callback ~= nil then if Debug then warn("Unsupported type of callback.") callback = nil end end
			local Checkbox = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Button = Instance.new("TextButton")
			local Text = Instance.new("TextLabel")
			local ImageLabel = Instance.new("ImageLabel")

			Checkbox.Name = "Checkbox"
			Checkbox.Parent = TabFrame
			Checkbox.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
			Checkbox.BorderColor3 = Color3.new(0, 0, 0)
			Checkbox.BorderSizePixel = 0
			Checkbox.Position = UDim2.new(0.0125000002, 0, 0, 0)
			Checkbox.Size = UDim2.new(0.949999988, 0, 0.150000006, 0)

			UICorner.Parent = Checkbox
			UICorner.CornerRadius = UDim.new(0, 15)
			
			UIStroke.Parent = Checkbox
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			UIStroke.Color = Color3.fromRGB(255,255,255)
			UIStroke.LineJoinMode = Enum.LineJoinMode.Round
			UIStroke.Thickness = 2
			UIStroke.Transparency = 0.5

			Button.Name = "Button"
			Button.Parent = Checkbox
			Button.BackgroundColor3 = Color3.new(1, 1, 1)
			Button.BackgroundTransparency = 1
			Button.BorderColor3 = Color3.new(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.0170000009, 0, 0, 0)
			Button.Size = UDim2.new(0.98299998, 0, 1, 0)
			Button.Font = Enum.Font.Cartoon
			Button.Text = ""
			Button.TextColor3 = Color3.new(1, 1, 1)
			Button.TextScaled = true
			Button.TextSize = 14
			Button.TextStrokeColor3 = Color3.new(1, 1, 1)
			Button.TextWrapped = true
			Button.TextXAlignment = Enum.TextXAlignment.Left

			Text.Name = "Text"
			Text.Parent = Button
			Text.BackgroundColor3 = Color3.new(1, 1, 1)
			Text.BackgroundTransparency = 1
			Text.BorderColor3 = Color3.new(0, 0, 0)
			Text.BorderSizePixel = 0
			Text.Position = UDim2.new(0.0168524403, 0, 0, 0)
			Text.Size = UDim2.new(0.833929598, 0, 0.999999881, 0)
			Text.Font = Enum.Font.Cartoon
			Text.TextColor3 = Color3.new(1, 1, 1)
			Text.TextScaled = true
			Text.TextSize = 14
			Text.TextWrapped = true
			Text.TextXAlignment = Enum.TextXAlignment.Left

			ImageLabel.Parent = Button
			ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(0.850782037, 0, 0.0282222889, 0)
			ImageLabel.Size = UDim2.new(0.0900000036, 0, 0.899999976, 0)
			ImageLabel.Image = ""
			ImageLabel.ImageTransparency = 1
			
			local on = default
			if default == true then ImageLabel.Image = CheckboxOn end

			if not callback then
				Button.MouseButton1Click:Connect(function()
					on = not on
					if on == false then ImageLabel.Image = "" else  ImageLabel.Image = CheckboxOn end
					print("Current state: "..tostring(on))
				end)
			else
				Button.MouseButton1Click:Connect(function() 
					on = not on
					if on == false then ImageLabel.Image = "" else  ImageLabel.Image = CheckboxOn end
					callback(on)
				end)
			end
		end
		setmetatable(TabFunctions, Functions)
		return TabFunctions
	end
	setmetatable(Functions, module)
	return Functions
end

return module
