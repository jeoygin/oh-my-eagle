(add-to-list 'custom-theme-load-path (concat (file-name-directory #$) "themes/emacs-color-theme-solarized"))

(defun nut/load-solarized-theme ()
  (interactive)
  (set-frame-parameter nil 'background-mode 'dark)
  (set-terminal-parameter nil 'background-mode 'dark)
  (load-theme 'solarized t))

(defun load-solarized-theme (frame)
  (select-frame frame)
  (nut/load-solarized-theme))

(if (daemonp)
    (add-hook 'after-make-frame-functions #'load-solarized-theme)
  (nut/load-solarized-theme))

(provide 'color-theme-load)
