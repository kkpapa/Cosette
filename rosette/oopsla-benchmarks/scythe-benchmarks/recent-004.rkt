#lang rosette 
 
(require "../cosette.rkt" "../util.rkt" "../denotation.rkt" "../cosette.rkt" "../sql.rkt" "../evaluator.rkt" "../syntax.rkt" "../symmetry.rkt" "../test-util.rkt") 
  
(provide ros-instance)  

(current-bitwidth #f)

(define t0 (table-info "input" (list "id" "call_ref" "job_num")))
 
(define (q5 tables) 
(UNION-ALL (SELECT (VALS "t6.call_ref" "t6.job_num" )
 FROM (AS (JOIN (AS (SELECT (VALS "t3.job_num" (VAL-UNOP aggr-max (val-column-ref "t3.id")) )
 FROM (AS (SELECT (VALS "input.id" "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (TRUE) (BINOP "input.job_num" = 0.0))) ["t3" (list "id" "call_ref" "job_num")])
 WHERE (TRUE)
 GROUP-BY (list "t3.job_num" )
 HAVING (TRUE)) ["t4" (list "job_num" "max_id")]) (AS (SELECT (VALS "input.id" "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (TRUE) (BINOP "input.job_num" = 0.0))) ["t5" (list "id" "call_ref" "job_num")])) ["t6" (list "job_num" "max_id" "id" "call_ref" "job_num1")])
 WHERE (AND (BINOP "t6.max_id" > "t6.id") (TRUE))) (SELECT (VALS "t1.max_call_ref" "t1.job_num" )
 FROM (AS (SELECT (VALS "t2.job_num" (VAL-UNOP aggr-max (val-column-ref "t2.call_ref")) )
 FROM (AS (NAMED (list-ref tables 0)) ["t2" (list "id" "call_ref" "job_num")])
 WHERE (TRUE)
 GROUP-BY (list "t2.job_num" )
 HAVING (TRUE)) ["t1" (list "job_num" "max_call_ref")])
 WHERE (TRUE))))
 
(define (q4 tables) 
(UNION-ALL (SELECT (VALS "t1.call_ref1" "t1.job_num" )
 FROM (AS (JOIN (SELECT (VALS "input.id" "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (TRUE) (BINOP "input.job_num" = 0.0))) (AS (SELECT (VALS "input.id" "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (TRUE) (BINOP "input.job_num" = 0.0))) ["t4" (list "id" "call_ref" "job_num")])) ["t1" (list "id" "call_ref" "job_num" "id1" "call_ref1" "job_num1")])
 WHERE (AND (TRUE) (BINOP "t1.id" > "t1.id1"))) (SELECT (VALS "t2.max_call_ref" "t2.job_num" )
 FROM (AS (SELECT (VALS "t3.job_num" (VAL-UNOP aggr-max (val-column-ref "t3.call_ref")) )
 FROM (AS (NAMED (list-ref tables 0)) ["t3" (list "id" "call_ref" "job_num")])
 WHERE (TRUE)
 GROUP-BY (list "t3.job_num" )
 HAVING (TRUE)) ["t2" (list "job_num" "max_call_ref")])
 WHERE (TRUE))))
 
(define (q3 tables) 
(UNION-ALL (SELECT (VALS "t6.call_ref" "t6.job_num" )
 FROM (AS (JOIN (AS (SELECT (VALS (VAL-UNOP aggr-max (val-column-ref "t1.id")) )
 FROM (AS (NAMED (list-ref tables 0)) ["t1" (list "id" "call_ref" "job_num")])
 WHERE (TRUE)
 GROUP-BY (list )
 HAVING (TRUE)) ["t2" (list "max_id")]) (AS (SELECT (VALS "input.id" "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (TRUE) (BINOP "input.job_num" = 0.0))) ["t3" (list "id" "call_ref" "job_num")])) ["t6" (list "max_id" "id" "call_ref" "job_num")])
 WHERE (AND (BINOP "t6.max_id" > "t6.id") (TRUE))) (SELECT (VALS "t4.max_call_ref" "t4.job_num" )
 FROM (AS (SELECT (VALS "t5.job_num" (VAL-UNOP aggr-max (val-column-ref "t5.call_ref")) )
 FROM (AS (NAMED (list-ref tables 0)) ["t5" (list "id" "call_ref" "job_num")])
 WHERE (TRUE)
 GROUP-BY (list "t5.job_num" )
 HAVING (TRUE)) ["t4" (list "job_num" "max_call_ref")])
 WHERE (TRUE))))
 
(define (q2 tables) 
(UNION-ALL (SELECT (VALS "t1.max_call_ref" "t1.job_num" )
 FROM (AS (SELECT (VALS "t2.job_num" (VAL-UNOP aggr-max (val-column-ref "t2.call_ref")) )
 FROM (AS (SELECT (VALS "input.id" "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.job_num" > 0.0) (TRUE))) ["t2" (list "id" "call_ref" "job_num")])
 WHERE (TRUE)
 GROUP-BY (list "t2.job_num" )
 HAVING (TRUE)) ["t1" (list "job_num" "max_call_ref")])
 WHERE (TRUE)) (SELECT (VALS "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (TRUE) (BINOP "input.job_num" = 0.0)))))
 
(define (q1 tables) 
(UNION-ALL (SELECT (VALS "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (TRUE) (BINOP "input.job_num" = 0.0))) (SELECT (VALS "t2.max_call_ref" "t2.job_num" )
 FROM (AS (SELECT (VALS "t1.job_num" (VAL-UNOP aggr-max (val-column-ref "t1.call_ref")) )
 FROM (AS (SELECT (VALS "input.id" "input.call_ref" "input.job_num" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.job_num" > 0.0) (TRUE))) ["t1" (list "id" "call_ref" "job_num")])
 WHERE (TRUE)
 GROUP-BY (list "t1.job_num" )
 HAVING (TRUE)) ["t2" (list "job_num" "max_call_ref")])
 WHERE (TRUE))))

(define ros-instance (list q1 q3 (list t0)))
