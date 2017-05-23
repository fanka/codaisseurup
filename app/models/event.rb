class Event < ApplicationRecord

  belongs_to :user
  validates :name, :starts_at, :ends_at, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates : ends_at, presence: true
  validates end_date_after_start_date?

  def end_date_after_start_date?
    if ends_at < starts_at
      errors.add :ends_at, "Must be after start date"
    end
  end

end
