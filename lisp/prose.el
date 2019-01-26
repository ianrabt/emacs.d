;; general writing configuration
;; =============================
(defun writing-mode ()
  ;; some good defaults for writing
  ;;
  ;;TODO get this to automatically trigger -- hooks?
  (interactive)
  (flyspell-mode))


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
  :ensure t)
