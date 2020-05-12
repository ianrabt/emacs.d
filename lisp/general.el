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
  :init
  ;; use only emacs keybindings in insert mode
  (setq evil-insert-state-map (make-sparse-keymap))
  (setq evil-want-fine-undo t)
  ;; specified by `evil-collection'
  (setq evil-want-keybinding nil)

  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

  ;; Make movement keys work visually, over wrapped lines
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>")
    'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>")
    'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>")
    'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>")
    'evil-previous-visual-line))

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

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

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

;; simplify lambda, etc in all supported modes -- great for LaTeX
(setq prettify-symbols-unprettify-at-point 1)
(global-prettify-symbols-mode 1)

;; match parenthesis
(use-package smartparens
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

;; better help
(use-package helpful
  :init
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable)
  :bind
  ("C-h f" . 'helpful-callable)
  ("C-h v" . 'helpful-variable)
  ("C-h k" . 'helpful-key)
  ("C-c C-d" . 'helpful-at-point)
  ("C-h F" . 'helpful-function))


;; open emacs init files
;; =====================

(defun open-init (arg)
  "Open the emacs configuration file.  Use \\[universal-argument]
to show a projectile listing of the entire emacs directory."
  (interactive "P")
  (let ((init-file (expand-file-name "init.el"
				     user-emacs-directory)))
    (if arg (progn (dired user-emacs-directory)
		   (project-find-file))
      (find-file init-file))))

(global-set-key (kbd "C-c i") 'open-init)

;; scroll settings
;; ===============
(setq mouse-wheel-scroll-amount '(0.07))
(setq mouse-wheel-progressive-speed nil)
(setq ring-bell-function 'ignore)
