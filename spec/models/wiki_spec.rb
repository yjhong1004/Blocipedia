require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { Wiki.create!(title: "New Wiki", body: "New Wiki Body", private: boolean)}

  describe "attributes" do
     it "has title and body attributes" do
       expect(wiki).to have_attributes(title: "New Wiki", body: "New Wiki Body", private: boolean)
     end
   end
end
