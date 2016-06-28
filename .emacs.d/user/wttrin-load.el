(require 'use-package)
(require 'frame-cmds-load)

(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Beijing"
                                "Shanghai"))
  )

;;advise wttrin to save frame arrangement
;;requires frame-cmds package
(defun nut/wttrin-save-frame ()
  "Save frame and window configuration and then expand frame for wttrin."
  ;;save window arrangement to a register
  (window-configuration-to-register :pre-wttrin)
  (delete-other-windows)
  ;;save frame setup and resize
  (save-frame-config)
  (set-frame-width (selected-frame) 130)
  (set-frame-height (selected-frame) 48)
  )
;; (advice-add 'wttrin :before #'nut/wttrin-save-frame)

(defun nut/wttrin-restore-frame ()
  "Restore frame and window configuration saved prior to launching wttrin."
  (interactive)
  (jump-to-frame-config-register)
  (jump-to-register :pre-wttrin)
  )
;; (advice-add 'wttrin-exit :after #'nut/wttrin-restore-frame)

;; function to open wttrin with first city on list
(defun nut/wttrin ()
  "Open `wttrin' without prompting, using first city in `wttrin-default-cities'"
  (interactive)
  ;; save window arrangement to register
  (window-configuration-to-register :pre-wttrin)
  (delete-other-windows)
  ;; save frame setup
  (save-frame-config)
  ;;(set-frame-width (selected-frame) 130)
  ;;(set-frame-height (selected-frame) 48)
  ;; call wttrin
  (wttrin-query (car wttrin-default-cities))
  )

(provide 'wttrin-load)
