;;; bootstrap.el --- load my personal elisp files -*- lexical-binding: t; -*-
;;; Commentary:
;;; Provides for my current bootstrap.
;;; Code:

;;; List the files we want.
(defvar nemacs-files
  '("org.el"
    "org-roam.el"
    "autocomplete.el"
    "markdown.el"
    "display.el"
    "spellcheck.el"
    "font.el"
    "prog.el"
    "slime.el"
    "java-ide.el"
    "claude.el")
  "Files I need to load.")

(defun nemacs-load (file &optional ignore)
  "Load FILE from my elisp dir.  Set IGNORE non-nil to swallow errors."
  (let ((full-file (f-join "~/dotfiles/elisp" file)))
    (if ignore
        (ignore-errors (load-file full-file))
      (load-file full-file))))

(dolist (file nemacs-files)
  ;; Load claude.el soft: a failure there shouldn't break the rest of init.
  (nemacs-load file (string= file "claude.el")))

;;; bootstrap.el ends here
