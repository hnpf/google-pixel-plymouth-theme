# Google Pixel Plymouth Theme
A high-quality, pixel-accurate Gemini boot animation for Linux. 
Optimized for fast-booting systems (Arch/CachyOS).

## Description
This theme uses the Gemini "G" animation frames used in modern Google Pixels. Since modern PCs boot 
too fast for the full 190-frame sequence, this script includes 
logic to speed up playback and hold the final frame.. Yeah, it sucks to have a fast pc now.

## INSTALLATION
Remember, install.sh does most of this already. but please do step 3.

1. Copy the theme folder:
   sudo cp -r gemini-pixel /usr/share/plymouth/themes/

2. Set the theme:
   sudo plymouth-set-default-theme -R gemini-pixel

3. Update initramfs (Arch):
   Make sure 'sd-plymouth' (optional) and 'kms' are in your HOOKS in /etc/mkinitcpio.conf.
   run: sudo mkinitcpio -P

## Optional performance tweaks

If the animation is too slow or cuts off:
- Edit 'gemini-pixel.script' 
- Find 'progress += 1'
- Change it to 'progress += 2' or '+ 4' for faster booting systems.

To hide your boot text (for a polished and cleaner look..):
Add 'quiet splash loglevel=3 vt.global_cursor_default=0' to your GRUB cmdline.

## Credits
- animation: google pixel 9 / gemini
- author: VIREX (hnpf)

## LICENSE
Project uses the MIT License. Upload, share, modify as you please.
