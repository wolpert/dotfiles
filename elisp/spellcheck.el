;; spell check add on 
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

