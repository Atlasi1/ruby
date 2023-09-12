def encoder(str)
  sub_str = ""
  str.downcase!
  for i in str.split("") do
    if str.count(i) > 1 or (i in sub_str)
      str = str.sub(i, ")")
      sub_str += i
    else
      str = str.sub(i, "(")
    end
  end
  str
end