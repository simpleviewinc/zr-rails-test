require 'rails_helper'

RSpec.describe Page, type: :model do
  describe '.site' do
    it { is_expected.to belong_to(:site) }
  end
end
