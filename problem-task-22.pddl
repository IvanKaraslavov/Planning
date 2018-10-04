(define (problem bar-22) 
    (:domain bartending)
    (:objects 
       G - glass
       C - customer
       UB - location
       UF - location
       MB - location
       MF - location
       LB - location
       LF - location
    )
    
    (:init
    (Adjacent UB UF)
    (Adjacent UB MB)
    (Adjacent UF UB)
    (Adjacent UF MF)
    (Adjacent MB UB)
    (Adjacent MB LB)
    (Adjacent MF UF)
    (Adjacent MF LF)
    (Adjacent LB MB)
    (Adjacent LB LF)
    (Adjacent LF MF)
    (Adjacent LF LB)
    (Adjacent BAR UF)
    (Adjacent UF BAR)
    (At Agent BAR)
    (EmptyHand Agent)
    (At G BAR)
    (At C LB)
    )
    
    (:goal (and 
    (Served C)
    ))
)