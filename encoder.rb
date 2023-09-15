def encoder(str)
  sub_str = ""
  str.downcase!
  str.split("").each { |i|
    if str.count(i) > 1 or (i in sub_str)
      str = str.sub(i, ")")
      sub_str += i
    else
      str = str.sub(i, "(")
    end
  }
  str
end