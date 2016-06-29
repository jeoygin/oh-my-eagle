(require 'use-package)
(require 'company-load)
(require 'flycheck-load)

(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(use-package ycmd
  :ensure t
  :init
  (set-variable 'ycmd-server-command '("python" "/Users/jeoygin/projects/ycmd/ycmd/"))
  (set-variable 'ycmd-global-config "/Users/jeoygin/projects/ycmd/cpp/ycm/.ycm_extra_conf.py")
  :config
  )

(use-package company-ycmd
  :ensure t
  :init
  :config
  (add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)
  )

(use-package flycheck-ycmd
  :ensure t
  :init
  :config
  ;; Make sure the flycheck cache sees the parse results
  (add-hook 'ycmd-file-parse-result-hook 'flycheck-ycmd--cache-parse-results)
  ;; Add the ycmd checker to the list of available checkers
  (add-to-list 'flycheck-checkers 'ycmd)

  (add-hook 'python-mode-hook (lambda () (add-to-list 'flycheck-disabled-checkers 'ycmd)))
  )

(provide 'ycmd-load)
