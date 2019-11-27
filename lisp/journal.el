;; journal configuration
;; =====================
(defun journal-mode ()
  ;; sets specific settings in the buffer used for writing journal
  ;; entries
  ;;
  ;; TODO learn how to actually write major and minor modes (and how
  ;; to get them to automatically trigger)
  (interactive)
  (writing-defaults)
  (set-fill-column 70)
  (auto-fill-mode))

(defun open-book (filename)
  "Open a given org notebook/journal file"
  (let ((already-opened (find-buffer-visiting filename)))
    (find-file filename)
    (unless already-opened (journal-mode))))

(defun open-notebook ()
  (interactive)
  (let* ((location "~/Insync/itaylor@g.hmc.edu/Google Drive/Personal/personal.org"))
	 (open-book location)))

(defun journal-insert-entry ()
  (interactive)
  (end-of-buffer)
  (org-insert-heading-respect-content)
  ;; two universal prefix commands make `org-time-stamp-inactive' insert a time
  ;; stamp at the current time *without prompting the user.*
  (let ((current-prefix-arg '(16)))
    (call-interactively 'org-time-stamp-inactive))
  (newline-and-indent)
  (evil-append-line 1))

(defvar journal-file-directory
  "~/Insync/itaylor@g.hmc.edu/Google Drive/Personal/journal/")

(defvar journal-file-format-string "%Y %b.org.gpg"
  "The time format string, used to create and find the
appropriate journal file in the journal directory.

This string indicates how often new files will be created, the
mode used for the journal files (see file extension) and whether
the file is encrypted (append \".gpg\" to the filename)

It is passed as an argument to `parse-time-string' and
`format-time-string'")

(defun journal-find-file (&optional time zone)
  "TODO"
  (interactive)
  ;; TODO use optional arguments!
  (let ((filename (format-time-string journal-file-format-string)))
    (open-book (concat journal-file-directory filename))))

(defun journal-new-entry ()
  "TODO"
  (interactive)
  (journal-find-file)
  (journal-insert-entry))

;; keybindings
;; ===========

(define-prefix-command 'journal-map)
(define-key journal-map (kbd "j") 'open-notebook)
(define-key journal-map (kbd "k") 'journal-find-file)
(define-key journal-map (kbd "RET") 'journal-new-entry)

(global-set-key (kbd "C-c j") 'journal-map)
