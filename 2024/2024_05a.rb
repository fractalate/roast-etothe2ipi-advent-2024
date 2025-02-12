t_file = open("2024_05a_input_test.txt")

before_page_list = []
edits_list = []

list_type = 1

def is_a_before_b(a, b, bpl)
  for element in bpl
    if element[0] == a and element[1] == b
      return true
    end
  end
  
  return false
end

for line in t_file
  tmp = line.strip
    
  if tmp == ""
    list_type = 2
    next
  end
  
  if list_type == 1
    pages = tmp.split("|")
    before_page_list.push(pages)
  else
    edits_list.push(tmp.split(","))
  end
end

final_sum = 0

for eList in edits_list
  
  list_OK = true
  for i in 0..(eList.length - 2)
    print eList[(eList.length - 2) - i].to_s + " "

    rules_OK = false    
    for j in (eList.length - 2 - i + 1)..(eList.length - 1)
      if is_a_before_b(eList[(eList.length - 2 - i)], eList[j], before_page_list)
        rules_OK = true
        break
      end
    end
    
    if !rules_OK
      list_OK = false
      break
    end
  end
  
  if list_OK
    median_idx = (eList.length - 1)/2
    final_sum = final_sum + eList[median_idx].to_i
  end
end

print "FINAL SUM: " + final_sum.to_s
