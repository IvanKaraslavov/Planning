(define (problem bar-32) 
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
       B - broom
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
    (At B BAR)
    (BrokenGlassOnTheFloor MF)
    (BrokenGlassOnTheFloor MB)
    )
    
    (:goal (and 
    (forall (?c - customer) (Served ?c))
    (At Agent BAR)
    (forall (?l - location) (not (BrokenGlassOnTheFloor ?l)))
    ))
)