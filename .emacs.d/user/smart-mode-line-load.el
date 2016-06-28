(require 'use-package)

(use-package solarized-theme
  :ensure t
  )

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (setq sml/mode-width 0)
  (setq sml/name-width 20)
  :config
  (sml/setup)
  )

(provide 'smart-mode-line-load)
