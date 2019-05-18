;; graphical configurations:
;; =========================

;; color theme
;; ===========
(setq nord-comment-brightness 20)
(setq nord-region-highlight "frost")
(load-theme 'nord t)

(defun load-nord-theme (frame)
  (select-frame frame)
  (load-theme 'nord t))

(if (daemonp)
	(add-hook 'after-make-frame-functions #'load-nord-theme)
  (load-theme 'nord t))

;; toggles
;; =======
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)

;; misc.
;; =====

;; display columns
(column-number-mode)
