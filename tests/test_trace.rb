require 'em_test_helper'

class TestTrace < Test::Unit::TestCase
  def test_trace
    assert_raises TypeError do
      EM.trace(:sym){}
    end
    assert_raises ArgumentError do
      EM.trace('connect to localhost')
    end
    assert_equal true, EM.trace('boolean'){ true }
  end
end