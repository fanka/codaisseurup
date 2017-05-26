class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

=begin
  def price
    @price = @event.price * guest_count
  end
=end

end
