class Floss < ActiveRecord::Base
	validates :colour, :brand, presence: true
	validates :colour, uniqueness: true
	belongs_to :user
	has_many :quantities, dependent: :destroy
	has_many :users, through: :quantities
end
