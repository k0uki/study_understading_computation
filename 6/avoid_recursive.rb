require_relative 'proc_only'
require_relative 'support'

def decrease(m, n)
  if n <= m
    m-n
  else
    m
  end
end

p decrease(decrease(17 ,5), 5)

p decrease(decrease(decrease(17 ,5), 5), 5)

MOD_SIMPLE =
  -> m { -> n {
    m[-> x {
      IF[IS_LESS_OR_EQUAL[n][x]][
        SUBTRACT[x][n]
        ][
          x
        ]
      }]
  }}

p to_integer(MOD[THREE][TWO])
