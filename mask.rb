def maskify(str) 
  str.sub(str[0...-4], "#" * str[0...-4].length)
end