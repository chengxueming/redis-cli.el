(setq value-list (list '("a" 99)
      '("b" 98)
      '("c" 97)
      ))
(loop for pair in value-list do
      (insert-char (nth 1 pair)))

;; progn 使用
(setq a 11)
(progn
  (setq a (+ a 12))
  (setq a (+ a 12))
  (setq a (+ a 12)))

;; 列表操作
(append (list '("" "")) value-list)
(push '("" "") value-list)
(append (list '("" "")) v-l)
(cddr '(1 2 3));; 移除元素

(setq v-l '("a" 1 "b" 2 "c" 3))
(setq o-l '())
(dotimes (i (/ (length v-l) 2))
  (push '((nth (* i 2) v-l) (nth (+ (* i 2) 1))) o-l))

(shiftf )
(setq o-l (list2list v-l))
(nth 0 o-l)
;; 测试eredis函数
(eredis-hai "127.0.0.1" 6379)
(eredis-hgetall "article:92617")
((nth 1 '("hgetall" eredis-hgetall)) "article:92617")
()

(eval "eredis-hgetall 'article:92617'")
(eredis-command-returning "hgetall" "article:92617")
'('("a". 1)
  '("b". 2)
  '("c". 3))

(eredis-command-returning "get" "abc")
(eredis-type "article:92617")

(if (nth 5 `(1 2 3)) (message "haha"))
(if (member 4 '(1 2 3)) (message "haha"))

(if (not nil) (message "haha"))
(if (= 1 1) (message "bbb"))
;;TODO
;; 1. 如何像 php里 ...$arr 一样把列表打开当成参数
;; 2. 如何 (eredis-$op ...$args) $op 可以是hgetall

(if (string-equal "a" "a")
    (draw-string "haha"))

(eredis-type "abc")
