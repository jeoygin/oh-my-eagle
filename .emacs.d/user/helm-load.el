(add-to-list 'load-path (concat (file-name-directory #$) "helm"))
(require 'setup-helm)
(require 'setup-helm-gtags)

(provide 'helm-load)
