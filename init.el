;;     ____           _          ______                         
;;    /  _/___ _____ ( )_____   / ____/___ ___  ____ ___________
;;    / // __ `/ __ \|// ___/  / __/ / __ `__ \/ __ `/ ___/ ___/
;;  _/ // /_/ / / / / (__  )  / /___/ / / / / / /_/ / /__(__  ) 
;; /___/\__,_/_/ /_/ /____/  /_____/_/ /_/ /_/\__,_/\___/____/  
;;          _      _ _         _ 
;;         (_)_ _ (_) |_   ___| |
;;         | | ' \| |  _|_/ -_) |
;;         |_|_||_|_|\__(_)___|_|
;;
;;  (use `figlet 'text' -f smslant` to create headings

;; set up packages
(require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq use-package-always-ensure t)

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

(use-package evil
  :config
  (evil-mode 1))

;; (use-package helm
;;   :bind (("M-x" . helm-M-x)
;; 	 ("C-x C-f" . helm-find-files)
;; 	 ("C-x f" . helm-recentf) ; overrides set-fill-column
;; 	 ("C-x b" . helm-buffers-list))
;;   :config
;;   (helm-mode 1))
;; USE IVY INSTEAD
(use-package ivy
  :config
  (ivy-mode))

(use-package counsel
  :config (counsel-mode)
  :bind ("C-x f" . 'counsel-recentf))

(use-package projectile
  :config (projectile-mode 1))
  ;; TODO finish setting up projectile)

;; use swiper
(global-set-key (kbd "C-s") 'swiper)

;; replace `list-buffers` with the more advanced `ibuffer`
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c f") 'follow-delete-other-windows-and-split)

(use-package which-key
  :config
  (which-key-mode))

;;    ____              __  _             
;;   / __/_ _____  ____/ /_(_)__  ___  ___
;;  / _// // / _ \/ __/ __/ / _ \/ _ \(_-<
;; /_/  \_,_/_//_/\__/\__/_/\___/_//_/___/

(defun insert-journal-date ()
  (interactive)
  (insert (shell-command-to-string "date")))

;; (defun highlight-todos
;;     (font-lock-add-keywords nil
;; 			    '(("\\<\\(FIXME\\|TODO\\|BUG\\):"
;;              1 font-lock-warning-face t))))

;; (defun hilite-todos ()
;;   (highlight-lines-matching-regexp "\\<\\(FIXME\\|WRITEME\\|WRITEME!\\|TODO\\|BUG\\):?"
;;        'hi-green-b) )

(defun journal-mode ()
  ;; sets specific settings in the buffer used for writing journal
  ;; entries
  ;;
  ;; TODO learn how to actually write major and minor modes (and how
  ;; to get them to automatically trigger)
  (interactive)
  (flyspell-mode)
  (set-fill-column 70)
  (auto-fill-mode))

(defun writing-mode ()
  ;; some defaults good for writing
  ;;
  ;; TODO currently this just copies journal-mode
  (interactive)
  (journal-mode))

;; PROGRAMMING
;; General:
(which-function-mode)

(add-hook 'prog-mode-hook 'show-paren-mode)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; simplify lambda, etc in all supported modes
(setq prettify-symbols-unprettify-at-point 1)
(global-prettify-symbols-mode 1)

;;                       __   _          __
;;   ___ ________ ____  / /  (_)______ _/ /
;;  / _ `/ __/ _ `/ _ \/ _ \/ / __/ _ `/ / 
;;  \_, /_/  \_,_/ .__/_//_/_/\__/\_,_/_/  
;; /___/        /_/                        
;;                __             _          __  _         
;;  ______ _____ / /____  __ _  (_)__ ___ _/ /_(_)__  ___ 
;; / __/ // (_-</ __/ _ \/  ' \/ /_ // _ `/ __/ / _ \/ _ \
;; \__/\_,_/___/\__/\___/_/_/_/_//__/\_,_/\__/_/\___/_//_/

;; (use-package dimmer
;;   :config
;;   (dimmer-mode))

;; Color Theme:
(setq nord-comment-brightness 20)
(setq nord-region-highlight "frost")
(load-theme 'nord t)

;; Toggles:
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(blink-cursor-mode -1)

;; Modeline:
;; TODO enter this

;; Org mode:
(use-package org-bullets
  :config (setq org-bullets-bullet-list
		 '("◉"
		   "○"
		   "●"
		   "◆"))
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

;; org keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)

(use-package evil-org)

(use-package auctex
  :defer t
  :ensure t)

;; Version control

(use-package magit
  :bind ("C-c g" . 'magit-status))

(use-package evil-magit)

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
