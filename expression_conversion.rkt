#lang racket

; Test case: (infix_to_prefix_conversion "2 * ($1 + $2) + 1")



; Tokenizes the string so that whenever I reverse the string, it will keep certain characters in place ($n)
(define (tokenize str)
  (regexp-match* #px"\\$\\d+|\\d+|[+*()-]|\\S" str))


; Precedence of operators
(define (precedence op)
  (cond [(equal? op "+") 1]
        [(equal? op "-") 1]
        [(equal? op "*") 2]
        [(equal? op "/") 2]
        [else 0]))

; Swap parentheses 
(define (reverse-tokens tokens)
  (map (lambda (tok)
         (cond [(equal? tok "(") ")"]
               [(equal? tok ")") "("]
               [else tok]))
       (reverse tokens)))  
  
  
; convert reversed infix to postfix
(define (conversion_loop current_lst stack expression)
  (cond
    [(null? current_lst) (append expression (reverse stack))]
    [else
     (let* ([token (car current_lst)]
            [remaining (cdr current_lst)])
       (cond
         [(regexp-match #px"^\\$?\\d+$" token) (conversion_loop remaining stack (append expression (list token)))]

         [(equal? token "(") (conversion_loop remaining (cons token stack) expression)]

         [(equal? token ")")
          (let loop ([stk stack] [exp expression])
            (cond
              [(null? stk) (display "Invalid Expression")]

              [(equal? (car stk) "(") (conversion_loop remaining (cdr stk) exp)]

              [else (loop (cdr stk) (append exp (list (car stk))))]
              )
            )
          ]

         [else
          (let loop ([stk stack] [exp expression])
            (if (and (not (null? stk))
                     (>= (precedence (car stk)) (precedence token)))
                (loop (cdr stk) (append exp (list (car stk))))
                (conversion_loop remaining (cons token stk) exp)))]
         )
       )
     ]
    )
              
         
         
    )


; Source file to be used in "main_file.rkt"
(provide infix_to_prefix_conversion)

; Convert string from infix to prefix (reverse first)
(define (infix_to_prefix_conversion str)
  (let* ([tokens (tokenize str)]
         [rev (reverse-tokens tokens)]
         [postfix (conversion_loop rev '() '())]
         [prefix (string-join (reverse postfix) " ")]
         )
         (display prefix)
    )
  )