import os
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy

def left_arrow(background_color, foreground_color):
     return widget.TextBox(
             text = "\uE0B2",
             padding = 0,
             fontsize = 25,
             background = background_color,
             foreground = foreground_color,
             )

def keyboard():
    return 'US' if os.popen("xset -q|grep LED| awk '{ print $10 }'").read().split('\n')[0] == '00000000' else 'UA'

mod = "mod4"              # Sets mod key to SUPER/WINDOWS
myTerm = "alacritty"      # My terminal of choice
myBrowser = "firefox"     # My browser of choice

keys = [
         ### The essentials
         Key([mod], "Return",
             lazy.spawn(myTerm),
             desc='Launches My Terminal'
             ),
         Key([mod], "Tab",
             lazy.next_layout(),
             desc='Toggle through layouts'
             ),
         Key([mod, "shift"], "Tab",
             lazy.prev_layout(),
             desc='Toggle back-through layouts'
             ),
         Key([mod], "q",
             lazy.window.kill(),
             desc='Kill active window'
             ),
         Key([mod], "o",
             lazy.window.opacity(0.5),
             desc='Change window opacity to 0.5'
             ),
         Key([mod, "shift"], "o",
             lazy.window.opacity(1),
             desc='Chane window opacaity to 1'
             ),
         Key([mod, "shift"], "r",
             lazy.restart(),
             desc='Restart Qtile'
             ),
         Key([mod, "shift"], "q",
             lazy.shutdown(),
             desc='Shutdown Qtile'
             ),
         ### Application launch
         Key(["control"], "space",
             lazy.spawn("rofi -show drun"),
             desc='Run rofi launcher'
             ),
         Key([mod], "b",
             lazy.spawn(myBrowser),
             desc='Launch Firefox'
             ),
         Key([mod], "t",
             lazy.spawn("telegram-desktop"),
             desc='Launch Telegram'
             ),
         Key([mod], "d",
             lazy.spawn("discord"),
             desc='Launch Discrod'
             ),
         Key([mod], "r",
             lazy.spawn("evince"),
             desc='Launch Evince docviewer'
             ),
         Key([mod], "g",
             lazy.spawn("pcmanfm"),
             desc='Launch PcManFn file manager'
             ),
         Key([], "Print",
             lazy.spawn("flameshot gui"),
             desc='Launch Flameshot - screenshot'
             ),
         ### System control
         Key([], "XF86MonBrightnessDown",
             #lazy.spawn("brightnessctl s 5%-"),
             lazy.spawn("changebrightness.sh down"),
             desc='Decrease screen brightness'
             ),
         Key([], "XF86MonBrightnessUp",
             #lazy.spawn("brightnessctl s +5%"),
             lazy.spawn("changebrightness.sh up"),
             desc='Increase screen brightness'
             ),
         Key([], "XF86AudioLowerVolume",
             #lazy.spawn("amixer -q sset Master 2%-"),
             lazy.spawn("changevolume.sh down"),
             desc='Lower system Volume'
             ),
         Key([], "XF86AudioRaiseVolume",
             #lazy.spawn("amixer -q sset Master 2%+"),
             lazy.spawn("changevolume.sh up"),
             desc='Raise system volume'
             ),
         Key([], "XF86AudioMute",
             #lazy.spawn("amixer -D pulse set Master 1+ toggle"),
             lazy.spawn("changevolume.sh mute"),
             desc='Mute system volume'
             ),
         Key([], "XF86AudioMicMute",
             lazy.spawn("amixer -D pulse sset Capture toggle"),
             desc='Mute system microphone'
             ),
         Key([], "XF86AudioPlay",
             lazy.spawn("playerctl play-pause"),
             desc='Play-pause media'
             ),
         Key([], "XF86AudioStop",
             lazy.spawn("playerctl stop"),
             desc='Stop media'
             ),
         Key([], "XF86AudioPrev",
             lazy.spawn("playerctl previous"),
             desc='Previous media'
             ),
         Key([], "XF86AudioNext",
             lazy.spawn("playerctl next"),
             desc='Next media'
             ),
         Key(["mod1", "control"], "r",
             lazy.spawn("shutdown -r now"),
             desc='Poweroff system'
             ),
         Key(["mod1", "control"], "p",
             lazy.spawn("shutdown now"),
             desc='Reboot system'
             ),
         Key(["mod1", "control"], "s",
             lazy.spawn("betterlockscreen -l"),
             desc='Lock screen'
             ),
         ### Window controls
         Key([mod], "j",
             lazy.layout.down().when(layout=['columns', 'monadtall', 'monadwide', 'monadthreecol']),
             desc='Move focus down in current stack pane'
             ),
         Key([mod], "k",
             lazy.layout.up().when(layout=['columns', 'monadtall', 'monadwide', 'monadthreecol']),
             desc='Move focus up in current stack pane'
             ),
         Key([mod, "shift"], "j",
             lazy.layout.shuffle_down().when(layout=['columns', 'monadtall', 'monadthreecol']),
             lazy.layout.swap_left().when(layout='monadwide'),
             desc='Move windows down in current stack'
             ),
         Key([mod, "shift"], "k",
             lazy.layout.shuffle_up().when(layout=['columns', 'monadtall', 'monadthreecol']),
             lazy.layout.swap_right().when(layout='monadwide'),
             desc='Move windows up in current stack'
             ),
         Key([mod, "control"], "j",
             lazy.layout.grow_down().when(layout='columns'),
             lazy.layout.shrink().when(layout=['monadtall', 'monadthreecol']),
             lazy.layout.grow_main().when(layout='monadwide'),
             desc='Grow window down in current stack'
             ),
         Key([mod, "control"], "k",
             lazy.layout.grow_up().when(layout='columns'),
             lazy.layout.grow().when(layout=['monadtall', 'monadthreecol']),
             lazy.layout.shrink_main().when(layout='monadwide'),
             desc='Grow window up in current stack'
             ),
         Key([mod], "h",
             lazy.layout.left().when(layout='columns'),
             lazy.layout.shrink_main().when(layout=['monadtall', 'monadthreecol']),
             lazy.layout.shrink().when(layout='monadwide'),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile) / Move focus to left stack'
             ),
         Key([mod], "l",
             lazy.layout.right().when(layout='columns'),
             lazy.layout.grow_main().when(layout=['monadtall', 'monadthreecol']),
             lazy.layout.grow().when(layout='monadwide'),
             desc='Expand window (MonadTall), increase number in master pane (Tile) / Move focus to right stack'
             ),
         Key([mod, "shift"], "h",
             lazy.layout.shuffle_left().when(layout='columns'),
             lazy.layout.swap_left().when(layout=['monadtall', 'monadthreecol']),
             lazy.layout.shuffle_up().when(layout='monadwide'),
             desc='Move window to the left stack'
             ),
         Key([mod, "shift"], "l",
             lazy.layout.shuffle_right().when(layout='columns'),
             lazy.layout.swap_right().when(layout=['monadtall', 'monadthreecol']),
             lazy.layout.shuffle_down().when(layout='monadwide'),
             desc='Move window to the right stack'
             ),
         Key([mod, "control"], "h",
             lazy.layout.grow_left().when(layout='columns'),
             desc='Grow window to the left'
             ),
         Key([mod, "control"], "l",
             lazy.layout.grow_right().when(layout='columns'),
             desc='Grow window to the right'
             ),
         Key([mod], "n",
             lazy.layout.normalize().when(layout='columns'),
             lazy.layout.reset().when(layout=['monadtall', 'monadwide', 'monadthreecol']),
             desc='normalize window size ratios'
             ),
         Key([mod], "m",
             lazy.layout.maximize().when(layout=['monadtall', 'monadwide', 'monadthreecol']),
             desc='toggle window between minimum and maximum sizes'
             ),
         Key([mod, "shift"], "f",
             lazy.window.toggle_floating(),
             desc='toggle floating'
             ),
         Key([mod], "f",
             lazy.window.toggle_fullscreen(),
             desc='toggle fullscreen'
             ),
         ### Stack controls
         Key([mod], "space",
             lazy.layout.swap_column_left().when(layout='columns'),
             lazy.layout.flip().when(layout=['monadtall', 'monadwide']),
             lazy.layout.swap_main().when(layout='monadthreecol'),
             desc='Switch side of main stack/ Swap columns to the left'
             ),
         Key([mod, "shift"], "space",
             lazy.layout.swap_column_right().when(layout='columns'),
             desc='Swap columns to the right'
             ),
         Key([mod, "control"], "space",
             lazy.layout.toggle_split().when(layout='columns'),
             desc='Toggle between split and unsplit sides of stack'
             )
]

groups = [Group("DEV"),
          Group("WWW", matches=[Match(wm_class=["firefox", "vimb"])], layout='monadtall'),
          Group("SYS"),
          Group("CHAT", matches=[Match(wm_class=["telegram-desktop", "discord"])]),
          Group("DOC")]

# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group
from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder("mod4")

layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "#e1acff",
                "border_normal": "#1D2330"
                }

layouts = [
    layout.Columns(
        border_on_single = True,
        insert_position = 1,
        **layout_theme),
    layout.MonadTall(
        ratio = 0.7,
        min_secondary_size = 200,
        new_client_position = 'after_current',
        **layout_theme),
    layout.MonadWide(
        ratio = 0.6,
        min_secondary_size = 400,
        **layout_theme),
    layout.MonadThreeCol(
        ratio = 0.55,
        min_secondary_size = 200,
        new_client_position = 'after_current',
        **layout_theme),
    #layout.Spiral(**layout_theme),
]

colors = [["#282c34", "#282c34"], #backgoroud
          ["#191724", "#191724"], #dark font
          ["#dfdfdf", "#dfdfdf"], #white font
          ["#51afef", "#51afef"], #blue font
          ["#ef476f", "#ef476f"],
          ["#ffd166", "#ffd166"],
          ["#06d6a0", "#06d6a0"],
          ["#118ab2", "#118ab2"]]

widget_defaults = dict(
    font = "Google Sans Bold",
    fontsize = 11,
    padding = 2,
    background = colors[0],
    foreground = colors[1],
)
extension_defaults = widget_defaults.copy()

def init_widgets_list(colors):
    widgets_list = [
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       ),
              widget.Image(
                       filename = "~/.config/qtile/icons/arch.svg",
                       margin = 0,
                       scale = True,
                       background = colors[0],
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + " --hold -e neofetch")},
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       ),
              widget.GroupBox(
                       fontsize = 9,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       disable_drag = True,
                       highlight_method = "line",
                       active = colors[2],
                       inactive = "#c678dd",
                       highlight_color = "#1c1f24",
                       this_current_screen_border = "#51afef",
                       this_screen_border = "#98be65",
                       other_current_screen_border = "#98be65",
                       other_screen_border = "#98be65",
                       foreground = colors[2],
                       ),
              widget.TextBox(
                       text = '|',
                       font = "Ubuntu Mono",
                       foreground = '474747',
                       padding = 2,
                       fontsize = 14
                       ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       padding = 0,
                       scale = 0.75
                       ),
              widget.CurrentLayout(
                       foreground = colors[2],
                       padding = 5
                       ),
              widget.TextBox(
                       text = '|',
                       font = "Ubuntu Mono",
                       foreground = '474747',
                       padding = 2,
                       fontsize = 14
                       ),
              widget.WindowName(
                       foreground = colors[3],
                       padding = 0,
                       ),
              widget.Systray(
                       padding = 3,
                       ),
              widget.Spacer(
                       length=3,
                       ),
              left_arrow(colors[0], colors[4]),
              widget.Pomodoro(
                       background = colors[4],
                       color_active = colors[1],
                       color_break = colors[1],
                       color_inactive = colors[1],
                       fmt = '{}',
                       num_pomodori = 3,
                       ),
              left_arrow(colors[4], colors[5]),
              widget.Image(
                       filename = "~/.config/qtile/icons/keyboard.png",
                       margin = -1,
                       #scale = True,
                       background = colors[5],
                       mouse_callbacks = {'Button1': lambda: os.system("xkb-switch -n")},
                       ),
              #widget.KeyboardLayout(
              #         background = colors[5],
              #         configured_keyboards=['us', 'ua'],
              #         display_map = {'us' : 'us', 'ua' : 'ua'},
              #         option='grp:alt_shift_toggle',
              #         foreground = colors[1]
              #         ),
              widget.GenPollText(       #KeyboardLayout
                       func = keyboard,
                       fmt = " {} ",
                       background = colors[5],
                       update_interval = 1,
                       padding = 3,
                       mouse_callbacks = {'Button1': lambda: os.system("xkb-switch -n")},
                       ),
              left_arrow(colors[5], colors[6]),
              widget.BatteryIcon(
                       theme_path = '~/.config/qtile/icons/battery-icons',
                       background = colors[6],
                       ),
              widget.Battery(
                       charge_char = "↑",
                       discharge_char = "↓",
                       unknown_char = "||",
                       hide_treshold = True,
                       fmt = '{}',
                       format = "{char} {percent:2.0%} {hour:d}:{min:02d}",
                       background = colors[6],
                       low_foreground = colors[4],
                       #notification_timeout = 0,
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + " --hold -e sudo tlp-stat -b")}
                       ),
              left_arrow(colors[6], colors[7]),
              widget.Image(
                       filename = "~/.config/qtile/icons/calendar.png",
                       margin = 1,
                       scale = True,
                       background = colors[7],
                       ),
              widget.Clock(
                       background = colors[7],
                       fmt = "{}",
                       format = "%a, %b %d - %H:%M "
                       )
              ]
    return widgets_list

if __name__ in ["config", "__main__"]:
    screens = [Screen(top=bar.Bar(widgets=init_widgets_list(colors), opacity=1.0, size=20))]


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(title="Media viewer"),
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

wmname = "Qtile"
