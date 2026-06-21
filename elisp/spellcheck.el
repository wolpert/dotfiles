;;; spellcheck.el --- Spell checking -*- lexical-binding: t; -*-
;;; Commentary:
;;; Enable flyspell in text and org buffers.
;;; Code:

(dolist (hook '(text-mode-hook org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;;; spellcheck.el ends here
