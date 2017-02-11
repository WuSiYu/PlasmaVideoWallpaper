cmake_minimum_required(VERSION 2.8.12)

project(plasma-videowallpaper)

find_package(ECM 1.4.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

find_package(KF5Plasma REQUIRED)

plasma_install_package(package org.kde.plasma.videowallpaper wallpapers wallpaper)

install(DIRECTORY "./locale/"
    DESTINATION "/usr/local/share/locale"
    FILES_MATCHING PATTERN "*/LC_MESSAGES/*.mo"
)
