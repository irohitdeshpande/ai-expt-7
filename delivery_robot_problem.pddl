;; Problem file for the Delivery Robot domain
(define (problem delivery-problem-1)
  (:domain delivery-robot)
  
  (:objects
    robot1 - robot
    package1 package2 package3 - package
    office1 office2 office3 lab kitchen - location
  )
  
  (:init
    ;; Robot initial location
    (at robot1 office1)
    
    ;; Package initial locations
    (at package1 office2)
    (at package2 lab)
    (at package3 office1)
    
    ;; Package destinations
    (destination package1 kitchen)
    (destination package2 office3)
    (destination package3 lab)
    
    ;; Building layout - connections between locations
    (connected office1 office2)
    (connected office2 office1)
    (connected office2 office3)
    (connected office3 office2)
    (connected office3 lab)
    (connected lab office3)
    (connected lab kitchen)
    (connected kitchen lab)
    (connected kitchen office1)
    (connected office1 kitchen)
  )
  
  (:goal
    (and
      (delivered package1)
      (delivered package2)
      (delivered package3)
    )
  )
)