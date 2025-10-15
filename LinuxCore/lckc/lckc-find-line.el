;; This Emacs Lisp file is distributed under the GNU General Public
;; License (GPL) by its author, Scott Maxwell.
;;
;; Find a line in lckc_code, given its number.  The line number can be
;; supplied as a prefix argument; if given no prefix argument, the
;; line number will be read from the minibuffer instead.  The function
;; assumes that it will be used in the file lckc_code, the Linux Core
;; Kernel Commentary code file distributed on the CD with the book.
;;
;; You will probably want to bind this to a key.  (If you're new to
;; Emacs, see the documentation of global-set-key and local-set-key.)
(defun lckc-find-line (line)
  "*Find line number LINE in lckc_code." ; Emacs Lisp documentation string.

  (interactive "NLine number: ")	; Get prefix arg or read from minibuf.
  (if line				; Got arg.
      (let ((regexp (format "^%d " line))
	    point-match)
	(save-excursion
	  (goto-line line)		; Start regex search from here (faster).
	  (setq point-match
		(save-match-data
		  (re-search-forward regexp)
		  (beginning-of-line)
		  (point))))
	(if point-match
	    (goto-char point-match))))	; Return to the matched point.
  )
