require 'minitest/autorun'
$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require 'turn'
require 'gattaca'

describe Gattaca do
  describe ".analyse" do
    it "returns [[[1, 10, 10]]] for [ [1, 10, 10] ]" do
      Gattaca.analyse([ [1, 10, 10] ]).must_equal [ [[1, 10, 10]] ]
    end
    it "can separate overlapping predictions [1, 10, 10], [5, 15, 10]" do
      Gattaca.analyse([ [1, 10, 10], [5, 15, 10] ]).must_equal [ [[1, 10, 10]], [[5, 15, 10]] ]
    end
    it "can merge separate predictions [1, 10, 10], [11, 15, 10]" do
      Gattaca.analyse([ [1, 10, 10], [11, 15, 10] ]).must_equal [ [[1, 10, 10], [11, 15, 10]] ]
    end
  end

  describe ".score" do
    it "scores 20 [1, 10, 10], [11, 15, 10]" do
      Gattaca.score([ [1, 10, 10], [11, 15, 10] ]).must_equal 20
    end
    it "scores 30 [1, 10, 10], [11, 15, 20]" do
      Gattaca.score([ [1, 10, 10], [11, 15, 20] ]).must_equal 30
    end
    # it "scores 100 for example of README" do
    #   Gattaca.score([
    #     [43,  70,  27],
    #     [3,   18,  24],
    #     [65,  99,  45],
    #     [20,  39,  26],
    #     [45,  74,  26],
    #     [10,  28,  20],
    #     [78,  97,  23],
    #     [0,   9,   22]
    #   ]).must_equal 100
    # end
  end
end