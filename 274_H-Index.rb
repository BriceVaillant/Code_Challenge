def h_index(citations)
  h = 0
  citations.sort!.reverse!.each_with_index do |citation, i|
    if citation >= i + 1
      h = i + 1
    else
      break
    end
  end
  h
end

# def h_index(citations)
#   h_index = citations.length
#   citations.sort!.reverse!
#   count = 0
#   is_running = true
#   print(citations.sort!.reverse!, "\n")
#   while is_running do
#     citations.each do |i|
#       if i >= h_index
#         count += 1
#         return h_index if count == h_index
#       end
#     end
#     count = 0
#     h_index -= 1
#     break if count == h_index
#   end
#   h_index
# end

citations1 = [3, 0, 6, 1, 5]
print(h_index(citations1))