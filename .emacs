;; Reload changed files automatically
(global-auto-revert-mode t)

;; Display line number: 
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%4d ")

;; Display column number: 
(column-number-mode t)

;; Buffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Color: 
(set-cursor-color "gray60")
(set-foreground-color "gray")
(set-background-color "black")

;; Without tool bar: 
(when (memq window-system '(mac ns))
  nil
  (tool-bar-mode nil))

;; Time: 
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;; Language Environment: 
(setq current-language-environment "UTF-8")
(setq default-input-method "fcitx")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Title: 
(setq frame-title-format "Jeoygin Wang@%b")

;; Calendar: 
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))

;; Mail: 
(setq display-time-use-mail-icon t)
(setq user-full-name "Jeoygin")
(setq user-mail-address "jeoygin@gmail.com")

;; Font: 
;; (set-default-font "10x20")
(set-face-attribute 'default nil :height 140)

;; Yes or No: 
(fset 'yes-or-no-p 'y-or-n-p)

;; Goto line
(global-set-key "\C-cg" 'goto-line)

;; Duplicate and delete one line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)

(global-set-key "\C-c\C-y" 'duplicate-line)
(global-set-key "\C-c\C-d" 'kill-whole-line)

;; Mark: 
(global-set-key "\C-cm" 'set-mark-command) 

;; Look Up Keys: 
(defun open-key-info-file ()
  (interactive)
  (split-window-horizontally)
  (find-file-other-window "~/.emacs.d/emacskeys.txt")
  (outline-mode)
  (hide-body))

(global-set-key "\C-ck" 'open-key-info-file)

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

;; zip-to-char:
(global-set-key "\M-z" 'zzz-to-char)
(global-set-key "\M-Z" 'zzz-up-to-char)

;; Define package load commands
(add-to-list 'load-path "~/.emacs.d/user")
(require 'package-load-define)

;; Load packages
(setq package-enable-at-startup nil)
(setq package-load-list '((auto-complete t)
                          (go-mode t)
                          (go-eldoc t)
                          (ztree t)
                          (ecb t)
                          (xcscope t)
                          (zzz-to-char t)
                          all))
(load-package '(elpa x-clipboard bracket tab color-theme yasnippet ecb xcscope))
