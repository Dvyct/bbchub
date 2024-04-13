local Decimals = 4
local Clock = os.clock()
local ValueText = "Value Is Now :"

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dohmai/Tokyo/main/Libraries/UI"))({
	cheatname = "Title Here", -- watermark text
	gamename = "Title Here", -- watermark text
})

library:init()

local Window1  = library.NewWindow({
	title = "Papers Please Cheats", -- Mainwindow Text
	size = UDim2.new(0, 510, 0.6, 6
	)})

local Tab1 = Window1:AddTab("Main")
local SettingsTab = library:CreateSettingsTab(Window1)

--Tab1:SetText("Teleports")

local Section1 = Tab1:AddSection("Main Features", 1)

Section1:AddSeparator({
	enabled = true,
	text = "Features"
})

Section1:AddButton({
	enabled = true,
	text = "Button1",
	tooltip = "tooltip1",
	confirm = true,
	risky = false,
	callback = function()
		-- Function to check if an object is an interact/proximity object
		local function isInteractObject(object)
			return object:IsA("ProximityPrompt") or object:IsA("ClickDetector")
		end

		-- Function to set the hold duration to 0 for interact/proximity objects
		local function setHoldDurationToZero(object)
			if object:IsA("ProximityPrompt") then
				object.HoldDuration = 0 
			end
		end

		-- Recursive function to iterate through all descendants of an object
		local function iterateDescendants(parent)
			for _, child in ipairs(parent:GetChildren()) do
				if isInteractObject(child) then
					local success, error = pcall(setHoldDurationToZero, child)
					if not success then
						warn("Error setting HoldDuration to 0:", error)
					end
				end
				iterateDescendants(child)
			end
		end

		-- Start the iteration from the workspace
		local success, error = pcall(iterateDescendants, game.Workspace)
		if not success then
			warn("Error iterating through descendants:", error)
		end
	end
})
local Time = (string.format("%."..tostring(Decimals).."f", os.clock() - Clock))
library:SendNotification(("Loaded In "..tostring(Time)), 6)

--[[
    --Window1:SetOpen(false)
    makefolder("Title Here")
    library:SetTheme(Default)
    library:GetConfig(Default)
    library:LoadConfig(Default)
    library:SaveConfig(Default)
]]
