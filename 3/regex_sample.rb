require_relative 'regex'

pattern = Repeat.new(
            Choose.new(
              Concatenate.new(Literal.new('a'), Literal.new('b')),
              Literal.new('a')
            )
)

p pattern

pattern =   Concatenate.new(
              Literal.new('a'),
              Concatenate.new(Literal.new('b'), Literal.new('c'))
            )

p pattern
p pattern.matches?('a')
p pattern.matches?('ab')
p pattern.matches?('abc')

pattern =  Choose.new(Literal.new('a'), Literal.new('b'))

p pattern
p pattern.matches?('a')
p pattern.matches?('b')
p pattern.matches?('c')

p pattern = Repeat.new(Literal.new('a'))
p pattern.matches?('')
p pattern.matches?('aaaaaaaaaaaaaaaaaa')
p pattern.matches?('aaaaaaaaaaaaaab')
