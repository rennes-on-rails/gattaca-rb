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
    # it "can merge separate predictions [1, 10, 10], [11, 15, 10]" do
    #   Gattaca.analyse([ [1, 10, 10], [11, 15, 10] ]).must_equal [ [[1, 10, 10], [11, 15, 10]] ]
    # end
  end
end