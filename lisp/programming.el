;; general programming configurations
;; ==================================
(use-package projectile
  :config (projectile-mode 1))

;; list all files in project (TODO as defined by projectile?)
(global-set-key (kbd "C-c p") 'project-find-file)

(which-function-mode 1) ;; display information about function at point

(add-hook 'prog-mode-hook 'show-paren-mode) ;; match parens
(add-hook 'prog-mode-hook 'smartparens-mode);; smart parents

;; (use-package company-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; version control
;; ===============
(use-package magit
  :bind ("C-c g" . 'magit-status))

(use-package evil-magit)

(use-package lsp-mode
  :commands lsp)
  ;; :init
  ;; (setq ...))

(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)

;; TODO set up flymake
;; TODO set up company

;; TODO highlight todo's
;; TODO autocompletion

;; rust
;; ====
;; TODO

;; c
;; =
(setq c-default-style "linux")
(add-hook 'c-mode-hook #'lsp)

(use-package ccls
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

;; emacs lisp
;; ==========
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (push '(?` . ("`" . "'"))
					evil-surround-pairs-alist)))

(use-package rust-mode)
