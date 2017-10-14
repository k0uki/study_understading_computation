require_relative 'proc_only_string'

LEFT_P = -> p { p[-> x{ ->y{ x }}]}
RIGHT_P = -> p { p[-> x{ ->y{ y }}]}
IS_EMPTY_P = LEFT_P
FIRST_P = -> l { LEFT_P[RIGHT_P[l]] }
REST_P = -> l { RIGHT_P[RIGHT_P[l]] }


def to_integer(proc)
  proc[-> n{n + 1}][0]
end

def to_boolean(proc)
  proc[true][false]
end

def to_array(proc)
  array = []
  until to_boolean(IS_EMPTY_P[proc])
    array.push(FIRST_P[proc])
    proc = REST_P[proc]
  end

  array
end

def to_char(c)
  '0123456789BFiuz'.slice(to_integer(c))
end

def to_string(s)
  to_array(s).map{|c| to_char(c) }.join
end
