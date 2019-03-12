(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        ;; Fill in additional types here
        state
        plate
        customer
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
        (At ?x - (plate or customer or waiter) ?y - location ?s - state)
        (Plate ?x - plate)
        (HasFood ?x - plate - ?s state)
        (Customer ?x - customer)
        (Served ?x - customer - ?s - state)
        (Holding ?x - waiter ?p - plater ?s - state)
        
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
    
    (:action PickUp
        :parameters (?a - waiter ?p - plate ?x - location - ?s state)
        :precondition (and
            (At ?a ?x ?s)
            (At ?p ?x ?s)
            (not (Holding ?a ?p ?s))
        )
        :effect (and
            (Holding ?a ?p ?s)
            (not (At ?p ?x ?s))
        )
    )
    
    (:action HandOver
        :parameters (?a - waiter ?p - plate ?c - customer ?x - location - ?s state)
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
            (At ?p ?x ?s)
        )
    )
    
    (:action Fill
        :parameters (?a - waiter ?p - plate ?x - BUFF - ?s state)
        :precondition (and
            (Holding ?a ?p ?s)
            (not(HasFood ?p ?s))
            (At ?a ?x ?s)
        )
        :effect (HasFood ?p ?s)
    )
    
    (:action Move
        :parameters (?a - waiter ?x - location ?y - location - ?s state)
        :precondition (and
            (At ?a ?x ?s)
            (Adjacent ?x ?y)
            (Adjacent ?y ?x)
        )
        :effect (and
            (At ?a ?y ?s)
        )
    )
    
)
