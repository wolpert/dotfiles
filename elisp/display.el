;;; The display settings we want

;; and make everything pretty!!
(use-package monokai-theme
    :ensure t)
(load-theme 'monokai t)


;; show matching parens
(show-paren-mode 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
