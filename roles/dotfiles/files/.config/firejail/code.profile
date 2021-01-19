include /etc/firejail/code.profile


mkdir ${HOME}/.config/Code
mkdir ${HOME}/.vscode

whitelist ${HOME}/.config/Code
whitelist ${HOME}/.vscode

whitelist ${HOME}/.gtkrc-2.0
whitelist ${HOME}/.config/gtk-2.0
whitelist ${HOME}/.config/gtk-3.0
whitelist ${HOME}/Projects
