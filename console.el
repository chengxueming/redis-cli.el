(defvar *cli-input* ""
  "global var record cli input execute and clear after entry return")

(defun cli-readin ()
  "Read a sentence.  Return it as a list of words."
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

(defun input-entry ()
  (interactive)
  (setq cli-input-list (cddr (cli-readin)))
  (message "submit command to redis...")
  (newline)
  (setq value-list (list '("title" "go to statement")
                         '("link" "http://goo.gl")
                         '("votes" "528")
                         ))
  (draw-rect 40 8 "article:92617" "hash" value-list)
  (draw-string "abcde")
  (newline)
  (draw-string "redis-cli>")
  )


(defun redis-init()
  (let ((inhibit-read-only t))
    (erase-buffer)
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
