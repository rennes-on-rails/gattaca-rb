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
  end
end