class Quantity < ActiveRecord::Base
  belongs_to :floss
  belongs_to :user

  validates :user, uniqueness: true
  validates :floss, uniqueness: true
end
