module Gattaca

  def analyse(predictions)
    head, *tail = predictions.sort
    tail.reduce([ [head] ]) do |sequences, p|
      count, sequences = sequences.reduce( [0, []] ) do |acc, sequence|
        count, list = acc
        inc, ng = mutate(sequence, p)
        [count + inc, list.push(*ng)]
      end
      sequences << [p] if count.zero?
      sequences
    end
  end

  def mutate(sequence, p)
    sub = sequence.select { |pp| pp[1] < p[0] }
    case sub.count
      when sequence.count then [1, [sequence << p]]
      when 0 then [0, [sequence]]
      else [1, [sequence, sub << p]]
    end
  end

  def score(predictions)
    analyse(predictions).map { |sequence| sequence.reduce(0) { |score, p| score += p[2] } }.max
  end

  module_function :analyse, :mutate, :score
end