(cua-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode (quote right))
(fullscreen)
(show-paren-mode 1)
(setq-default cursor-type 'bar) 

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0/")
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-fallback-behavior '(apply indent-for-tab-command))
(add-hook 'find-file-hook '(lambda () (idle-highlight-mode t)))

(loop
 for from across "йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\ЭЯЧСМИТЬБЮ№"
 for to   across "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"
 do
 (eval `(define-key key-translation-map (kbd ,(concat "C-" (string from))) (kbd ,(concat     "C-" (string to)))))
 (eval `(define-key key-translation-map (kbd ,(concat "M-" (string from))) (kbd ,(concat     "M-" (string to))))))

;; Theme
(load-theme 'tango-dark t)
