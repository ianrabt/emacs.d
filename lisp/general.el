;; general global functionality changes:
;;   this file is a bit of a grab-bag
;; =====================================

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

(global-set-key (kbd "C-c f") 'follow-delete-other-windows-and-split)

(use-package which-key
  :config
  (which-key-mode))

;; use swiper
(global-set-key (kbd "C-s") 'swiper)

;; simplify lambda, etc in all supported modes
(setq prettify-symbols-unprettify-at-point 1)
(global-prettify-symbols-mode 1)

;; allow "un-filling" paragraphs (i.e. undo `fill-paragraph'
(defun unfill-paragraph ()
  "Undo the effects of `fill-paragraph'."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(global-set-key (kbd "M-Q") 'unfill-paragraph)
