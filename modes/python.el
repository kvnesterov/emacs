(add-hook 'python-mode-hook
	  (lambda () (package-initialize)
		 ;(elpy-enable)
		 (setq ac-trigger-key 'nil)
		 (local-set-key (kbd "C-b") 'python-run)
		 ))
