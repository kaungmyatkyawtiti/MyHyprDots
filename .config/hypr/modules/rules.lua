--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
local overlayLayerRule = hl.layer_rule({
	name = "no-anim-overlay",
	match = { namespace = "^my-overlay$" },
	no_anim = true,
})
overlayLayerRule:set_enabled(true)

-- Force file dialogs to be floating and stay on the active workspace
hl.window_rule({
	name = "force-floating-file-dialog",
	match = {
		-- Expanded titles to catch Telegram and other portal pickers
		title = "^(Save File|Open Files|Save As|Open|Select File|Select Folder|Choose Files)$",
	},
	float = true,
	workspace = "current",
})

-- Explicitly catch the XDG Desktop Portal (the most common culprit)
hl.window_rule({
	name = "xdg-desktop-portal-floating",
	match = {
		class = "xdg-desktop-portal-gtk",
	},
	float = true,
	workspace = "current",
})
-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
	no_anim = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({
	match = { namespace = "notifications" },
	blur = true,
	ignore_alpha = 0.5,
})

-- Assign workspaces 1-6 to eDP-1
for i = 1, 6 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "eDP-1",
	})
end

-- Assign workspaces 7-10 to HDMI-A-1
for i = 7, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "HDMI-A-1",
	})
end
