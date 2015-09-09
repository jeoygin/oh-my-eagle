(defun load-package-cedet()
  (interactive)
  (require 'cedet-load))

(defun load-package-jdee()
  (interactive)
  (require 'jdee-load))

(defun load-package-yasnippet()
  (interactive)
  (require 'yasnippet-load))

(defun load-package-table()
  (interactive)
  (require 'table-load))

(defun load-package-jalopy()
  (interactive)
  (require 'jalopy-load))

(defun load-package-flymake()
  (interactive)
  (require 'flymake-load))

(defun load-package-jmaker()
  (interactive)
  (require 'jmaker-load))

(defun load-package-jsee()
  (interactive)
  (require 'jsee-load))

(defun load-package-ecb()
  (interactive)
  (require 'ecb-load))

(defun load-package-elib()
  (interactive)
  (require 'elib-load))

(defun load-package-cscope()
  (interactive)
  (require 'cscope-load))

(defun load-package-x-clipboard()
  (interactive)
  (require 'x-clipboard-load))

(defun load-package-bracket()
  (interactive)
  (require 'bracket-load))

(defun load-package-tab()
  (interactive)
  (require 'tab-load))

(defun load-package-color-theme()
  (interactive)
  (require 'color-theme-load))

(defun load-package-elpa()
  (interactive)
  (require 'elpa-load))

(defun load-package-go()
  (interactive)
  (require 'go-load))

(defun load-package-java()
  (interactive)
  (load-package-jdee)
  (load-package-jalopy)
  (load-package-flymake)
  (load-package-jmaker)
  (load-package-jsee))

(defun load-package-all()
  (interactive)
  (load-package-elpa)
  (load-package-x-clipboard)
  (load-package-bracket)
  (load-package-tab)
  (load-package-color-theme)
  (load-package-cedet)
  (load-package-ecb)
  (load-package-yasnippet)
  (load-package-table)
  (load-package-elib)
  (load-package-cscope)
  (load-package-java)
  (load-package-go))

(provide 'package-load-define)
