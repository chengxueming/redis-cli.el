(defvar *cli-input* ""
  "global var record cli input execute and clear after entry return")

(defun cli-readin ()
  "Read a sentence.  Return it as a list of words."
  "TODO fix the problem key with : or - like article:92617"
  (interactive)
  (let (sentence)
    (backward-sentence 1)
    (while (not (eobp))
      (setq sentence (append sentence (list (cli-read-token)))))
       sentence))

(defun cli-read-token ()
  "Read one word from buffer."
  (interactive)
  (prog1 (intern (downcase (buffer-substring (point)
                                             (progn
                                               (forward-word 1)
                                               (point)))))
    (re-search-forward "\\Sw*")))

(define-derived-mode redis-cli-mode text-mode
  "redis mode"
  (define-key redis-cli-mode-map (kbd "<return>") 'input-entry)
  )

(defun draw-string(str)
  "draw a str near cursor"
  (loop for x in (string-to-list str) do
        (insert x)))

(defun list2list(v-l)
  (setq o-l (list))
  (setq len (/ (length v-l) 2))
  (dotimes (index len)
    (progn
      (setq i (- len index 1) )
      (push (list (nth (* i 2) v-l) (nth (+ (* i 2) 1) v-l)) o-l)
      ))
  o-l)

(defun input-entry ()
  (interactive)
  (setq cli-input-list (cddr (cli-readin)))
  (message "submit command to redis...")
  (newline)
  ;; (setq value-list (list '("title" "go to statement")
                         ;; '("link" "http://goo.gl")
                         ;; '("votes" "528")
                         ;; ))
  ;; (draw-rect 40 8 "article:92617" "hash" value-list)
  ;; (draw-string "abcde")
  (setq op  (nth 0 cli-input-list))
  (setq op (format "%s" op))
  (if (not (member op '("get" "lrange" "smembers" "hgetall" "zrange")))
      (error (format "command %s not support" op)))
  (setq key (nth 1 cli-input-list))
  (setq key (format "%s" key))
  (setq ktype (eredis-type key))
  (setq single-ktypes '("string" "list" "set"))
  (setq kv-ktypes '("hash" "zset"))

  (if (member op '("zrange" "lrange"))
      (progn 
        (setq start (nth 2 cli-input-list))
        (setq end (nth 3 cli-input-list))
        )
    )

  (setq only-value nil)
  (if (member ktype single-ktypes)
      (setq only-value t))
  (if (string-equal op "zrange")
      (setq value-list (eredis-command-returning op key start end "withscores"))
    (if (string-equal op "lrange")
        (setq value-list (eredis-command-returning op key start end))
        (setq value-list (eredis-command-returning op key));; get smembers hgetall
      )
    )
  (if (string-equal op "get")
      (setq value-list (list value-list))
    )

  (if (not only-value)
      (setq value-list (list2list value-list))
      )
  (draw-rect 40 8 key ktype value-list only-value)
  (newline)
  (newline)
  (draw-string "redis-cli>")
  )


(defun redis-init()
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eredis-hai "127.0.0.1" 6379)
    (draw-string "redis-cli>")
    (setq buffer-read-only nil)
    ))
(setq redis-buffer-name "*redis-cli*")

(defun redis_cli()
  "Start redis cli"
  (interactive)
  (switch-to-buffer redis-buffer-name)
  (redis-cli-mode)
  (redis-init))



;; (make-comint-in-buffer "redis-cli" nil "/usr/local/bin/redis-cli")
;; pcomplete-here
