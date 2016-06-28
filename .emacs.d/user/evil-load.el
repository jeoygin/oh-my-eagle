(require 'use-package)

(use-package evil
  :ensure t
  :init
  :config
  (setq evil-default-state 'emacs)
  (evil-mode 1)
  )

(provide 'evil-load)
