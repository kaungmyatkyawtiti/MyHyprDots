-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- hl.env("GTK_THEME", "Gruvbox-B-LB-Dark")

hl.env("XCURSOR_THEME", "Bibata-Modern-Amber")
hl.env("XCURSOR_SIZE", "24")

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Amber")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("GDK_BACKEND", "wayland,x11,*") -- GTK fallback
hl.env("QT_QPA_PLATFORM", "wayland;xcb") -- Qt fallback
hl.env("SDL_VIDEODRIVER", "wayland") -- SDL2 Games/Apps
hl.env("CLUTTER_BACKEND", "wayland") -- Clutter Apps

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "2")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "2")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct") -- Use with qt5ct/Kvantum

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("GDK_SCALE", "2")
