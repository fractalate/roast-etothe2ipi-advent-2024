t_file = open("2024_02a_input.txt")

lines = []

def breaks_rules(line)
  diff = line[1] - line[0]
  
  if diff == 0 or diff.abs > 3
    return true
  end
  
  first_difference = (diff < 0) ? "neg" : "pos"
  for j in 2..(line.length-1)
    diff = line[j] - line[j-1]
    if ((diff < 0 or diff > 3) and first_difference == "pos") or ((diff > 0 or diff < -3) and first_difference == "neg") or diff == 0
      return true
      break
    end
  end
  
  return false
end

for line in t_file
  tmp = line.strip.split(" ")
  
  tmp_nums = []
  for j in 0..(tmp.length-1)
    tmp_nums.push(tmp[j].to_i)
  end
  
  lines.push(tmp_nums)
end

number_of_inc_dec_lines = 0

print lines.count.to_s + "\n"

for i in 0..(lines.count-1)
  if !breaks_rules(lines[i])
    number_of_inc_dec_lines = number_of_inc_dec_lines + 1
    print "inc/dec: " + lines[i].to_s + "\n"
  else
    for k in 0..(lines[i].count-1)
      new_line = []
      for l in 0..(lines[i].count - 1)
        if l == k
          next
        end
        new_line.push(lines[i][l])
      end
      print new_line.to_s + "\n"
      if !breaks_rules(new_line)
        number_of_inc_dec_lines = number_of_inc_dec_lines + 1
        print "inc/dec (remove 1): " + new_line.to_s + "\n"
        break
      end
    end
  end
end

print number_of_inc_dec_lines.to_s + "\n"
