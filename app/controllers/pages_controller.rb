class PagesController < ApplicationController
  def examples
  end

  def about
  end

  def contact
  end

  def home
    @daily_ath_tally =  AllTimeHigh.daily_ath.daily_ath_count
    @daily_atl_tally = AllTimeLow.daily_atl.daily_atl_count
  end
end
