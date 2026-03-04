def full_justify(words, max_width)
  saved_width = max_width
  space_count = 0
  line_count = 0
  words_length = 0
  word_count = 0

  hash_lines = Hash.new { |h, k| h[k] = [] }

  #this will create a hash with the line number as key and the words that are in this line as value, it will also add the total length of the words in this line at the end of the array

  words.each do |w|
    # print("current word is: ", w, "\n")
    # print("word size: ", w.size, "\n")
    if max_width - w.size >= 0
      # print("max_width before removing word size: ", max_width, "\n")
      hash_lines[line_count] << w
      max_width -= w.size
      max_width -= 1
      words_length += w.size
      # print("max_width after removing word size: ", max_width, "\n")
    else
      # print(w.size, "is superior to ", max_width, "+ ", space_count, "\n")
      # print("creating new line", "\n\n")
      hash_lines[line_count] << words_length
      words_length = 0
      line_count += 1
      max_width = saved_width
      # print("max_width is 16", "\n")
      hash_lines[line_count] << w
      max_width -= w.size
      max_width -= 1
      words_length += w.size
    end
  end

  hash_lines[line_count] << words_length
  result = Array.new(hash_lines.length) { "" }

  last_line = hash_lines.length - 1

  (0..last_line - 1).each do |lines|
    words_length = hash_lines[lines][-1]
    word_count = hash_lines[lines].length - 1
    needed_space = saved_width - words_length

    if word_count == 1
      number_of_space = 1
    else
      number_of_space = word_count - 1
    end

    spacing = needed_space / number_of_space
    remainder = needed_space % number_of_space

    (0..word_count - 1).each do |i|
      result[lines] << hash_lines[lines][i]
      break if result[lines].size == saved_width
      if i < remainder
        result[lines] += " " * (spacing + 1)
      else
        result[lines] += " " * spacing
      end
    end
    words_length = 0
    word_count = 0
  end

  word_count = hash_lines[last_line].length - 1
  result[last_line] = hash_lines[last_line][0..word_count - 1].join(" ")
  result[last_line] = result[last_line].ljust(saved_width)
  print(result)
end

words = ["This", "is", "an", "example", "of", "text", "justification."]
maxWidth = 16

words2 = ["What", "must", "be", "acknowledgment", "shall", "be"]
maxWidth2 = 16

words3 = ["Science", "is", "what", "we", "understand", "well", "enough", "to", "explain", "to", "a", "computer.", "Art", "is", "everything", "else", "we", "do"]
maxWidth3 = 20

print(full_justify(words, maxWidth), " ---   expected   --- \n[\n \"This    is    an\", \n \"example  of text\",\n \"justification.  \"\n] \n")
print(full_justify(words2, maxWidth2), " ---   expected   --- \n[\n \"What   must   be\",\n \"acknowledgment  \",\n \"shall be        \"\n] \n")
print(full_justify(words3, maxWidth3), " ---   expected   --- \n[\n \"Science  is  what we\",\n \"understand      well\",\n \"enough to explain to\",\n \"a  computer.  Art is\",\n \"everything  else  we\",\n \"do                  \"\n] \n")
