-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------
require("modules.monitors")

-------------------
---- AUTOSTART ----
-------------------

require("modules.autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

require("modules.env")

-----------------------
----- PERMISSIONS -----
-----------------------

require("modules.permissions")

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("modules.decorations")

----------------
----  MISC  ----
----------------

require("modules.misc")

---------------
---- INPUT ----
---------------

require("modules.inputs")

---------------------
---- KEYBINDINGS ----
---------------------

require("modules.bindings")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("modules.rules")
