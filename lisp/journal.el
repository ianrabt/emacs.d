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
  (find-file "~/itaylor@g.hmc.edu/Personal/personal.org")
  (journal-mode))

(defun journal-insert-entry ()
  (interactive)
  (org-insert-heading-after-current)
  (org-time-stamp-inactive))
