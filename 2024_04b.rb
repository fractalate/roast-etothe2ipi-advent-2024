# t_file = open("2024_04a_input.txt")
t_file = open("2024_04a_input_test.txt")

lines = []

for line in t_file
  tmp = line.strip
  lines.push(tmp)
end

WORD = "MAS"

ROW_COUNT = lines.length
COL_COUNT = lines[0].length

final_grid = []
for r in 0..(ROW_COUNT-1)
  new_row = []
  for c in 0..(COL_COUNT-1)
    new_row.push(".")
  end
  final_grid.push(new_row)
end

word_count = 0
word_count_by_cat = [0,0,0,0]

for r in 1..(ROW_COUNT-2)
  for c in 1..(COL_COUNT-2)
    # Diagonal Down/Right
    found = 0
    
    diag1_word = lines[r][c] + lines[r+1][c+1] + lines[r-1][c-1]
    
    if diag1_word == WORD or diag1_word.reverse == WORD 
      found = found + 1
    end
    
    # Diagonal Up/Right
    diag2_word = lines[r][c] + lines[r-1][c+1] + lines[r+1][c-1]

    if diag2_word == WORD or diag2_word.reverse == WORD
      found = found + 1
    end
    
    if found == 2
      final_grid[r-1][c-1] = lines[r-1][c-1]
      final_grid[r+1][c+1] = lines[r+1][c+1]
      final_grid[r][c] = lines[r][c]
      final_grid[r+1][c-1] = lines[r+1][c-1]
      final_grid[r-1][c+1] = lines[r-1][c+1]
      word_count = word_count + 1
    end
    
    print lines[r][c]
  end
  print "\n"
end

print "\n"

for r in 0..(ROW_COUNT-1)
  for c in 0..(COL_COUNT-1)
    print final_grid[r][c]
  end
  print "\n"
end

print "I found X-'MAS' " + word_count.to_s + " time(s).\n"
