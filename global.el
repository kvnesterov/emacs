;; Misc
(cua-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode (quote right))
(fullscreen)
(show-paren-mode 1)
(setq-default cursor-type 'bar) 
(setq inhibit-startup-message t)
;(setq shift-select-mode t)

;; Package system
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0/")
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-fallback-behavior '(apply indent-for-tab-command))
(add-hook 'find-file-hook '(lambda () (idle-highlight-mode t)))

;; Russian keys mapping
(loop
 for from across "йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\ЭЯЧСМИТЬБЮ№"
 for to   across "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"
 do
 (eval `(define-key key-translation-map (kbd ,(concat "C-" (string from))) (kbd ,(concat     "C-" (string to)))))
 (eval `(define-key key-translation-map (kbd ,(concat "M-" (string from))) (kbd ,(concat     "M-" (string to))))))

;; Theme
(load-theme 'tango-dark t)

;; sr-speedbar
(add-to-list 'load-path "~/.emacs.d/elpa/sr-speedbar-0.1.8/")
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq speedbar-use-images nil)
(custom-set-faces
 '(speedbar-separator-face ((t (:foreground "white")))))
;; (sr-speedbar-open)
(speedbar-change-initial-expansion-list "buffers")
(setq sr-speedbar-max-width 24)
(setq sr-speedbar-skip-other-window-p t)
(next-multiframe-window-wrapper)

;; Python mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
