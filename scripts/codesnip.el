;; http://ergoemacs.org/emacs/elisp_all_about_lines.html


(defun replace-greek-region (start end)
  "Replace “alpha” to “α” and other greek letters in current region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward " alpha" nil t) (replace-match " α" nil t))
    (goto-char (point-min))
    (while (search-forward " beta" nil t) (replace-match " β" nil t))
    (goto-char (point-min))
    (while (search-forward " gamma" nil t) (replace-match " γ" nil t))
    ))

;; abc
;; abc -> "abc","abc","abc"
;; abc
(defun join-multi-line (start end)
  "Replace “alpha” to “α” and other greek letters in current region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while t 
      (progn
        (goto-char (line-beginning-position))
        (insert "\"")
        (goto-char (line-end-position))
        (insert "\"")
        (if (< (point) (point-max)) 
            (progn
              (insert ",")
              (next-line)
              )
          (throw 'break nil)
          )
        )
      )
    )
  )
