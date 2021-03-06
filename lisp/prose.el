;; general writing configuration
;; =============================
(use-package adaptive-wrap
  :config (setq adaptive-wrap-extra-indent 0))

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'text-mode-hook 'adaptive-wrap-prefix-mode)

(set-face-attribute 'variable-pitch nil :family "DejaVu Serif Condensed")

(straight-use-package 'olivetti)

(defun writing-defaults ()
  ;; some good defaults for writing
  (interactive)
  (flyspell-mode))

(add-hook 'text-mode-hook 'writing-defaults)

(defun writing-mode-olivetti ()
  ;; TODO make this an actual mode
  (interactive)
  (writing-defaults)
  (auto-fill-mode -1)
  (olivetti-mode)
  ;; (whitespace-newline-mode) ;; newlines can be ambiguous in olivetti
  (adaptive-wrap-prefix-mode))

(global-set-key (kbd "C-c o") 'writing-mode-olivetti)

;; TODO add serif proportional font support

;; markdown configuration
;; ======================
(use-package markdown-mode
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
  (setq TeX-parse-self t))

(add-hook 'TeX-mode-hook (lambda ()
			   (set-fill-column 80)
			   (auto-fill-mode)
			   (smartparens-mode)))

;; PDFs
;; ====

(use-package pdf-tools
  :config (pdf-tools-install))
