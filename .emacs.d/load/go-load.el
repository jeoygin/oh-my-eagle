;; goflymake
(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
(require 'go-flymake)

;; go-autocomplete
(add-to-list 'load-path "~/.emacs.d/go/")
(require 'go-autocomplete)

;; auto complete
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'go-mode-hook 'go-eldoc-setup)

(provide 'go-load)
