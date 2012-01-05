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
    last = sequence.last
    if last[1] < prediction[0]
      [ (sequence << prediction) ]
    else
      [sequence, [prediction]]
    end
  end

  module_function :analyse, :mutate
end