{ config, lib, pkgs, ...}:

{
    xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "\"rofi -modi drun,run,ssh -show drun -theme side\"";
      bars = [];
      startup = [
        {
          command = "pkill polybar; polybar topBar &";
          always = true;
        }
        {
          command = "setxkbmap -option caps:super";
          always = false;
        }
      ];
      keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
      in lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec --no-startup-id amixer set Master 5%+";
        "XF86AudioLowerVolume" = "exec --no-startup-id amixer set Master 5%-";
        "XF86AudioMute" = "exec --no-startup-id amixer set Master toggle";
        "${modifier}+x" = "scratchpad show";
      };
    };
    extraConfig = ''
    set $mode_system (l) logout, (Shift+r) reboot, (Shift+s) shutdown
    mode "$mode_system" {
        bindsym l exec --no-startup-id i3-msg exit, mode "default"
        bindsym Shift+r exec --no-startup-id systemctl reboot, mode "default"
        bindsym Shift+s exec --no-startup-id systemctl poweroff, mode "default"

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }
    bindsym MOD4+q mode "$mode_system"

    # Place terminal in scratchpad on login
    exec --no-startup-id alacritty -t scratchpad
    for_window [title="scratchpad"] move scratchpad
    for_window [title="scratchpad"] scratchpad show
    for_window [title="scratchpad"] resize set 685 300
    for_window [title="scratchpad"] move position 1230px 40px
    for_window [title="scratchpad"] scratchpad show
    '';
  };
}
