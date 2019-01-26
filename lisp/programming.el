;; general configurations for all programming languages
(use-package projectile
  :config (projectile-mode 1))

(which-function-mode)

(add-hook 'prog-mode-hook 'show-paren-mode)

;; Version control
(use-package magit
  :bind ("C-c g" . 'magit-status))

(use-package evil-magit)

;; TODO highlight todo's
;; TODO autocompletion
