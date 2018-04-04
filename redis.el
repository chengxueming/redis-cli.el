
;; helper routines (foundations)
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

;; (insert-string-with-margin "hello" 2 10)

(defun draw-rect(width height title key-type value-list only-value)
  "show redis key content"
  ;;  --article:92617-----------------hash-- 
  ;; |         |                            |
  ;; |  title  |  go to statement           |
  ;; |  link   |  http://goo.gl             |
  ;; |  votes  |  528                       |
  ;;  -------------------------------------- 
  (interactive)
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
  (setq head-value "")
  (if (not only-value)
      (setq head-value '("" "")))
  (setq value-list (push head-value value-list) )
  (loop for pair in value-list do
        (progn
          (insert-char ?| 1)
          (if (not only-value)
              (progn 
                (setq key (nth 0 pair))
                (setq value (nth 1 pair))
                (insert-string-with-margin key 2 max-key-length)
                (insert-char ?| 1)
                (insert-string-with-margin value 2 (- width 1 max-key-length 1 1))
                )
              (insert-string-with-margin pair 2 (- width 2))
            )
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
(draw-rect 40 8 "article:92617" "hash" value-list nil)
(substring "article" 0 2)
(loop for x in (string-to-list "article") do
      (insert x)
      )article
(insert-char 97)
