require 'rails_helper'

RSpec.describe Collaborator, type: :model do
   let(:user) { create(:user) }
   let(:wiki) { create(:wiki) }
   let(:collaborator) { Collaborator.create!(wiki: wiki, user: user) }

   it { is_expected.to belong_to(:wiki) }
   it { is_expected.to belong_to(:user) }
end
