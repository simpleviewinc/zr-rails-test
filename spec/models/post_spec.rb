require 'rails_helper'

RSpec.describe Page, type: :model do
  describe '.user' do
    it { is_expected.to belong_to(:user) }
  end
  describe '.site' do
    it { is_expected.to belong_to(:site) }
  end
end
