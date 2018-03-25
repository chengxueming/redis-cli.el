
;; helper routines (foundations)

(defun make-grid ()
  (interactive)
  (erase-buffer)
  (dotimes (i height)
    (insert-char background-char width)
    (newline)))


(defun draw-char (x y char)
  (interactive)
  (goto-char (+ x (* (1- y) (1+ width))))
  (delete-char 1)
  (insert-char char 1))

(dotimes (i 5)
(draw-char i i ?-)
(newline))


((goto-char (point-min))
(delete-char 1)
(insert-char ?* 1))

(draw-char 2 2 ?*)

(defun draw-string(str)
  "draw a str near cursor"
  (loop for x in (string-to-list str) do
        (insert x)))

(defun insert-string-with-margin (str left-margin width)
  "draw a with a margin like '**str******' near cursor"
  (insert-char ? left-margin)
  (draw-string str)
  (insert-char ? (- width left-margin (length str)))
  )

(insert-string-with-margin "hello" 2 10)  hello   

(defun draw-rect(width height title key-type value-list)
  "show redis key content"
  ;;  --article:92617-----------------hash-- 
  ;; |         |                            |
  ;; |  title  |  go to statement           |
  ;; |  link   |  http://goo.gl             |
  ;; |  votes  |  528                       |
  ;;  -------------------------------------- 
  (newline)
  ;; title line
  (insert-char ? 1)
  (setq border-radio-length 2)
  (insert-char ?-  border-radio-length)
  (draw-string title)
  (setq key-type-gap (- width (length title) (* border-radio-length 3) (length key-type)))
  (insert-char ?- key-type-gap)
  (draw-string key-type)
  (insert-char ?- border-radio-length)
  (insert-char ? 1)
  (newline)
  ;; build body
  (setq max-key-length 9)
  (setq value-list (push '("" "") value-list) )
  (loop for pair in value-list do
        (progn
          (setq key (nth 0 pair))
          (setq value (nth 1 pair))
          (insert-char ?| 1)
          (insert-string-with-margin key 2 max-key-length)
          (insert-char ?| 1)
          (insert-string-with-margin value 2 (- width 1 max-key-length 1 1))
          (insert-char ?| 1)
          (newline))
        )
  ;; bottom line
  (insert-char ? 1)
  (insert-char ?- (- width 2))
  (insert-char ? 1)
  )
(setq value-list (list '("title" "go to statement")
                       '("link" "http://goo.gl")
                       '("votes" "528")
                       ))
(draw-rect 40 8 "article:92617" "hash" value-list)
(substring "article" 0 2)
(loop for x in (string-to-list "article") do
      (insert x)
      )
(insert-char 97)
