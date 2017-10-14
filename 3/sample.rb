require_relative 'dfa'

rulebook = DFARulebook.new([
  FARule.new(1, 'a', 2), FARule.new(1, 'b', 1),
  FARule.new(2, 'a', 2), FARule.new(2, 'b', 3),
  FARule.new(3, 'a', 3), FARule.new(3, 'b', 3)
  ])

rulebook.next_state(1, 'a')

rulebook.next_state(1, 'b')

rulebook.rule_for(2, 'b')

dfa = DFA.new(1, [3], rulebook);
p dfa.accepting?
1000.times { dfa.read_character('a')}
p dfa.accepting?
dfa.read_character('b')
p dfa.accepting?

dfa2 = DFA.new(1, [3], rulebook)

dfa2.read_string('baaab')
p dfa2.accepting?

dd = DFADesign.new(1, [3], rulebook)

p dd.accepts?('a')
p dd.accepts?('baa')
p dd.accepts?('baba')
