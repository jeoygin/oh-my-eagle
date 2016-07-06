(require 'use-package)

(use-package evil
  :ensure t
  :init
  :config
  (setq evil-default-state 'normal)
  (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
  (define-key evil-insert-state-map "\C-e" 'end-of-line)
  (define-key evil-insert-state-map "\C-n" 'next-line)
  (define-key evil-insert-state-map "\C-p" 'previous-line)
  (define-key evil-insert-state-map "\C-v" 'scroll-up-command)
  (define-key evil-insert-state-map "\M-v" 'scroll-down-command)
  (define-key evil-insert-state-map "\C-k" 'kill-line)
  (define-key evil-insert-state-map "\C-w" 'kill-region)
  (define-key evil-insert-state-map "\C-y" 'yank)
  (evil-mode 1)
  )

(provide 'evil-load)
