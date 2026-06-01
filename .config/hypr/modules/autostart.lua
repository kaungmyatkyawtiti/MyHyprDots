-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local sans_font = "Inter 10"
local mono_font = "JetBrainsMono Nerd Font 10"

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & hyprpaper & hypridle")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name '" .. mono_font .. "'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface document-font-name '" .. sans_font .. "'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name '" .. mono_font .. "'")
end)
