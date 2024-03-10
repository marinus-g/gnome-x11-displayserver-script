#!/bin/bash

GDM_CUSTOM_CONF="/etc/gdm3/custom.conf"

if [ ! -f "$GDM_CUSTOM_CONF" ]; then
    echo "$GDM_CUSTOM_CONF does not exist. Creating file and setting WaylandEnable=false"

    echo "[daemon]" | sudo tee "$GDM_CUSTOM_CONF"
    echo "# Uncoment the line below to force the login screen to use Xorg" | sudo tee -a "$GDM_CUSTOM_CONF"
    echo "WaylandEnable=false" | sudo tee -a "$GDM_CUSTOM_CONF"
else
    echo "$GDM_CUSTOM_CONF exists. Updating WaylandEnable=false"

    if grep -q "^#WaylandEnable=false" "$GDM_CUSTOM_CONF"; then
        sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=false/' "$GDM_CUSTOM_CONF"
    elif ! grep -q "^WaylandEnable=false" "$GDM_CUSTOM_CONF"; then
        echo "WaylandEnable=false" | sudo tee -a "$GDM_CUSTOM_CONF"
    else
        echo "Wayland is already disabled in $GDM_CUSTOM_CONF"
    fi
fi


echo "The display server has been set to use X11. It's recommended to reboot your system for the changes to take effect."
echo "Run 'sudo reboot' to reboot now."

