require_relative 'simple'

class Number
  def evaluate(environment)
    self
  end
end

class Boolean
  def evaluate(environment)
    self
  end
end

class Variable
  def evaluate(environment)
    environment[name]
  end
end

class Add
  def evaluate(environment)
    Number.new(left.evaluate(environment).value + right.evaluate(environment).value)
  end
end

class Multiply
  def evaluate(environment)
    Number.new(left.evaluate(environment).value * right.evaluate(environment).value)
  end
end

class LessThan
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value < right.evaluate(environment).value)
  end
end

class Assign
  def evaluate(environment)
    environment.merge({name => expression.evaluate(environment)})
  end
end

class DoNothing
  def evaluate(environment)
    environment
  end
end

class If
  def evaluate(environment)
    case condition.evaluate(environment)
    when Boolean.new(true)
      consequence.evaluate(environment)
    when Boolean.new(false)
      alternative.evaluate(environment)
    end
  end
end

class Sequence
  def evaluate(environment)
    second.evaluate(first.evaluate(environment))
  end
end

class While
  def evaluate(environment)
    case condition.evaluate(environment)
    when Boolean.new(true)
      evaluate(body.evaluate(environment))
    when Boolean.new(false)
      environment
    end
  end
end

p LessThan.new(
  Add.new(Variable.new(:x), Number.new(2)), Variable.new(:y)
  ).evaluate({x:Number.new(2), y: Number.new(5) })

stmt = Sequence.new(
        Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
        Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
       )
p stmt
p stmt.evaluate({})

stmt = While.new(
        LessThan.new(Variable.new(:x), Number.new(5)),
        Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
)
p stmt
p stmt.evaluate({x: Number.new(1)})


class Number
  def to_ruby
    "-> e {#{value.inspect}}"
  end
end

class Boolean
  def to_ruby
    "-> e {#{value.inspect}}"
  end
end

class Variable
  def to_ruby
    "-> e { e[#{name.inspect}]}"
  end
end

class Add
  def to_ruby
    "-> e{( #{left.to_ruby} ).call(e) + (#{right.to_ruby}).call(e)}"
  end
end

class Multiply
  def to_ruby
    "-> e{( #{left.to_ruby} ).call(e) * (#{right.to_ruby}).call(e)}"
  end
end

class LessThan
  def to_ruby
    "-> e{( #{left.to_ruby} ).call(e) < (#{right.to_ruby}).call(e)}"
  end
end

class Assign
  def to_ruby
    "-> e{ e.merge({#{name.inspect} => (#{expression.to_ruby}).call(e) })}"
  end
end

class DoNothing
  def to_ruby
    "-> e{ e }"
  end
end

class If
  def to_ruby
    "-> e{if (#{condition.to_ruby}).call(e)" +
    "then (#{consequence.to_ruby}).call(e)" +
    "else (#{alternative.to_ruby}).call(e)" +
    "end }"
  end
end

class Sequence
  def to_ruby
    "->e{ (#{second.to_ruby}).call((#{first.to_ruby}).call(e)) }"
  end
end

class While
  def to_ruby
    "-> e{" +
     "while (#{condition.to_ruby}).call(e); e = (#{body.to_ruby}).call(e); end;" +
     "e }"
  end
end

p Number.new(5).to_ruby
p Boolean.new(false).to_ruby

exp = Variable.new(:x)
p exp.to_ruby
proc = eval(exp.to_ruby)
p proc.call({x:7})

env = {x:3}
proc = eval(Add.new(Variable.new(:x), Number.new(1)).to_ruby)
proc.call(env)

proc = eval( LessThan.new(Add.new(Variable.new(:x), Number.new(1)), Number.new(3)).to_ruby )
proc.call(env)

statement = Assign.new(:y, Add.new(Variable.new(:x), Number.new(1)))
proc = eval(statement.to_ruby)
proc.call({x:3})

stmt = If.new(Variable.new(:x), Assign.new(:y, Number.new(2)), Assign.new(:y, Number.new(3)) )
proc = eval(stmt.to_ruby)
proc.call({x: true})

stmt = While.new(
        LessThan.new(Variable.new(:x), Number.new(5)),
        Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3))) )
stmt.to_ruby
proc = eval(stmt.to_ruby)
proc.call({x: 1})
