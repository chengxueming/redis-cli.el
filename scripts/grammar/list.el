;; 字典
(defvar my-dict
  '((1 . 1.61893)
    (2 . 2)
    (3 . 3)) "my first lisp dict");; 定义

;;(nth 1 (assoc 1 my-dict))
(cdr (assoc 1 my-dict));;取值
;;(cdr '(1 . 2))

