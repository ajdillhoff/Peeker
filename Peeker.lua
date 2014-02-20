-- Main Variables --
local Peeker = {}
local harvester

-- Event Handler Setup --
Peeker.eventHandler = CreateFrame("Frame")
Peeker.eventHandler.eventList = {
	--["PLAYER_ENTERING_WORLD"] = function(self) Peeker:PLAYER_ENTERING_WORLD(self) end,
	["CHAT_MSG_SAY"] = function(self, msg, author) Peeker:chatHandler(self, msg, author) end,
	["CHAT_MSG_YELL"] = function(self, msg, author) Peeker:chatHandler(self, msg, author) end,
	["CHAT_MSG_PARTY"] = function(self, msg, author) Peeker:chatHandler(self, msg, author) end,
	["CHAT_MSG_RAID"] = function(self, msg, author) Peeker:chatHandler(self, msg, author) end,
	["CHAT_MSG_INSTANCE_CHAT"] = function(self, msg, author) Peeker:chatHandler(self, msg, author) end,
}

-- Register initial events --
Peeker.eventHandler:RegisterEvent("PLAYER_LOGIN")

-- Event Handler --
Peeker.eventHandler:SetScript("OnEvent", function(self, event, ...)
	-- Player login
	if(event == "PLAYER_LOGIN") then
		-- Load addon config
		Peeker:OnLoad(self, name)
		Peeker.eventHandler:UnregisterEvent("PLAYER_LOGIN")
	else
		Peeker.eventHandler.eventList[event](self, ...)
	end
end)

----------------------
-- OnLoad Functions --
----------------------

function Peeker:OnLoad(self, name)
	--Peeker.eventHandler:RegisterEvent("PLAYER_ENTERING_WORLD")
	
	-- Setup Slash Commands
	SLASH_PeekCmd1 = "/peek"
	SlashCmdList["PeekCmd"] = Peeker_Commands
	
	-- Register events
	Peeker:OnEnable()
	
	-- Load Harvester
	if not harvester then harvester = newHarvester("<a href='{value url}'>{value title}</a>") end
	
	-- Print Loaded Message
	ChatFrame1:AddMessage("Peeker Loading Complete. Use /peeker <service> <term>", 1, 0, 0)
end

------------------------------
-- Enable/Disable Functions --
------------------------------

function Peeker:OnEnable()
	if(Peeker.enabled == false) or (Peeker.enabled == nil) then
		Peeker.eventHandler:RegisterEvent("CHAT_MSG_SAY")
		Peeker.eventHandler:RegisterEvent("CHAT_MSG_YELL")
		Peeker.eventHandler:RegisterEvent("CHAT_MSG_PARTY")
		Peeker.eventHandler:RegisterEvent("CHAT_MSG_RAID")
		Peeker.eventHandler:RegisterEvent("CHAT_MSG_INSTANCE_CHAT")
		Peeker.enabled = true
	end
end

function Peeker:OnDisable()
	Peeker.eventHandler:UnregisterAllEvents()
	Peeker.enabled = false
end

--------------------
-- Slash Commands --
--------------------

function Peeker_Commands(cmd)
	cmd = cmd:trim()
	local lower = cmd:lower()
	
	if (cmd == "") then
		-- Display instructions to user
	else
		-- Handle command here
	end
end