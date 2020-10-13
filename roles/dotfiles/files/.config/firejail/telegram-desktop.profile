include /etc/firejail/telegram-desktop.profile

mkdir ${HOME}/.local/share/TelegramDesktop

whitelist ${HOME}/.local/share/TelegramDesktop
whitelist ${HOME}/Downloads
