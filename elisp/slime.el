;;; slime.el --- SLIME for SBCL -*- lexical-binding: t; -*-
;;; Commentary:
;;; slime mode to use with sbcl.
;;; Code:

(setq inferior-lisp-program "sbcl")

(use-package slime
  :ensure t)

;;; slime.el ends here
