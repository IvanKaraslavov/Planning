(define (domain bartending)
    (:requirements :adl )
    
    (:types
        bartender glass customer - objects
        location
    )
    
    (:constants 
        Agent - bartender
        BAR - location
    )
    
    (:predicates
        (Adjacent ?x - location ?y - location)
        (At ?x - objects ?y - location)
        (ContainsBeer ?x - glass)
        (Served ?x - customer)
        (EmptyHand ?x - bartender)
        (Holding ?x - bartender ?y - glass)
    )
    
    (:action PickUp
        :parameters (?g - glass ?l - location)
        :precondition (and (At Agent ?l) (At ?g ?l) (EmptyHand Agent) (not (ContainsBeer ?g)))
        :effect (and (not (EmptyHand Agent)) (Holding Agent ?g))
    )
    
    (:action HandOver
        :parameters (?g - glass ?c - customer ?l - location)
        :precondition (and (At Agent ?l) (At ?c ?l) (Holding Agent ?g) (ContainsBeer ?g) (not (Served ?c)))
        :effect (and (EmptyHand Agent) (not (Holding Agent ?g)) (Served ?c))
    )
    
    (:action Pour
        :parameters (?g - glass)
        :precondition (and (At Agent BAR) (Holding Agent ?g) (not (ContainsBeer ?g)))
        :effect (ContainsBeer ?g)
    )
    
    (:action Move
        :parameters (?from - location ?to - location)
        :precondition (and (At Agent ?from) (not (= ?from ?to)) (Adjacent ?from ?to))
        :effect (and (not (At Agent ?from)) (At Agent ?to))
    )
)