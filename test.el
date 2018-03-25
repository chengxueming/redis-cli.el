(setq value-list (list '("a" 99)
      '("b" 98)
      '("c" 97)
      ))
(loop for pair in value-list do
      (insert-char (nth 1 pair)))

(setq a 11)
(progn
  (setq a (+ a 12))
  (setq a (+ a 12))
  (setq a (+ a 12)))

(append (list '("" "")) value-list)
(push '("" "") value-list)
(insert '("" "") value-list)
