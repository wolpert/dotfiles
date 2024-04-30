;;;
;;; Set the current font
;;;

(defvar ha-fixed-font
  (when window-system
    (or
     (seq-first
      (seq-filter (lambda (font) (when (x-list-fonts font) font))
                  '("FiraCode"
		    "CaskaydiaCove Nerd Font"  ; finally found it
                    ;; funky font with litagures and a dotted 0
                    "Cascadia Code PL"
                    ;; clean font, but no litagures!?
                    "Hack Nerd Font"
                    "FiraCode Nerd Font"       ; has litagures
                    "Cousine Nerd Font"
                    "Iosevka Nerd Font"
                    "FantasqueSansMono Nerd Font"
                    "Monoid Nerd Font"
                    "Hasklig"
                    "Source Code Pro")))
     "monospaced"))
  "My fixed width font based on what I have installed.")

(set-face-attribute 'fixed-pitch nil :family ha-fixed-font :inherit 'default :height 1.0)
