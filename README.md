# sabayon-tools
This is my Sabayon overlay, it was originally intended for Atom with ebuilds to install Atom from binary packages. It has since been expanded to include extra packages. To add this overlay run (as root):
```sh
layman -a sabayon-tools
```
`STATUS.md` files refer to my history (of past build/installation failures) with the ebuild in question.

## ebuilds
### [Atom][7]
[app-editors/atom-bin][11] is designed to install Atom from official Debian package releases. I did not use [app-editors/atom][12] to build binaries because it is more likely to generate build errors (usually related to momentary network connectivity issues) and takes over an hour, but I have fixed it now so that it should work even with intermittent network issues, although it still takes over an hour to build.

### [FFMpegThumbs-MattePaint][1]
[kde-apps/ffmpegthumbs-mattepaint][2] is a program that when installed (and enabled by going to **Control**&rarr;**Configure Dolphin...**&rarr;**General**&rarr;**Previews** and selecting in the "Show previews for:" box, "Video Files (ffmpegthumbs-mattepaint)") should allow video file thumbnailing (or previews) in Dolphin.

### [Onboard][3]
[app-accessibility/onboard][4] is an on-screen virtual keyboard that is developed for Ubuntu, although via the [`unity-gentoo`][5] and [`lif`][6] overlays it has also been ported to Gentoo-based platforms, such as Sabayon. I use it primarily when my cat jumps on me for scratches, which leaves me just one hand spare to use my laptop. I touch-type fairly well with two hands but poorly with just one, so onboard can help improve my one-handed typing performance.

### [wkhtmltopdf][10]
[media-gfx/wkhtmltopdf][13] is a command-line tool for converting HTML webpages to PDF format.

## Binary packages
Using these tools I also build a SPM `tbz2` package that I upload to my dropbox. You can install these packages, after you download them, of course, by running (as root):
```sh
mv <PACKAGE> /var/lib/entropy/smartpackages/amd64
equo i -av <PACKAGE>
```
although it is important to ensure their file extension is `.tbz2`, downloading from my dropbox will likely give you a file name ending with `?dl=1`, which you will need to remove in order to install the binary with `equo`.

[1]: http://kde-apps.org/content/show.php/FFMpegThumbs-MattePaint?content=153902 "FFMpegThumbs-MattePaint Homepage"
[2]: https://github.com/fusion809/sabayon-tools/tree/master/kde-apps/ffmpegthumbs-mattepaint "kde-apps/ffmpegthumbs-mattepaint"
[3]: https://launchpad.net/onboard "Onboard Homepage at Launchpad"
[4]: https://github.com/fusion809/sabayon-tools/tree/master/app-accessibility/onboard "app-accessibility/onboard"
[5]: https://github.com/shiznix/unity-gentoo "unity-gentoo overlay"
[6]: https://github.com/killer2tester/gentoo-overlay-lif "lif overlay"
[7]: https://atom.io "Atom Homepage"
[9]: http://www.scilab.org/ "Scilab Homepage"
[10]: http://wkhtmltopdf.org/
[11]: https://github.com/fusion809/sabayon-tools/tree/master/app-editors/atom-bin
[12]: https://github.com/fusion809/sabayon-tools/tree/master/app-editors/atom
[13]: https://github.com/fusion809/sabayon-tools/tree/master/media-gfx/wkhtmltopdf
