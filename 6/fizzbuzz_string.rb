require_relative 'proc_only_string'
require_relative 'support_string'

fizzbuzz = <<~STR.gsub(/(\s)/, "")
  #{MAP}[#{RANGE}[#{ONE}][#{HUNDRED}]][-> n {
    #{IF}[#{IS_ZERO}[#{MOD}[n][#{FIFTEEN}]]][
      #{FIZZBUZZ}
    ][#{IF}[#{IS_ZERO}[#{MOD}[n][#{THREE}]]][
      #{FIZZ}
    ][#{IF}[#{IS_ZERO}[#{MOD}[n][#{FIVE}]]][
      #{BUZZ}
      ][
        #{TO_DIGITS}[n]
      ]]]
  }]
  STR

puts fizzbuzz

to_array(eval(fizzbuzz)).each do |p|
  puts to_string(p)
end
