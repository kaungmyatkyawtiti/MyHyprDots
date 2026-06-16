-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local sans_font = "Inter 10"
local mono_font = "CaskaydiaMono Nerd Font 10"

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_RUNTIME_DIR HYPRLAND_INSTANCE_SIGNATURE")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")

	hl.exec_cmd("waybar & hyprpaper & hypridle")

	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	hl.exec_cmd("wl-paste --type text --watch cliphist store")

	hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name '" .. mono_font .. "'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface document-font-name '" .. sans_font .. "'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name '" .. mono_font .. "'")
end)
