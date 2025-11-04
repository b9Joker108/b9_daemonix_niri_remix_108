#!/bin/bash

# Preparation

mkdir -p /etc/niri/
mkdir -p /etc/xdg/dunst/
mkdir -p /etc/wofi/

# Niri main configuration

cat << 'EOF' > /etc/niri/config.kdl
input {
    keyboard {
        xkb {
               layout "fr"
        }

        numlock
    }


    touchpad {
        tap
        natural-scroll
    }

    mouse {

    }

    trackpoint {

    }
}

environment {
        DISPLAY ":0"
}

// Applications Startup

spawn-at-startup "xwayland-satellite"
spawn-at-startup "swayidle"
spawn-at-startup "dunst"
spawn-at-startup "swaybg" "--image" "/home/alerion/.config/niri/wall.png"
spawn-at-startup "dconf" "write" "/org/gnome/desktop/interface/color-scheme" "'prefer-dark'"
spawn-at-startup "dconf" "write" "/org/gnome/desktop/interface/icon-theme" "'Flatery-Indigo-Dark'"

// Screen Resolution

output "DP-1" {

    mode "3840x2160@239.99"
    scale 1.0
    transform "normal"
    position x=1280 y=0
}


// Layout Configuration

layout {
    gaps 25
    background-color "transparent"
    always-center-single-column
    center-focused-column "never"
    default-column-display "normal"

    preset-column-widths {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
    }

    // New windows default width

    default-column-width { proportion 0.5; }


    // Focus Ring

    focus-ring {
        width 8
        active-color "#DA70D6"
        inactive-color "#DA70D6"
    }

    // Always visible border

    border {

        off
        width 4
        active-color "#FF00FF99"
        inactive-color "#FF00FF99"
        urgent-color "#FF00FF99"

    }

    // Windows Shadow

    shadow {

        on
        softness 40
        spread 4
        offset x=0 y=5
        color "#0007"
    }

}


// Animation settings.

animations {
}


// Window Rules

window-rule {
    match app-id=r#"^org\.wezfurlong\.wezterm$"#
    default-column-width {}
}

window-rule {
    match app-id=r#"firefox$"# title="^Picture-in-Picture$"
    open-floating true
}

// Rounded Corners

window-rule {
    geometry-corner-radius 12
    clip-to-geometry true
}


layer-rule {
    match namespace="^wallpaper$"
    place-within-backdrop true
}

overview {
    workspace-shadow {
        off
    }
}


binds {

    Mod+Shift+Slash { show-hotkey-overlay; }
    Super+Alt+L hotkey-overlay-title="Lock the Screen: swaylock" { spawn "swaylock"; }

    Mod+I { spawn "sh" "-c" "grim -g \"$(slurp)\" - | wl-copy --type image/png"; }
    Mod+R { spawn "wofi" "--show" "drun" "--conf" "/etc/wofi/config"; }
    Mod+T hotkey-overlay-title="Open a Terminal: ghostty" { spawn "ghostty"; }
    Mod+W { close-window; }

    XF86AudioRaiseVolume allow-when-locked=true { spawn "ddcutil" "--bus=4" "setvcp" "10" "+" "10"; }
    XF86AudioLowerVolume allow-when-locked=true { spawn "ddcutil" "--bus=4" "setvcp" "10" "-" "10"; }
    XF86AudioMute        allow-when-locked=true { spawn "ddcutil" "--bus=4" "setvcp" "10" "0"; }
    XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

    Mod+Tab repeat=false { toggle-overview; }

    Mod+o { spawn "killall" "waybar"; }
    Mod+p { spawn "sh" "-c" "waybar" "&"; }

    Mod+Left  { focus-column-left; }
   // Mod+Down  { focus-window-down; }
   // Mod+Up    { focus-window-up; }
    Mod+Right { focus-column-right; }
    Mod+H     { focus-column-left; }
    Mod+J     { focus-window-down; }
    Mod+K     { focus-window-up; }
    Mod+L     { focus-column-right; }

    Mod+Ctrl+Left  { move-column-left; }
    Mod+Ctrl+Down  { move-window-down; }
    Mod+Ctrl+Up    { move-window-up; }
    Mod+Ctrl+Right { move-column-right; }
    Mod+Ctrl+H     { move-column-left; }
    Mod+Ctrl+J     { move-window-down; }
    Mod+Ctrl+K     { move-window-up; }
    Mod+Ctrl+L     { move-column-right; }

    Mod+Home { focus-column-first; }
    Mod+End  { focus-column-last; }
    Mod+Ctrl+Home { move-column-to-first; }
    Mod+Ctrl+End  { move-column-to-last; }

    Mod+Shift+Left  { focus-monitor-left; }
    Mod+Shift+Down  { focus-monitor-down; }
    Mod+Shift+Up    { focus-monitor-up; }
    Mod+Shift+Right { focus-monitor-right; }
    Mod+Shift+H     { focus-monitor-left; }
    Mod+Shift+J     { focus-monitor-down; }
    Mod+Shift+K     { focus-monitor-up; }
    Mod+Shift+L     { focus-monitor-right; }

    Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
    Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

    Mod+Down      { focus-workspace-down; }
    Mod+Up        { focus-workspace-up; }
    Mod+U              { focus-workspace-down; }
    Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
    Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
    Mod+Ctrl+U         { move-column-to-workspace-down; }
    Mod+Ctrl+I         { move-column-to-workspace-up; }

    Mod+Shift+Page_Down { move-workspace-down; }
    Mod+Shift+Page_Up   { move-workspace-up; }
    Mod+Shift+U         { move-workspace-down; }
    Mod+Shift+I         { move-workspace-up; }

    Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
    Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
    Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
    Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

    Mod+WheelScrollRight      { focus-column-right; }
    Mod+WheelScrollLeft       { focus-column-left; }
    Mod+Ctrl+WheelScrollRight { move-column-right; }
    Mod+Ctrl+WheelScrollLeft  { move-column-left; }

    Mod+Shift+WheelScrollDown      { focus-column-right; }
    Mod+Shift+WheelScrollUp        { focus-column-left; }
    Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
    Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

    Mod+1 { focus-workspace 1; }
    Mod+2 { focus-workspace 2; }
    Mod+3 { focus-workspace 3; }
    Mod+4 { focus-workspace 4; }
    Mod+5 { focus-workspace 5; }
    Mod+6 { focus-workspace 6; }
    Mod+7 { focus-workspace 7; }
    Mod+8 { focus-workspace 8; }
    Mod+9 { focus-workspace 9; }
    Mod+Ctrl+1 { move-column-to-workspace 1; }
    Mod+Ctrl+2 { move-column-to-workspace 2; }
    Mod+Ctrl+3 { move-column-to-workspace 3; }
    Mod+Ctrl+4 { move-column-to-workspace 4; }
    Mod+Ctrl+5 { move-column-to-workspace 5; }
    Mod+Ctrl+6 { move-column-to-workspace 6; }
    Mod+Ctrl+7 { move-column-to-workspace 7; }
    Mod+Ctrl+8 { move-column-to-workspace 8; }
    Mod+Ctrl+9 { move-column-to-workspace 9; }

    Mod+BracketLeft  { consume-or-expel-window-left; }
    Mod+BracketRight { consume-or-expel-window-right; }

    Mod+Comma  { consume-window-into-column; }
    Mod+Period { expel-window-from-column; }

    Mod+Shift+R { switch-preset-window-height; }
    Mod+Ctrl+R { reset-window-height; }
    Mod+F { maximize-column; }
    Mod+Shift+F { fullscreen-window; }

    Mod+Ctrl+F { expand-column-to-available-width; }

    Mod+C { center-column; }

    Mod+Ctrl+C { center-visible-columns; }

    Mod+Alt+Left  { set-column-width "-10%"; }
    Mod+Alt+Right { set-column-width "+10%"; }

    Mod+Alt+Up { set-window-height "-10%"; }
    Mod+Alt+Down { set-window-height "+10%"; }

    Mod+V       { toggle-window-floating; }
    Mod+Shift+V { switch-focus-between-floating-and-tiling; }

    Print { screenshot; }
    Ctrl+Print { screenshot-screen; }
    Alt+Print { screenshot-window; }

    Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

    Mod+Shift+E { quit; }
    Ctrl+Alt+Delete { quit; }

    Mod+Shift+P { power-off-monitors; }

}
EOF


# Notification daemon 

cat << 'EOF' > /etc/xdg/dunst/dunstrc
[global]
frame_color = "#da70d4"
frame_width = 5
separator_color = frame
highlight = "#8aadf4"
foreground = "#ffffff"
background = "#000000"
width = (0,700)
notification_limit = 20
font = 14
min_icon_size = 800
corner_radius = 11
offset = 0x0
EOF

# Wofi config

cat << 'EOF' > /etc/wofi/config
hide_scroll=true
width=30%
lines=11
line_wrap=word
term=alacritty
allow_markup=true
always_parse_args=false
show_all=true
print_command=true
layer=overlay
allow_images=true
sort_order=default
gtk_dark=true
prompt=
image_size=35
display_generic=false
location=center
key_expand=Tab
insensitive=false
single_click=true
style=/etc/wofi/style.css
EOF

# Wofi style

cat << 'EOF' > /etc/wofi/style.css
* {
  font-family: JetBrainsMono, SpaceMono;
  color: #e5e9f0;
  font-size: 18px;
  /* background: transparent; */
}

#window {
  margin: auto;
  padding: 10px;
  border-radius: 25px;
  border: 6px solid rgba(218, 112, 212, 1.0);
  background-color: #151515;
  opacity: 1.0;
}

#input {
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 5px;
}

#outer-box {
  padding: 20px;
}

#img {
  margin-right: 6px;
}

#entry {
  padding: 10px;
  border-radius: 10px;
}

#entry:selected {
  background-color: rgba(218, 112, 212, 1.0);
}

#text {
  margin: 2px;
}
EOF

# Login manager

cat << 'EOF' > /etc/lightdm/lightdm.conf
#
# General configuration
#
# start-default-seat = True to always start one seat if none are defined in the configuration
# greeter-user = User to run greeter as
# minimum-display-number = Minimum display number to use for X servers
# minimum-vt = First VT to run displays on
# lock-memory = True to prevent memory from being paged to disk
# user-authority-in-system-dir = True if session authority should be in the system location
# guest-account-script = Script to be run to setup guest account
# logind-check-graphical = True to on start seats that are marked as graphical by logind
# log-directory = Directory to log information to
# run-directory = Directory to put running state in
# cache-directory = Directory to cache to
# sessions-directory = Directory to find sessions
# remote-sessions-directory = Directory to find remote sessions
# greeters-directory = Directory to find greeters
# backup-logs = True to move add a .old suffix to old log files when opening new ones
# dbus-service = True if LightDM provides a D-Bus service to control it
#
[LightDM]
#start-default-seat=true
#greeter-user=lightdm
#minimum-display-number=0
#minimum-vt=7 # Setting this to a value < 7 implies security issues, see FS#46799
#lock-memory=true
#user-authority-in-system-dir=false
#guest-account-script=guest-account
#logind-check-graphical=false
#log-directory=/var/log/lightdm
run-directory=/run/lightdm
#cache-directory=/var/cache/lightdm
#sessions-directory=/usr/share/lightdm/sessions:/usr/share/xsessions:/usr/share/wayland-sessions
#remote-sessions-directory=/usr/share/lightdm/remote-sessions
#greeters-directory=$XDG_DATA_DIRS/lightdm/greeters:$XDG_DATA_DIRS/xgreeters
#backup-logs=true
#dbus-service=true

#
# Seat configuration
#
# Seat configuration is matched against the seat name glob in the section, for example:
# [Seat:*] matches all seats and is applied first.
# [Seat:seat0] matches the seat named "seat0".
# [Seat:seat-thin-client*] matches all seats that have names that start with "seat-thin-client".
#
# type = Seat type (local, xremote)
# pam-service = PAM service to use for login
# pam-autologin-service = PAM service to use for autologin
# pam-greeter-service = PAM service to use for greeters
# xserver-command = X server command to run (can also contain arguments e.g. X -special-option)
# xmir-command = Xmir server command to run (can also contain arguments e.g. Xmir -special-option)
# xserver-config = Config file to pass to X server
# xserver-layout = Layout to pass to X server
# xserver-allow-tcp = True if TCP/IP connections are allowed to this X server
# xserver-share = True if the X server is shared for both greeter and session
# xserver-hostname = Hostname of X server (only for type=xremote)
# xserver-display-number = Display number of X server (only for type=xremote)
# xdmcp-manager = XDMCP manager to connect to (implies xserver-allow-tcp=true)
# xdmcp-port = XDMCP UDP/IP port to communicate on
# xdmcp-key = Authentication key to use for XDM-AUTHENTICATION-1 (stored in keys.conf)
# greeter-session = Session to load for greeter
# greeter-hide-users = True to hide the user list
# greeter-allow-guest = True if the greeter should show a guest login option
# greeter-show-manual-login = True if the greeter should offer a manual login option
# greeter-show-remote-login = True if the greeter should offer a remote login option
# user-session = Session to load for users
# allow-user-switching = True if allowed to switch users
# allow-guest = True if guest login is allowed
# guest-session = Session to load for guests (overrides user-session)
# session-wrapper = Wrapper script to run session with
# greeter-wrapper = Wrapper script to run greeter with
# guest-wrapper = Wrapper script to run guest sessions with
# display-setup-script = Script to run when starting a greeter session (runs as root)
# display-stopped-script = Script to run after stopping the display server (runs as root)
# greeter-setup-script = Script to run when starting a greeter (runs as root)
# session-setup-script = Script to run when starting a user session (runs as root)
# session-cleanup-script = Script to run when quitting a user session (runs as root)
# autologin-guest = True to log in as guest by default
# autologin-user = User to log in with by default (overrides autologin-guest)
# autologin-user-timeout = Number of seconds to wait before loading default user
# autologin-session = Session to load for automatic login (overrides user-session)
# autologin-in-background = True if autologin session should not be immediately activated
# exit-on-failure = True if the daemon should exit if this seat fails
#
[Seat:*]
#type=local
#pam-service=lightdm
#pam-autologin-service=lightdm-autologin
#pam-greeter-service=lightdm-greeter
#xserver-command=X
#xmir-command=Xmir
#xserver-config=
#xserver-layout=
#xserver-allow-tcp=false
#xserver-share=true
#xserver-hostname=
#xserver-display-number=
#xdmcp-manager=
#xdmcp-port=177
#xdmcp-key=
greeter-session=lightdm-webkit2-greeter
greeter-hide-users=false
greeter-allow-guest=true
greeter-show-manual-login=true
#greeter-show-remote-login=true
#user-session=default
allow-user-switching=true
allow-guest=true
#guest-session=
session-wrapper=/etc/lightdm/Xsession
#greeter-wrapper=
#guest-wrapper=
#display-setup-script=
#display-stopped-script=
#greeter-setup-script=
#session-setup-script=
#session-cleanup-script=
#autologin-guest=false
#autologin-user=
#autologin-user-timeout=0
#autologin-in-background=false
#autologin-session=
#exit-on-failure=false
EOF
