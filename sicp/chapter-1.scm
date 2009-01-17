;; -*- outline-regexp: ";; *\\*" -*-
;; (outline-minor-mode 1)

;;* Chapter 1
;; * _ Section 1.1.6
;;  * _ Exercise 1.1
;;  * _ Exercise 1.2
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))
;;  * _ Exercise 1.3 - first try
(define (square x) (* x x))

(define (square-of-two-largest a b c)
  (square (if (> a b)
              (if (> b c)
                  (+ a b)
                  (+ a c))
              (if (> a c)
                  (+ a b)
                  (+ b c)))))
;;  * _ Exercise 1.3 - second try
(define (square-of-two-largest a b c)
  (square (cond ((and (> a c) (> b c)) (+ a b))
                ((> a c)               (+ a c))
                (else                  (+ b c)))))
;;  * _ Exercise 1.4
;; If b is greater than 0: (+ a b)
;; else:                   (- a b)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;;  * _ Exercise 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Applicative-order
; it will try to evaluate (p), but it will always return (p)

(test 0 (p))
(test 0 (p))
(test 0 (p))
(test 0 (p))

;; Normal-order
; (p) never needs to be evaluated
(test 0 (p))
; transforms to:
(if (= 0 0)
    0
    (p))
; which transforms to:
0
;; * _ Section 1.1.7
;;  * _ Exercise 1.6
;; Since Scheme uses applicative evaluation order, the else-clause is
;; always being evaluated, which causes an endless recursion.
;;  * _ Exercise 1.7
(define (our-sqrt x)
  (sqrt-iter 1.0 0.0 x))

(define (sqrt-iter guess prev-guess x)
  (if (close-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))
;;  * _ Exercise 1.8
(define cube-root our-sqrt)

(define (improve guess x)
  (/ (+ (/ x (expt guess 2)) (* 2 guess))
     3))
;; * _ Section 1.2.1
;;  * _ Exercise 1.9 (recursive)
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(+ 3 3)
(inc (+ 2 3))
(inc (inc (+ 1 3)))
(inc (inc (inc (+ 0 3))))
(inc (inc (inc 3)))
(inc (inc 4))
(inc 5)
6
;;  * _ Exercise 1.9 (iterative)
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 3 3)
(+ 2 4)
(+ 1 5)
(+ 0 6)
6
;;  * _ Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

(define (f n) (A 0 n))
; f(n) = 2n

(define (g n) (A 1 n))
; g(0) = 0
; g(n) = 2^n

(define (h n) (A 2 n))
; h(0) = 0
; h(n) = 2^g(n-1)
;; * _ Section 1.2.2
;;  * _ Exercise 1.11 (recursive)
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))
;;  * _ Exercise 1.11 (iterative)
(define (f n)
  (define (sum a b c)
    (+ a
       (* 2 b)
       (* 3 c)))

  (define (iter a b c count)
    (if (= count 0)
	c
	(iter (sum a b c)
	      a
	      b
	      (- count 1))))
  (iter 2 1 0 n))
;;  * _ Exercise 1.12
(define (pascal row col)
  (cond ((eq? col 0) 1)
	((eq? col row) 1)
	(else (+ (pascal (- row 1) col)
		 (pascal (- row 1) (- col 1))))))
;;  * _ Exercise 1.13
(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

(define gold (/ (+ 1 (sqrt 5)) 2))
;; * _ Section 1.2.3
;;  * _ Exercise 1.14
;;  * _ Exercise 1.15
;; * _ Section 1.2.4
;;  * _ Exercise 1.16
(define (square x) (* x x))
(define (expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
	  ((even? n) (iter (square b) (/ n 2) a))
	  (else (iter b (- n 1) (* a b)))))

  (iter b n 1))
;;  * _ Exercise 1.17
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
  (cond ((= b 0) 0)
	((= b 1) a)
	((even? b) (* (double a) (halve b)))
	(else (+ a (* a (- b 1))))))
;;  * _ Exercise 1.18
(define (* a b)
  ; ab+c is the state which never changes
  (define (iter a b c)
    (cond ((= b 0) 0)
	  ((= b 1) (+ a c))
	  ((even? b) (iter (double a) (halve b) c))
	  (else (iter a (- b 1) (+ a c)))))
  (iter a b 0))
;;  * _ Exercise 1.19
;; * _ Section 1.2.5
;;  * _ Exercise 1.20
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Normal-order
(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(if (= (remainder 206 40) 0) ; +1
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder 40 (remainder 206 40))) ; +2
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))); +4
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
	 (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ; +7
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    123); no point of writing this since the if is true

(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; +4

; Total: (+ 1 2 4 7 4) = 18
    
; Applicative-order
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
; Total: 4
;; * _ Section 1.2.6
;;  * _ Exercise 1.21
;;  * _ Exercise 1.22
;;  * _ Exercise 1.23
;;  * _ Exercise 1.24
;;  * _ Exercise 1.25
;;  * _ Exercise 1.26
;;  * _ Exercise 1.27
;;  * _ Exercise 1.28
;;  * _ Exercise 1.29
;; * _ Section 1.3.1
;;  * _ Exercise 1.30
;;  * _ Exercise 1.31
;;  * _ Exercise 1.32
;;  * _ Exercise 1.33
;; * _ Section 1.3.2
;;  * _ Exercise 1.34
;; * _ Section 1.3.3
;;  * _ Exercise 1.35
;;  * _ Exercise 1.36
;;  * _ Exercise 1.37
;;  * _ Exercise 1.38
;;  * _ Exercise 1.39
;; * _ Section 1.3.5
;;  * _ Exercise 1.40
;;  * _ Exercise 1.41
;;  * _ Exercise 1.42
;;  * _ Exercise 1.43
;;  * _ Exercise 1.44
;;  * _ Exercise 1.45
;;  * _ Exercise 1.46
