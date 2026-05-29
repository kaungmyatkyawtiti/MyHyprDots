------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x1080",
	scale = 1.8,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "0x0",
	scale = 1.0,
})
