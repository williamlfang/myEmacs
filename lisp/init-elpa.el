;;init-elpa.el
;; =============================================================================
;; 有了ELPA，给Emacs装插件就变的非常容易了。比方说你需要一个叫example的插件，那么可以在lisp/目录下增加一个文件init-example.el：
;; require-package函数的作用是，判断某个包是否已经安装，如果没有则自动从ELPA中安装它（需要联网）。当然，对于自定义的插件或是没有被ELPA收录的插件，这个函数就不起作用了。
;; ----------------------------------------------------------------------
;; (require-package 'example)
;; ;; ELPA中的插件一般都提供一个"autoloads"方法，可以帮用户自动加载插件并做相应
;; ;; 的配置。不过如果涉及到细节的配置，那请自己看该插件的帮助文档。
;; (require 'example-autoloads)
;; (provide 'init-example)
;; ----------------------------------------------------------------------
;; 然后在init.el中加入一句(require 'init-example)(注意这一句要放在(require 'init-elpa)之后)即可。
;; ----------

(require 'package)
;; 增加软件包仓库
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))


;;; Standard package repositories

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Official MELPA Mirror, in case necessary.
  ;;(add-to-list 'package-archives (cons "melpa-mirror" (concat proto "://www.mirrorservice.org/sites/melpa.org/packages/")) t)
  (if (< emacs-major-version 24)
      ;; For important compatibility libraries like cl-lib
      (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))
    (unless no-ssl
      ;; Force SSL for GNU ELPA
      (setcdr (assoc "gnu" package-archives) "https://elpa.gnu.org/packages/"))))


;;; On-demand installation of packages

(require 'cl-lib)

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
             (versions (mapcar #'package-desc-version known)))
        (if (cl-find-if (lambda (v) (version-list-<= min-version v)) versions)
            (package-install package)
          (if no-refresh
              (error "No version of %s >= %S is available" package min-version)
            (package-refresh-contents)
            (require-package package min-version t))))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))


;;; Fire up package.el

(setq package-enable-at-startup nil)
;; 强行提前初始化ELPA。因为默认情况下Emacs在init.el加载完之后才开始初始化ELPA，
;; 而我们把大多数包的初始化函数都放在init.el中，如果不提前初始化ELPA会导致后面的
;; 初始化过程出错（对应的包文件还没有加载进来）。
(package-initialize)
(provide 'init-elpa)
