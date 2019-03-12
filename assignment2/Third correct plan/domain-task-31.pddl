(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        ;; Fill in additional types here
        state
        plate
        customer
        brokenPlate
        broom
        spilledFood
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        ;; Example:
        ;; (Contains ?x - object ?c - container)
        (Adjacent ?x - location ?y - location)
        (Location ?x - location)
        (At ?x - object ?y - location ?s - state)
        (Plate ?x - plate)
        (HasFood ?x - plate ?s - state)
        (Customer ?x - customer)
        (Served ?x - customer ?s - state)
        (Holding ?x - waiter ?p - object ?s - state)
        (Broken ?x - brokenPlate)
        (Broom ?x - broom)
        
    )
    
    ;;;; Action Template - Delete and fill in own actions ;;;;
    
    ;(:action dummy-action
    ;    :parameters (?obj - object)
    ;    :precondition (and
    ;        (dummy-pred-1 ?obj)
    ;        (dummy-pred-2 ?obj)
    ;    )
    ;    :effect (and
    ;        (not (dummy-pred-1 ?obj))
    ;        (dummy-pred-3 ?obj)
    ;    )
    ;)
    
    (:action PickUpPlate
        :parameters (?a - waiter ?p - plate ?x - location ?s - state)
        :precondition (and
            (At ?a ?x ?s)
            (At ?p ?x ?s)
            (not (Holding ?a ?p ?s)) ;should waiter not be able to pick up a plate with food on it to avoid stealing customer food?
            (not (exists (?b - broom) (Holding ?a ?b ?s)))
        )
        :effect (and
            (Holding ?a ?p ?s)
            (not (At ?p ?x ?s))
        )
    )
    
    (:action HandOver
        :parameters (?a - waiter ?p - plate ?c - customer ?x - location ?s - state)
        :precondition (and
            (Holding ?a ?p ?s)
            (HasFood ?p ?s)
            (At ?a ?x ?s)
            (At ?c ?x ?s)
            (not (Served ?c ?s))
        )
        :effect (and
            (Served ?c ?s) 
            (not (Holding ?a ?p ?s))
            ;(At ?p ?x ?s) ;had to remove this line or else robot would steal a customers plate
        )
    )
    
    (:action Fill
        :parameters (?a - waiter ?p - plate ?s - state)
        :precondition (and
            (Holding ?a ?p ?s)
            (not(HasFood ?p ?s))
            (At ?a BUFF ?s)
        )
        :effect (HasFood ?p ?s)
    )
    
    (:action Move
        :parameters (?a - waiter ?x - location ?y - location ?s - state)
        :precondition (and
            (At ?a ?x ?s)
            (Adjacent ?x ?y)
            (Adjacent ?y ?x)
            (not (exists (?bp - brokenPlate) (At ?bp ?y ?s))) ;there can not be a broken plate at the position the waiter wants to go
        )
        :effect (and
            (At ?a ?y ?s)
            (not(At ?a ?x ?s))
        )
    )

    (:action SweepItUpFood
        :parameters (?a - waiter ?x - location ?y - location ?b - broom ?sf - spilledFood ?s - state)
        :precondition (and
            (Holding ?a ?b ?s)
            (At ?a ?y ?s)
            (Adjacent ?y ?x)
            (Adjacent ?x ?y)
            (At ?sf ?x ?s)
        )
        :effect (and
            (not(At ?sf ?x ?s))
        )
    )  

    (:action SweepItUpBrokenPlate
        :parameters (?a - waiter ?x - location ?y - location ?b - broom ?bp - brokenPlate ?s - state)
        :precondition (and
            (Holding ?a ?b ?s)
            (At ?a ?y ?s)
            (Adjacent ?y ?x)
            (Adjacent ?x ?y)
            (At ?bp ?x ?s)
        )
        :effect (and
            (not(At ?bp ?x ?s))
        )
    )    
    
    (:action PutItDownBroom
        :parameters (?a - waiter ?x - location ?b - broom ?s - state)
        :precondition (and
            (At ?a ?x ?s)
            (Holding ?a ?b ?s)
        )
        :effect (and
            (not(Holding ?a ?b ?s))
            (At ?b ?x ?s)
        )
    )
    
    (:action PutItDownPlate
        :parameters (?a - waiter ?x - location ?p - plate ?s - state)
        :precondition (and
            (At ?a ?x ?s)
            (Holding ?a ?p ?s)
        )
        :effect (and
            (not(Holding ?a ?p ?s))
            (At ?p ?x ?s)
        )
    )
    
    
    
    (:action PickUpBroom
        :parameters (?a - waiter ?x - location ?b - broom ?s - state)
        :precondition (and
            (At ?a ?x ?s)
            (At ?b ?x ?s)
            (not (exists (?p - plate) (Holding ?a ?p ?s)))
            (not (Holding ?a ?b ?s))
        )
        :effect (and
            (Holding ?a ?b ?s)
            (not(At ?b ?x ?s))
        )
    )
    
)
