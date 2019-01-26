;; journal configuration
;; =====================
(defun journal-mode ()
  ;; sets specific settings in the buffer used for writing journal
  ;; entries
  ;;
  ;; TODO learn how to actually write major and minor modes (and how
  ;; to get them to automatically trigger)
  (interactive)
  (writing-mode)
  (set-fill-column 70)
  (auto-fill-mode))
