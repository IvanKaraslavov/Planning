(define (domain bartending)
    (:requirements :adl )
    
    (:types
        bartender glass customer broom - objects
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
        (HoldingGlass ?x - bartender ?y - glass)
        (HoldingBroom ?x - bartender ?y - broom)
        (BrokenGlassOnTheFloor ?x - location)
    )
    
    (:action PickUpGlass
        :parameters (?g - glass ?l - location)
        :precondition (and (At Agent ?l) (At ?g ?l) (EmptyHand Agent) (not (ContainsBeer ?g)))
        :effect (and (not (EmptyHand Agent)) (HoldingGlass Agent ?g))
    )
    
    (:action PickUpBroom
        :parameters (?b - broom ?l - location)
        :precondition (and (At Agent ?l) (At ?b ?l) (EmptyHand Agent))
        :effect (and (not (EmptyHand Agent)) (HoldingBroom Agent ?b))
    )
    
    (:action HandOver
        :parameters (?g - glass ?c - customer ?l - location)
        :precondition (and (At Agent ?l) (At ?c ?l) (HoldingGlass Agent ?g) (ContainsBeer ?g) (not (Served ?c)))
        :effect (and (EmptyHand Agent) (not (HoldingGlass Agent ?g)) (Served ?c))
    )
    
    (:action Pour
        :parameters (?g - glass)
        :precondition (and (At Agent BAR) (HoldingGlass Agent ?g) (not (ContainsBeer ?g)))
        :effect (ContainsBeer ?g)
    )
    
    (:action SweepUp
        :parameters (?b - broom ?at - location ?clean - location)
        :precondition (and (At Agent ?at) (not (= ?at ?clean)) (Adjacent ?at ?clean)
        (HoldingBroom Agent b) (BrokenGlassOnTheFloor ?clean))
        :effect (and (not (BrokenGlassOnTheFloor ?clean)))
    )
    
    (:action PutDownGlass
        :parameters (?g - glass ?l - location)
        :precondition (and (At Agent ?l) (HoldingGlass Agent ?g) (not (EmptyHand Agent)))
        :effect (and (EmptyHand Agent) (not (HoldingGlass Agent ?g)) (At ?g ?l))
    )
    
    (:action PutDownBroom
        :parameters (?b - broom ?l - location)
        :precondition (and (At Agent ?l) (HoldingBroom Agent ?b) (not (EmptyHand Agent)))
        :effect (and (EmptyHand Agent) (not (HoldingBroom Agent ?b)) (At ?b ?l))
    )
    
    (:action Move
        :parameters (?from - location ?to - location)
        :precondition (and (At Agent ?from) (not (= ?from ?to)) (Adjacent ?from ?to)
        (not (BrokenGlassOnTheFloor ?to)))
        :effect (and (not (At Agent ?from)) (At Agent ?to))
    )
)