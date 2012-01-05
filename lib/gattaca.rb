module Gattaca
  def analyse(predictions)
    head, *tail = predictions
    tail.reduce( [ [head] ] ) do |sequences, p|
      sequences.reduce( [] ) do |acc, sequence|
        acc.push(*mutate(sequence, p))
      end
    end
  end

  def mutate(sequence, prediction)
    [sequence, [prediction]]
  end

  module_function :analyse, :mutate
end