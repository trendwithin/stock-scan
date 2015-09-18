require 'test_helper'

class AllTimeHighTest < ActiveSupport::TestCase
  def setup
    @ath = AllTimeHigh.new(symbol: 'AAPL', saved_on: Time.now)
  end

  def test_valid
    assert @ath.valid?
  end

  def test_empty_symbol_fails
    @ath.symbol = '    '
    refute @ath.valid?
  end

  def test_empty_saved_on_fails
    @ath.saved_on = '    '
    refute @ath.valid?
  end

  def test_against_duplicate_entries
    dupe = @ath.dup
    @ath.save
    dupe.save
    refute dupe.valid?
  end
end
