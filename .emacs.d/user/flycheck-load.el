(require 'use-package)

(use-package flycheck
  :ensure t
  :init
  :config
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'objc-mode-hook 'flycheck-mode)
  )

(provide 'flycheck-load)
