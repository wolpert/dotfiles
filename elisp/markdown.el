;; Yeah, just realized we need markdown still configured... lets do that now.


(use-package markdown-mode
    :ensure t
    :mode (("README\\.md\\'" . gfm-mode)
           ("\\.md\\'" . markdown-mode)
           ("\\.markdown\\'" . markdown-mode))
    :init (setq markdown-command "multimarkdown"))

;; let org be able to export to md files
(use-package ox-gfm
    :ensure t)
