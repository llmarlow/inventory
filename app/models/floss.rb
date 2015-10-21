class Floss < ActiveRecord::Base
	validates :colour, :brand, presence: true
	validates_length_of :quantity, maximum: 3
	belongs_to :user
end
