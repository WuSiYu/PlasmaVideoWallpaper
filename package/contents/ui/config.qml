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
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.0 as QtControls

// for "units"
import org.kde.plasma.core 2.0 as PlasmaCore


ColumnLayout {
    id: root
    property alias cfg_VideoPath: videoPath.text
    property alias cfg_VideoVolume: videoVolume.value

    RowLayout {
        spacing: units.largeSpacing / 2

        QtControls.Label {
            Layout.minimumWidth: width
            Layout.maximumWidth: width
            width: formAlignment - units.largeSpacing
            horizontalAlignment: Text.AlignRight
            text: i18nd("plasma_wallpaper_org.kde.plasma.videowallpaper", "Video:")
        }
		QtControls.TextField {
			id: videoPath
			Layout.fillWidth: true
		}
        QtControls.Button {
            id: videoPathPick
			text: "..."
			onClicked: fileDialog.open()
        }
    }

    RowLayout {
        spacing: units.largeSpacing / 2

        QtControls.Label {
            Layout.minimumWidth: width
            Layout.maximumWidth: width
            width: formAlignment - units.largeSpacing
            horizontalAlignment: Text.AlignRight
            text: i18nd("plasma_wallpaper_org.kde.plasma.videowallpaper", "Volume:")
        }
		QtControls.SpinBox {
			id: videoVolume
			minimumValue: 0
			maximumValue: 100
		}
    }

    RowLayout {
        spacing: units.largeSpacing / 2

        QtControls.Label {
            Layout.minimumWidth: width
            Layout.maximumWidth: width
            width: formAlignment - units.largeSpacing
            horizontalAlignment: Text.AlignRight
        }
		QtControls.Label {
			text: i18nd("plasma_wallpaper_org.kde.plasma.videowallpaper", "You can pause or resume the video by click the wallpaper")
		}
    }

	FileDialog {
		id: fileDialog
		title: i18nd("plasma_wallpaper_org.kde.plasma.videowallpaper", "Open a video")
		nameFilters: "Video files (*.mp4 *.mpg *.ogg *.mov *.webm *.flv *.matroska *.avi *.mkv)"
		onAccepted: cfg_VideoPath = fileDialog.fileUrls[0]
	}

    Item { // tighten layout
        Layout.fillHeight: true
    }
}
