
(define-macro (switch expr cases)
    (if (eq? (eval expr) (car (car cases)))
    (eval (car (cdr (car cases))))
    (switch expr (cdr cases)))
)
