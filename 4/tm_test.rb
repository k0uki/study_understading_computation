require_relative 'tmrule'
require_relative 'dtm'

rule = TMRule.new(1, '0', 2, '1', :right)

#p rule

#p rule.follow(TMConfiguration.new(1, Tape.new([], '0', [], '_')))

rulebook = DTMRulebook.new([
    TMRule.new(1, '0', 2, '1', :right),
    TMRule.new(1, '1', 1, '0', :left),
    TMRule.new(2, '0', 2, '0', :right),
    TMRule.new(2, '1', 2, '1', :right),
    TMRule.new(2, '_', 3, '_', :right),
  ])

tape = Tape.new(['1', '0', '1'], '1', [], '_')
configuration = TMConfiguration.new(1, tape)
p config = rulebook.next_configuration(configuration)

puts "==== dtm ========="
dtm = DTM.new(TMConfiguration.new(1, tape), [3], rulebook)
p dtm.current_configuration
p dtm.accepting?
p dtm.step;
p dtm.current_configuration
p dtm.accepting?
puts "run!!"
dtm.run
p dtm.current_configuration
p dtm.accepting?

puts "===== wrong tape ======"
tape = Tape.new(['1', '2', '1'], '1', [], '_')
dtm = DTM.new(TMConfiguration.new(1, tape), [3], rulebook)
dtm.run
p dtm.current_configuration
p dtm.stuck?
