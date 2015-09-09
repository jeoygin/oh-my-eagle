(add-to-list 'load-path "~/.emacs.d/ecb")
;; (require 'ecb)
(require 'ecb-autoloads)

(custom-set-variables
 '(ecb-options-version "2.40"))

(setq ecb-tip-of-the-day nil)
(setq byte-compile-warnings nil)
(setq stack-trace-on-error nil)

(global-set-key "\C-c0" 'ecb-goto-window-directories)
(global-set-key "\C-c1" 'ecb-goto-window-sources)
(global-set-key "\C-c2" 'ecb-goto-window-methods)
(global-set-key "\C-c3" 'ecb-goto-window-history)
(global-set-key "\C-ce" 'ecb-goto-window-edit-last)

(provide 'ecb-load)
