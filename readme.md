# Instructions
* open [justinhj/eredis](https://github.com/justinhj/eredis/blob/master/eredis.el) and M-x eval-buffer
* open redis.el and M-x eval-buffer
* open console.el and M-x eval-buffer
* use a window and M-x redis_cli

```lisp
  (if (not (member op '("get" "lrange" "smembers" "hgetall" "zrange")))
      (error (format "command %s not support" op)))
```

# Snapshot
```
redis-cli>lrange myl 0 5

 --myl---------------------------list-- 
|                                      |
|  ccc                                 |
|  bbb                                 |
|  aaa                                 |
 -------------------------------------- 

redis-cli>get abc

 --abc-------------------------string-- 
|                                      |
|  11111                               |
 -------------------------------------- 

redis-cli>hgetall article92617

 --article92617------------------hash-- 
|         |                            |
|  title  |  go to statement           |
|  link   |  http://goo.gl             |
|  votes  |  528                       |
|  author |  chengxueming              |
 -------------------------------------- 

redis-cli>zrange myzset 0 5

 --myzset------------------------zset-- 
|         |                            |
|  aab    |  0                         |
|  aac    |  0                         |
|  ab     |  0                         |
|  abc    |  0                         |
|  abd    |  0                         |
|  apple  |  12                        |
 -------------------------------------- 

redis-cli>smembers myset

 --myset--------------------------set-- 
|                                      |
|  a13                                 |
|  a12                                 |
|  a11                                 |
 -------------------------------------- 

redis-cli>
```

# TODO
- [ ] [bug!!]choose a suitable style for string/json set and list
- [ ] [bug!!]adjust the gap in data view, support multiline in text filed
- [ ] [bug!!!]find a way to support any command in redis-cli.el and init with host and port
- [ ] [feature]incr or hmset eg.. modify command, show the change info(recently add or value change) with color(green for add, blue for change, red for del) and simple view ( + 1, -> new value)
