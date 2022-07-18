# == Schema Information
#
# Table name: toys
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  style      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cat_id     :integer
#
class Toy < ApplicationRecord
    STYLES = ["ball", "string", "mouse", "laser"]

    validates :style, presence: true
    validates :name, presence: true, length: { minimum: 2 }
    validates :style, inclusion: STYLES

    belongs_to :cat
end
