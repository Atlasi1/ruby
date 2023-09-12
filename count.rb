def count(arr)
  hash = arr.group_by { |v| v }.map { |k, v| [k, v.size] }.to_h
  str = ""
  hash.each do |key, value|
    if key == "Стол"
      if value > 1
        str += "Столов #{value} "
      else
        str += "Стол #{value} "
      end
    elsif key == "Ручка"
      if value > 1
        str += "Ручек #{value} "
      else
        str += "Ручка #{value} "
      end
    elsif key == "Сапог"
      if value > 1
        str += "Сапогов #{value} "
      else
        str += "Сапог #{value} "
      end
    end
  end
  str.strip!
end