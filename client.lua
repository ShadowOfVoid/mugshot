-- Register an application here: https://gyazo.com/oauth/applications
local uploadUrl = "https://upload.gyazo.com/api/upload?access_token=YOURACCESSTOKEN"

-- Uploads the mugshot
function getMugshotUrl(ped)
	-- Register the ped headshot
	local mugshot = RegisterPedheadshot(ped)

	while not IsPedheadshotReady(mugshot) do
		Wait(0)
	end

	-- Loop necessary to be able to draw the mugshot
	local i = 0

	while true do
		Wait(1)
		
		-- Draws the mugshot at the players screen
		DrawSprite(GetPedheadshotTxdString(mugshot), GetPedheadshotTxdString(mugshot), 0.045, 0.085, 0.09, 0.18, 0.0, 255, 255, 255, 1000)

		i = i + 1

		-- Makes the sprite a second
		if i == 10 then
			local url

			-- Screenshot the screen using screenshot-basic
			exports['screenshot-basic']:requestScreenshotUpload(uploadUrl, "imagedata", function(data)
				-- Grabs the image url and crops it using images.weserv.nl since we don't want the whole screen. We only want the mugshot image
				-- This is an ugly work-around but necessary since I don't want to force people to make changes to screenshot-basic resource
				url = "https://images.weserv.nl/?url=".. json.decode(data)["url"] .."&crop=170,180,0,0"
			end)

			Wait(2500)

			-- Unregister the ped headshot
			UnregisterPedheadshot(mugshot)
	
			-- Returns the url
			return url
		end
	end
end