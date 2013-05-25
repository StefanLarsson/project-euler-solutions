#lang racket
;  The naive solution

; First we define whether to include a number in the sum
(define (accepted n)
  (or (= 0 (remainder n 3)) (= 0 (remainder n 5))))

(define (naivesum n)
  (if (= 0 n) 0
      (+ (naivesum (- n 1)) (if (accepted n) n 0))))

(define naivesolution (naivesum 999))

; This solution has the problem that the recursion is not tail recursion
(define (sum2 acc m n)
  (if (= m n) acc
      (sum2 (+ acc (if (accepted m) m 0)) (+ 1 m) n)))

(define bettersolution (sum2 0 1 1000))
; It is of course also possible to find a closed expression for this..


; There is actually already a gcd function
(define (greatest-common-divisor m n)
  (if (= 0 (remainder m n)) n
      (greatest-common-divisor n (remainder m n))))
 

; This should create a list of all numbers from m upto n
; that are divisible by either a or b
(define (divisibleby m n a b)
  (if (> m n) '()
      (if (or (= 0 (remainder m a)) (= 0 (remainder m b))) (cons m (divisibleby (+ 1 m) n a b))
          (divisibleby (+ 1 m) n a b))))




