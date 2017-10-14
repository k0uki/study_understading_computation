require_relative 'dfa'
require_relative 'nfa'

rulebook = NFARulebook.new([
  FARule.new(1, nil, 2), FARule.new(1, nil, 4),
  FARule.new(2, 'a', 3),
  FARule.new(3, 'a', 2),
  FARule.new(4, 'a', 5),
  FARule.new(5, 'a', 6),
  FARule.new(6, 'a', 4)
  ])


nd = NFADesign.new(1, [2, 4], rulebook)

p nd.accepts?('aa')

p nd.accepts?('aaa')

p nd.accepts?('aaaaa')

p nd.accepts?('aaaaaa')
