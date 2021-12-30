local uiLib = {}

_G.pages = nil
_G.buttons = nil
_G.libraryColor = Color3.fromRGB(85, 0, 255)

function uiLib.CreateUi(title, toggleKey, color)
	local UIS = game:GetService("UserInputService")
	
	if color then
		_G.libraryColor = color
	end

	local UILib = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Sidebar = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Buttons = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Topbar = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local TextLabel_2 = Instance.new("TextLabel")
	local Pages = Instance.new("Frame")

	if game:GetService("RunService"):IsStudio() then
		UILib.Parent = game.Players.LocalPlayer.PlayerGui
	else
		UILib.Parent = game.CoreGui
	end	
	UILib.Name = title
	UILib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = UILib
	Frame.AnchorPoint = Vector2.new(0, 1)
	Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	Frame.Position = UDim2.new(0, 0, 1, 0)
	Frame.Size = UDim2.new(0.25, 0, 0.275, 0)
	Frame.Active = true
	Frame.Selectable = true
	Frame.Draggable = true

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Frame

	Sidebar.Name = "Sidebar"
	Sidebar.Parent = Frame
	Sidebar.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	Sidebar.Size = UDim2.new(0.2, 0, 1, 0)

	UICorner_2.CornerRadius = UDim.new(0, 15)
	UICorner_2.Parent = Sidebar

	_G.buttons = Buttons
	Buttons.Name = "Buttons"
	Buttons.Parent = Sidebar
	Buttons.AnchorPoint = Vector2.new(0.5, 1)
	Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Buttons.BackgroundTransparency = 1
	Buttons.BorderSizePixel = 0
	Buttons.Position = UDim2.new(0.5, 0, 1, 0)
	Buttons.Size = UDim2.new(1, 0, 0.85, 0)

	UIListLayout.Parent = Buttons
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 5)

	Topbar.Name = "Topbar"
	Topbar.Parent = Frame
	Topbar.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Topbar.Size = UDim2.new(1, 0, 0.15, 0)

	UICorner_3.CornerRadius = UDim.new(0, 15)
	UICorner_3.Parent = Topbar

	TextLabel.Parent = Topbar
	TextLabel.AnchorPoint = Vector2.new(0, 0.5)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(0.75, 0, 0.9, 0)
	TextLabel.Font = Enum.Font.GothamBlack
	TextLabel.Text = title
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14
	TextLabel.TextWrapped = true

	TextLabel_2.Parent = Topbar
	TextLabel_2.AnchorPoint = Vector2.new(1, 0.5)
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(1, 0, 0.5, 0)
	TextLabel_2.Size = UDim2.new(0.25, 0, 0.9, 0)
	TextLabel_2.Font = Enum.Font.GothamBlack
	TextLabel_2.Text = "Toggle with "..toggleKey
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextScaled = true
	TextLabel_2.TextSize = 14
	TextLabel_2.TextWrapped = true
	
	_G.pages = Pages
	Pages.Name = "Pages"
	Pages.Parent = Frame
	Pages.AnchorPoint = Vector2.new(1, 1)
	Pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Pages.BackgroundTransparency = 1
	Pages.BorderSizePixel = 0
	Pages.Position = UDim2.new(1, 0, 1, 0)
	Pages.Size = UDim2.new(0.8, 0, 0.85, 0)
	
	UIS.InputBegan:Connect(function(input, isTyping)
		if isTyping then return end
		if input.KeyCode == Enum.KeyCode[toggleKey] then
			Frame.Visible = not Frame.Visible
		end
	end)
end

function uiLib.CreateTab(name)
	if not _G.pages then return end
	if not _G.buttons then return end
	local Tab = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local Button = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	
	Tab.Name = name
	Tab.Parent = _G.pages
	Tab.AnchorPoint = Vector2.new(0.5, 0.5)
	Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tab.BackgroundTransparency = 1
	Tab.BorderSizePixel = 0
	Tab.Position = UDim2.new(0.5, 0, 0.5, 0)
	Tab.Size = UDim2.new(1, 0, 1, 0)
	Tab.Visible = false

	UIGridLayout.Parent = Tab
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0.01, 0, 0.01, 0)
	UIGridLayout.CellSize = UDim2.new(0.24, 0, 0.15, 0)

	Button.Name = name
	Button.Parent = _G.buttons
	Button.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
	Button.Size = UDim2.new(0.9, 0, 0.1, 0)
	Button.Font = Enum.Font.GothamBlack
	Button.Text = name
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextScaled = true
	Button.TextSize = 14
	Button.TextWrapped = true

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Button
	
	Button.MouseButton1Click:Connect(function()
		for i, page in pairs(_G.pages:GetChildren()) do
			page.Visible = false
		end
		for i, button in pairs(_G.buttons:GetChildren()) do
			if button:IsA("TextButton") then
				button.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
			end
		end
		Button.BackgroundColor3 = _G.libraryColor
		Tab.Visible = true
	end)
end

function uiLib.CreateButton(tab, name, runFunction)
	if not _G.pages:FindFirstChild(tab) then return end
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Button = Instance.new("TextButton")
	
	Frame.Parent = _G.pages[tab]
	Frame.Name = name
	Frame.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
	Frame.Size = UDim2.new(1, 0, 1, 0)

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Frame

	Button.Name = "Button"
	Button.Parent = Frame
	Button.AnchorPoint = Vector2.new(0.5, 0.5)
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundTransparency = 1
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0.5, 0, 0.5, 0)
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.Font = Enum.Font.GothamBlack
	Button.Text = name
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextScaled = true
	Button.TextSize = 14
	Button.TextWrapped = true

	Button.MouseButton1Click:Connect(function()
		runFunction()
	end)
end

function uiLib.CreateToggleButton(tab, name, runFunction)
	if not _G.pages:FindFirstChild(tab) then return end

	local toggle = false

	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Button = Instance.new("TextButton")

	Frame.Parent = _G.pages[tab]
	Frame.Name = name
	Frame.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
	Frame.Size = UDim2.new(1, 0, 1, 0)

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Frame

	Button.Name = "Button"
	Button.Parent = Frame
	Button.AnchorPoint = Vector2.new(0.5, 0.5)
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundTransparency = 1
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0.5, 0, 0.5, 0)
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.Font = Enum.Font.GothamBlack
	Button.Text = name
	Button.TextColor3 = Color3.fromRGB(255, 55, 55)
	Button.TextScaled = true
	Button.TextSize = 14
	Button.TextWrapped = true

	Button.MouseButton1Click:Connect(function()
		toggle = not toggle
		if toggle then
			spawn(function()
				while toggle do
					runFunction()
					wait(0.001)
				end
			end)
			Button.TextColor3 = Color3.fromRGB(55, 255, 55)
		else
			Button.TextColor3 = Color3.fromRGB(255, 55, 55)
		end
	end)
end

function uiLib.CreateTextbox(tab, name, id)
	if not _G.pages:FindFirstChild(tab) then return end
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Textbox = Instance.new("TextBox")
	local value = Instance.new("StringValue")

	Frame.Parent = _G.pages[tab]
	Frame.Name = name
	Frame.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
	Frame.Size = UDim2.new(1, 0, 1, 0)

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Frame

	Textbox.Name = "Textbox"
	Textbox.Parent = Frame
	Textbox.AnchorPoint = Vector2.new(0.5, 0.5)
	Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Textbox.BackgroundTransparency = 1
	Textbox.BorderSizePixel = 0
	Textbox.Position = UDim2.new(0.5, 0, 0.5, 0)
	Textbox.Size = UDim2.new(1, 0, 1, 0)
	Textbox.Font = Enum.Font.GothamBlack
	Textbox.PlaceholderText = name
	Textbox.Text = ""
	Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	Textbox.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
	Textbox.TextScaled = true
	Textbox.TextSize = 14
	Textbox.TextWrapped = true
	
	value.Parent = Textbox
	value.Name = "Id"
	value.Value = id
end

function uiLib.GetText(id) 
	for _, page in pairs(_G.pages:GetChildren()) do
		for _, frame in pairs(page:GetChildren()) do
			for _, button in pairs(frame:GetChildren()) do
				if button:IsA("TextBox") then
					if id == button.Id.Value then
						print(button.Text)
						return button
					end
				end
			end
		end
	end
end

return uiLib
