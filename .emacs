;; CEDET: 
;; -----------
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another 
;; package (Gnus, auth-source, ...).
(load-file "~/.emacs.d/cedet/common/cedet.el")

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)
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

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;; -----------
(global-set-key [(f6)] 'speedbar-get-focus)

;; =====================================END=====================================

(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; =====================================END=====================================

(add-to-list 'load-path "~/.emacs.d/table")
(require 'table)

;; =====================================END=====================================

;; jdee: 
(add-to-list 'load-path "~/.emacs.d/jdee/lisp")
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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(jde-expand-classpath-p t)
 '(jde-help-docsets (quote (("JDK API" "/opt/jdk1.6.0/docs/api/index.html" nil))))
 '(jde-jalopy-option-force t)
 '(jde-jalopy-option-path "/home/jeoygin/util/jalopy")
 '(jde-jalopy-option-preferences-file "~/.emacs.d/jalopy/jalopy.xml")
 '(jde-jdk (quote ("1.6.0")))
 '(jde-jdk-doc-url "/opt/jdk1.6.0/docs/api/index.html")
 '(jde-jdk-registry (quote (("1.7.0" . "/opt/jdk1.7.0") ("1.6.0" . "/opt/jdk1.6.0"))))
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

;; =====================================END=====================================

;; jalopy: 
(add-to-list 'load-path "~/.emacs.d/jalopy")
(require 'jde-jalopy)

;; set jde-jalopy options


;; =====================================END=====================================

;; flymake: 
(add-to-list 'load-path "~/.emacs.d/flymake")
(require 'jde-flymake)
;;(require 'flymake-helper)

;; (autoload 'flymake-find-file-hook "flymake" "" t)
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
(setq flymake-gui-warnings-enabled nil)
(setq flymake-log-level 0)

(defun flymake-display-current-error ()
  "Display errors/warnings under cursor."
  (interactive)
  (let ((ovs (overlays-in (point) (1+ (point)))))
    (catch 'found
      (dolist (ov ovs)
        (when (flymake-overlay-p ov)
          (message (overlay-get ov 'help-echo))
          (throw 'found t))))))

(defun flymake-goto-next-error-disp ()
  "Go to next error in err ring, then display error/warning."
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-current-error))

(defun flymake-goto-prev-error-disp ()
  "Go to previous error in err ring, then display error/warning."
  (interactive)
  (flymake-goto-prev-error)
  (flymake-display-current-error))

(defvar flymake-mode-map (make-sparse-keymap))
(define-key flymake-mode-map (kbd "C-c <f7>") 'flymake-goto-next-error-disp)
(define-key flymake-mode-map (kbd "C-c <f8>") 'flymake-goto-prev-error-disp)
(define-key flymake-mode-map (kbd "C-c <C-f7>")
  'flymake-display-err-menu-for-current-line)
(or (assoc 'flymake-mode minor-mode-map-alist)
    (setq minor-mode-map-alist
          (cons (cons 'flymake-mode flymake-mode-map)
                minor-mode-map-alist)))

(define-key flymake-mode-map [M-f7]         'flymake-goto-prev-error)
(define-key flymake-mode-map [M-f8]         'flymake-goto-next-error)
(define-key flymake-mode-map [M-f12]        'flymake-save-as-kill-err-messages-for-current-line)

;; =====================================END=====================================

;; jmaker: 

(add-to-list 'load-path "~/.emacs.d/jmaker")
(require 'jmaker)

;; =====================================END=====================================

;; jsee: 

(add-to-list 'load-path "~/.emacs.d/jsee")
(require 'jsee)

;; =====================================END=====================================

;; ecb: 
(add-to-list 'load-path "~/.emacs.d/ecb")
;; (require 'ecb)
(require 'ecb-autoloads)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq ecb-tip-of-the-day nil)
(setq byte-compile-warnings nil)
(setq stack-trace-on-error nil)

(global-set-key "\C-c0" 'ecb-goto-window-directories)
(global-set-key "\C-c1" 'ecb-goto-window-sources)
(global-set-key "\C-c2" 'ecb-goto-window-methods)
(global-set-key "\C-c3" 'ecb-goto-window-history)
(global-set-key "\C-ce" 'ecb-goto-window-edit-last)

;; =====================================END=====================================

;; elib:
(add-to-list 'load-path "~/.emacs.d/elib")

;; =====================================END=====================================

;; cscope: 
(add-to-list 'load-path "~/.emacs.d/cscope")
(add-hook 'c-mode-common-hook
      '(lambda ()
        (require 'xcscope)))

;; =====================================END=====================================

;; Goto-line: 
;; (global-set-key [?\C-\M-g] 'goto-line)
(global-set-key "\C-cg" 'goto-line)

;; =====================================END=====================================

;; Copy & Yank: 
(setq x-select-enable-clipboard t)
;; (global-set-key "\C-c\C-c" 'clipboard-kill-ring-save) 
;; (global-set-key "\C-c\C-v" 'clipboard-yank) 

(defun copy-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
    (progn
     ; my clipboard manager only intercept CLIPBOARD
      (shell-command-on-region (region-beginning) (region-end)
        (cond
         ((eq system-type 'cygwin) "putclip")
         ((eq system-type 'darwin) "pbcopy")
         (t "xsel -ib")
         )
        )
      (message "Yanked region to clipboard!")
      (deactivate-mark))
    (message "No region active; can't yank to clipboard!")))
(defun paste-from-x-clipboard()
  (interactive)
  (shell-command
   (cond
    ((eq system-type 'cygwin) "getclip")
    ((eq system-type 'darwin) "pbpaste")
    (t "xsel -ob")
    )
   1)
  )

(global-set-key "\C-c\C-c" 'copy-to-x-clipboard)
(global-set-key "\C-c\C-v" 'paste-from-x-clipboard)

;; =====================================END=====================================

;; Buffer: 
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; =====================================END=====================================

;; Mark: 
(global-set-key "\C-cm" 'set-mark-command) 

;; =====================================END=====================================

;; Look Up Keys: 
(defun open-key-info-file ()
  (interactive)
  (split-window-horizontally)
  (find-file-other-window "~/emacskeys.txt")
  (outline-mode)
  (hide-body))

(global-set-key "\C-ck" 'open-key-info-file)

;; =====================================END=====================================

;; Disable Control + Space: 
(global-set-key (kbd "C-SPC") 'nil)

;; Delete Other Windows: 
(global-set-key [(f1)] 'delete-other-windows)

;; Other Window: 
(global-set-key [(f2)] 'other-window)

;; Close Buffer: 
(global-set-key [(f3)] 'kill-buffer-and-window)

;; Shell: 
(global-set-key [(f4)] 'shell)

;; Compile: 
(global-set-key [(f5)] 'compile)
;; Set Compile Command as make: 
(setq compile-command "make")

;; =====================================END=====================================

;; bracket: 
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
;;    (?\( _ ")")
    (?\[ _ "]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-common-hook 'my-c-mode-auto-pair)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
		((looking-at "\\s\)") (forward-char 1) (backward-list 1))
		(t (self-insert-command (or arg 1)))))

(global-set-key "%" 'match-paren)

;; =====================================END=====================================

;; Display line number: 
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%4d ")

;; Display column number: 
(column-number-mode t)

;; =====================================END=====================================

;; Color: 
(set-cursor-color "gray60")
(set-foreground-color "gray")
(set-background-color "black")

;; =====================================END=====================================

;; Without tool bar: 
(tool-bar-mode nil)

;; =====================================END=====================================

;; Time: 
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;; =====================================END=====================================

;; Language Environment: 
(setq current-language-environment "UTF-8")
(setq default-input-method "fcitx")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; =====================================END=====================================

;; Title: 
(setq frame-title-format "Jeoygin Wang@%b")

;; =====================================END=====================================

;; Calendar: 
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))

;; =====================================END=====================================

;; Mail: 
(setq display-time-use-mail-icon t)
(setq user-full-name "Jeoygin")
(setq user-mail-address "jeoygin@163.com")

;; =====================================END=====================================

;; Yes or No: 
(fset 'yes-or-no-p 'y-or-n-p)

;; =====================================END=====================================

;; Tab: 
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list '(0 4 8 12 16 20 24 28 32 36 40
      44 48 52 56 60 64 68 72 76 80 84 88 92 96))

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)
    )
  "My C Programming Style")

;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
;  (c-toggle-auto-hungry-state 1)
  ;; key bindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, idl-mode-map, and pike-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; =====================================END=====================================

;; Font: 
;; (set-default-font "10x20")

;; =====================================END=====================================

;; w3m: 
;; (autoload 'w3m "w3m" "interface for w3m on emacs" t)
;; (setq w3m-command-arguments '("-cookie" "-F"))
;; (setq w3m-use-cookies t)
;; (setq w3m-home-page "http://www.google.com/")
;; (require 'mime-w3m)
;; (setq w3m-default-display-inline-image t)
;; (setq w3m-default-toggle-inline-images t)
;;
;; (setq w3m-arrived-file-coding-system 'euc-cn)
;; (setq w3m-bookmark-file-coding-system 'euc-cn)
;; (setq w3m-default-url-coding-system 'euc-cn)
;; (setq w3m-output-coding-system 'euc-cn)
;; (setq w3m-coding-system 'euc-cn)
;; (setq w3m-input-coding-system 'euc-cn)
;; (setq w3m-find-coding-system 'euc-cn)
;; (setq w3m-default-coding-system 'euc-cn)
;; (setq w3m-coding-system-priority-list '(euc-cn))
;; (setq w3m-file-name-coding-system 'euc-cn)
;; (setq w3m-bookmark-file-coding-system 'euc-cn)

;; =====================================END=====================================

;; color-theme:
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

(load "~/.emacs.d/color-theme-molokai/color-theme-molokai.el")
(color-theme-molokai)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
