
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (lambda (str) (string-append str suffix)) xs))

(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (let ([pos (remainder n (length xs))])
              (cond [(= pos 0) (car xs)]
                    [#t (car (list-tail xs pos))]))]))

(define (stream-for-n-steps s n)
  (if (= n 0)
      null
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))

(define funny-number-stream
  (letrec ([f (lambda (x) (cons (if (= (remainder x 5) 0) (- x) x) (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))

(define dan-then-dog
  (letrec ([f (lambda (bo) (if bo (cons "dan.jpg" (lambda () (f #f))) (cons "dog.jpg" (lambda () (f #t)))))])
    (lambda () (f #t))))

(define (stream-add-zero s)
  (letrec ([f (lambda (x) (cons (cons 0 (car (s))) (lambda () (f (stream-add-zero (cdr (s)))))))])
    (lambda () (f 1))))

(define (cycle-lists xs ys)
  (letrec ([f (lambda (num) (cons (cons (list-nth-mod xs num) (list-nth-mod ys num)) (lambda () (f (+ num 1)))))])
    (lambda () (f 0))))

(define (vector-assoc v vec)
  (letrec ([f (lambda (n)
                (cond [(= n (vector-length vec)) #f]
                      [(not (pair? (vector-ref vec n))) (f (+ n 1))]
                      [#t (let ([elm (vector-ref vec n)])
                            (if (equal? (car elm) v) elm (f (+ n 1))))]))])
    (f 0)))

(define (cached-assoc xs n)
  (let* ([cache-vector (make-vector n)]
         [cache-counter 0]
         [inc-counter (lambda (c) (remainder (+ c 1) n))]
         [add-to-cache-and-return (lambda (v)
                                    (let ([assoc-result (assoc v xs)])
                                      (if assoc-result
                                          (begin (vector-set! cache-vector cache-counter assoc-result)
                                                 (set! cache-counter (inc-counter cache-counter))
                                                 assoc-result)
                                          #f)))])
    (lambda (v)
      (let ([cache-result (vector-assoc v cache-vector)])
        (if cache-result
            cache-result
            (add-to-cache-and-return v))))))

(define-syntax while-less
  (syntax-rules (while-less do)
    [(while-less e1 do e2)
     (let ([evaluated-e1 e1])
       (letrec ([loop (lambda (it)
                        (if (< it evaluated-e1)
                            (loop e2)
                            #t))])
         (loop e2)))]))