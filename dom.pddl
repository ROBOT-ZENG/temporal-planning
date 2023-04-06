( DEFINE ( DOMAIN FLOOR-TILE )
( :REQUIREMENTS :CONDITIONAL-EFFECTS :TYPING )
( :TYPES
	ROBOT - OBJECT
	TILE - OBJECT
	COLOR - OBJECT
)
( :PREDICATES
	( ROBOT-AT ?ROBOT0 - ROBOT ?TILE1 - TILE )
	( UP ?TILE0 - TILE ?TILE1 - TILE )
	( DOWN ?TILE0 - TILE ?TILE1 - TILE )
	( RIGHT ?TILE0 - TILE ?TILE1 - TILE )
	( LEFT ?TILE0 - TILE ?TILE1 - TILE )
	( CLEAR ?TILE0 - TILE )
	( PAINTED ?TILE0 - TILE ?COLOR1 - COLOR )
	( ROBOT-HAS ?ROBOT0 - ROBOT ?COLOR1 - COLOR )
	( AVAILABLE-COLOR ?COLOR0 - COLOR )
	( FREE-COLOR ?ROBOT0 - ROBOT )
)
( :ACTION CHANGE-COLOR
  :PARAMETERS ( ?ROBOT0 - ROBOT ?COLOR1 - COLOR ?COLOR2 - COLOR )
  :PRECONDITION
	( AND
		( ROBOT-HAS ?ROBOT0 ?COLOR1 )
		( AVAILABLE-COLOR ?COLOR2 )
	)
  :EFFECT
	( AND
		( ROBOT-HAS ?ROBOT0 ?COLOR2 )
		( NOT ( ROBOT-HAS ?ROBOT0 ?COLOR1 ) )
	)
)
( :ACTION PAINT-UP
  :PARAMETERS ( ?ROBOT0 - ROBOT ?TILE1 - TILE ?TILE2 - TILE ?COLOR3 - COLOR )
  :PRECONDITION
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE2 )
		( CLEAR ?TILE1 )
		( ROBOT-HAS ?ROBOT0 ?COLOR3 )
		( UP ?TILE1 ?TILE2 )
	)
  :EFFECT
	( AND
		( PAINTED ?TILE1 ?COLOR3 )
		( NOT ( CLEAR ?TILE1 ) )
	)
)
( :ACTION PAINT-DOWN
  :PARAMETERS ( ?ROBOT0 - ROBOT ?TILE1 - TILE ?TILE2 - TILE ?COLOR3 - COLOR )
  :PRECONDITION
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE2 )
		( CLEAR ?TILE1 )
		( ROBOT-HAS ?ROBOT0 ?COLOR3 )
		( DOWN ?TILE1 ?TILE2 )
	)
  :EFFECT
	( AND
		( PAINTED ?TILE1 ?COLOR3 )
		( NOT ( CLEAR ?TILE1 ) )
	)
)
( :ACTION UP
  :PARAMETERS ( ?ROBOT0 - ROBOT ?TILE1 - TILE ?TILE2 - TILE )
  :PRECONDITION
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE1 )
		( CLEAR ?TILE2 )
		( UP ?TILE2 ?TILE1 )
	)
  :EFFECT
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE2 )
		( CLEAR ?TILE1 )
		( NOT ( ROBOT-AT ?ROBOT0 ?TILE1 ) )
		( NOT ( CLEAR ?TILE2 ) )
	)
)
( :ACTION DOWN
  :PARAMETERS ( ?ROBOT0 - ROBOT ?TILE1 - TILE ?TILE2 - TILE )
  :PRECONDITION
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE1 )
		( CLEAR ?TILE2 )
		( DOWN ?TILE2 ?TILE1 )
	)
  :EFFECT
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE2 )
		( CLEAR ?TILE1 )
		( NOT ( ROBOT-AT ?ROBOT0 ?TILE1 ) )
		( NOT ( CLEAR ?TILE2 ) )
	)
)
( :ACTION RIGHT
  :PARAMETERS ( ?ROBOT0 - ROBOT ?TILE1 - TILE ?TILE2 - TILE )
  :PRECONDITION
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE1 )
		( CLEAR ?TILE2 )
		( RIGHT ?TILE2 ?TILE1 )
	)
  :EFFECT
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE2 )
		( CLEAR ?TILE1 )
		( NOT ( ROBOT-AT ?ROBOT0 ?TILE1 ) )
		( NOT ( CLEAR ?TILE2 ) )
	)
)
( :ACTION LEFT
  :PARAMETERS ( ?ROBOT0 - ROBOT ?TILE1 - TILE ?TILE2 - TILE )
  :PRECONDITION
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE1 )
		( CLEAR ?TILE2 )
		( LEFT ?TILE2 ?TILE1 )
	)
  :EFFECT
	( AND
		( ROBOT-AT ?ROBOT0 ?TILE2 )
		( CLEAR ?TILE1 )
		( NOT ( ROBOT-AT ?ROBOT0 ?TILE1 ) )
		( NOT ( CLEAR ?TILE2 ) )
	)
)
)
