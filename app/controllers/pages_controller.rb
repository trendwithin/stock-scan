class PagesController < ApplicationController
  def examples
    @ath = AllTimeHigh.all
  end

  def about
  end

  def contact
  end

  def home
    @daily_ath_tally =  AllTimeHigh.daily_ath.daily_ath_count
    @daily_atl_tally = AllTimeLow.daily_atl.daily_atl_count
    @daily_nh_tally = NewHigh.daily_nh.daily_nh.count
    @daily_nl_tally = NewLow.daily_nl.daily_nl.count
    @ath = AllTimeHigh.all
    @highs = NewHigh.all
    @lows = NewLow.all
  end
end
