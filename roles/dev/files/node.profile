quiet

include /etc/firejail/default.profile

#private

whitelist ${HOME}/Projects
whitelist ${HOME}/.yarn/bin
whitelist ${HOME}/.config/yarn
