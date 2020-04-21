quiet

include /etc/firejail/default.profile

whitelist ${HOME}/.local/bin
whitelist ${HOME}/.node_global
whitelist ${HOME}/.local/share/nvim
whitelist ${HOME}/.config/nvim
whitelist ${HOME}/Projects