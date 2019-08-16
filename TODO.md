# Not critical

- Put Xft.dpi to system file
- bash PS1 should indicate whether user logged as root.
- define font in vars
- use terminus pro in tty? as default font doesn't renders some symbols
- Notion debt page in mozilla start page
- use monospace font as in github or - https://github.com/vivien/i3blocks-contrib/blob/master/batterybar/screenshot.png . Liberation Mono or simply 'monospace' or Noto Mono
- define system color set
- have terminal colors the same as in current ubuntu
- make terminal and generic black color deeply darkened blue
- make terminal color palette

# Tasks

- auto copying dotfiles
- ssh
- jailing

- Add \$VISUAL to .bashrc?

  - how to make sure executive files do not run /usr/bin/node
    - probably install nodejs manually/locally
  - restrict access to /usr/bin ? in order to disallow accessing spawning new node process and accessing home dir? most likely spawned process will not have access to home anyways
  - have node but not yarn installed, share node_modules between container and host machine to have access to packages such as prettier etc

- copy video specific settings to /etc/X11/xorg.conf.d

  - should I copy all video drivers configuration and system will choose automatically which one to use for gpu?
  - OutputClass all drivers and Device in template for defining driver in use

- slock. suspend on lid close
  -enable slock?

- how to avoid dns reconfiguring attack


Neovim
- Snippets (deoplete, neosnippet)
- jailing
