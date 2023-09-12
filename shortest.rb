def shortest(str)
  str.split.min{|a, b| a.length <=> b.length}
end