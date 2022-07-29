require 'rails_helper'

RSpec.describe Cat, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # what do we test?
  #   Validations
  #   Associations
  #   Class Methods
  #   Error Messages

  describe "validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_presence_of(:gender) }   
    it { should validate_inclusion_of(:gender).in_array(["male", "female"]) } 
  end

  describe "associations" do 
    it { should have_many(:toys) }
  end


end