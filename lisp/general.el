;; general global functionality changes:
;;   this file is a bit of a grab-bag
;; =====================================

;; start up evil automatically
(use-package evil
  :config
  (evil-mode 1))

;; ivy config
(use-package ivy
  :config
  (ivy-mode))

(use-package counsel
  :config (counsel-mode)
  :bind ("C-x f" . 'counsel-recentf))

;; replace `list-buffers` with the more advanced `ibuffer`
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c f") 'follow-delete-other-windows-and-split)

(use-package which-key
  :config
  (which-key-mode))

;; use swiper
(global-set-key (kbd "C-s") 'swiper)

;; simplify lambda, etc in all supported modes
(setq prettify-symbols-unprettify-at-point 1)
(global-prettify-symbols-mode 1)