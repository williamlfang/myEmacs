;; =============================================================================
;; 把目录lisp/添加到搜索路径中去
;; --------------------------
(add-to-list
    'load-path 
    (expand-file-name "lisp" "~/.emacs.d")
)

(add-to-list
    'load-path 
    (expand-file-name "lisp/purcell" "~/.emacs.d")
)
;; =============================================================================


;; =============================================================================
;; Adjust garbage collection thresholds during startup, and thereafter
;;-------------------------------------------------------------------
(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(require 'init-benchmarking) ;; Measure startup time
;; =============================================================================

;; =============================================================================
;; Bootstrap config
;; ----------------
;; 下面每一个被require的feature都对应一个lisp/目录下的同名
;; elisp文件，例如init-utils.el、init-elpa.el
(require 'init-compat)
(require 'init-utils)   ;; 为加载初始化文件提供一些自定义的函数和宏
(require 'init-elpa)    ;; 加载ELPA，并定义了require-package函数
(require 'init-exec-path) ;; Set up $PATH
;; =============================================================================


;; =============================================================================
(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)
;; =============================================================================


;; =============================================================================
;; lisp/
;; -----------
;; 主题颜色配置
(require 'init-theme)

(require 'init-company)
(require 'init-auto-complete)

(require 'init-windows)
; (require 'init-sessions)
(require 'init-editing-utils)
(require 'init-whitespace)
(require 'init-fonts)
(require 'init-evil)

(require 'init-org)
(require 'init-textile)
(require 'init-csv)
(require 'init-markdown)
(require 'init-python)
(require 'init-sql)
;; =============================================================================

;; =============================================================================
;; lisp/purcell
;; -----------
(require 'init-frame-hooks)
(require 'init-gui-frames)
;; =============================================================================

;; =============================================================================
;; Variables configured via the interactive 'customize' interface
(setq custom-file (expand-file-name "custom.el" "~/.emacs.d"))
(when (file-exists-p custom-file)
  (load custom-file))


(global-set-key (kbd "C-SPC") nil)
;; =============================================================================


;; ==================
(require 'init-key-binding)
(provide 'init)
;; init.el ends here
;; ==================


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (command-log-mode scratch diminish yasnippet company-quickhelp)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
