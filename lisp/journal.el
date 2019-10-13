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

(defun open-journal ()
  (interactive)
  (let* ((location "~/Insync/itaylor@g.hmc.edu/Google Drive/Personal/personal.org")
	 (already-opened (find-buffer-visiting location)))
    (find-file location)
    (unless already-opened (journal-mode))))

(global-set-key (kbd "C-c j") 'open-journal)

(defun journal-insert-entry ()
  (interactive)
  (org-insert-heading-after-current)
  (org-time-stamp-inactive))
