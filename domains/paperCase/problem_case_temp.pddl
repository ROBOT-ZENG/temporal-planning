(define (problem paperCase)
  (:domain paperCase)
  (:objects
    human1 robot1 - agent
    cab1 - cabinet
    location00 location01 location02 location03 location04 - rack
    location10 location11 location12 location13 location14 location20 location21 location22 location23 location24 location30 location31 location32 location33 location34 - path
    part1 part2 part3 part4 part5 part6 part7 part8 part9 part10 - part
    rhand1 lhand1 robothand1 part1_holder part2_holder part3_holder part4_holder part5_holder part6_holder part7_holder part8_holder part9_holder part10_holder - holder
  )
  (:init
    (neighbor location10 location10)
    (neighbor location11 location11)
    (neighbor location12 location12)
    (neighbor location13 location13)
    (neighbor location14 location14)
    (neighbor location10 location11)
    (neighbor location11 location12)
    (neighbor location12 location13)
    (neighbor location13 location14)
    (neighbor location11 location10)
    (neighbor location12 location11)
    (neighbor location13 location12)
    (neighbor location14 location13)
    (neighbor location10 location00)
    (neighbor location11 location01)
    (neighbor location12 location02)
    (neighbor location13 location03)
    (neighbor location14 location04)
    (neighbor location00 location10)
    (neighbor location01 location11)
    (neighbor location02 location12)
    (neighbor location03 location13)
    (neighbor location04 location14)
    (neighbor location20 location20)
    (neighbor location21 location21)
    (neighbor location22 location22)
    (neighbor location23 location23)
    (neighbor location24 location24)
    (neighbor location20 location21)
    (neighbor location21 location22)
    (neighbor location22 location23)
    (neighbor location23 location24)
    (neighbor location21 location20)
    (neighbor location22 location21)
    (neighbor location23 location22)
    (neighbor location24 location23)
    (neighbor location20 location10)
    (neighbor location21 location11)
    (neighbor location22 location12)
    (neighbor location23 location13)
    (neighbor location24 location14)
    (neighbor location10 location20)
    (neighbor location11 location21)
    (neighbor location12 location22)
    (neighbor location13 location23)
    (neighbor location14 location24)
    (neighbor location30 location30)
    (neighbor location31 location31)
    (neighbor location32 location32)
    (neighbor location33 location33)
    (neighbor location34 location34)
    (neighbor location30 location31)
    (neighbor location31 location32)
    (neighbor location32 location33)
    (neighbor location33 location34)
    (neighbor location31 location30)
    (neighbor location32 location31)
    (neighbor location33 location32)
    (neighbor location34 location33)
    (neighbor location20 location30)
    (neighbor location21 location31)
    (neighbor location22 location32)
    (neighbor location23 location33)
    (neighbor location24 location34)
    (neighbor location30 location20)
    (neighbor location31 location21)
    (neighbor location32 location22)
    (neighbor location33 location23)
    (neighbor location34 location24)
    (locate part1 location00)
    (locate part2 location01)
    (locate part3 location01)
    (locate part4 location01)
    (locate part5 location02)
    (locate part6 location02)
    (locate part7 location03)
    (locate part8 location04)
    (locate part9 location04)
    (locate part10 location04)
    (at human1 location30)
    (at robot1 location31)
    (fixat cab1 location32)
    (free rhand1)
    (free lhand1)
    (free robothand1)
    (free part1_holder)
    (free part2_holder)
    (free part3_holder)
    (free part4_holder)
    (free part5_holder)
    (free part6_holder)
    (free part7_holder)
    (free part8_holder)
    (free part9_holder)
    (free part10_holder)
    (occupied location30)
    (occupied location31)
    (occupied location32)
    (belong human1 lhand1)
    (belong human1 rhand1)
    (belong robot1 robothand1)
    (have cab1 part1_holder)
    (have cab1 part2_holder)
    (have cab1 part3_holder)
    (have cab1 part4_holder)
    (have cab1 part5_holder)
    (have cab1 part6_holder)
    (have cab1 part7_holder)
    (have cab1 part8_holder)
    (have cab1 part9_holder)
    (have cab1 part10_holder)
  )

  (:goal
    (and
    (on part1 part1_holder) (on part2 part2_holder) (on part3 part3_holder) (on part4 part4_holder)
    (on part5 part5_holder) (on part6 part6_holder) (on part7 part7_holder) (on part8 part8_holder)
    (on part9 part9_holder) (on part10 part10_holder)
    )
  )

  (:metric minimize (total-time))

)
