#lang racket


; THIS IS FOR MY USE ONLY: I JUST WANT TO BE ABLE TO EASILY COPY THE FUNCTION CALL(S) IN THE TERMINAL WITHOUT HAVING TO WRITE IT MANUALLY OVER AND OVER AGAIN!!!!
; Test case: (infix_to_prefix_conversion "5 * ($1 + $2) + 9")
; Test case (if history exists): (evaluate (infix_to_prefix_conversion "5 * ($1 + $2) + 9"))

; Test case (Invalid operator): (evaluate-prefix (tokenize (infix_to_prefix_conversion "5 * ($1 ^ $2) + 9")))
;Test case: (evaluate-prefix (tokenize (infix_to_prefix_conversion "+ 3")))

; Test case: (evaluate)

; Test case (Interactive mode): 5 * (1 + 2) + 9
; Test case (Interactive mode): 5 * ($1 + 2) + 9


; File where the conversion from infix to prefix is formulated
(require "expression_conversion.rkt")

; File where the prefix is evaluated and the result is stored in the history
(require "evaluating_prefix.rkt")

; File that contains the interactive and batch mode
(require "mode.rkt")



; Initially empty history
(define history '())

; Evaluate an expression string and update history
(define (process-expression expr hist)
  (let ([tokens (tokenize (infix_to_prefix_conversion expr))])
    (let-values ([(result new-history) (evaluate-prefix tokens hist)])
      (cond
        [(eq? result #f)
         (displayln "Error: Invalid Expression")
         hist
         ]
        [else
         
         (let ([id (+ 1 (length hist))])
           (display (string-append (number->string id) ": "))
           (displayln (real->double-flonum result))
           )
         (cons result hist)])
         )
         )
         )


(define (interactive-loop hist)
  (display "> ")
  (flush-output)
  (let ([input (string-trim (read-line))])
    (let ([input-lc (string-downcase input)])
      (cond
        [(string=? input-lc "quit")
         (displayln "Exiting Program!")
         (void)]
        [(regexp-match? #px"^\\s*$" input) (interactive-loop hist)]
        [else
         (interactive-loop (process-expression input hist))
         ]
         )
         )
         )
         )


(define (batch-loop hist)
  (let loop ([lines (port->lines (current-input-port))] [hist hist])
    (cond
      [(null? lines) hist]
      [else
       (define line (car lines))
       (define new-hist (process-expression line hist))
       (loop (cdr lines) new-hist)]
       )
       )
       )


(if interactive?
    (interactive-loop history)
    (begin
      (batch-loop history)
      (void))
      )
