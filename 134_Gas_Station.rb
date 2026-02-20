def can_complete_circuit(gas, cost)
  return -1 if gas.sum < cost.sum
  current_tank = 0
  start_index = 0
  total_surplus = 0

  (0..gas.length - 1).each do |i|
    total_surplus += gas[i] - cost[i]
    current_tank += gas[i] - cost[i]

    if current_tank < 0
      current_tank = 0
      start_index = i + 1
    end

  end
  total_surplus < 0 ? -1 : start_index
end

gas1 = [1, 2, 3, 4, 5]
cost1 = [3, 4, 5, 1, 2]
# Output: 3

gas2 = [2, 3, 4]
cost2 = [3, 4, 3]
# Output: -1

gas3 = [3,1,1]
cost3 = [1,2,2]
# Output: 0

p(can_complete_circuit(gas1, cost1))
p(can_complete_circuit(gas2, cost2))
p(can_complete_circuit(gas3, cost3))


#works but like super slow since i'm looping multiple times
# def can_complete_circuit(gas, cost)
#   current_fuel = 0
#   step = 0
#   counter = 0
#   turn_counter = 0

#   while counter != gas.length

#     current_fuel += gas[step] - cost[step]

#     if current_fuel < 0
#       current_fuel = 0
#       counter = 0
#     else
#       counter += 1
#       if counter == gas.length
#         step += 1
#         break
#       end
#     end
#     step += 1
#     if step > gas.length - 1
#       step = 0
#       turn_counter += 1
#       if turn_counter > gas.length
#         break
#       end
#     end
#   end
#   if step + 1 > gas.length
#     return 0
#   end
#   turn_counter > gas.length ? -1 : step
# end