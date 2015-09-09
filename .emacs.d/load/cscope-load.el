(add-to-list 'load-path "~/.emacs.d/cscope")
(add-hook 'c-mode-common-hook
      '(lambda ()
        (require 'xcscope)))

(provide 'cscope-load)
