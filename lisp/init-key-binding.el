;; =============================================================================
;; 各种 快捷键 组合设置
;; =============================================================================

;; 分两个屏幕
(global-set-key (kbd "C-x 2") 'split-window-horizontally-instead)
(global-set-key (kbd "C-x 3") 'split-window-vertically-instead)

;; 交互屏幕
(global-set-key (kbd "C-x o") 'switch-window)

;; 继续切分屏幕
(global-set-key (kbd "C-x -") (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key (kbd "C-x \\") (split-window-func-with-other-buffer 'split-window-horizontally))

;; 屏幕分割后，立马切换到新屏幕
(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 0))

;; ========================
(provide 'init-key-binding)
