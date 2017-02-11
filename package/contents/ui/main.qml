/*
 * Copyright (C) 2017 by WuSiYu <wu.siyu@hotmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.1
import QtMultimedia 5.5
import org.kde.plasma.extras 2.0 as PlasmaExtras

Item {
    id: root
    property var playing: true
    
	MediaPlayer {
        id: mediaPlayer
        autoPlay: true
        loops: MediaPlayer.Infinite
        volume: wallpaper.configuration.VideoVolume/100
        source: wallpaper.configuration.VideoPath
    }

    VideoOutput {
        fillMode: VideoOutput.PreserveAspectCrop
        anchors.fill: parent
        source: mediaPlayer
    }
    
    MouseArea {
        id: playArea
        anchors.fill: parent
        onPressed: mediaPlayer.playbackState === MediaPlayer.PlayingState ? mediaPlayer.pause() : mediaPlayer.play()
    }
}
