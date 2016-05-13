require 'pry'

def start_probability(state)
  { 0 => 0.6, 1 => 0.4 }.fetch(state)
end

def transition_probability(state1, state2)
  { [0, 0] => 0.3, [0, 1] => 0.7, [1, 0] => 0.6, [1, 1] => 0.4 }.fetch([state1, state2])
end

def emission_probability(state, observation)
  [{ H: 0.2, T: 0.8 }, { H: 0.6, T: 0.4 }].fetch(state).fetch(observation)
end

def alpha(j, state, observations)
  case j
  when 0
    start_probability(state) * emission_probability(state, observations[0])
  else
    [0, 1].reduce(0) do |sum, index|
      a = alpha(j - 1, index, observations)
      t = transition_probability(index, state)
      e = emission_probability(state, observations[j])
      sum + a * t * e
    end
  end
end

def beta(j, state, observations)
  case j
  when observations.count - 1
    1
  else
    [0, 1].reduce(0) do |sum, index|
      t = transition_probability(state, index)
      e = emission_probability(index, observations[j + 1])
      b = beta(j + 1, index, observations)
      sum + t * e * b
    end
  end
end

# puts alpha(0, 0, %i(H T T H))
# puts alpha(0, 1, %i(H T T H))
# puts alpha(1, 0, %i(H T T H))
# puts alpha(1, 1, %i(H T T H))

# puts beta(3, 0, %i(H T T H))
# puts beta(3, 1, %i(H T T H))
# puts beta(2, 0, %i(H T T H))
# puts beta(2, 1, %i(H T T H))

def praxis(j, state, observations)
  alpha(j, state, observations) * beta(j, state, observations)
end

def recalculate_start_probability(state, observation_sequences)
  a = observation_sequences.reduce(0) do |sum, observations|
    sum + praxis(0, state, observations)
  end

  b = observation_sequences.reduce(0) do |sum, observations|
    sum + [0, 1].reduce(0) do |sub_sum, sub_state|
      sub_sum + praxis(0, sub_state, observations)
    end
  end

  Rational(a / b).to_f
end

puts recalculate_start_probability(0, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])
puts recalculate_start_probability(1, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])

def ksi(j, state1, state2, observations)
  a = alpha(j, state1, observations)
  b = beta(j + 1, state2, observations)
  t = transition_probability(state1, state2)
  e = emission_probability(1, observations[j + 1])
  a * b * t * e
end

def recalculate_transition_probability(state1, state2, observation_sequences)
  a = observation_sequences.reduce(0) do |sum, observations|
    sum + (observations.count - 1).times.reduce(0) do |sub_sum, j|
      sub_sum + ksi(j, state1, state2, observations)
    end
  end

  b = observation_sequences.reduce(0) do |sum, observations|
    sum + (observations.count - 1).times.reduce(0) do |sub_sum, j|
      sub_sum + [0, 1].reduce(0) do |sub_sub_sum, state|
        sub_sub_sum + ksi(j, state1, state, observations)
      end
    end
  end

  Rational(a / b).to_f
end

puts recalculate_transition_probability(0, 0, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])
puts recalculate_transition_probability(0, 1, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])
puts recalculate_transition_probability(1, 0, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])
puts recalculate_transition_probability(1, 1, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])

def recalculate_emission_probability(state, observation, observation_sequences)
  a = observation_sequences.reduce(0) do |sum, observations|
    sum + observations.each_with_index.reduce(0) do |sub_sum, (o, j)|
      if o == observation
        sub_sum + praxis(j, state, observations)
      else
        sub_sum
      end
    end
  end

  b = observation_sequences.reduce(0) do |sum, observations|
    sum + (observations.count).times.reduce(0) do |sub_sum, j|
      sub_sum + praxis(j, state, observations)
    end
  end

  Rational(a / b).to_f
end

puts recalculate_emission_probability(0, :H, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])
puts recalculate_emission_probability(0, :T, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])
puts recalculate_emission_probability(1, :H, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])
puts recalculate_emission_probability(1, :T, [%i(H T T H), %i(T H H T), %i(T H T T H H T)])
