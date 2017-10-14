require_relative 'lambda_calculus'

one = LCFunction.new(:p,
        LCFunction.new(:x,
          LCCall.new(LCVariable.new(:p), LCVariable.new(:x))
          ))

increment = LCFunction.new(:n,
              LCFunction.new(:p,
                LCFunction.new(:x,
                  LCCall.new(
                    LCVariable.new(:p),
                    LCCall.new(
                      LCCall.new(LCVariable.new(:n), LCVariable.new(:p)),
                      LCVariable.new(:x)
                    )
                  )
                )
              )
            )

add = LCFunction.new(:m,
        LCFunction.new(:n,
          LCCall.new( LCCall.new(LCVariable.new(:n), increment), LCVariable.new(:m))
          )
        )

p add

expression = LCVariable.new(:x)
p expression.replace(:x, LCFunction.new(:y, LCVariable.new(:y)))


function = LCFunction.new(:x,
              LCFunction.new(:y,
                LCCall.new(LCVariable.new(:x), LCVariable.new(:y))
              )
          )
p function
p argument = LCFunction.new(:z, LCVariable.new(:z))
p function.call(argument)

expression = LCCall.new(LCCall.new(add, one), one)

while expression.reducible?
  puts expression
  expression = expression.reduce
end; puts expression


inc, zero = LCVariable.new(:inc), LCVariable.new(:zero)
expression = LCCall.new(LCCall.new(expression, inc), zero)
while expression.reducible?
  puts expression
  expression = expression.reduce
end; puts expression
