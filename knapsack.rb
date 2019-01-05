sack_w = 50_043_000
rock_w = [10, 20, 30]
rock_v = [60, 100, 120]

def max_value(sack_w, rock_w, rock_v)
  return 0 if rock_w.first > sack_w
  hash_t = [rock_w, rock_v].transpose.to_h

  current_sack_w = 0
  current_sack_v = 0

  rock_w.reverse_each do |r_w|
    picks = ((sack_w - current_sack_w) / r_w)
    current_sack_w += (picks * r_w)
    current_sack_v += (picks * hash_t[r_w])
  end

  current_sack_v
end

p max_value(sack_w, rock_w, rock_v)
