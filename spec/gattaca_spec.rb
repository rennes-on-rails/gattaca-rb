require 'minitest/autorun'
$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require 'gattaca'

describe Gattaca do
  describe ".analyse" do
    it "can make a single sequence with [ [1, 10, 10] ]" do
      Gattaca.analyse([ [1, 10, 10] ]).must_equal [ [[1, 10, 10]] ]
    end
    it "can make 2 sequences with [ [1, 10, 10], [5, 15, 10] ]" do
      Gattaca.analyse([ [1, 10, 10], [5, 15, 10] ]).must_equal [ [[1, 10, 10]], [[5, 15, 10]] ]
    end
    it "can merge sequence with [ [1, 10, 10], [11, 15, 10] ]" do
      Gattaca.analyse([ [1, 10, 10], [11, 15, 10] ]).must_equal [ [[1, 10, 10], [11, 15, 10]] ]
    end
    it "can split sequence with [ [1, 10, 10], [11, 15, 10], [12, 15, 20]]" do
      Gattaca.analyse([ [1, 10, 10], [11, 15, 10], [12, 15, 20] ]).must_equal [
        [[1, 10, 10], [11, 15, 10]],
        [[1, 10, 10], [12, 15, 20]]
      ]
    end
  end

  describe ".score" do
    it "of [ [1, 10, 10], [11, 15, 10], [12, 15, 20]] is 30" do
      Gattaca.score([ [1, 10, 10], [11, 15, 10], [12, 15, 20] ]).must_equal 30
    end
  end
end