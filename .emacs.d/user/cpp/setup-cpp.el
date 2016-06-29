(require 'cc-mode)
;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

(defun nut/setup-cpp-env()
  (nut/load-package '(helm dev cedet))
  )

(add-hook 'c-mode-common-hook 'nut/setup-cpp-env)
(add-hook 'c-mode-common-hook 'helm-gtags-mode)
(add-hook 'c-mode-common-hook 'company-mode)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c-mode-common-hook 'ycmd-mode)

(provide 'setup-cpp)
