require_relative 'proc_only'
require_relative 'support'

fizzbuzz =
  MAP[RANGE[ONE][HUNDRED]][-> n {
    IF[IS_ZERO[MOD[n][FIFTEEN]]][
      FIZZBUZZ
    ][IF[IS_ZERO[MOD[n][THREE]]][
      FIZZ
    ][IF[IS_ZERO[MOD[n][FIVE]]][
      BUZZ
      ][
        TO_DIGITS[n]
      ]]]
  }]

to_array(fizzbuzz).each do |p|
  puts to_string(p)
end
