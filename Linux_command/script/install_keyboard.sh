#!/bin/bash

cd ~
# 安裝「gcin
sudo apt-get install gcin gcin-qt5-immodule gcin-anthy gcin-voice
# 接著執行下面指令，將系統的輸入法框架設「gcin」
im-config -n gcin
# 執行下面指令，確認上個步驟是否有更改
cat ~/.xinputrc
# 如何確認系統上安裝了那些關於「gcin」的套件
dpkg -l | grep gcin
# 重啟
reboot
