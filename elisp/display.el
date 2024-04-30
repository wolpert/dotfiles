;;; The display settings we want, including a general theme

(use-package monokai-theme
  :ensure t)
(load-theme 'monokai t)


;; show matching parens
(show-paren-mode 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Now dim inactive windows
(use-package dimmer
  :ensure t
  :custom
  (dimmer-adjustment-mode :foreground)
  :config
  (dimmer-configure-which-key)    ; Do not dim these special windows
  (dimmer-configure-hydra)
  (dimmer-configure-magit)
  (dimmer-mode t))
