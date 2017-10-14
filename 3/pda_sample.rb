require_relative 'pda'

rulebook = DPDARulebook.new([
    PDARule.new(1, '(', 2, '$', ['b', '$']),
    PDARule.new(2, '(', 2, 'b', ['b', 'b']),
    PDARule.new(2, ')', 2, 'b', []),
    PDARule.new(2, nil, 1, '$', ['$']),
  ])

init_conf = PDAConfiguration.new(1, Stack.new(['$']))
p configuration = rulebook.next_configuration(init_conf, '(')

p configuration = rulebook.next_configuration(configuration, '(')
p configuration = rulebook.next_configuration(configuration, ')')


dpda = DPDA.new(PDAConfiguration.new(1, Stack.new(['$'])), [1], rulebook)
p dpda.accepting?
dpda.read_string('(()')
p dpda.accepting?
p dpda.current_configuration

p configuration = PDAConfiguration.new(2, Stack.new(['$']))
p rulebook.follow_free_moves(configuration)

dpda = DPDA.new(PDAConfiguration.new(1, Stack.new(['$'])), [1], rulebook)
p dpda.read_string('(()(')
p dpda.accepting?
p dpda.current_configuration
p dpda.read_string('))()')
p dpda.current_configuration

p "----- dpdadesign -----"
dpda_design = DPDADesign.new(1, '$', [1], rulebook)
p dpda_design.accepts?('(((((((((((((())))))))))))))()')
p dpda_design.accepts?('())')
