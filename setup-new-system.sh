echo "NEW SYSTEM SETUP"
echo "add flathub"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "fix autologin"
echo "install GNOME seahorse keyring to fix autologin"
nix-shell -p gnome.seahorse
echo "Now, open seahorse, change password of Login to blank"
