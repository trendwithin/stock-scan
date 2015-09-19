class ScansController < ApplicationController
  def high_low
    @hl = HighLow.all
  end
end
