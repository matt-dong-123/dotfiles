function reloadConfig(files)
	doReload = false
	for _, file in pairs(files) do
		-- Check if any lua file has been modified
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end

-- Watch for changes in config file
-- NOTE: This has to be a global variable

WATCHER = hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
