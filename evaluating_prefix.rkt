#lang racket

; Test Case: (evaluate-prefix "+ * 5 + $1 $2 9" '(3.2 4.5))



; Source file to be used in "main_file.rkt"
(provide evaluate-prefix)


; Evaluate the prefix
(define (evaluate-prefix prefix history)

  
  (define (evaluate-loop remaining stack hist)
    (cond
      
      [(null? remaining)
       (if (= (length stack) 1)
           (values (car stack) (append hist (list (car stack)))) 
           (values #f hist))
       ]                                     
      [else
       (let* ([token (car remaining)]
              [rest (cdr remaining)]
              )
         (cond
          
           [(regexp-match #px"^\\d+$" token)
            (evaluate-loop rest (cons (real->double-flonum (string->number token)) stack) hist)
            ]

           
           [(regexp-match #px"^\\$(\\d+)$" token)
            (define match (regexp-match #px"^\\$(\\d+)$" token))
            (define id (string->number (cadr match)))
            (if (> id (length hist))
                (values #f hist)  
                (evaluate-loop rest (cons (list-ref hist (- id 1)) stack) hist)
                )
            ]

           
           [else
            (if (< (length stack) 2)
                (values #f hist)
                (let* ([first (car stack)]
                  [second (cadr stack)]
                  [rest-stack (cddr stack)]
                  [result (case token
                            [("+") (+ first second)]
                            [("-") (- first second)]
                            [("*") (* first second)]
                            [("/") (/ first second)]
                            [else #f])])
                (evaluate-loop rest (cons result rest-stack) hist)
              )
            )
          ]
          )
        )
      ]
    )
   )

  
  (evaluate-loop (reverse prefix) '() history)
  )