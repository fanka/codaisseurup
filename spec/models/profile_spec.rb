require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("S") }
    let (:user) {create :user }
    let (:another_user) {create :user }
    let (:one_more_user) {create :user }

    let(:profile1) { create :profile, first_name: "Sander", user: user }
    let(:profile2) { create :profile, first_name: "Stefan", user: another_user }
    let(:profile3) { create :profile, first_name: "Wouter", user: one_more_user }

    it "returns a sorted array of results that match" do
      expect(subject).to match_array [profile1, profile2]
      expect(subject).not_to include profile3
    end
  end

  describe "assosiations with user" do
    it { is_expected.to belong_to (:user) }
  end

end
