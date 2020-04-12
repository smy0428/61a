(define (partial-sums stream)
        (define  (helper num stream_1)
                 (if (null? stream_1)
                 nil
                 (cons-stream (+ num (car stream_1)) (helper (+ (car stream_1) num) (cdr-stream stream_1)))))
        (helper 0 stream)
)
