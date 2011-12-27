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
    sub = sequence.select { |pp| pp[1] < p[0] }
    case sub.count
      when sequence.count then [sequence << p]
      else [sequence, sub << p]
    end
  end

  module_function :analyse, :mutate
end