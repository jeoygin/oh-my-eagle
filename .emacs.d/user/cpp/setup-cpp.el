(require 'cc-mode)
;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

(add-hook 'c-mode-common-hook #'load-package :helm)
(add-hook 'c-mode-common-hook #'load-package :dev)
(add-hook 'c-mode-common-hook #'load-package :cedet)

(add-hook 'c-mode-common-hook 'helm-gtags-mode)
(add-hook 'c-mode-common-hook 'company-mode)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c-mode-common-hook 'ycmd-mode)

(provide 'setup-cpp)
