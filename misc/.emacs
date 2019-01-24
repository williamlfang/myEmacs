;; =============================================================================
;; @william
;; 2018-12-30
;; 我的 Emacs 种草记
;; ---------------
;; 配置文件位于：
;; - Mac OS : ~/.emacs
;; - Linux  : 
;; =============================================================================
(setq user-full-name "william")
(setq user-mail-address "william.lian.fang@gmail.com")

;; -----------------------
;; 添加仓库
;; -----------------------
(require 'package)
(setq
  package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
  package-archive-priorities '(("melpa-stable" . 1))
)
(package-initialize)
;; -----------------------


;; -----------------------
;; 安装插件
;; -----------------------
(require 'cl)
(defvar william/packages '(
                company
                monokai-theme
                atom-one-dark-theme
                hungry-delete
                swiper
                counsel
                js2-mode
                exec-path-from-shell
                ) "Default packages")

(setq package-selected-packages william/packages)

(defun william/packages-installed-p ()
  (loop for pkg in william/packages
    when (not (package-installed-p pkg)) do (return nil)
    finally (return t)
  )
)

(unless (william/packages-installed-p)
  (message "%s" "正在更新包...")
  (package-refresh-contents)
  (dolist (pkg william/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg)
      )
    )
)
;; -----------------------


;; -----------------------
;; 自动完成
;; -----------------------
(require 'company)
(global-company-mode t); 全局开启

(setq company-idle-delay 0.2;菜单延迟
      company-minimum-prefix-length 1; 开始补全字数
      company-require-match nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
      company-show-numbers t; 显示序号
      company-transformers '(company-sort-by-backend-importance)
      company-continue-commands '(not helm-dabbrev)
      )
;; -----------------------


;; -----------------------
;; 默认配置
;; -----------------------
;;主题
(load-theme 'atom-one-dark t)

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

(set-cursor-color "gold1")
(set-mouse-color "gold1")

;;智能backspace删除
;;================
(require 'hungry-delete)
(global-hungry-delete-mode)

;;开启行标
(global-linum-mode t)

;;
(setq inhibit-splash-screen t)

;;指针模式
(setq-default cursor-type 'bar)

;;开启最近的文件
(require 'recentf)
   (recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;可视化选中 d 删除
(delete-selection-mode t)

;;全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;括号匹配(用hook勾住lisp 的major-mode  追加一个mode  ctrl h m 可以看到当前mode)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;高亮当前行
(global-hl-line-mode)

;;隐藏菜单栏工具栏滚动条 
(tool-bar-mode 0) 
(menu-bar-mode 0) 
(scroll-bar-mode 0) 

(set-scroll-bar-mode nil)
;;取消滚动栏

;;(customize-set-variable 'scroll-bar-mode 'right))
;;设置滚动栏在窗口右侧，而默认是在左侧

(setq visible-bell t)
;;关闭烦人的出错时的提示声

(setq inhibit-startup-message t)
;;关闭emacs启动时的画面

(setq gnus-inhibit-startup-message t)
;;关闭gnus启动时的画面

(mouse-avoidance-mode 'animate)
;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。

(fset 'yes-or-no-p 'y-or-n-p)       ;;'y'/'n'代替'yes'/'no'
(setq x-select-enable-clipboard t)  ;;支持emacs和外部程序的粘贴

;;[ 设置缩进 ]
;;===========
(setq indent-tabs-mode t)
(setq default-tab-width 4)
(setq tab-width 4)

(setq make-backup-files nil)
;; 设定不产生备份文件

;;(setq auto-save-mode nil)
;;自动保存模式

(setq-default make-backup-files nil)
;; 不生成临时文件

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;(setq mouse-yank-at-point t)
;;使用鼠标中键可以粘贴

(setq require-final-newline t)
;; 自动的在文件末增加一新行

(setq-default transient-mark-mode t)
;;Non-nil if Transient-Mark mode is enabled.

(setq track-eol t)
;; 当光标在行尾上下移动的时候，始终保持在行尾。

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


;; -----------------------
;; 快捷键设置 F1-F12
;; -----------------------
;; F1
;;按F1调用open-my-init-file函数
(global-set-key (kbd "<f2>") 'open-my-init-file)

;;代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;;能把一个代码块缩起来，需要的时候再展开
;; M-x hs-minor-mode
;; C-c @ ESC C-s show all
;; C-c @ ESC C-h hide all
;; C-c @ C-s show block
;; C-c @ C-h hide block
;; C-c @ C-c toggle hide/show
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ess org-mind-map org-link-minor-mode color-theme monokai-theme js2-mode hungry-delete exec-path-from-shell counsel company-statistics company-math atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
