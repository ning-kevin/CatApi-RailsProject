# == Schema Information
#
# Table name: cats
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  gender     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cat < ApplicationRecord
    GENDER = ["male", "female"]

    validates :name, presence: true
    validates :gender, presence: true, inclusion: GENDER
    validate :valid_name_length?

    has_many :toys

    
    private

    def valid_name_length?
        if self.name.nil? || self.name.length < 2
            errors.add(:name, "is too short (minimum is 2 characters)")
        end
    end
end
