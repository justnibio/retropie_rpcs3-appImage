#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="rpcs3-appImage"
rp_module_desc="PS3 emulator RPCS3"
rp_module_help="ROM Extensions: .ps3\n\nCopy your .PS3 game folders to $romdir/ps3\n\nDon't forget to run system firmware update first!"
rp_module_licence="GPL2 https://raw.githubusercontent.com/RPCS3/rpcs3/master/LICENSE"
rp_module_section="exp"
rp_module_flags="!all 64bit"

function install_bin_rpcs3-appImage() {
    mkdir -p "$md_inst/bin"
    wget https://github.com/RPCS3/rpcs3-binaries-linux-arm64/releases/download/build-ff0249d662fcedee602c9206e73b5feb91f164c1/rpcs3-v0.0.34-17222-ff0249d6_linux_aarch64.AppImage -O "$md_inst/bin/rpcs3.AppImage"
    chmod +x "$md_inst/bin/rpcs3.AppImage"
}

function configure_rpcs3-appImage() {
    mkRomDir "ps3"
    addEmulator 0 "$md_id" "ps3" "$md_inst/bin/rpcs3.AppImage %ROM%/PS3_GAME/USRDIR/EBOOT.BIN"
    addEmulator 1 "$md_id-nogui" "ps3" "$md_inst/bin/rpcs3.AppImage --no-gui %ROM%/PS3_GAME/USRDIR/EBOOT.BIN"
    addEmulator 2 "$md_id-guionly" "ps3" "$md_inst/bin/rpcs3.AppImage"
    addSystem "ps3"
}
