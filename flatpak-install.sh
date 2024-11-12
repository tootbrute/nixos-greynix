#!/run/current-system/sw/bin/bash
# flatpak list --columns=application
# find flatpaks that are important
# add them to this variable

MY_FLATPAKS="
org.gimp.GIMP
md.obsidian.Obsidian
org.localsend.localsend_app
org.torproject.torbrowser-launcher
org.videolan.VLC
chat.simplex.simplex
io.github.flattool.Warehouse
io.missioncenter.MissionCenter
io.github.celluloid_player.Celluloid
io.github.dweymouth.supersonic
com.github.tchx84.Flatseal
com.calibre_ebook.calibre
com.brave.Browser
"

#MY_FLATPAKS=(
#    org.gimp.GIMP
#    md.obsidian.Obsidian
#    )

flatpak install --assumeyes $MY_FLATPAKS
