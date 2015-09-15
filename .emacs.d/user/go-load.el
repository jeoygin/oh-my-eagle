(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; goflymake
(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
(require 'go-flymake)

;; go-autocomplete
(add-to-list 'load-path (concat (file-name-directory #$) "go"))
(require 'go-autocomplete)

;; auto complete
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'go-mode-hook 'go-eldoc-setup)

(provide 'go-load)
