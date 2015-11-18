class Quantity < ActiveRecord::Base
  belongs_to :floss
  belongs_to :user
end
