(defun load-dir(dir)
  (mapcar (lambda (x)
	    (if (string-match "\\.el$" x)
		(load-file (concat dir "/" x))))
	  (directory-files dir)))



(defun fullscreen (&optional f)
  (interactive)
  (if (string= system-type "gnu/linux")
      (progn (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			     '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
	     (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
				    '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))))

(defun move-line-up ()
  (interactive)
  (let (offset)
    (setq offset (- (point) (line-beginning-position)))
    (transpose-lines 1)
    (forward-line -2)
    (goto-char (+ offset (line-beginning-position))))
  )

(defun move-line-down ()
  (interactive)
  (let (offset)
    (setq offset (- (point) (line-beginning-position)))
    (forward-line 1)
    (transpose-lines 1)
    (forward-line -1)
    (goto-char (+ offset (line-beginning-position))))
  )

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
