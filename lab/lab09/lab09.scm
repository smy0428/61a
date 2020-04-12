;; Scheme ;;

(define (over-or-under x y)
  (cond
  ((> x y) -1)
  ((= x y) 0)
  ((> x y) 1))
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0

(define (filter-lst f lst)
  (cond
  ((null? lst) nil)
  ((f (car lst)) (cons (car lst) (filter-lst f (cdr lst))))
  (else (filter-lst f (cdr lst))))
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)

(define (make-adder num)
  (lambda (x) (+ x num))

)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13

;; Extra questions

(define lst
  (cons (cons 1 nil) (cons 2 (cons (cons 3 (cons 4 nil)) (cons 5 nil))))
)

(define (composed f g)
  (lambda (x) (f (g x)))
)

(define (remove item lst)
  (cond
  ((null? lst) nil)
  ((= (car lst) item) (remove item (cdr lst)))
  (else (cons (car lst) (remove item (cdr lst)))))
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

(define (no-repeats s)
  (if (null? s) nil

  (cons (car s) (no-repeats (filter (lambda (x) (not (= x (car s)))) (cdr s)))))
)

(define (substitute s old new)
  (cond
  ((null? s) ())
  ((not (pair? s)) (if (eq? s old) new s))
  ((pair? s)
    (cons (substitute (car s) old new) (substitute (cdr s) old new)))


  )
)


(define (sub-all s olds news)
  (if (null? olds) s
  (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))
  )
)
