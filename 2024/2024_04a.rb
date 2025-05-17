lines = []

for line in STDIN
  tmp = line.strip
  lines.push(tmp)
end

WORD = "XMAS"

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

for r in 0..(ROW_COUNT-1)
  for c in 0..(COL_COUNT-1)
    # Horizontal
    if(c <= (COL_COUNT-WORD.length))
      horiz_word = lines[r][c] + lines[r][c+1] + lines[r][c+2] + lines[r][c+3]
      
      if horiz_word == WORD or horiz_word.reverse == WORD
        final_grid[r][c] = lines[r][c]
        final_grid[r][c+1] = lines[r][c+1]
        final_grid[r][c+2] = lines[r][c+2]
        final_grid[r][c+3] = lines[r][c+3]
        word_count = word_count + 1
        word_count_by_cat[0] = word_count_by_cat[0] + 1
      end
    end
    
    # Vertical
    if(r <= (ROW_COUNT-WORD.length))
      vert_word = lines[r][c] + lines[r+1][c] + lines[r+2][c] + lines[r+3][c]
      
      if vert_word == WORD or vert_word.reverse == WORD
        final_grid[r][c] = lines[r][c]
        final_grid[r+1][c] = lines[r+1][c]
        final_grid[r+2][c] = lines[r+2][c]
        final_grid[r+3][c] = lines[r+3][c]
        word_count = word_count + 1
        word_count_by_cat[1] = word_count_by_cat[1] + 1
      end
    end
    
    # Diagonal Down/Right
    if(r <= (ROW_COUNT-WORD.length) and c <= (COL_COUNT-WORD.length))
      diag1_word = lines[r][c] + lines[r+1][c+1] + lines[r+2][c+2] + lines[r+3][c+3]
      
      if diag1_word == WORD or diag1_word.reverse == WORD
        final_grid[r][c] = lines[r][c]
        final_grid[r+1][c+1] = lines[r+1][c+1]
        final_grid[r+2][c+2] = lines[r+2][c+2]
        final_grid[r+3][c+3] = lines[r+3][c+3]
        word_count = word_count + 1
        word_count_by_cat[2] = word_count_by_cat[2] + 1
      end
    end
    
    # Diagonal Up/Right
    if(r >= (WORD.length - 1) and c <= (COL_COUNT - WORD.length))
      diag1_word = lines[r][c] + lines[r-1][c+1] + lines[r-2][c+2] + lines[r-3][c+3]
      
      if diag1_word == WORD or diag1_word.reverse == WORD
        final_grid[r][c] = lines[r][c]
        final_grid[r-1][c+1] = lines[r-1][c+1]
        final_grid[r-2][c+2] = lines[r-2][c+2]
        final_grid[r-3][c+3] = lines[r-3][c+3]
        word_count = word_count + 1
        word_count_by_cat[3] = word_count_by_cat[3] + 1
      end
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

print "I found 'XMAS' " + word_count.to_s + " time(s).\n"
print "Horitzontally " + word_count_by_cat[0].to_s + " time(s).\n"
print "Vertically " + word_count_by_cat[1].to_s + " time(s).\n"
print "Diagonally down/right " + word_count_by_cat[2].to_s + " time(s).\n"
print "Diagonally up/right " + word_count_by_cat[3].to_s + " time(s).\n"
