#lang racket

; THIS IS FOR MY USE ONLY: I JUST WANT TO BE ABLE TO EASILY COPY THE FUNCTION CALL(S) IN THE TERMINAL WITHOUT HAVING TO WRITE IT MANUALLY OVER AND OVER AGAIN!!!!
; Test case: (infix_to_prefix_conversion "5 * ($1 + $2) + 9")
; Test case (if history exists): (evaluate (infix_to_prefix_conversion "5 * ($1 + $2) + 9"))

; Test case (Invalid operator): (evaluate-prefix (tokenize (infix_to_prefix_conversion "5 * ($1 ^ $2) + 9")))
;Test case: (evaluate-prefix (tokenize (infix_to_prefix_conversion "+ 3")))

; Test case: (evaluate)


; File where the conversion from infix to prefix is formulated
(require "expression_conversion.rkt")

; File where the prefix is evaluated and the result is stored in the history
(require "evaluating_prefix.rkt")



; Tokenizes the prefix once more, and then will evaluate it

(define (evaluate)
  (let-values ([(result new-history)
                (evaluate-prefix (tokenize (infix_to_prefix_conversion "5 * ($1 + $2) + 9")) '(3 4))])
    (cond
      [(not (eq? result #f))
       (displayln (string-append "Result: " (number->string result) ", ID: " (number->string (length new-history))))
       (displayln (string-append "New History: " (format "~a" new-history)))
       new-history]
      [else
       (displayln "Error: Invalid Expression.")
      ]
      )
    )
  )


