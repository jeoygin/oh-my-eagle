;; flymake:
(add-to-list 'load-path "~/.emacs.d/flymake")
(require 'jdee-load)
(require 'jde-flymake)
;;(require 'flymake-helper)

;; (autoload 'flymake-find-file-hook "flymake" "" t)
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
(setq flymake-gui-warnings-enabled nil)
(setq flymake-log-level 0)

(defun flymake-display-current-error ()
  "Display errors/warnings under cursor."
  (interactive)
  (let ((ovs (overlays-in (point) (1+ (point)))))
    (catch 'found
      (dolist (ov ovs)
        (when (flymake-overlay-p ov)
          (message (overlay-get ov 'help-echo))
          (throw 'found t))))))

(defun flymake-goto-next-error-disp ()
  "Go to next error in err ring, then display error/warning."
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-current-error))

(defun flymake-goto-prev-error-disp ()
  "Go to previous error in err ring, then display error/warning."
  (interactive)
  (flymake-goto-prev-error)
  (flymake-display-current-error))

(defvar flymake-mode-map (make-sparse-keymap))
(define-key flymake-mode-map (kbd "C-c <f7>") 'flymake-goto-next-error-disp)
(define-key flymake-mode-map (kbd "C-c <f8>") 'flymake-goto-prev-error-disp)
(define-key flymake-mode-map (kbd "C-c <C-f7>")
  'flymake-display-err-menu-for-current-line)
(or (assoc 'flymake-mode minor-mode-map-alist)
    (setq minor-mode-map-alist
          (cons (cons 'flymake-mode flymake-mode-map)
                minor-mode-map-alist)))

(define-key flymake-mode-map [M-f7]         'flymake-goto-prev-error)
(define-key flymake-mode-map [M-f8]         'flymake-goto-next-error)
(define-key flymake-mode-map [M-f12]        'flymake-save-as-kill-err-messages-for-current-line)

(provide 'flymake-load)
