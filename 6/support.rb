require_relative 'proc_only'

def to_integer(proc)
  proc[-> n{n + 1}][0]
end

def to_boolean(proc)
  proc[true][false]
end

def to_array(proc, count=nil)
  array = []
  until to_boolean(IS_EMPTY[proc]) || count == 0
    array.push(FIRST[proc])
    proc = REST[proc]
    count = count -1 unless count.nil?
  end

  array
end

def to_char(c)
  '0123456789BFiuz'.slice(to_integer(c))
end

def to_string(s)
  to_array(s).map{|c| to_char(c) }.join
end
