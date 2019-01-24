(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#fdf6e3"))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(fci-rule-color "#eee8d5")
 '(package-selected-packages
   (quote
    (command-log-mode scratch diminish yasnippet company-quickhelp)))
 '(session-use-package t nil (session))
 '(speedbar-show-unknown-files t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(window-numbering-mode t)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 115 :width normal :family "Source Code Pro")))))

(setq default-tab-width 4)
(setq tab-width 4)
(setq lua-indent-level 4)
(defun my-lua-setup ()
  (setq indent-tabs-mode nil))
(add-hook 'lua-mode-hook 'my-lua-setup)
; (set-default-font "-microsoft-YaHei Consolas Hybrid-normal-normal-normal-*-17-*-*-*-*-0-iso10646-1")

(setq scroll-margin 1
      scroll-conservatively 10000);;防止页面滚动时跳动
(require 'popwin)
(popwin-mode 1)

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;;=====================tabbar===============
(global-set-key [(meta k)] 'tabbar-backward)
(global-set-key [(meta j)] 'tabbar-forward)

;; ======================================================
;; 全局都有 行号,
;; init-editing-utils.el
;; 控制 行号
; (when (fboundp 'display-line-numbers-mode)
;   (add-hook 'prog-mode-hook 'display-line-numbers-mode))
(global-display-line-numbers-mode)
;; ======================================================

;; 加载上次文件
(desktop-save-mode 1)
;;[ 编码设置]
;;==========
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)            ;缓存文件编码
(setq default-file-name-coding-system 'utf-8-unix)              ;文件名编码
(setq default-keyboard-coding-system 'utf-8-unix)               ;键盘输入编码
(setq default-process-coding-system '(utf-8-unix . utf-8-unix)) ;进程输出输入编
(setq default-sendmail-coding-system 'utf-8-unix)               ;发送邮件编码
(setq default-terminal-coding-system 'utf-8-unix)               ;终端编码 

(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)

;; 光标颜色
(set-cursor-color "gold1")
(set-mouse-color "gold1")
;;智能backspace删除
;;================
(require-package 'hungry-delete)
(global-hungry-delete-mode)

;; 记忆上次打开的分屏幕
;; ================
(setq inhibit-splash-screen t)
;;高亮当前行
(global-hl-line-mode)
;;隐藏菜单栏工具栏滚动条 
(tool-bar-mode 0) 
(menu-bar-mode 0) 
(scroll-bar-mode 0) 
;;取消滚动栏
;;---------
(set-scroll-bar-mode nil)
;;设置滚动栏在窗口右侧，而默认是在左侧
;;(customize-set-variable 'scroll-bar-mode 'right))
;;关闭emacs启动时的画面
(setq inhibit-startup-message t)
;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

(fset 'yes-or-no-p 'y-or-n-p)       ;;'y'/'n'代替'yes'/'no'
(setq x-select-enable-clipboard t)  ;;支持emacs和外部程序的粘贴

;; 设定不产生备份文件
(setq make-backup-files nil)
;;自动保存模式
(setq auto-save-mode nil)
;; 不生成临时文件
(setq-default make-backup-files nil)

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)
;;(setq mouse-yank-at-point t)
;;使用鼠标中键可以粘贴

;; 自动的在文件末增加一新行
(setq require-final-newline t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;;显示时间
;;======= 
(display-time-mode 1) ;; 常显 
(setq display-time-24hr-format t)   ;;格式 
(setq display-time-day-and-date t)  ;;显示时间、星期、日期
(setq display-time-use-mail-icon t) ;;时间栏旁边启用邮件设置
(setq display-time-interval 10)     ;;时间的变化频率，单位多少来着？

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

(setq auto-image-file-mode t)
;; -----------------------


;; -----------------------
;; 屏幕设置
;; -----------------------
;;横向分屏
;;(split-window-below)  

;;纵向分屏
(split-window-right)    
;; -----------------------

;;自动补全括号
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist '(
    (?` ?` _ "''")
    (?\( ? _ " )")
    (?\[ ? _ " ]")
    (?{ \n > _ \n ?} >)
    ))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。

;;(electric-pair-mode t)
;;自动补全各种括弧
;; enable skeleton-pair insert globally
   (setq skeleton-pair t)
  ;;(setq skeleton-pair-on-word t)
  ;; Uncomment if curly braces won't close in .R files
  ;; https://github.com/emacs-ess/ESS/issues/296#issuecomment-189614821[/url]
  ;;(define-key ess-mode-map (kbd "{") nil)
  ;;(define-key ess-mode-map (kbd "}") nil) 
   (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
   (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
   (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
   (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
   (global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
   (global-set-key (kbd "\`") 'skeleton-pair-insert-maybe)
   (global-set-key (kbd "<") 'skeleton-pair-insert-maybe)

(autoload 'folding-mode "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode "folding" "Folding mode" t)
;;folding.el 编辑文本的一部分，其它部分折叠起来

(setq auto-mode-alist
      ;; 将文件模式和文件后缀关联起来
      (append '(("\\.py\\'" . python-mode)
                ("\\.s?html?\\'" . html-helper-mode)
                ("\\.asp\\'" . html-helper-mode)
                ("\\.phtml\\'" . html-helper-mode)
                ("\\.css\\'" . css-mode))
              auto-mode-alist))

(setq default-tab-width 4)
(setq-default indent-tabs-mode nil) ;; tab 改为插入空格
;;(global-set-key (kbd "RET") 'newline-and-indent)

(setq c-default-style "linux"
      c-basic-offset 4)
;; -----------------------

;; -----------------------
;; org-model
;; -----------------------
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; -----------------------
