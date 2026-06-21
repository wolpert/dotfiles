;;; font.el --- Fixed-width font selection -*- lexical-binding: t; -*-
;;; Commentary:
;;; Set the current fixed-width font based on what is installed.
;;; Code:

(defvar ha-fixed-font
  (when (display-graphic-p)
    (or
     (seq-first
      (seq-filter (lambda (font) (when (x-list-fonts font) font))
                  '("Fira Code"
                    "FiraCode"
                    "CaskaydiaCove Nerd Font"  ; finally found it
                    ;; funky font with ligatures and a dotted 0
                    "Cascadia Code PL"
                    ;; clean font, but no ligatures!?
                    "Hack Nerd Font"
                    "FiraCode Nerd Font"       ; has ligatures
                    "Cousine Nerd Font"
                    "Iosevka Nerd Font"
                    "FantasqueSansMono Nerd Font"
                    "Monoid Nerd Font"
                    "Hasklig"
                    "Source Code Pro")))
     "monospaced"))
  "My fixed width font based on what I have installed.")

;; Only set the family in a graphical frame where a font was found; in a
;; terminal ha-fixed-font is nil and :family nil would signal an error.
(when (and ha-fixed-font (display-graphic-p))
  (set-face-attribute 'fixed-pitch nil
                      :family ha-fixed-font :inherit 'default :height 1.0))

;;; font.el ends here
