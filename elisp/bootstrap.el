;;;
;;; Provides for my current bootstrap.
;;;

;;; List the files we want.
(defvar nemacs-files (flatten-list
		      '("org.el"
			"org-roam.el"
			"autocomplete.el"
			"markdown.el"
			"display.el"
			"spellcheck.el"
			"font.el"
			"prog.el"
			"slime.el"
			"lsp.el"
			"java-ide.el"
			))
  "Files I need to load")

(defun nemacs-load (file &optional ignore)
  "Loads the current file. Set non-nil to ignore if you want the errors"
  (setq full-file (f-join "~/dotfiles/elisp" file))
  (if ignore
      (ignore-errors (load-file full-file))
    (load-file full-file))
  )

(dolist (file nemacs-files)
  (nemacs-load file))
