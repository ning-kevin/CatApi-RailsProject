require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # what do we test?
  #   Validations
  #   Associations
  #   Class Methods
  #   Error Messages

  subject(:user) { FactoryBot.build(:user) }

  describe "validations" do 
    #optional approach without using shouda-match gem
    it "should validate presence of name" do
      user = User.new(username: "123456")
      expect(user.valid?).to be false
    end

    # it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:username) }   
    it { should validate_length_of(:password).is_at_least(6) } 
  end


end
