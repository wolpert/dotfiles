(use-package lsp-mode
  :hook (
	 (java-mode . lsp-deferred)
	 )
  :commands (lsp lsp-deferred))

(use-package lsp-java
  :hook (java-mode-hook . lsp)
  )

;; need tree-sitter too
;; 
