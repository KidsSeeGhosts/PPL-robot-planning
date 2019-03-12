(define (problem waiting-22) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
    a - waiter
    p - plate
    c - customer
    s0 - state
    BUFF - Location
    UF - Location
    UB - Location
    MF - Location
    MB - Location
    LF - Location
    LB - Location
    
    
    )
    
    (:init
        (Adjacent BUFF UF)
        (Adjacent UF BUFF)
        (Adjacent UF UB)
        (Adjacent UF MF)
        (Adjacent UB UF)
        (Adjacent UB MB)
        (Adjacent MF UF)
        (Adjacent MF LF)
        (Adjacent MB UB)
        (Adjacent MB LB)
        (Adjacent LF MF)
        (Adjacent LF LB)
        (Adjacent LB MB)
        (Adjacent LB LF)
        (At a BUFF s0)
        (At p BUFF s0)
        ;(not(HasFood p s0))
        (At c LB s0)
        ;not(Served c s0)
        

    )
    
    (:goal (and 
        (Served c s0)
    ))
)
