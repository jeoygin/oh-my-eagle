(require 'cedet)
(require 'ede)
(require 'semantic)

(global-ede-mode 1)
(global-semantic-mru-bookmark-mode 1)

(defvar mru-tag-stack '()
  "Tag stack, when jumping to new tag, current tag will be stored here,
and when jumping back, it will be removed.")

(defun yc/store-mru-tag (pt)
  "Store tag info into mru-tag-stack"
  (interactive "d")
  (let* ((tag (semantic-mrub-find-nearby-tag pt)))
    (if tag
        (let ((sbm (semantic-bookmark (semantic-tag-name tag)
                                      :tag tag)))
          (semantic-mrub-update sbm pt 'mark)
          (add-to-list 'mru-tag-stack sbm)
          )
      (error "No tag to go!")))
  )

(defun yc/goto-func (pt)
  "Store current postion and call (semantic-ia-fast-jump)"
  (interactive "d")
  (yc/store-mru-tag pt)
  (semantic-ia-fast-jump pt)
)

(defun yc/goto-func-any (pt)
  "Store current postion and call (semantic-ia-fast-jump)"
  (interactive "d")
  (yc/store-mru-tag pt)
  (semantic-complete-jump)
  )

(defun yc/symref (pt)
  (interactive "d")
  (yc/store-mru-tag pt)
  (semantic-symref))

(defun yc/return-func()
  "Return to previous tag."
  (interactive)
  (if (car mru-tag-stack)
      (semantic-mrub-switch-tags (pop mru-tag-stack))
    (error "TagStack is empty!")))

(global-set-key "\C-cR" 'yc/symref)
(global-set-key "\C-cb" 'semantic-mrub-switch-tags)
(global-set-key "\C-cC-j" 'yc/goto-func-any)
(global-set-key "\C-cj" 'yc/goto-func)
(global-set-key [S-f12] 'yc/return-func)
(global-set-key [M-S-f12] 'yc/return-func)
(global-set-key (kbd "C-x SPC") 'yc/store-mru-tag)

(global-set-key [(f6)] 'speedbar-get-focus)

(provide 'cedet-load)
