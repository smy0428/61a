
; Tail recursion

(define (replicate x n)
        (define (helper y n)
                (if (= n 0)
                y
                (helper (cons x y) (- n 1))))
        (helper nil n)
  )

(define (accumulate combiner start n term)
        (if (= n 0)
        start
        (accumulate combiner (combiner start (term n)) (- n 1) term))
)

(define (accumulate-tail combiner start n term)
        (if (= n 0)
        start
        (accumulate-tail combiner (combiner start (term n)) (- n 1) term))
)

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  (cons-stream 3 (map-stream (lambda (x) (+ x 3)) multiples-of-three))
)


(define (nondecreastream s)
        (define (helper s_doing end s)
                (if (null? s)
                            (cons-stream s_doing nil)
                            (if (>= (car s) end)
                                (helper (append s_doing (list (car s))) (car s) (cdr-stream s))
                                (cons-stream s_doing (nondecreastream s)))
                )
        )
        (helper nil 0 s)
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))
