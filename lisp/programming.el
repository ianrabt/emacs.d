;; general programming configurations
;; ==================================
(use-package projectile
  :config (projectile-mode 1))

;; list all files in project (TODO as defined by projectile?)
(global-set-key (kbd "C-c p") 'project-find-file)

(which-function-mode 1) ;; display information about function at point

(add-hook 'prog-mode-hook 'show-paren-mode) ;; match parens

;; version control
;; ===============
(use-package magit
  :bind ("C-c g" . 'magit-status))

(use-package evil-magit)

;; TODO highlight todo's
;; TODO autocompletion
