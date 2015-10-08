;; ELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
    '("marmalade" . "https://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives
    '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize))

(provide 'elpa-load)
