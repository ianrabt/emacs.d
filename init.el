;; Ian's Emacs Configuration
;; =========================

;; bootstrap package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
       user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; now we can just use use-package to install packages
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; get that custom out of my face!
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; creates custom file if it does not exist
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file t))

(load custom-file)

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(load "general") ;; global functionality changes
(load "graphical") ;; graphical customization
(load "programming")
(load "prose")
(load "journal")
