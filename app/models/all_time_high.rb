class AllTimeHigh < ActiveRecord::Base
  validates :symbol, :saved_on, presence: true
  validates :symbol, uniqueness: { scope: :saved_on }

  scope :daily_ath, -> { where("saved_on >=?", Time.zone.now.beginning_of_day) }
  scope :daily_ath_count, -> { self.select(:saved_on).group(:saved_on).to_a.count }
end
