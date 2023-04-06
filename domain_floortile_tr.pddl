(define (domain floortile)
    (:requirements :typing)
    (:types
        agent tile color - object
    )

    (:predicates
        (robotat ?r - agent ?x - tile)
        (up ?x - tile ?y - tile)
        (down ?x - tile ?y - tile)
        (right ?x - tile ?y - tile)
        (left ?x - tile ?y - tile)
        (clear ?x - tile)
        (painted ?x - tile ?c - color)
        (robothas ?r - agent ?c - color)
        (availablecolor ?c - color)
        (freecolor ?r - agent))

    (:action changecolor
      :parameters (?r - agent ?c - color ?c2 - color)
      :precondition (and (robothas ?r ?c) (availablecolor ?c2))
      :effect (and (not (robothas ?r ?c)) (robothas ?r ?c2))
      :duration (= ?duration 5)
    )

    (:action paintup
      :parameters (?r - agent ?y - tile ?x - tile ?c - color)
      :precondition (and (robothas ?r ?c) (robotat ?r ?x) (up ?y ?x) (clear ?y))
      :effect (and (not (clear ?y)) (painted ?y ?c))
      :duration (= ?duration 2)
    )

    (:action paintdown
      :parameters (?r - agent ?y - tile ?x - tile ?c - color)
      :precondition (and (robothas ?r ?c) (robotat ?r ?x) (down ?y ?x) (clear ?y))
      :effect (and (not (clear ?y)) (painted ?y ?c))
      :duration (= ?duration 2)
    )

    (:action moveup
      :parameters (?r - agent ?x - tile ?y - tile)
      :precondition (and (robotat ?r ?x) (up ?y ?x) (clear ?y))
      :effect (and (robotat ?r ?y) (not (robotat ?r ?x)) (clear ?x) (not (clear ?y)))
      :duration (= ?duration 3)
    )

    (:action movedown
      :parameters (?r - agent ?x - tile ?y - tile)
      :precondition (and (robotat ?r ?x) (down ?y ?x) (clear ?y))
      :effect (and (robotat ?r ?y) (not (robotat ?r ?x)) (clear ?x) (not (clear ?y)))
      :duration (= ?duration 1)
    )

    (:action moveright
      :parameters (?r - agent ?x - tile ?y - tile)
      :precondition (and (robotat ?r ?x) (right ?y ?x) (clear ?y))
      :effect (and (robotat ?r ?y) (not (robotat ?r ?x)) (clear ?x) (not (clear ?y)))
      :duration (= ?duration 1)
    )

    (:action moveleft
      :parameters (?r - agent ?x - tile ?y - tile)
      :precondition (and (robotat ?r ?x) (left ?y ?x) (clear ?y))
      :effect (and (robotat ?r ?y) (not (robotat ?r ?x)) (clear ?x) (not (clear ?y)))
      :duration (= ?duration 1)
    )
)
