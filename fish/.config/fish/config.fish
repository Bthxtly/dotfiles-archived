# prime-run Nvidia GPU if the external monitor is connected
if status is-login
    if test (tty) = /dev/tty1
        if lsusb | grep -q "Genesys Logic, Inc. Billboard Device"
            # run Hyprland with env var
            env AQ_DRM_DEVICES="/dev/dri/card0:/dev/dri/card1" Hyprland
        else
            Hyprland
        end
    end
end

if status is-interactive
    # shell integrations
    fzf --fish | source
    thefuck --alias | source
    zoxide init fish | source

    # clear greeting message
    set -U fish_greeting

    # # display a randomly selected tldr page
    # tldr --quiet $(tldr --quiet --list | shuf -n1)
end
