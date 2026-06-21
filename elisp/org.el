;;; org.el --- org-mode configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Configuration for org mode.  Settings live inside :config so org is
;;; only loaded when first needed (an org file or an org command).
;;; Code:

(use-package org
    :ensure t
    :bind (("A-<tab>" . pcomplete)
           ("C-c l" . org-store-link)
           ("C-c a" . org-agenda)
           ("C-c c" . org-capture)
           ("C-c b" . org-switchb))
    :config
    (setq org-refile-targets '((nil :maxlevel . 9)
                               (org-agenda-files :maxlevel . 2))
          org-refile-use-outline-path 'file
          org-outline-path-complete-in-steps nil)

    ;; Weeks in org mode start on Sunday.
    (setq org-agenda-start-on-weekday 0)
    ;; no confirmation for babel
    (setq org-confirm-babel-evaluate nil)
    ;; syntax highlighting in src blocks
    (setq org-src-fontify-natively t)
    ;; todo states
    (setq org-todo-keywords
          '((sequence "TODO" "ACTIVE" "WAITING" "|" "DONE" "ABANDONED")))
    ;; where to look for agenda files
    (setq org-agenda-files
          (list "~/workspace/home/org/"
                "~/workspace/home/org-roam/journal/"
                "~/workspace/home/org-roam/"))
    (setq org-startup-folded 'show2levels)

    ;; languages we care about so they display/run nicely
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((awk . t)
       (emacs-lisp . t)
       (java . t)
       (python . t)
       (ruby . t)
       ;;(rust . t)
       (shell . t)))

    ;; enable markdown / GitHub-flavored markdown export
    (require 'ox-md nil t)
    (require 'ox-gfm nil t))

;; pretty bullets in org buffers
(use-package org-bullets
    :ensure t
    :hook (org-mode . org-bullets-mode))

;;; org.el ends here
