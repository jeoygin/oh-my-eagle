(defmacro create-load-package-defun (name)
  (list 'defun (intern (concat "load-package-" name)) '()
    (list 'interactive)
    (list 'require (list 'quote (intern (concat name "-load"))))))

(dolist (file (directory-files (file-name-directory load-file-name) nil "^.+-load\\.el$"))
  (let ((package-name (replace-regexp-in-string "-load\\.el$" "" file)))
    (message "%s" package-name)
    (eval (macroexpand `(create-load-package-defun ,package-name)))))

(defun load-package(packages)
  (interactive)
  (if (listp packages)
    (dolist (f (append packages '()))
      (funcall (intern (concat "load-package-" (symbol-name f)))))
    nil))

(provide 'package-load-define)
