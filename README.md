# LinuxDistroDetection
Script to detect linux distros, to add/reference in other scripts

After writing one too many installation scripts and having to port them to different distros (installing via pacman, yum, apt), I decided to make a quick little script to detect your distro.

Currently only supports Debian-based, RHEL-based, and Arch-based distros.  Also only supports distros that have systemd or hostnamectl (only non-systemd distro that I'm aware of having hostnamectl is Ubuntu 14.04).

After calling this script, you can add whatever necessary variable assignments in the if statements.  I tried to make it small for portability.

Since most mainstream distros have moved to systemd, this should be sufficient, as /etc/os-release is a systemd specification.  Happy to adapt to any pull requests though!

Happy scripting!
