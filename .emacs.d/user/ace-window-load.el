(require 'use-package)

(use-package ace-window
  :ensure t
  :defer t
  :init
  (global-set-key (kbd "M-p") 'ace-window)
  :config
  )

(provide 'ace-window-load)
