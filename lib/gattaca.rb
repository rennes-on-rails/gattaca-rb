module Gattaca
  def analyse(predictions)
    head, *tail = predictions
    tail.reduce([ [head] ]) do |sequences, p|
      sequences.reduce( [] ) do |acc, sequence|
        acc.push(*mutate(sequence, p))
      end
    end
  end

  def mutate(sequence, p)
    if sequence.last[1] < p[0]
    else
      [sequence, [p]]
    end
  end

  module_function :analyse, :mutate
end