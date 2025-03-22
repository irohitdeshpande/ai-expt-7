;; Domain file for the Delivery Robot problem
(define (domain delivery-robot)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    location - object
    package - object
    robot - object
  )
  
  (:predicates
    (at ?obj - object ?loc - location)    ; Object is at location
    (connected ?loc1 ?loc2 - location)    ; Locations are connected (can move between them)
    (carrying ?r - robot ?p - package)    ; Robot is carrying a package
    (destination ?p - package ?loc - location)  ; Package's destination is location
    (delivered ?p - package)              ; Package has been delivered
  )
  
  (:action move
    :parameters (?r - robot ?from ?to - location)
    :precondition (and 
                    (at ?r ?from)
                    (connected ?from ?to)
                  )
    :effect (and 
              (not (at ?r ?from))
              (at ?r ?to)
            )
  )
  
  (:action pick-up
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and 
                    (at ?r ?loc)
                    (at ?p ?loc)
                    (not (exists (?p2 - package) (carrying ?r ?p2)))
                  )
    :effect (and 
              (carrying ?r ?p)
              (not (at ?p ?loc))
            )
  )
  
  (:action drop
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and 
                    (at ?r ?loc)
                    (carrying ?r ?p)
                  )
    :effect (and 
              (not (carrying ?r ?p))
              (at ?p ?loc)
            )
  )
  
  (:action deliver
    :parameters (?r - robot ?p - package ?loc - location)
    :precondition (and 
                    (at ?r ?loc)
                    (carrying ?r ?p)
                    (destination ?p ?loc)
                  )
    :effect (and 
              (not (carrying ?r ?p))
              (delivered ?p)
            )
  )
)