require 'test_helper'

class AllTimeLowTest < ActiveSupport::TestCase
  def setup
    @atl = AllTimeLow.new(symbol: 'GOLD', saved_on: Time.now)
  end

  def test_valid
    assert @atl.valid?
  end

  def test_empty_symbol_fails
    @atl.symbol = '    '
    refute @atl.valid?
  end

  def test_empty_saved_on_fails
    @atl.saved_on = '    '
    refute @atl.valid?
  end

  def test_against_duplicate_entries
    dupe = @atl.dup
    @atl.save
    dupe.save
    refute dupe.valid?
  end
end
