# moonlisp
a lisp on luajit

# Usage
### moonlisp
```clojure
(def myfn 
  (fn (name)
    (print name)
))
```
### Generated Lua
```lua
local myfn = function(name)
  print(name)
end
```

### moonlisp
```clojure
(def mytable ())
(table.insert mytable 1)
```

### Generated lua
```lua
local mytable = {}
table.insert(mytable, 1)
```

