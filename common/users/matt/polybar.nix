{ config, lib, pkgs, ...}:

{
    services.polybar = {
        enable = true;
        script = ''
        polybar topBar &
        '';
        package = pkgs.polybar.override  {
            i3Support = true;
        };
        config = {
            "colors" = {
                background = "#000000ff";
                primary = "#fff";
                disabled = "#aaa";
                charging = "#ffb52a";
                alert = "#bd2c40";
            };
            "bar/topBar" = {
                monitor = "eDP-1";
                width = "100%";
                height = 27;
                fixed-center = true;

                background = "\${colors.background}";

                padding-left = 13;
                padding-right = 13;

                module-margin-left = 1;
                module-margin-right = 2;

                font-0 = "terminus:pixelsize=14;1";
                font-1 = "Font Awesome 5 Free:style=Regular:pixelsize=14;1";
                font-2 = "Font Awesome 5 Free:style=Solid:pixelsize=14;1";
                font-3 = "Font Awesome 5 Brands:pixelsize=14;1";

                modules-left = "date";
                modules-center = "i3";
                modules-right = "alsa wlan battery";
            };
            "module/date" = {
                type = "internal/date";
                interval = 1;

                date = " %m-%d";
                time = "%H:%M";

                format-prefix = "";
                format-prefix-foreground = "\${colors.primary}";
                format-underline = "\${colors.primary}";

                label-foreground = "\${colors.primary}";
                label = "%date% || %time%";
            };
            "module/i3" = {
                type = "internal/i3";
                format = "<label-state> <label-mode>";
                index-sort = true;

                # focused = Active workspace on focused monitor
                label-focused = "%icon%";
                label-focused-background = "\${colors.background}";
                label-focused-foreground = "\${colors.primary}";
                label-focused-underline = "\${colors.primary}";
                label-focused-padding = 2;

                # unfocused = Inactive workspace on any monitor
                label-unfocused = "%icon%";
                label-unfocused-padding = 2;
                label-unfocused-foreground = "\${self.label-focused-foreground}";

                # visible = Active workspace on unfocused monitor
                label-visible = "%icon%";
                label-visible-background = "\${self.label-focused-background}";
                label-visible-foreground = "\${self.label-focused-foreground}";
                label-visible-underline = "\${self.label-focused-underline}";
                label-visible-padding = "\${self.label-focused-padding}";

                # urgent = Workspace with urgency hint set
                label-urgent = "%icon%";
                label-urgent-underline = "\${colors.alert}";
                label-urgent-foreground = "\${colors.alert}";
                label-urget-background = "\${colors.background}";
                label-urgent-padding = 2;

                ws-icon-0 = "1;1";
                ws-icon-1 = "2;2";
                ws-icon-2 = "3;3";
                ws-icon-3 = "4;4";
                ws-icon-4 = "5;5";
                ws-icon-5 = "6;6";
                ws-icon-6 = "7;7";
                ws-icon-7 = "8;8";
                ws-icon-8 = "9;9";
                ws-icon-9 = "10;10";
            };
            "module/alsa" = {
                type = "internal/alsa";

                master-soundcard = "hw:0";
                speaker-soundcard = "hw:0";
                headphone-soundcard = "hw:0";

                mapped = true;

                format-volume-underline = "\${colors.primary}";
                format-volume = "<label-volume>";
                label-volume = " %percentage%%";
                label-volume-foreground = "\${colors.primary}";

                format-muted-underline = "\${colors.disabled}";
                format-muted = "<label-muted>";
                format-muted-foreground = "\${colors.disabled}";
                label-muted = " muted";
            };
            "module/wlan" = {
                type = "internal/network";
                interface = "wlp2s0";
                interval = 3;

                format-connected = "<label-connected>";
                format-connected-underline = "\${colors.primary}";
                label-connected = " %essid%";
                label-connected-foreground = "\${colors.primary}";

                format-disconnected = "<label-disconnected>";
                format-disconnected-underline = "\${colors.disabled}";
                label-disconnected = " disconnected";
                label-disconnected-foreground = "\${colors.disabled}";
            };
            "module/battery" = {
                type = "internal/battery";
                battery = "BAT0";
                adapter = "ADP1";
                full-at = 99;
                poll-interval = 1;

                format-charging = "<animation-charging> <label-charging>";
                format-charging-underline = "\${colors.charging}";
                label-charging-foreground = "\${colors.primary}";

                format-discharging = "<ramp-capacity> <label-discharging>";
                format-discharging-underline = "\${colors.primary}";
                label-discharging-foreground = "\${colors.primary}";

                format-full-prefix = "";
                format-full-prefix-foreground = "\${colors.primary}";
                format-full-underline = "\${colors.primary}";

                ramp-capacity-0 = "";
                ramp-capacity-1 = "";
                ramp-capacity-2 = "";
                ramp-capacity-3 = "";
                ramp-capacity-4 = "";
                ramp-capacity-foreground = "\${colors.primary}";

                animation-charging-0 = "";
                animation-charging-1 = "";
                animation-charging-2 = "";
                animation-charging-3 = "";
                animation-charging-4 = "";
                animation-charging-foreground = "\${colors.primary}";
                animation-charging-framerate = 750;
            };
            "settings" = {
                screenchange-reload = true;
            };
            "global/wm" = {
                margin-top = 5;
                margin-bottom = 5;
            };
        };
    };
}