;; ---- org-roam start
;; which is finally why we came to org-mode in the first place.
(use-package org-roam
    :ensure t
    :custom
    (org-roam-directory "~/workspace/home/org-roam/")
    :bind   (("C-c n l"   . org-roam-buffer-toggle)
             ("C-c n f"   . org-roam-node-find)
             ("C-c n i"   . org-roam-node-insert)
             ("C-c n d"   . org-roam-dailies-goto-today)
             ("C-c n >"   . org-roam-dailies-goto-next-note)
             ("C-c n <"   . org-roam-dailies-goto-previous-note)
             ("C-c n ."   . org-roam-dailies-goto-next-note)
             ("C-c n ,"   . org-roam-dailies-goto-previous-note)
             ("C-c n c"   . org-roam-dailies-capture-today))
    :config
    (setq org-roam-dailies-directory "journal/")
    (org-roam-setup))

