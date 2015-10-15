(custom-set-variables
 '(ecb-options-version "2.40"))

(setq ecb-tip-of-the-day nil)
(setq byte-compile-warnings nil)
(setq stack-trace-on-error nil)

(setq ecb-layout-name "leftright2")
(setq ecb-show-sources-in-directories-buffer 'always)
;; (setq ecb-compile-window-height 4)

;; activate and deactivate ecb
(global-set-key (kbd "C-x C-;") 'ecb-activate)
(global-set-key (kbd "C-x C-'") 'ecb-deactivate)

;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)

(global-set-key "\C-c0" 'ecb-goto-window-directories)
(global-set-key "\C-c1" 'ecb-goto-window-sources)
(global-set-key "\C-c2" 'ecb-goto-window-methods)
(global-set-key "\C-c3" 'ecb-goto-window-history)
(global-set-key "\C-ce" 'ecb-goto-window-edit-last)

(provide 'ecb-load)
