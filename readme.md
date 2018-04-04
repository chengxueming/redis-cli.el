# Instructions
* open [justinhj/eredis](https://github.com/justinhj/eredis/blob/master/eredis.el) and M-x eval-buffer
* open redis.el and M-x eval-buffer
* open console.el and M-x eval-buffer
* use a window and M-x redis_cli
```lisp
  (if (not (member op '("get" "lrange" "smembers" "hgetall" "zrange")))
      (error (format "command %s not support" op)))
```
```
redis-cli>hgetall article:92617
 --article:92617-----------------hash-- 
|         |                            |
|  title  |  go to statement           |
|  link   |  http://goo.gl             |
|  votes  |  528                       |
 --------------------------------------

redis-cli>
```
# 
