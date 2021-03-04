(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; Packages list
(setq package-selected-packages
      '(evil
        helm
        atom-one-dark-theme
        org-roam))

;; Theme
(load-theme 'atom-one-dark t)

;; Enable Evil
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; Org Roam
(setq org-roam-directory "~/Knowledge")
(add-hook 'after-init-hook 'org-roam-mode)

;; Helm
; (require 'helm-config)
(helm-mode 1)

;; Keymaps
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x p") 'org-roam-find-file)


;; Hide toolbar, menu bar and scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
