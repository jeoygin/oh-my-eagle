;; ELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
    '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives
    '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  )

(provide 'elpa-load)
