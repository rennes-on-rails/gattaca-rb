module Gattaca
  def analyse(predictions)
    predictions.map { |p| [p] }
  end
  module_function :analyse
end