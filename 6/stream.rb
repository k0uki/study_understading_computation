require_relative 'proc_only'
require_relative 'support'

ZEROS = Z[->f{UNSHIFT[f][ZERO]}]

p to_integer(FIRST[ZEROS])

p to_integer(FIRST[REST[ZEROS]])

p to_array(ZEROS, 30).map {|p| to_integer(p)}

UPWORDS_OF = Z[-> f { -> n { UNSHIFT[-> x{ f[INCREMENT[n]][x] }] [n]} }]
p to_array(UPWORDS_OF[FIFTEEN], 20).map {|p| to_integer(p)}
