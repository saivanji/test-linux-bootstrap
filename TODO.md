- //Investigate alacritty config issue
- //Why in Alacritty font size is smaller (11pt) than in i3 (9pt). Alacritty won't respect DPI set in Xresources
- //Investigate DPI thing. Why setting dpi 120 does not scales screen to 1440 in Chrome, even 96 dpi makes screen 1920. Weird beahivour, solved overriding DPI with scaling
  - https://www.linux.org.ru/forum/desktop/13782270
  - https://www.linux.org.ru/forum/linux-hardware/13782671
- //How to change dpi in alacritty?

//We use 1.25 (125%) scaling (120 dpi) which makes desktop screen equal to 1536px

---

# Not critical

- Put Xft.dpi to system file
- bash PS1 should indicate whether user logged as root.
- neovim paste doesn't work
- define font in vars
- use terminus pro in tty? as default font doesn't renders some symbols
- Notion debt page in mozilla start page
- use monospace font as in github or - https://github.com/vivien/i3blocks-contrib/blob/master/batterybar/screenshot.png . Liberation Mono or simply 'monospace'
- define system color set
- have terminal colors the same as in current ubuntu

# Tasks

- auto copying dotfiles

- use i3 blocks

  - # date
  - # battery
  - wifi / lte indicator
  - bluetooth indicator
  - # keyboard layout
  - weather
  - volume

- jailing

  - restrict access to /usr/bin ? in order to disallow accessing spawning new node process and accessing home dir? most likely spawned process will not have access to home anyways
  - have node but not yarn installed, share node_modules between container and host machine to have access to packages such as prettier etc

- copy video specific settings to /etc/X11/xorg.conf.d

  - should I copy all video drivers configuration and system will choose automatically which one to use for gpu?
  - OutputClass all drivers and Device in template for defining driver in use

- slock. suspend on lid close

- how to avoid dns reconfiguring attack
