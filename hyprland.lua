-- Kevin's Hyprland Config (XPS 13 9360)
-- ~/.config/hypr/hyprland.lua

local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "hyprfind"
local codeEditor = "/home/kweber/.local/bin/cursor-gui"

-- ─────────────────────────────────────────────
-- MONITOR
-- ─────────────────────────────────────────────

hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })

-- ─────────────────────────────────────────────
-- APPEARANCE
-- ─────────────────────────────────────────────

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border   = "rgba(33ccffee)",
            inactive_border = "rgba(595959aa)",
        },
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
    active_opacity   = 0.95,
    inactive_opacity = 0.45,
        blur = {
            enabled = true,
            size    = 3,
            passes  = 1,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    input = {
        sensitivity  = 0.5,
        follow_mouse = 2,
        touchpad = {
            natural_scroll       = true,
            tap_to_click         = false,
            drag_lock            = true,
            clickfinger_behavior = true,
            disable_while_typing = true,
        },
    },
})

-- ─────────────────────────────────────────────
-- ENVIRONMENT
-- ─────────────────────────────────────────────

hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS",   "@im=fcitx")
hl.env("SDL_IM_MODULE","fcitx")

-- ─────────────────────────────────────────────
-- AUTOSTART
-- ─────────────────────────────────────────────

hl.on("hyprland.start", function()
    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("hyprpolkitagent")
    hl.exec_cmd("hyprswitch init --show-title")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("sudo tlp start")
    hl.exec_cmd("/usr/bin/gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("mako")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("mpvpaper -o 'loop --no-audio' eDP-1 /home/kweber/Videos/gojokitty.mp4")
end)

-- ─────────────────────────────────────────────
-- KEYBINDS — SYSTEM
-- ─────────────────────────────────────────────

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(codeEditor))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu toggle"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))


-- ─────────────────────────────────────────────
-- KEYBINDS — LAUNCHER
-- ─────────────────────────────────────────────

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("wofi --show drun --allow-images --insensitive"))
hl.bind("ALT + space",      hl.dsp.exec_cmd("wofi --show drun --allow-images --insensitive"))

-- ─────────────────────────────────────────────
-- KEYBINDS — WINDOW SWITCHER
-- ─────────────────────────────────────────────

hl.bind("ALT + Tab", hl.dsp.exec_cmd("hyprswitch gui --mod-key ALT_L --key tab --close mod-key-release"))

-- ─────────────────────────────────────────────
-- KEYBINDS — FOCUS
-- ─────────────────────────────────────────────

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- ─────────────────────────────────────────────
-- KEYBINDS — MOVE WINDOWS
-- ─────────────────────────────────────────────

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- ─────────────────────────────────────────────
-- KEYBINDS — WORKSPACES
-- ─────────────────────────────────────────────

for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
    hl.bind("F" .. i,                      hl.dsp.focus({ workspace = i }))
end

-- ─────────────────────────────────────────────
-- KEYBINDS — MEDIA & HARDWARE
-- ─────────────────────────────────────────────

hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd("bash -c 'if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED; then wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.5; else wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+; fi'"))
hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",          hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioPlay",          hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext",          hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev",          hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioStop",          hl.dsp.exec_cmd("playerctl stop"))
hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("SHIFT + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 50%+"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 50%-"))

-- ─────────────────────────────────────────────
-- KEYBINDS — SCREENSHOTS
-- ─────────────────────────────────────────────

hl.bind("Print",         hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grimblast copy screen"))

-- ─────────────────────────────────────────────
-- KEYBINDS — PWAs
-- ─────────────────────────────────────────────

hl.bind("F11", hl.dsp.exec_cmd("/opt/google/chrome/google-chrome --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja"))
hl.bind("F12", hl.dsp.exec_cmd("/opt/google/chrome/google-chrome --profile-directory=Default --app-id=igokoiikkeknloocbhcobpifmdadakdb"))

-- ─────────────────────────────────────────────
-- MOUSE
-- ─────────────────────────────────────────────

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- ─────────────────────────────────────────────
-- GESTURES
-- ─────────────────────────────────────────────

hl.gesture({ fingers = 3, direction = "left",  action = "workspace", value = "r+1" })
hl.gesture({ fingers = 3, direction = "right", action = "workspace", value = "r-1" })
