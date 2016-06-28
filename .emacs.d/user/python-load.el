(add-to-list 'load-path (concat (file-name-directory #$) "python"))
(require 'use-package)

(use-package jedi
  :ensure t
  :defer t
  :init
  :config
  )

(use-package python-mode
  :ensure t
  :defer t
  :init
  (autoload 'python-mode "python-mode" "Python Mode." t)
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
  (add-to-list 'interpreter-mode-alist '("python" . python-mode))
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  )

(provide 'python-load)
