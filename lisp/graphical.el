;; graphical configurations:
;; =========================

;; color theme
;; ===========

(straight-use-package 'nord-theme)
(setq nord-comment-brightness 20)
(setq nord-region-highlight "frost")

(defun load-nord-theme (frame)
  (select-frame frame)
  (load-theme 'nord t))

(if (daemonp)
	(add-hook 'after-make-frame-functions #'load-nord-theme)
  (load-theme 'nord t))

(defun toggle-theme ()
  "Switch between my dark and light theme.  This function is
fairly brittle (assumes there is a theme already set, etc), but
it works well enough for my purposes."
  (interactive)
  (let* ((themes '(nord adwaita))
	 (current-theme (car custom-enabled-themes))
	 (next-theme (car (remove current-theme themes))))
    (disable-theme current-theme)
    (load-theme next-theme t)))

(global-set-key (kbd "C-c <delete>") 'toggle-theme)

;; from:
;; https://github.com/toroidal-code/cycle-themes.el/blob/master/cycle-themes.el
(defun cycle-themes-get-next-valid-theme ()
  "Get the next valid theme from the list."
  ;; save our starting theme for a infinite-loop check
  ;; if there's no theme applied,
  (let* ((cycle-themes-theme-list '('adwaita 'nord))
	 (start-theme (or (first custom-enabled-themes)
                          (car (last cycle-themes-theme-list))))
         (current-theme start-theme))
    ;; do-while
    (while
        (progn
          ;; Fancy way to move to the next theme
          ;; with modular arithmetic so we never reach the end.
          (setq current-theme
                (nth (mod (1+ (cl-position current-theme cycle-themes-theme-list))
                          (length cycle-themes-theme-list))
                     cycle-themes-theme-list))
          ;; Make sure we didn't loop all the way through
          (when (eq current-theme start-theme)
            (error "No valid themes in cycle-themes-theme-list"))
          (not (custom-theme-p current-theme))))
    current-theme))


(defun cycle-themes ()
  "Cycle to the next theme."
  (interactive)
  (let ((new-theme (cycle-themes-get-next-valid-theme))
        (current-theme (first custom-enabled-themes))
        (current-theme-set custom-enabled-themes))
    ;; disable the current theme only if we want multiple themes
    ;; and we had it before
    (unless (and cycle-themes-allow-multiple-themes
                 (member current-theme cycle-themes-last-theme-set))
      (disable-theme current-theme))
    (load-theme new-theme t)
    (setq cycle-themes-last-theme-set current-theme-set)
    (run-hooks 'cycle-themes-after-cycle-hook)))

;; transparency
;; (set-frame-parameter (selected-frame) 'alpha '(92 92))
;; (add-to-list 'default-frame-alist '(alpha 92 92))

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
