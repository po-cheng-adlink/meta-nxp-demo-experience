ROOTFS_POSTPROCESS_COMMAND:append:mx93-nxp-bsp = " install_demo_93; "
ROOTFS_POSTPROCESS_COMMAND:append:mx8-nxp-bsp = " install_demo; "
ROOTFS_POSTPROCESS_COMMAND:append:mx95-nxp-bsp = " install_demo; "
ROOTFS_POSTPROCESS_COMMAND:append:mx7ulp-nxp-bsp = " install_demo; "

install_demo() {
    if ! grep -q "icon=/opt/gopoint-apps/icon/icon_demo_launcher.png" ${IMAGE_ROOTFS}${sysconfdir}/xdg/weston/weston.ini
    then
       printf "\n[launcher]\nicon=/opt/gopoint-apps/icon/icon_demo_launcher.png\npath=/usr/bin/gopoint\n\n[launcher]\nicon=/usr/share/weston/terminal.png\npath=/usr/bin/weston-terminal" >> ${IMAGE_ROOTFS}${sysconfdir}/xdg/weston/weston.ini
    fi
    if ! grep -q "HOME=/root/" ${IMAGE_ROOTFS}${sysconfdir}/default/weston
    then
        printf "\nHOME=/root/\nQT_QPA_PLATFORM=wayland" >> ${IMAGE_ROOTFS}${sysconfdir}/default/weston
    fi
}

install_demo_93() {
    if ! grep -q "icon=/opt/gopoint-apps/icon/icon_demo_launcher.png" ${IMAGE_ROOTFS}${sysconfdir}/xdg/weston/weston.ini
    then
       printf "\n[launcher]\nicon=/opt/gopoint-apps/icon/icon_demo_launcher.png\npath=QMLSCENE_DEVICE=softwarecontext /usr/bin/gopoint\n\n[launcher]\nicon=/usr/share/weston/terminal.png\npath=/usr/bin/weston-terminal" >> ${IMAGE_ROOTFS}${sysconfdir}/xdg/weston/weston.ini
    fi
    if ! grep -q "HOME=/root/" ${IMAGE_ROOTFS}${sysconfdir}/default/weston
    then
        printf "\nHOME=/root/\nQT_QPA_PLATFORM=wayland" >> ${IMAGE_ROOTFS}${sysconfdir}/default/weston
    fi
}
