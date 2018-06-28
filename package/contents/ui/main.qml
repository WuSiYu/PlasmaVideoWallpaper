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
import QtMultimedia 5.11
import org.kde.plasma.extras 2.0 as PlasmaExtras

Item {
	id: root

	MediaPlayer {
		id: player1
		volume: wallpaper.configuration.VideoVolume/100
		source: wallpaper.configuration.VideoPath
		onStopped: {
            if(wallpaper.configuration.DualPlayback){
                videoOutput1.visible = false
                videoOutput2.visible = true
                if(player2.source != wallpaper.configuration.VideoPath){
                    player2.source = wallpaper.configuration.VideoPath
                }
                player1.play()
                player1.pause()
                player2.play()
            }else{
                if(player2.source == wallpaper.configuration.VideoPath){
                    player2.stop()
                    player2.source = ''
                }
                player1.play()
            }
		}
	}

	MediaPlayer {
		id: player2
		volume: wallpaper.configuration.VideoVolume/100
		onStopped: {
            videoOutput2.visible = false
            videoOutput1.visible = true
            player2.play()
            player2.pause()
			player1.play()
		}
	}

    VideoOutput {
		id: videoOutput1
		fillMode: VideoOutput.PreserveAspectCrop
		anchors.fill: parent
		source: player1
	}

	VideoOutput {
		id: videoOutput2
		fillMode: VideoOutput.PreserveAspectCrop
		anchors.fill: parent
		source: player2
	}

	MouseArea {
		id: playArea
		anchors.fill: parent
        onPressed: {
            if( videoOutput1.visible == true ){
                player1.playbackState === MediaPlayer.PlayingState ? player1.pause() : player1.play()
            }else{
                player2.playbackState === MediaPlayer.PlayingState ? player2.pause() : player2.play()
            }
        }
	}

	Component.onCompleted: {
        videoOutput2.visible = false
        videoOutput1.visible = true
        
        if(wallpaper.configuration.DualPlayback){
            player2.source = wallpaper.configuration.VideoPath
            player2.play()
            player2.pause()
        }
        player1.play()
    }
}

	

