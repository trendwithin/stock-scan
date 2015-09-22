module PagesHelper
  def highs_minus_lows
    @highs.group_by_day(:saved_on, format: "%B %d, %Y").count.merge(@lows.group_by_day(:saved_on, format: "%B %d, %Y").count){ |key, first, second| first - second}
  end

  def chart_highs
    NewHigh.pluck(:symbol).map { |e| { name: e, data: @highs.where(symbol: e).group_by_day(:saved_on, format: "%b %d, %Y").count } }
  end
end
