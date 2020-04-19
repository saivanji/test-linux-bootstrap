quiet

include /etc/firejail/default.profile

#private

whitelist ${HOME}/Projects
whitelist ${HOME}/.node_global
whitelist ${HOME}/.eslintrc.js
