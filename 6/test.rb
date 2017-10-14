require_relative 'proc_only'
require_relative 'support'

p to_integer(TWO)

p to_boolean(TRUE)
p to_boolean(FALSE)

p IF[TRUE]['happy']['sad']
p IF[FALSE]['happy']['sad']

p to_boolean(IS_ZERO[ZERO])
p to_boolean(IS_ZERO[TWO])

my_pair = PAIR[THREE][ONE]
p my_pair
p to_integer(LEFT[my_pair])
p to_integer(RIGHT[my_pair])

puts "==decrement=="
p to_integer(DECREMENT[TWO])
p to_integer(DECREMENT[THREE])

p to_integer(POWER[THREE][THREE])

puts "== less or equal =="
p to_boolean(IS_LESS_OR_EQUAL[ONE][TWO])
p to_boolean(IS_LESS_OR_EQUAL[THREE][TWO])

puts "== mod =="
p to_integer(MOD[THREE][TWO])
p to_integer(MOD[
  POWER[THREE][THREE]
  ][
  ADD[THREE][TWO]
  ])

puts "== list =="
my_list =
  UNSHIFT[
    UNSHIFT[
      UNSHIFT[EMPTY][THREE]
    ][TWO]
  ][ONE]

p to_array(my_list)

my_range = RANGE[ONE][THREE]
p to_array(my_range).map{ |p|  to_integer(p) }

p to_integer(FOLD[RANGE[ONE][THREE]][ONE][MULTIPLY])

my_list = MAP[RANGE[ONE][THREE]][INCREMENT]
p to_array(my_list).map{|p| to_integer(p)}

puts "== string =="
p to_char(ZED)
p to_string(FIZZBUZZ)

puts "== to digits =="
p to_array(TO_DIGITS[FIVE]).map{|p| to_integer(p)}
p to_array(TO_DIGITS[POWER[FIVE][THREE]]).map{|p| to_integer(p)}

p to_string(TO_DIGITS[POWER[FIVE][THREE]])

p to_integer(HUNDRED)
