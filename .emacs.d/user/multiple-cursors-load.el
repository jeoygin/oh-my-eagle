(require 'use-package)

(use-package multiple-cursors
  :ensure t
  :init
  :config
  (global-set-key (kbd "M-s e") 'mc/edit-lines)
  (global-set-key (kbd "M-s n") 'mc/mark-next-like-this)
  (global-set-key (kbd "M-s p") 'mc/mark-previous-like-this)
  (global-set-key (kbd "M-s a") 'mc/mark-all-like-this)
  )

(provide 'multiple-cursors-load)
