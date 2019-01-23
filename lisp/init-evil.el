;;
;;
(require-package 'evil-leader)
(require-package 'evil)

;; 进入 evil
(evil-mode t)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "w" 'save-buffer)

;; 默认　Emacs 模式
;; 使用　C-z 切换
(setq evil-default-state 'emacs) 

(provide 'init-evil)
