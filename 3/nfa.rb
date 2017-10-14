require 'set'

class NFARulebook < Struct.new(:rules)

  def next_states(states, character)
    #puts "## next states ## #{states.to_a} at #{character}"
    #p states.flat_map{|state| follow_rules_for(state, character)}.to_set
    states.flat_map{|state| follow_rules_for(state, character)}.to_set
  end

  def follow_rules_for(state, character)
    rules_for(state, character).map(&:follow)
  end

  def rules_for(state, character)
    rules.select{|rule| rule.applies_to?(state, character)}
  end

  def follow_free_moves(states)
    more_states = next_states(states, nil)
    if more_states.subset?(states)
      states
    else
      follow_free_moves(states + more_states)
    end
  end
end


class NFA < Struct.new(:current_state, :accept_states, :rulebook)
  def accepting?
    (current_state & accept_states).any?
  end

  def read_character(character)
    self.current_state = rulebook.next_states(current_state, character)
  end

  def read_string(string)
    string.chars.map{|c| read_character(c)}
  end

  def current_state
    rulebook.follow_free_moves(super)
  end
end

class NFADesign < Struct.new(:start_state, :accept_states, :rulebook)
  def to_nfa
    NFA.new(Set[start_state], accept_states, rulebook)
  end

  def accepts?(string)
    to_nfa.tap {|nfa| nfa.read_string(string)}.accepting?
  end
end
