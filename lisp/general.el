;; general global functionality changes:
;;   this file is a bit of a grab-bag
;; =====================================

;; backup settings
;; ===============

(setq backup-directory-alist `(("." . "~/.saves")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


;; evil
;; ====

;; start up evil automatically
(use-package evil
  :config
  (evil-mode 1))

;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>")
  'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>")
  'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>")
  'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>")
  'evil-previous-visual-line)

;; Make horizontal movement cross lines                                    
(setq-default evil-cross-lines t)

;; evil escape
(use-package evil-escape
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode 1))

;; evil surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; misc.
;; =====

;; ivy config
(use-package ivy
  :config
  (ivy-mode))

(use-package counsel
  :config (counsel-mode)
  :bind ("C-x f" . 'counsel-recentf))

;; replace `list-buffers` with the more advanced `ibuffer`
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)
(global-set-key (kbd "C-c s") 'follow-delete-other-windows-and-split)
(global-set-key (kbd "C-c f") 'set-fill-column)

(use-package which-key
  :config
  (which-key-mode))

;; use swiper
(global-set-key (kbd "C-s") 'swiper)

;; simplify lambda, etc in all supported modes
(setq prettify-symbols-unprettify-at-point 1)
(global-prettify-symbols-mode 1)

;; match parenthesis
;; (electric-pair-mode 1)
(use-package smartparens
  :ensure t
  :config
  (setq sp-show-pair-from-inside nil)
  (require 'smartparens-config)
  :diminish smartparens-mode)

;; allow "un-filling" paragraphs (i.e. undo `fill-paragraph'
(defun unfill-paragraph ()
  "Undo the effects of `fill-paragraph'."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(global-set-key (kbd "M-Q") 'unfill-paragraph)


;; open emacs init files
;; =====================

(defun open-init ()
  "Open the emacs configuration file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c i") 'open-init)
