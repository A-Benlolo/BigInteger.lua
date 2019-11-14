local BigInteger=require "BigInteger"

local function main()
  --Working Data
  local p=BigInteger:new("8675309", '-')
  local q=BigInteger:new("42069", '+')
  local exponent1=BigInteger:new("4", '+')
  local exponent2=BigInteger:new("1234567890987654321", '+')
  
  --Result Data
  local sum=p:add(q)
  local diff=p:subtract(q)
  local prod=p:multiply(q)
  local quot, rema=p:divide(q)
  local modu=p:mod(q)
  local powr=p:pow(exponent1)
  local moduPow=p:modPow(exponent2, q)
  
  --Expected Results
  local expectedSum=BigInteger:new("8633240", '-')
  local expectedDiff=BigInteger:new("8717378", '-')
  local expectedProd=BigInteger:new("364961574321", '-')
  local expectedQuot, expectedRema=BigInteger:new("206", '-'), BigInteger:new("9095", '+')
  local expectedModu=BigInteger:new("32974", '+')
  local expectedPowr=BigInteger:new("5664216050642480268792921361", '+')
  local expectedModuPow=BigInteger:new("1", '+')
  

  io.write(",----------------,\n")
  io.write("|    ADDITION    |\n")
  io.write("`----------------`\n")
  io.write("  ", p:toString(), "\n")
  io.write("+    ", q:toString(), "\n")
  io.write("==========\n")
  io.write("  ", sum:toString(), "\n\n")
  
  io.write(",----------------,\n")
  io.write("|  SUBTRACTION   |\n")
  io.write("`----------------`\n")
  io.write("  ", p:toString(), "\n")
  io.write("-    ", q:toString(), "\n")
  io.write("==========\n")
  io.write("  ", diff:toString(), "\n\n")
  
  io.write(",----------------,\n")
  io.write("| MULTIPLICATION |\n")
  io.write("`----------------`\n")
  io.write("       ", p:toString(), "\n")
  io.write("*         ", q:toString(), "\n")
  io.write("===============\n")
  io.write("  ", prod:toString(), "\n\n")
  
  io.write(",----------------,\n")
  io.write("|    DIVISION    |\n")
  io.write("`----------------`\n")
  io.write("    ", p:toString(), "\n")
  io.write("/      ", q:toString(), "\n")
  io.write("============\n")
  io.write(" ", quot:toString(), " R ", rema:toString(), "\n\n")
  
  io.write(",----------------,\n")
  io.write("|     MODULUS    |\n")
  io.write("`----------------`\n")
  io.write("    ", p:toString(), "\n")
  io.write("%      ", q:toString(), "\n")
  io.write("============\n")
  io.write("       ", modu:toString(), "\n\n")
  
  io.write(",----------------,\n")
  io.write("|      POWER     |\n")
  io.write("`----------------`\n")
  io.write(p:toString(), "^", exponent1:toString(), " = ", powr:toString(), "\n\n")

  io.write(",----------------,\n")
  io.write("|     MOD-POW    |\n")
  io.write("`----------------`\n")
  io.write(p:toString(), "^", exponent2:toString(), " (mod ", q:toString(), ") = ", moduPow:toString(), "\n\n")

  io.write(string.format("%-30s : %s\n", "Addition Correct", (sum:equals(expectedSum) and "True" or "False")))
  io.write(string.format("%-30s : %s\n", "Subtraction Correct", (diff:equals(expectedDiff) and "True" or "False")))
  io.write(string.format("%-30s : %s\n", "Multiplication Correct", (prod:equals(expectedProd) and "True" or "False")))
  io.write(string.format("%-30s : %s\n", "Division Correct", (quot:equals(expectedQuot) and rema:equals(expectedRema) and "True" or "False")))
  io.write(string.format("%-30s : %s\n", "Modulus Correct", (modu:equals(expectedModu) and "True" or "False")))
  io.write(string.format("%-30s : %s\n", "Exponentiation Correct", (powr:equals(expectedPowr) and "True" or "False")))
  io.write(string.format("%-30s : %s\n\n", "Modular-Exponentiation Correct", (moduPow:equals(expectedModuPow) and "True" or "False")))
  
  io.write("Random 0<r<", q:toString(), " = ", q:random():toString(), "\n")
end

io.write("\n")
main()
io.write("\n")