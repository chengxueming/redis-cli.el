(defun cxm/mkdir-pwd(dir)
  (interactive)
  (mkdir (format "%s%s" (nth 1 (split-string (pwd))) dir))
  )

(defun cxm/init-composer-dir()
  (interactive)
  (cxm/mkdir-pwd "src")
  (cxm/mkdir-pwd "example")
  )

(defun cxm/init-composer-json()
  (interactive)
  (insert "{\n")
  (insert "   \"require\":{\n")
  (insert "     }\n")
  (insert "}\n")
  )


