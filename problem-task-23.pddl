(define (problem bar-23) 
    (:domain bartending)
    (:objects 
       G1 - glass
       G2 - glass
       C1 - customer
       C2 - customer
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
    (At Agent MF)
    (EmptyHand Agent)
    (At G1 MB)
    (At G2 LB)
    (At C1 UB)
    (At C2 LF)
    )
    
    (:goal (and 
    (Served C1)
    (Served C2)
    (At Agent BAR)
    ))
)