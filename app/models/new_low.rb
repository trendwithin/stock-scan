class NewLow < ActiveRecord::Base
  validates :symbol, :saved_on, presence: true
  validates :symbol, uniqueness: { scope: :saved_on }

  scope :daily_nl, -> { where("saved_on >=?", Time.zone.now.beginning_of_day) }
  scope :daily_nl_count, -> { self.select(:saved_on).group(:saved_on).to_a.count }
end
