Plasma Video Wallpaper
=========================

A KDE Plasma 5 wallpaper plugin which can let you using a video as the wallpaper

![Screenshot](http://i.imgur.com/mFf8NZp.jpg)


Build and install instructions
---------------------------------

```bash
cmake .
make
sudo make install
```
If it says `Could not find a package configuration file provided by "ECM" ` during the `cmake .`, try to install `extra-cmake-modules` package

Restart plasmashell
(in a terminal or in krunner type: `kquitapp plasmashell` and then `plasmashell`)


Usage
--------
- Open desktop settings
- Select `Video` in `Wallpaper Type`
- Choose a video file

![Settings](https://i.imgur.com/NhNPz1h.png)

You can pause or resume the video by clicking wallpaper, but it won't work if your `Layout` is set to `Folder View`
