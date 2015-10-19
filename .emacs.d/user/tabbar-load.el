(setq tabbar-ruler-global-tabbar t)
(setq tabbar-ruler-global-ruler t)

(require 'tabbar-ruler)

(global-set-key (kbd "C-c t") 'tabbar-ruler-move)
(global-set-key (kbd "C-c n") 'tabbar-ruler-forward)
(global-set-key (kbd "C-c p") 'tabbar-ruler-backward)

(provide 'tabbar-load)
