;;; claude.el --- agent-shell / Claude integration -*- lexical-binding: t; -*-
;; agent-shell talks to Claude over the external ACP bridge. Without it on
;; PATH the package is useless, so check first and bail with instructions
;; rather than loading a broken agent-shell.
(if (not (executable-find "claude-agent-acp"))
    (message "agent-shell: claude-agent-acp not found on PATH. Install it with: npm install -g @agentclientprotocol/claude-agent-acp")

  ;; agent-shell, acp and shell-maker are all on MELPA, but agent-shell is
  ;; new (published 2026-06-21). If our cached package index predates it,
  ;; refresh once so :ensure t can find it. The guard keeps normal startups
  ;; fast once the package is installed.
  (unless (assq 'agent-shell package-archive-contents)
    (package-refresh-contents))

  ;; Launch with M-x agent-shell-anthropic-start-claude-code
  (use-package agent-shell
      :ensure t
      ;;:ensure-system-package
      :config
      ;; Default subscription/login-based auth. For API-key auth instead, use:
      ;;   (agent-shell-anthropic-make-authentication
      ;;    :api-key (lambda () (auth-source-pass-get 'secret "anthropic-api-key")))
      (setq agent-shell-anthropic-authentication
            (agent-shell-anthropic-make-authentication :login t))))
