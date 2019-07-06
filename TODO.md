- //Investigate alacritty config issue
- //Why in Alacritty font size is smaller (11pt) than in i3 (9pt). Alacritty won't respect DPI set in Xresources
- //Investigate DPI thing. Why setting dpi 120 does not scales screen to 1440 in Chrome, even 96 dpi makes screen 1920. Weird beahivour, solved overriding DPI with scaling
  - https://www.linux.org.ru/forum/desktop/13782270
  - https://www.linux.org.ru/forum/linux-hardware/13782671
- //How to change dpi in alacritty?

//We use 1.25 (125%) scaling (120 dpi) which makes desktop screen equal to 1536px

---

# Not critical

- Use xrdb -merge ~/.Xresources before startup
- Put Xft.dpi to system file
