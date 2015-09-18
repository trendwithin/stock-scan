require 'test_helper'

class NewLowTest < ActiveSupport::TestCase
  def setup
    @nl = NewLow.new(symbol: 'GOLD', saved_on: Time.now)
  end

  def test_valid
    assert @nl.valid?
  end

  def test_empty_symbol_fails
    @nl.symbol = '    '
    refute @nl.valid?
  end

  def test_empty_saved_on_fails
    @nl.saved_on = '    '
    refute @nl.valid?
  end

  def test_against_duplicate_entries
    dupe = @nl.dup
    @nl.save
    dupe.save
    refute dupe.valid?
  end
end
