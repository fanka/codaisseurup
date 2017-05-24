require 'rails_helper'

RSpec.describe User, type: :model do

describe "assosiations with avents" do
  it { is_expected.to have_many (:events) }
end

describe "assosiations with profile" do
  it { is_expected.to have_one (:profile) }
end

end
