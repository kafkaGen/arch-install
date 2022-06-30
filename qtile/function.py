import os
from libqtile import widget

def keyboard():                                                                
    return 'US' if os.popen("xset -q|grep LED| awk '{ print $10 }'").read().split('\n')[0] == '00000000' else 'UA'                                                  
                                                                                  
def backlight():                                                                  
    return os.popen("cat /sys/class/backlight/nvidia_0/actual_brightness").read().split('\n')[0]

def left_arrow(background_color, foreground_color):
    return widget.TextBox(
            text = "\uE0B2",
            padding = 0,
            fontsize = 25,
            background = background_color,
            foreground = foreground_color,
            )

bar_condition = 1

def bar_switch():
    bar_condition *= -1
