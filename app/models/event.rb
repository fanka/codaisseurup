class Event < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :categories
  validates :name, :starts_at, :ends_at, presence: true
  validates :description, presence: true, length: {maximum: 500}
=begin  validate :end_date_after_start_date?

  def end_date_after_start_date?
    if :ends_at < :starts_at
      errors.add :ends_at, "Must be after start date"
    end
  end
=end

def bargain?
    price < 30
end

def self.order_by_price
    order(:price)
end

end
