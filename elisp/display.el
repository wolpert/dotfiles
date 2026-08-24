;;; display.el --- Display and theme settings -*- lexical-binding: t; -*-
;;; Commentary:
;;; The display settings we want, including a general theme.
;;; Code:

(use-package monokai-theme
  :ensure t)

;; Emacs 31's org-faces defines org-level-N as `:inherit outline-N', while
;; monokai defines outline-N as `:inherit org-level-N'.  Emacs 31 detects the
;; resulting cycle and aborts `load-theme' with "Face inheritance results in
;; inheritance cycle: org-level-8".  Drop the org-level-N side of the loop
;; before the theme loads; monokai gives those faces explicit colours anyway.
(require 'outline)
(require 'org-faces)
(dotimes (i 8)
  (face-spec-set (intern (format "org-level-%d" (1+ i)))
                 '((t :inherit unspecified))
                 'face-defface-spec))

(load-theme 'monokai t)

;; Fix face attribute warnings
(with-eval-after-load 'monokai-theme
  (set-face-attribute 'highlight nil :distant-foreground 'unspecified))

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

;;; display.el ends here
