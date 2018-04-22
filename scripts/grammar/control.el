;; 条件
(defun testcond(&optional ratio)
  (cond
   (ratio
    (message "fine you pass ratio"))
   (t
    (message "saddly"))
   ))

(testcond 1)
(testcond nil)
(testcond)
