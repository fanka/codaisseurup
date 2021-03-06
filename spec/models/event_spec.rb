require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#available?" do
      let(:host_user) { create :user, email: "host@user.com" }
      let(:guest_user) { create :user, email: "guest@user.com" }

      let(:event) { create :event, price: 20, user: host_user, capacity: 20 }

      let!(:existent_registration) {
        create :registration,
          event: event,
          guest_count: 2,
          user: guest_user
      }

      context "is available" do
        let(:event) { create :event, price: 20, user: host_user, capacity: 20  }

        let!(:existent_registration) {
          create :registration,
            event: event,
            guest_count: 2,
            user: guest_user
        }
        subject { event.available? }

        it "returns true" do
          expect(subject).to be true
        end
      end

      context "is not available" do
        let(:event) { create :event, price: 20, user: host_user, capacity: 1  }

        let!(:existent_registration) {
          create :registration,
            event: event,
            guest_count: 2,
            user: guest_user
        }
        subject { event.available? }

        it "returns false" do
          expect(subject).to be false
        end
      end
    end


  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    end

  describe "#bargain?" do
    let(:bargain_event) { create :event, price: 20 }
    let(:non_bargain_event) { create :event, price: 200 }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 300 }

    it "returns a sorted array of events by prices" do
      expect(Event.order_by_price).to match_array [event1, event2, event3]
    end
  end

  describe "association with user" do
  let(:user) { create :user }

  it "belongs to a user" do
    event = user.events.new(name: "Some event")

    expect(event.user).to eq(user)
  end
end

describe "assosiations with categories" do
  it { is_expected.to have_and_belong_to_many (:categories) }
end

describe "association with registration" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:registration) { create :registration, event: event, user: guest_user }

  it "has guests" do
    expect(event.guests).to include(guest_user)
  end
end

end
