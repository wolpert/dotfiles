;;; autocomplete.el --- minibuffer completion (ivy/counsel) -*- lexical-binding: t; -*-
;;; Commentary:
;;; Minibuffer completion via ivy/counsel/swiper.  In-buffer (popup)
;;; completion is handled by company (see java-ide.el), which replaced the
;;; old auto-complete package.
;;; Code:

;; IVY from fowler https://martinfowler.com/articles/2024-emacs-completion.html
(use-package ivy
  :ensure t
  :demand t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  (setq ivy-height 10)
  (setq counsel-find-file-at-point t)
  (setq ivy-count-format "(%d/%d) "))

(use-package counsel
    :ensure t
    :bind (("C-x C-b" . ivy-switch-buffer)
           ("C-x b" . ivy-switch-buffer)
           ("M-r" . counsel-ag)
           ("C-x C-d" . counsel-dired)
           ("C-x d" . counsel-dired))
    :diminish
    :config
    (global-set-key [remap org-set-tags-command] #'counsel-org-tag))

(use-package swiper
    :ensure t
    :bind (("M-C-s" . swiper)))

(use-package ivy-hydra
    :ensure t)

;;; autocomplete.el ends here
