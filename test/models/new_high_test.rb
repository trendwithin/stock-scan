require 'test_helper'

class NewHighTest < ActiveSupport::TestCase
  def setup
    @nh = NewHigh.new(symbol: 'AAPL', saved_on: Time.now)
  end

  def test_valid
    assert @nh.valid?
  end

  def test_empty_symbol_fails
    @nh.symbol = '    '
    refute @nh.valid?
  end

  def test_empty_saved_on_fails
    @nh.saved_on = '    '
    refute @nh.valid?
  end

  def test_against_duplicate_entries
    dupe = @nh.dup
    @nh.save
    dupe.save
    refute dupe.valid?
  end
end
