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
    it "can map overlapping sequences [ [1, 10, 10], [5, 15, 10], [6, 10, 10] ]" do
      Gattaca.analyse([ [1, 10, 10], [5, 15, 10], [6, 10, 10] ]).must_equal [
        [[1, 10, 10]], [[5, 15, 10]], [[6, 10, 10]]
      ]
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
    it "produces same results if predictions are not sorted [[12, 15, 20], [11, 15, 10], [1, 10, 10]]" do
      Gattaca.analyse([[12, 15, 20], [11, 15, 10], [1, 10, 10]]).must_equal [
        [[1, 10, 10], [11, 15, 10]],
        [[1, 10, 10], [12, 15, 20]]
      ]
    end
  end

  describe ".score" do
    it "of [ [1, 10, 10], [11, 15, 10], [12, 15, 20]] is 30" do
      Gattaca.score([ [1, 10, 10], [11, 15, 10], [12, 15, 20] ]).must_equal 30
    end
    it "is 100 for example of README" do
      Gattaca.score([
        [43,  70,  27],
        [3,   18,  24],
        [65,  99,  45],
        [20,  39,  26],
        [45,  74,  26],
        [10,  28,  20],
        [78,  97,  23],
        [0,   9,   22]
      ]).must_equal 100
    end
  end
end