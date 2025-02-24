
;;;
;;; The autocomplete package and configurations
;;; 


(use-package auto-complete
    :ensure t
    :config
    (ac-config-default))
;; and start configuring auto-complete for org mode

;; Had to disable org-ac. It was last touched 8 years ago and now just
;; beeps a lot. :( 

;(use-package org-ac
;    :ensure t
;    :init
;    (org-ac/config-default))


;; IVY from fowler https://martinfowler.com/articles/2024-emacs-completion.html
(use-package ivy
  :demand t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-use-selectable-prompt t)
;;  (setq ivy-ignore-buffers '(\\` " "\\`\\*magit'))
  (setq ivy-re-builders-alist '(
                                (t . ivy--regex-ignore-order)
                                ))
  (setq ivy-height 10)
  (setq counsel-find-file-at-point t)
  (setq ivy-count-format "(%d/%d) "))

(use-package counsel
    :ensure t
    :bind (
           ("C-x C-b" . ivy-switch-buffer)
           ("C-x b" . ivy-switch-buffer)
           ("M-r" . counsel-ag)
           ("C-x C-d" . counsel-dired)
           ("C-x d" . counsel-dired)
           )
    :diminish
    :config
    (global-set-key [remap org-set-tags-command] #'counsel-org-tag))

(use-package swiper
    :ensure t
    :bind(("M-C-s" . swiper)))

(use-package ivy-hydra
    :ensure t)
