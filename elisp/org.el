;;;
;; Configuration org mode
;;;

(use-package org
    :ensure t
    :bind ("A-<tab>" . pcomplete)
    :config
    (setq org-refile-targets '((nil :maxlevel . 9)
                               (org-agenda-files :maxlevel . 2))
          org-refile-use-outline-path 'file
          org-outline-path-complete-in-steps nil
          )
    )


;; lets load languages we care about so they are displayed nicely.
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (awk . t)
   (emacs-lisp . t)
   (java . t)
   (python . t)
   (ruby . t)
   ;;(rust . t)
   (shell . t)
   ))

;; Back to org-mode, Weeks in org mode start on Sunday.
(setq org-agenda-start-on-weekday 0)
;; no confirmation
(setq org-confirm-babel-evaluate nil)
;; syntax highlighting
(setq org-src-fontify-natively t)
;; todo states in org mode
(setq org-todo-keywords
      '((sequence "TODO" "ACTIVE" "WAITING" "|" "DONE" "ABANDONED")))

;; now some global keys for org mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)
;; and where to look for files for the agenda
(setq org-agenda-files
       (list "~/workspace/home/org/"
       "~/workspace/home/org-roam/journal/"
       "~/workspace/home/org-roam/"
       ))

;; now that org-mode is configured, setup the code to enable markdown exports
(eval-after-load "org"
  '(require 'ox-md nil t))
(eval-after-load "org"
  '(require 'ox-gfm nil t))

;; stole this from doom, lets get org bullets configured for 'more pretty!'
(use-package org-bullets
    :ensure t)
(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)))

(setq org-startup-folded 'show2levels)
