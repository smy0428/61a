(define-macro (switch expr cases)
    (let ((val (eval expr)))
        (cons 'cond (map (lambda (case)
                                 (cons (eq? val (car case))(cdr case))
                          )
                          cases
                    )
        )
    )
)

(define (flatmap f x)
  (begin
        (f (car x))
        (flatmap f (cdr x))
  )
)


(define (expand lst)
  (flatmap eval lst)
)

(define (interpret instr dist)
  (flatmap instr dist)
)

(define (apply-many n f x)
  (if (zero? n)
      x
      (apply-many (- n 1) f (f x))))

(define (dragon n d)
  (interpret (apply-many n expand '(f x)) d))
