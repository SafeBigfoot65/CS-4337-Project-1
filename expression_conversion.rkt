#lang racket

; THIS IS FOR MY USE ONLY: I JUST WANT TO BE ABLE TO EASILY COPY THE FUNCTION CALL(S) IN THE TERMINAL WITHOUT HAVING TO WRITE IT MANUALLY OVER AND OVER AGAIN!!!!
; Test case: (infix_to_prefix_conversion "5 * ($1 + $2) + 9")



; Tokenizes the string so that whenever I reverse the string, it will keep certain characters in place ($n)
(provide tokenize)
(define (tokenize str)
  (regexp-match* #px"\\$\\d+|\\d+|[+*()-]|\\S" str))


; Precedence of operators
(define (precedence op)
  (cond [(equal? op "+") 1]
        [(equal? op "-") 1]
        [(equal? op "*") 2]
        [(equal? op "/") 2]
        [else 0]))
 
  
; convert reversed infix to postfix
(define (conversion_loop current_lst stack output)
  (cond
    [(null? current_lst) (append (reverse stack) output)]
    [else
     (let* ([token (car current_lst)]
            [remaining (cdr current_lst)]
            )
       (cond
         [(regexp-match #px"^\\$?\\d+$" token)
          (conversion_loop remaining stack (cons token output))]

         [(equal? token ")")
          (conversion_loop remaining (cons token stack) output)]

         [(equal? token "(")
          (let loop ([stk stack] [out output])
            (cond
              [(null? stk) (display "Invalid Expression")]
              [(equal? (car stk) ")") (conversion_loop remaining (cdr stk) out)]
              [else (loop (cdr stk) (cons (car stk) out))]
              )
            )
          ]

         [else 
          (let loop ([stk stack] [out output])
            (if (and (not (null? stk))
                     (> (precedence (car stk)) (precedence token))
                     )
                (loop (cdr stk) (cons (car stk) out))
                (conversion_loop remaining (cons token stk) out))
            )
          ]
         )
       )
     ]
    )
  )


; Source file to be used in "main_file.rkt"
(provide infix_to_prefix_conversion)

; Convert string from infix to prefix (reverse the tokens first)
(define (infix_to_prefix_conversion str)
  (let* ([tokens (tokenize str)]
         [prefix (string-join (conversion_loop (reverse tokens) '() '()) " ")])
    prefix))
  

; THIS IS FOR MY USE ONLY: I JUST WANT TO BE ABLE TO EASILY COPY THE FUNCTION CALL(S) IN THE TERMINAL WITHOUT HAVING TO WRITE IT MANUALLY OVER AND OVER AGAIN!!!!
; Test case: (infix_to_prefix_conversion "5 * ($1 + $2) + 9")