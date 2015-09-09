;; jdee:
(add-to-list 'load-path "~/.emacs.d/jdee/lisp")
(require 'cedet-load)
(require 'jde)
(setq jde-enable-abbrev-mode t)

;;jde completion with ido and yasnippet
(defun jde-complete-ido ()
  "Custom method completion for JDE using ido-mode and yasnippet."
  (interactive)
  (let ((completion-list '()) (variable-at-point (jde-parse-java-variable-at-point)))
    (dolist (element (jde-complete-find-completion-for-pair variable-at-point nil) nil)
      (add-to-list 'completion-list (cdr element)))
    (if completion-list
        (let ((choise (ido-completing-read "> " completion-list nil nil (car (cdr variable-at-point)))) (method))
          (unless (string-match "^.*()$" choise)
            (setq method (replace-regexp-in-string ")" "})"(replace-regexp-in-string ", " "}, ${" (replace-regexp-in-string "(" "(${" choise)))))
          (delete-region (point) (re-search-backward "\\." (line-beginning-position)))
          (insert ".")
          (if method
              (yas/expand-snippet  method)
            (insert choise)))
      (message "No completions at this point"))))
(add-hook 'jde-mode-hook 'jde-complete-ido)

(defun my-java-jde-mode-hook()
  (local-set-key (quote [C-return]) (quote jde-complete-ido))
)
(add-hook 'java-mode-hook 'my-java-jde-mode-hook)
(global-set-key (kbd "C-c C-.") 'jde-complete-ido)

(custom-set-variables
 '(jde-expand-classpath-p t)
 '(jde-help-docsets
   (quote
        (("JDK API" "/opt/jdk1.6.0/docs/api/index.html" nil))))
 '(jde-jalopy-option-force t)
 '(jde-jalopy-option-path "/home/jeoygin/util/jalopy")
 '(jde-jalopy-option-preferences-file "~/.emacs.d/jalopy/jalopy.xml")
 '(jde-jdk (quote ("1.6.0")))
 '(jde-jdk-doc-url "/opt/jdk1.6.0/docs/api/index.html")
 '(jde-jdk-registry
   (quote
        (("1.7.0" . "/opt/jdk1.7.0")
         ("1.6.0" . "/opt/jdk1.6.0"))))
 '(jde-lib-directory-names (list "^lib$" "^jar$")))

(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

(defun add_classpath  (classpath)
   (if (stringp classpath) (setq jde-global-classpath  (append jde-global-classpath (list classpath ))) )
   (if (listp classpath) (setq jde-global-classpath (append jde-global-classpath classpath)) )
)

(defun add_src_path  (src_path)
   (if (stringp src_path) (setq jde-sourcepath  (append jde-sourcepath (list src_path ))) )
   (if (listp  src_path) (setq  jde-sourcepath  (append jde-sourcepath  src_path)) )
)

(add_classpath  (getenv "CLASSPATH"))
(add_src_path "/opt/jdk1.6.0/src")

(define-key jde-mode-map "\M-u" nil)
(define-key jde-mode-map "\M-up" 'jde-usages-display-call-tree-for-thing-at-point) ;; p = point
(define-key jde-mode-map "\M-ui" 'jde-usages-display-call-tree-for-specified-class) ;; i = interactive
(define-key jde-mode-map "\M-uc" 'jde-usages-display-call-tree) ;; c = callers
(define-key jde-mode-map "\M-ut" 'jde-usages-display-type-hierarchy) ;; t = types
(define-key jde-mode-map "\M-ur" 'jde-usages-display-subs-implementing-method) ;; r = reimplements
(define-key jde-mode-map "\M-ud" 'jde-usages-display-subs-and-implementers) ;; d = descendants
(define-key jde-mode-map "\M-ua" 'jde-usages-display-superclasses) ;; a = ancestors

(define-key jde-mode-map "\M-un" 'jde-usages-next-pos)
(define-key jde-mode-map "\M-ul" 'jde-usages-locate-class)


(global-set-key [(meta n)]  (lambda ()
                              (interactive)
                              (jde-load-project-file)
                              (jde-open-class-source-with-completion)))

(defun organize-imports()
  (interactive)
  (jde-import-all)
  (jde-import-expand-imports)
  (jde-import-kill-extra-imports)
  (jde-import-organize))

(global-set-key [(control shift o)] 'organize-imports)

(remove-hook 'jde-compile-finish-hook 'jde-compile-finish-kill-buffer)

(provide 'jdee-load)
