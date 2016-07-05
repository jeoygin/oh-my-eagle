(require 'use-package)

(use-package swiper
  :ensure t
  :init
  :config
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  )

(provide 'swiper-load)
