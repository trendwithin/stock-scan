require 'test_helper'

class HighLowTest < ActiveSupport::TestCase
  def setup
    @hl =   HighLow.new(one_month_high: 0, one_month_low: 1,
                        three_month_high: 2, three_month_low: 3,
                         six_month_high: 4, six_month_low: 5,
                         twelve_month_high: 6, twelve_month_low: 7,
                         ytd_high: 8, ytd_low: 9,
                         saved_on: Time.now)
  end

  def test_valid
    assert @hl.valid?
  end
end
