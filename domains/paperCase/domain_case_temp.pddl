(define (domain paperCase)
  (:requirements :typing :durative-actions)
  (:types
    location agent holder part cabinet - object
    path rack - location
  )

  (:predicates
    (neighbor ?l1 - location ?l2 - location)
    (belong ?ag - agent ?h - holder)
    (have ?cab - cabinet ?h - holder)
    (at ?ag - agent ?l - path)
    (fixat ?cab - cabinet ?l - path)
    (occupied ?l - path)
    (free ?h - holder)
    (locate ?p - part ?l - rack)
    (on ?p - part ?h - holder)
  )

  (:durative-action move
    :parameters (?ag - agent ?from - path ?to - path)
    :duration (= ?duration 2)
    :condition (and (over all (neighbor ?from ?to)) (at start (at ?ag ?from)) (at start (not (occupied ?to))))
    :effect (and (at start (not (occupied ?from))) (at start (not (at ?ag ?from))) (at end (occupied ?to)) (at end (at ?ag ?to)))
  )

  (:durative-action pick
    :parameters (?ag - agent ?p - part ?l1 - path ?l2 - rack ?h - holder)
    :duration (= ?duration 1)
    :condition (and (over all (at ?ag ?l1)) (at start (locate ?p ?l2)) (over all (neighbor ?l1 ?l2)) (at start (free ?h)) (over all (belong ?ag ?h)))
    :effect (and (at end (not (free ?h))) (at end (on ?p ?h)) (at start (not (locate ?p ?l2))))
  )

  (:durative-action place
    :parameters (?ag1 - agent ?cab - cabinet ?l1 - path ?l2 - path ?p - part ?h1 - holder ?h2 - holder)
    :duration (= ?duration 1)
    :condition (and (over all (at ?ag1 ?l1)) (over all (fixat ?cab ?l2)) (over all (neighbor ?l1 ?l2)) (over all (belong ?ag1 ?h1)) (at start (on ?p ?h1)) (over all (have ?cab ?h2)) (at start (free ?h2)))
    :effect (and (at start (not (on ?p ?h1))) (at start (free ?h1)) (at end (on ?p ?h2)) (at end (not (free ?h2))))
  )
)
