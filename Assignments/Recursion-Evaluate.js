const evaluate = function(expression) {
  if(expression.indexOf(")") === -1) {
    return expression
  }
  if((expression.split(")").length - 1) ===  1) {
    return eval(expression)
  }
  str = expression.substr(
        expression.lastIndexOf("("),
        expression.indexOf(")"))
  str = str.substr(0, str.indexOf(")")+1)
  result = eval(str)
  
  return evaluate(expression.replace(str, result))
}

console.log(evaluate("7"))
console.log(evaluate("(2+2)"))
console.log(evaluate("(1+(2*4))"))
console.log(evaluate("((1+3)+((1+2)*5))"))