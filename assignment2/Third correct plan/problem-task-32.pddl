(define (problem waiting-32) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
    a - waiter
    p1 - plate
    c1 - customer
    s0 - state
    b - broom
    bp1 - brokenPlate
    bp2 - brokenPlate
    sf - spilledFood
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
        (At a BUFF s0);POINT 1
        (At p1 BUFF s0) ;POINT 3
        (At b UB s0) ;POINT 4
        (At bp1 MF s0) ;POINT 5
        (At bp2 MB s0) ;POINT 5
        (At sf UF s0) ;POINT 6
        ;(not(HasFood p s0))
        (At c1 LB s0);POINT 2
        ;not(Served c s0)
        

    )
    
    (:goal (and 
        (Served c1 s0)
        (not(At bp1 MF s0))
        (not(At bp2 MB s0))
        (not(At sf UF s0))
        (At a BUFF s0)
    ))
)
