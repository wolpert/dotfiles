;;; Basic LSP setup - enhanced configuration is in java-ide.el

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred))

(use-package lsp-java
  :ensure t
  :after lsp-mode)

;; Note: Comprehensive Java IDE configuration is in java-ide.el
;; which includes lsp-ui, lsp-treemacs, dap-mode, and all keybindings

