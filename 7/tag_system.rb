class TagRule < Struct.new(:first_character, :append_characters)
  def applies_to?(string)
    string.chars.first == first_character
  end

  def follow(string)
    string + append_characters
  end
end

class TagRuleBook < Struct.new(:deletion_number, :rules)
  def next_string(string)
    rule_for(string).follow(string).slice(deletion_number..-1)
  end

  def rule_for(string)
    rules.detect{ |r| r.applies_to?(string)}
  end

  def applies_to?(string)
    !rule_for(string).nil? && string.length >= deletion_number
  end
end

class TagSystem < Struct.new(:current_string, :rulebook)
  def step
    self.current_string = rulebook.next_string(current_string)
  end

  def run
    while rulebook.applies_to?(current_string)
      puts current_string
      step
    end

    puts current_string
  end
end

# rulebook = TagRuleBook.new(2,[TagRule.new('a', 'cc'), TagRule.new('b', 'dddd') ])
# system = TagSystem.new('aabbbbbb', rulebook)
# system.run
#
# puts "increments"
# rulebook = TagRuleBook.new(2,[TagRule.new('a', 'ccdd'), TagRule.new('b', 'dd') ])
# system = TagSystem.new('aabbbb', rulebook)
# system.run

# 4.times do
#   puts system.current_string
#   system.step
# end
# puts system.current_string
