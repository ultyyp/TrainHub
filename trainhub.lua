if game.PlaceId == 13655735489 or game.PlaceId == 12214593747 then

  
	local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
	
	local Window = Rayfield:CreateWindow({
		Name = "Train Hub - SBL:Reborn",
		LoadingTitle = "Loading...",
		LoadingSubtitle = "by train",
		ConfigurationSaving = {
			Enabled = true,
			FolderName = "Train Hub",
			FileName = "SBLREBORN"
		},
		KeySystem = false, -- Set this to true to use their key system
		KeySettings = {
			Title = "Sirius Hub",
			Subtitle = "Key System",
			Note = "Join the discord (discord.gg/sirius)",
			SaveKey = true,
			Key = "ABCDEF"
		}
	})
	
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Hub Loaded!",
		Text = "Success!",
		Icon = "https://www.roblox.com/asset/?id=4485364377"
	})
	


	--MAIN-------------


	local MainTab = Window:CreateTab("Main", 4483362458)
	
	local AutofarmSection = MainTab:CreateSection("Autofarm")
	
	local QuestFarmToggle = MainTab:CreateToggle({
		Name = "Autofarm Quest",
		CurrentValue = false,
		Flag = "LevelFlag", 
		Callback = function(Value)
		  
	getgenv().AutoFarmQuest = Value	  
	
		  
		  
	local player = game.Players.LocalPlayer
	local hmr = player.Character.HumanoidRootPart
	local workspace = game:GetService("Workspace")
	local marvinTaroModel = workspace.NPCS:FindFirstChild("Engineer")
	local primaryPart = marvinTaroModel.PrimaryPart
	local proximityPrompt = marvinTaroModel.HumanoidRootPart.Slash1.ProximityPrompt
	proximityPrompt.MaxActivationDistance = 999
	
	local function toggleNoclip(enabled)
		for _, part in ipairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = not enabled
			end
		end
	   if(enabled) then
		 workspace.Gravity = 0
		 else
		 workspace.Gravity = 196.2
	   end
	end
	
	toggleNoclip(false)
	
	player.Character:SetPrimaryPartCFrame(CFrame.new(primaryPart.Position) + Vector3.new(0,3,3))
	
	while getgenv().AutoFarmQuest == true do
	if(getgenv().AutoFarmQuest == false) then toggleNoclip(false) break end 
	toggleNoclip(true)
	
	repeat
	if(getgenv().AutoFarmQuest == false) then toggleNoclip(false) break end 
	player.Character:SetPrimaryPartCFrame(CFrame.new(primaryPart.Position) + Vector3.new(0,3,3))
	wait(0.3)
	player.Character:SetPrimaryPartCFrame(CFrame.new(primaryPart.Position) + Vector3.new(0,-5,0))
	fireproximityprompt(proximityPrompt)
	wait(0.5)
	
	
	local args = {
		[1] = "Taken"
	}
	
	game:GetService("Players").LocalPlayer.PlayerGui.Quest.LocalScript.RemoteEvent:FireServer(unpack(args))
	
	until player.PlayerQuest:FindFirstChild("COLLECTING MATERIALS")
	
	
	Wait(1)
	local mats = workspace:WaitForChild("QuestItems"):WaitForChild("COLLECTING MATERIALS")
	local boxesFolder = mats:GetChildren()
	local boxId = 1 
	local boxValue = game:GetService("Players").LocalPlayer.PlayerQuest["COLLECTING MATERIALS"].QuestValue.Value
	
	Wait(0.1)
	
	
	repeat
		if(getgenv().AutoFarmQuest == false) then toggleNoclip(false) break end 
			if(player.PlayerQuest:FindFirstChild("COLLECTING MATERIALS")) then
			boxValue = game:GetService("Players").LocalPlayer.PlayerQuest["COLLECTING MATERIALS"].QuestValue.Value
			local box = boxesFolder[boxId]
			if(box.Position == nil) then return end
			if(boxId >= 9) then boxId = 0 end
			player.Character:SetPrimaryPartCFrame(CFrame.new(box.Position) + Vector3.new(0,-5,0))
			box.Attachment.ProximityPrompt.MaxActivationDistance = 999
			Wait(0.1)
			fireproximityprompt(box.Attachment.ProximityPrompt)
			Wait(0.1)
			boxId = boxId + 1		
			else
			break
			end
	until boxValue == 10
	
	toggleNoclip(false)
	
	end
		
		end,
	})


	

	--PLAYER-------------
	
	local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image
	
	local PlayerSection = PlayerTab:CreateSection("Player")
	
	local GodmodeButton = PlayerTab:CreateButton({
		Name = "Godmode",
		Callback = function()
			game.Players.LocalPlayer.Character.Humanoid:Remove() Instance.new('Humanoid', game.Players.LocalPlayer.Character) game:GetService("Workspace")[game.Players.LocalPlayer.Name]:FindFirstChildOfClass( 'Humanoid').HipHeight = 2	
		end,
	})

	getgenv().InfJumpOn = false  
	local InfJumpToggle = PlayerTab:CreateToggle({
		Name = "Infinite jump",
		CurrentValue = false,
		Flag = "InfJumpToggle", 
		Callback = function(Value)
			getgenv().InfJumpOn = Value
			game:GetService("UserInputService").JumpRequest:connect(function()
				if getgenv().InfJumpOn then
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
				end
			end)
		end,
	})

	getgenv().WalkspeedOn = false  
	local WalkspeedToggle = PlayerTab:CreateToggle({
		Name = "Toggle Walkspeed",
		CurrentValue = false,
		Flag = "WalkspeedToggle", 
		Callback = function(Value)
		  local Human = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			if(Value) then
			  Human.WalkSpeed = getgenv().WalkspeedValue
			  else
				Human.WalkSpeed = 16
			end
			Value = not Value
		end,
	})
	
		local SpeedSlider = PlayerTab:CreateSlider({
			Name = "Walkspeed",
			Range = {16, 200},
			Increment = 1,
			Suffix = "Speed",
			CurrentValue = 16,
			Flag = "WalkspeedSlider",
			Callback = function(Value)
				
				getgenv().WalkspeedValue = Value

			end,
		})
	

	--VISUAL-------------

	local VisualTab = Window:CreateTab("Visual", 4483362458) -- Title, Image
	
	local EspSection = VisualTab:CreateSection("ESP")
	
	getgenv().Esp = false  
	local PlayerEspToggle = VisualTab:CreateToggle({
		Name = "Player ESP",
		CurrentValue = false,
		Flag = "ESPToggle", 
		Callback = function(Value)

			getgenv().Esp = Value
			
			local Players = game:GetService("Players")
			local RunService = game:GetService("RunService")
			local UserInputService = game:GetService("UserInputService")
			local Camera = workspace.CurrentCamera
			
			getgenv().SendNotifications = true
			getgenv().DefaultSettings = false   
			
			getgenv().TeamCheck = false
			
			getgenv().ESPVisible = false
			getgenv().TextColor = Color3.fromRGB(255, 255, 255) 
			getgenv().TextSize = 14 
			getgenv().Center = true 
			getgenv().Outline = true
			getgenv().OutlineColor = Color3.fromRGB(0, 0, 0)
			getgenv().TextTransparency = 1
			getgenv().TextFont = Drawing.Fonts.UI   

			if(getgenv().Esp) then 
				
			getgenv().ESPVisible = true

			local function CreateESP()
				for _, v in next, Players:GetPlayers() do
					if v.Name ~= Players.LocalPlayer.Name then
						local ESP = Drawing.new("Text")
			
						RunService.RenderStepped:Connect(function()
							if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
								local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
			
								ESP.Size = getgenv().TextSize
								ESP.Center = getgenv().Center
								ESP.Outline = getgenv().Outline
								ESP.OutlineColor = getgenv().OutlineColor
								ESP.Color = getgenv().TextColor
								ESP.Transparency = getgenv().TextTransparency
								ESP.Font = getgenv().TextFont
			
								if OnScreen == true then
									local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
									local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
									local Dist = (Part1 - Part2).Magnitude
									ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
									ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
									if getgenv().TeamCheck == true then 
										if Players.LocalPlayer.Team ~= v.Team then
											ESP.Visible = getgenv().ESPVisible
										else
											ESP.Visible = false
										end
									else
										ESP.Visible = getgenv().ESPVisible
									end
								else
									ESP.Visible = false
								end
							else
								ESP.Visible = false
							end
						end)
			
						Players.PlayerRemoving:Connect(function()
							ESP.Visible = false
						end)
					end
				end
			
				Players.PlayerAdded:Connect(function(Player)
					Player.CharacterAdded:Connect(function(v)
						if v.Name ~= Players.LocalPlayer.Name then 
							local ESP = Drawing.new("Text")
				
							RunService.RenderStepped:Connect(function()
								if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
									local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
				
									ESP.Size = getgenv().TextSize
									ESP.Center = getgenv().Center
									ESP.Outline = getgenv().Outline
									ESP.OutlineColor = getgenv().OutlineColor
									ESP.Color = getgenv().TextColor
									ESP.Transparency = getgenv().TextTransparency
				
									if OnScreen == true then
										local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
									local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
										local Dist = (Part1 - Part2).Magnitude
										ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
										ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
										if getgenv().TeamCheck == true then 
											if Players.LocalPlayer.Team ~= Player.Team then
												ESP.Visible = getgenv().ESPVisible
											else
												ESP.Visible = false
											end
										else
											ESP.Visible = getgenv().ESPVisible
										end
									else
										ESP.Visible = false
									end
								else
									ESP.Visible = false
								end
							end)
				
							Players.PlayerRemoving:Connect(function()
								ESP.Visible = false
							end)
						end
					end)
				end)
			end
			
			if getgenv().DefaultSettings == true then
				getgenv().TeamCheck = false
				getgenv().ESPVisible = true
				getgenv().TextColor = Color3.fromRGB(40, 90, 255)
				getgenv().TextSize = 14
				getgenv().Center = true
				getgenv().Outline = false
				getgenv().OutlineColor = Color3.fromRGB(0, 0, 0)
				getgenv().TextTransparency = 0.75
			end
			
			local Success, Errored = pcall(function()
				CreateESP()
			end)

		else

			getgenv().ESPVisible = false

		end

		end,
	})



	local AmbienceSection = VisualTab:CreateSection("Ambience")

	getgenv().Fullbright = false
	local FullbrightToggle = VisualTab:CreateToggle({
		Name = "Fullbright",
		CurrentValue = false,
		Flag = "FullbrightToggle", 
		Callback = function(Value)
			getgenv().Fullbright = Value
			local Lighting = game:GetService("Lighting")
			
			if(getgenv().Fullbright) then
			

			getgenv().DefaultBrightness = Lighting.Brightness
			getgenv().DefaultClockTime = Lighting.ClockTime
			getgenv().DefaultFogEnd = Lighting.FogEnd
			getgenv().DefaultGlobalShadows =  Lighting.GlobalShadows
			getgenv().DefaultOutdoorAmbient =  Lighting.OutdoorAmbient 

			while getgenv().Fullbright do
				if (getgenv().Fullbright == false) then break end
				Lighting.Brightness = 2
				Lighting.ClockTime = 14
				Lighting.FogEnd = 100000
				Lighting.GlobalShadows = false
				Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
				Wait(1)
			end

		else
			Lighting.Brightness = getgenv().DefaultBrightness
			Lighting.ClockTime = getgenv().DefaultClockTime
			Lighting.FogEnd = getgenv().DefaultFogEnd 
			Lighting.GlobalShadows = getgenv().DefaultGlobalShadows
			Lighting.OutdoorAmbient = getgenv().DefaultOutdoorAmbient
		end

		end,
	})

	local NoFogButton = VisualTab:CreateButton({
		Name = "Nofog",
		Callback = function()
			local Lighting = game:GetService("Lighting")
			Lighting.FogEnd = 100000
			for i,v in pairs(Lighting:GetDescendants()) do
				if v:IsA("Atmosphere") then
					v:Destroy()
				end
			end
		end,
	})
	

	--MISC-------------

	local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image
	
	local MiscSection = MiscTab:CreateSection("Misc")
	
	local DestroyUIButton = MiscTab:CreateButton({
		Name = "Destroy UI",
		Callback = function()
			Rayfield:Destroy()
		end,
	})


	--AUTOLOAD------------

	queueonteleport([[
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ultyyp/TrainHub/main/trainhub.lua'))()
	]]);
	
	
	else 
	  
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Game Unsupported!", -- Required
		Text = "Suggest it in the discord!", -- Required
		Icon = "https://www.roblox.com/asset/?id=2761831324"
	})
	
	end