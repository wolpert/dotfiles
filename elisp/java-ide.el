;;; java-ide.el --- Java IDE configuration with LSP -*- lexical-binding: t -*-
;;;
;;; Commentary:
;; Comprehensive Java development environment using LSP, DAP, and modern tooling.
;; This configuration integrates with the existing nemacs setup.

;;; Code:

;; ============================================================================
;; Enhanced LSP Configuration
;; ============================================================================

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (lsp-mode . lsp-lens-mode))
  :config
  ;; Performance tuning
  (setq lsp-idle-delay 0.5)
  (setq lsp-log-io nil)
  (setq lsp-completion-provider :capf)
  (setq lsp-headerline-breadcrumb-enable t)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-modeline-code-actions-enable t)

  ;; File watching
  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 2000)

  ;; Semantic highlighting
  (setq lsp-semantic-tokens-enable t))

;; ============================================================================
;; LSP UI - Enhanced UI components for LSP
;; ============================================================================

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-delay 0.5)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-peek-enable t)
  :bind (:map lsp-ui-mode-map
              ("C-c l d" . lsp-ui-doc-glance)
              ("C-c l p" . lsp-ui-peek-find-references)))

;; ============================================================================
;; Company Mode - LSP-based Code Completion
;; ============================================================================

(use-package company
  :ensure t
  :hook ((lsp-mode . company-mode)
         (java-mode . company-mode))
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (setq company-show-quick-access t)
  ;; Make company work better with LSP
  (setq company-backends '((company-capf :with company-yasnippet)))
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("<tab>" . company-complete-selection)
              ("TAB" . company-complete-selection)))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :config
  (setq company-box-show-single-candidate t)
  (setq company-box-backends-colors nil)
  (setq company-box-max-candidates 50))

;; ============================================================================
;; Flycheck - Syntax Checking
;; ============================================================================

(use-package flycheck
  :ensure t
  :hook ((lsp-mode . flycheck-mode)
         (java-mode . flycheck-mode))
  :config
  (setq flycheck-indication-mode 'left-fringe)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; ============================================================================
;; Projectile - Project Management
;; ============================================================================

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :config
  (setq projectile-project-search-path '("~/projects/" "~/workspace/"))
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-enable-caching t)
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; ============================================================================
;; Treemacs - File Tree
;; ============================================================================

(use-package treemacs
  :ensure t
  :bind (("M-0" . treemacs-select-window)
         ("C-x t t" . treemacs))
  :config
  (setq treemacs-width 35)
  (setq treemacs-follow-mode t)
  (setq treemacs-filewatch-mode t))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

;; ============================================================================
;; LSP Treemacs Integration
;; ============================================================================

(use-package lsp-treemacs
  :ensure t
  :after (lsp-mode treemacs)
  :config
  (lsp-treemacs-sync-mode 1)
  :bind (:map lsp-mode-map
              ("C-c l t e" . lsp-treemacs-errors-list)
              ("C-c l t s" . lsp-treemacs-symbols)))

;; ============================================================================
;; Enhanced LSP Java Configuration
;; ============================================================================

(use-package lsp-java
  :ensure t
  :after lsp-mode
  :config
  ;; JDT Language Server settings
  (setq lsp-java-server-install-dir (expand-file-name "~/.emacs.d/eclipse.jdt.ls/"))

  ;; Java runtime configuration
  (setq lsp-java-configuration-runtimes
        '[(:name "JavaSE-17"
           :path "/usr/lib/jvm/java-17-openjdk-amd64")
          (:name "JavaSE-21"
           :path "/usr/lib/jvm/java-21-openjdk-amd64"
           :default t)])

  ;; Code generation settings
  (setq lsp-java-completion-enabled t)
  (setq lsp-java-completion-guess-method-arguments t)
  (setq lsp-java-completion-overwrite t)
  (setq lsp-java-completion-favorite-static-members
        ["org.junit.Assert.*"
         "org.junit.jupiter.api.Assertions.*"
         "org.mockito.Mockito.*"
         "org.mockito.ArgumentMatchers.*"
         "java.util.Objects.requireNonNull"
         "java.util.Objects.requireNonNullElse"])

  ;; Import organization
  (setq lsp-java-import-order ["java" "javax" "org" "com" ""])
  (setq lsp-java-save-actions-organize-imports t)

  ;; Format settings
  (setq lsp-java-format-enabled t)
  (setq lsp-java-format-comments-enabled t)

  ;; Code lens - including test runners
  (setq lsp-java-code-generation-use-blocks t)
  (setq lsp-lens-enable t)
  (setq lsp-java-references-code-lens-enabled t)
  (setq lsp-java-implementations-code-lens-enabled t)

  ;; Autobuild
  (setq lsp-java-autobuild-enabled t)

  ;; Maven/Gradle
  (setq lsp-java-import-maven-enabled t)
  (setq lsp-java-import-gradle-enabled t)
  (setq lsp-java-maven-download-sources t)
  (setq lsp-java-sources-organize-imports-on-paste t)

  ;; Trust the Gradle wrapper for this project
  (setq lsp-java-imports-gradle-wrapper-checksums
        [(:sha256 "b3a875ddc1f044746e1b1a55f645584505f4a10438c1afea9f15e92a7c42ec13"
          :allowed t)]))

;; ============================================================================
;; Project-Specific Workspace Configuration
;; ============================================================================

(defun my-lsp-java-set-workspace ()
  "Set project-specific workspace directory for LSP Java."
  (when (and (eq major-mode 'java-mode)
             (not lsp-java-workspace-dir))
    (let* ((project-root (or (lsp-workspace-root)
                             (projectile-project-root)
                             default-directory))
           (project-name (file-name-nondirectory
                         (directory-file-name project-root)))
           (workspace-dir (expand-file-name
                          (concat "~/.emacs.d/workspace/" project-name "/"))))
      (setq-local lsp-java-workspace-dir workspace-dir)
      (message "LSP Java workspace: %s" workspace-dir))))

;; Set workspace before LSP starts
(add-hook 'java-mode-hook #'my-lsp-java-set-workspace)

;; ============================================================================
;; DAP Mode - Debugging Support
;; ============================================================================

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-auto-configure-mode 1)

  ;; DAP UI setup
  (setq dap-auto-configure-features '(sessions locals controls tooltip))

  :bind (:map dap-mode-map
              ("C-c d d" . dap-debug)
              ("C-c d l" . dap-debug-last)
              ("C-c d r" . dap-debug-restart)
              ("C-c d c" . dap-continue)
              ("C-c d n" . dap-next)
              ("C-c d i" . dap-step-in)
              ("C-c d o" . dap-step-out)
              ("C-c d b" . dap-breakpoint-toggle)
              ("C-c d B" . dap-breakpoint-condition)
              ("C-c d e" . dap-eval)
              ("C-c d E" . dap-eval-region)
              ("C-c d q" . dap-disconnect)))

;; dap-java is provided by lsp-java package
(with-eval-after-load 'lsp-java
  (require 'dap-java))

;; ============================================================================
;; YASnippet - Code Snippets
;; ============================================================================

(use-package yasnippet
  :ensure t
  :hook ((java-mode . yas-minor-mode)
         (lsp-mode . yas-minor-mode))
  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;; ============================================================================
;; Rainbow Delimiters
;; ============================================================================

(use-package rainbow-delimiters
  :ensure t
  :hook (java-mode . rainbow-delimiters-mode))

;; ============================================================================
;; HL-TODO - Highlight TODO comments
;; ============================================================================

(use-package hl-todo
  :ensure t
  :hook (java-mode . hl-todo-mode))

;; ============================================================================
;; Which-Key Integration
;; ============================================================================

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5))

;; ============================================================================
;; Java Mode Hooks
;; ============================================================================

(add-hook 'java-mode-hook
          (lambda ()
            ;; Indentation settings
            (setq c-basic-offset 4)
            (setq tab-width 4)
            (setq indent-tabs-mode nil)

            ;; Enable features
            (electric-pair-mode 1)
            (display-line-numbers-mode 1)
            (hl-line-mode 1)

            ;; LSP integration
            (lsp-deferred)))

;; ============================================================================
;; Basic Editor Settings for Java
;; ============================================================================

;; Scroll settings
(setq scroll-margin 3)
(setq scroll-conservatively 101)

;; Remember cursor position
(save-place-mode 1)

;; Refresh buffers when files change on disk
(global-auto-revert-mode 1)

;; ============================================================================
;; Test Running Keybindings (available after dap-java loads)
;; ============================================================================

(defun java-run-all-tests ()
  "Run all tests in the project using Gradle."
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (compile "./gradlew test")))

(with-eval-after-load 'dap-java
  (define-key java-mode-map (kbd "C-c t m") 'dap-java-run-test-method)
  (define-key java-mode-map (kbd "C-c t c") 'dap-java-run-test-class)
  (define-key java-mode-map (kbd "C-c t l") 'dap-java-run-last-test)
  (define-key java-mode-map (kbd "C-c t a") 'java-run-all-tests)
  (define-key java-mode-map (kbd "C-c t d m") 'dap-java-debug-test-method)
  (define-key java-mode-map (kbd "C-c t d c") 'dap-java-debug-test-class))

(provide 'java-ide)
;;; java-ide.el ends here
