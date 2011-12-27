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
  end
end