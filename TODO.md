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

# Tasks

- Use xrdb -merge ~/.Xresources before startup
- neovim plugins install
  - install fzf and the rest deps
- screen locker
- setup gtk theme
- jailing
