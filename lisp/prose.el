;; general writing configuration
;; =============================
(setq adaptive-wrap-extra-indent 0)

(defun writing-mode ()
  ;; some good defaults for writing
  ;;
  ;; TODO get this to automatically trigger -- hooks?
  (interactive)
  (flyspell-mode))

(defun writing-mode-olivetti ()
  ;; TODO make this an actual mode
  (interactive)
  (writing-mode)
  (olivetti-mode)
  (whitespace-newline-mode) ;; newlines can be ambiguous in olivetti
  (adaptive-wrap-prefix-mode))

(global-set-key (kbd "C-c o") 'writing-mode-olivetti)

;; TODO add serif proportional font support

;; markdown configuration
;; ======================
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;; org mode configuration
;; ======================
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

;; TODO latex configuration
;; ========================
(use-package auctex
  :defer t
  :init
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  :ensure t)

;; PDFs
;; ====

(use-package pdf-tools
  :ensure t
  :config (pdf-tools-install))
