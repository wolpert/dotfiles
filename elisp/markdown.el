;;; markdown.el --- Markdown editing and export -*- lexical-binding: t; -*-
;;; Commentary:
;;; Markdown mode plus org export to GitHub-flavored markdown.
;;; Code:

(use-package markdown-mode
    :ensure t
    :mode (("README\\.md\\'" . gfm-mode)
           ("\\.md\\'" . markdown-mode)
           ("\\.markdown\\'" . markdown-mode))
    ;; pandoc is installed (multimarkdown is not). Set markdown-command here
    ;; only -- the duplicate in dot-emacs custom-set-variables was removed.
    :init (setq markdown-command "pandoc"))

;; let org be able to export to md files
(use-package ox-gfm
    :ensure t)

;;; markdown.el ends here
