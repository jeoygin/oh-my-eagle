(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)

(provide 'color-theme-load)
