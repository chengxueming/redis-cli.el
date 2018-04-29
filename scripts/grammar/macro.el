;;https://www.jianshu.com/p/9a8e8d62a335
;;'abc 定义字符串 1+ 是个函数 format %s 会进行类型转换 defvar 当变量已经存在不会重新赋值
(defun inc (var)
    (list 'setq var (list '1+ var)))

(inc 'x)    ; (setq x (1+ x))

(defvar x 0)
(eval (inc 'x))
(1+ 2 4)


(list '1+ 3)


(message (format "hello %s" '("a" "b")))


(defmacro inc (var)
    (list 'setq var (list '1+ var)))
