((domain SPS)
  (:requirements :strips :typing :negative-preconditions :equality)
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

  (:action move
    :parameters (?ag - agent ?from - path ?to - path)
    :precondition (and (neighbor ?from ?to) (at ?ag ?from) (not (occupied ?to)))
    :effect (and (at ?ag ?to) (not (occupied ?from)) (occupied ?to) (not (at ?ag ?from)))
  )

  (:action pick
    :parameters (?ag - agent ?p - part ?l1 - path ?l2 - rack ?h - holder)
    :precondition (and (at ?ag ?l1) (locate ?p ?l2) (neighbor ?l1 ?l2) (free ?h) (belong ?ag ?h))
    :effect (and (not (free ?h)) (on ?p ?h) (not (locate ?p ?l2)))
  )

  (:action place
    :parameters (?ag1 - agent ?cab - cabinet ?l1 - path ?l2 - path ?p - part ?h1 - holder ?h2 - holder)
    :precondition (and (at ?ag1 ?l1) (fixat ?cab ?l2) (neighbor ?l1 ?l2) (belong ?ag1 ?h1) (on ?p ?h1) (have ?cab ?h2) (free ?h2))
    :effect (and (not (on ?p ?h1)) (free ?h1) (on ?p ?h2) (not (free ?h2)))
  )
)
