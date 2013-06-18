(add-hook 'python-mode-hook
	  (progn (package-initialize)
		 (elpy-enable)
		 (setq ac-trigger-key 'nil)
		 ))
