(require 'use-package)

(use-package company
  :ensure t
  :defer t
  :init
  :config
  (use-package company-c-headers :ensure t :defer t)
  (setq company-idle-delay              nil
	company-minimum-prefix-length   2
	company-show-numbers            t
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
	company-backends                '((company-c-headers company-ycmd company-gtags company-files))
	)
  :bind ("M-'" . company-complete-common)
  )

(provide 'company-load)
