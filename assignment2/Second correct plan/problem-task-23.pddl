(define (problem waiting-23) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
    a - waiter
    p1 - plate
    p2 - plate
    c1 - customer
    c2 - customer
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
        (At a MF s0)
        (At p1 MB s0)
        (At p2 LB s0)
        ;(not(HasFood p s0))
        (At c1 UB s0)
        (At c2 LF s0)
        ;not(Served c s0)
        

    )
    
    (:goal (and 
        (Served c1 s0)
        (Served c2 s0)
        (At a BUFF s0)
    ))
)
