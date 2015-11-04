(setq x-select-enable-clipboard t)

(defun get-copy-command ()
  (cond
    ((eq system-type 'cygwin) "putclip")
    ((eq system-type 'darwin) "pbcopy")
    (t "xsel -ib")
  ))

(defun get-paste-command ()
  (cond
    ((eq system-type 'cygwin) "getclip")
    ((eq system-type 'darwin) "pbpaste")
    (t "xsel -ob")
  ))

(defun copy-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
    (progn
     ; my clipboard manager only intercept CLIPBOARD
      (shell-command-on-region (region-beginning) (region-end) (get-copy-command))
      (message "Yanked region to clipboard!")
      (deactivate-mark))
    (message "No region active; can't yank to clipboard!")))

(defun get-x-clipboard-as-string ()
  (shell-command-to-string (get-paste-command)))

(defun paste-from-x-clipboard()
  (interactive)
  (let ((content (get-x-clipboard-as-string)))
    (or (= (length content) 0)
      (and mark-active (filter-buffer-substring (region-beginning) (region-end) t))
      (insert content))))

(global-set-key "\C-cc" 'copy-to-x-clipboard)
(global-set-key "\C-cv" 'paste-from-x-clipboard)

(provide 'x-clipboard-load)
