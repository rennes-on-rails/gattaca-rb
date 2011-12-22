require 'minitest/autorun'

describe Gattaca do
  describe ".analyse" do
    it "returns [[[1, 10, 10]]] for [ [1, 10, 10] ]" do
      Gattaca.analyse([ [1, 10, 10] ]).must_equal [ [[1, 10, 10]] ]
    end
  end
end