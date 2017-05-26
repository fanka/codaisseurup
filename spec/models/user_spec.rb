require 'rails_helper'

RSpec.describe User, type: :model do

describe "assosiations with avents" do
  it { is_expected.to have_many (:events) }
end

describe "assosiations with profile" do
  it { is_expected.to have_one (:profile) }
end

describe "association with registration" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:registration) { create :gegistration, event: event, user: guest_user }

  it "is registered for events" do
    expect(guest_user.registered_at_events).to include(event)
  end
end

end
