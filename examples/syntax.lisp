(global a 2) ;; globals are global lua variables

(def sum ;; def tranpiles to local
    (fn [a b]
        ;; this is a comment
        (comment this is a comment)
        (+ 1 2) ;; function calls and operations

        ;;functional style
        (reduce [1 2 3 4] +)
        (filter [1 2 3 4] (fn [a] (< a 4)))
        (map [1 2 3 4] (fn [a] (hex a)))

        ;; only data structure
        { :a 1 :b 2 } ;; tables as associative arrays
        ( :a 1 :b 2 ) ;; tables as associative arrays
        [ :a 1 :b 2 ] ;; tables as associative arrays
        { 1 2 3 4 } ;; tables as arrays
        ( 1 2 3 4 ) ;; tables as arrays
        [ 1 2 3 4 ] ;; tables as arrays

        ;; require lua libraries
        (def lpeg (require 'lpeg'))
        ;; call methods as well
        (obj:name arg1 arg2)
    )
)


(export [
    sum = sum
])
