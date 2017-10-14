require_relative 'dfa'
require_relative 'nfa'

rulebook = NFARulebook.new([
  FARule.new(1, 'a', 1), FARule.new(1, 'b', 1), FARule.new(1, 'b', 2),
  FARule.new(2, 'a', 3), FARule.new(2, 'b', 3),
  FARule.new(3, 'a', 4), FARule.new(3, 'b', 4)
  ])


nd = NFADesign.new(1, [4], rulebook)
p '##input aaa'
p nd.accepts?('aaa')

p '##input bbbbb'
p nd.accepts?('bbbbb')

p '##input bbabb'
p nd.accepts?('bbabb')
