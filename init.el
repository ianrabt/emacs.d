;; Ian's Emacs Configuration
;; =========================

;; set up packages
(require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq use-package-always-ensure t)

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path (expand-file-name "lisp"
					  user-emacs-directory))

(load "general.el") ;; global functionality changes
(load "graphical") ;; graphical customization
(load "programming")
(load "prose")
(load "journal")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 108 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "d88c43fe03ac912e35963695caf0ae54bc6ce6365c3a42da434ef639f7a37399" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" default)))
 '(org-agenda-files (quote ("~/itaylor@g.hmc.edu/Personal/personal.org")))
 '(package-selected-packages
   (quote
    (auctex evil-org magit adaptive-wrap poet-theme doom-themes eglot markdown-mode olivetti which-key use-package projectile org-bullets nord-theme memoize helm evil dimmer counsel))))
