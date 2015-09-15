(add-to-list 'custom-theme-load-path (concat (file-name-directory #$) "themes/emacs-color-theme-solarized"))
(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)

(provide 'color-theme-load)
