## A simple shell script to disable the wayland display server on gnome.

---
## The why
With wayland enabled, screensharing in apps written with election does not work.

## How To
Copy this lines and paste it into a terminal
```bash
git clone https://github.com/marinus-g/gnome-x11-displayserver-script.git && sudo sh gnome-x11-displayserver-script/script.sh
```
Run the `revert.sh` script if you want to switch the displayserver back to wayland!
