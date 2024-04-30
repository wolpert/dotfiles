;;;
;;; Provides for my current bootstrap.
;;;

;;; List the files we want.
(defvar nemacs-files (flatten-list
		      '("theme.el"
			))
  "Files I need to load")

(defun nemacs-load (file)
  "Loads the current file"
  (ignore-errors
    (load-file (f-join "~/dotfiles/elisp" file)))
  )

(dolist (file nemacs-files)
  (nemacs-load file))
